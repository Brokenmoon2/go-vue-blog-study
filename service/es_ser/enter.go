package es_ser

import (
	"context"
	"encoding/json"
	"errors"
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"strings"
)

type Option struct {
	models.PageInfo
	Fields []string
	Tag    string
}

func (o *Option) GetForm() int {
	if o.Page == 0 {
		o.Page = 1
	}
	if o.Limit == 0 {
		o.Limit = 10
	}
	return (o.Page - 1) * o.Limit
}

func CommList(option Option) (list []models.ArticleModel, count int, err error) {

	boolSearch := elastic.NewBoolQuery()

	if option.Key != "" {
		boolSearch.Must(
			elastic.NewMultiMatchQuery(option.Key, option.Fields...),
		)
	}
	if option.Tag != "" {
		boolSearch.Must(
			elastic.NewMultiMatchQuery(option.Tag, "tags"),
		)
	}

	type SortField struct {
		Field     string
		Ascending bool
	}
	sortField := SortField{
		Field:     "created_at",
		Ascending: false, // 从小到大  从大到小
	}
	if option.Sort != "" {
		_list := strings.Split(option.Sort, " ")
		if len(_list) == 2 && (_list[1] == "desc" || _list[1] == "asc") {
			sortField.Field = _list[0]
			if _list[1] == "desc" {
				sortField.Ascending = false
			}
			if _list[1] == "asc" {
				sortField.Ascending = true
			}
		}
	}

	res, err := global.ESClient.
		Search(models.ArticleModel{}.Index()).
		Query(boolSearch).
		Highlight(elastic.NewHighlight().Field("title")).
		From(option.GetForm()).
		Sort(sortField.Field, sortField.Ascending).
		Size(option.Limit).
		Do(context.Background())
	if err != nil {
		return
	}
	count = int(res.Hits.TotalHits.Value) //搜索到结果总条数
	demoList := []models.ArticleModel{}
	for _, hit := range res.Hits.Hits {
		var model models.ArticleModel
		data, err := hit.Source.MarshalJSON()
		if err != nil {
			logrus.Error(err.Error())
			continue
		}
		err = json.Unmarshal(data, &model)
		if err != nil {
			logrus.Error(err)
			continue
		}
		title, ok := hit.Highlight["title"]
		if ok {
			model.Title = title[0]
		}

		model.ID = hit.Id
		demoList = append(demoList, model)
	}
	return demoList, count, err
}

func CommDetail(id string) (model models.ArticleModel, err error) {
	res, err := global.ESClient.Get().
		Index(models.ArticleModel{}.Index()).
		Id(id).
		Do(context.Background())
	if err != nil {
		return
	}
	err = json.Unmarshal(res.Source, &model)
	if err != nil {
		return
	}
	model.ID = res.Id
	return
}

func CommDetailByKeyword(key string) (model models.ArticleModel, err error) {
	res, err := global.ESClient.Search().
		Index(models.ArticleModel{}.Index()).
		Query(elastic.NewTermQuery("keyword", key)).
		Size(1).
		Do(context.Background())
	if err != nil {
		return
	}
	if res.Hits.TotalHits.Value == 0 {
		return model, errors.New("文章不存在")
	}
	hit := res.Hits.Hits[0]

	err = json.Unmarshal(hit.Source, &model)
	if err != nil {
		return
	}
	model.ID = hit.Id
	return
}
