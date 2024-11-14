package es_ser

import (
	"context"
	"encoding/json"
	"errors"
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
)

func CommList(key string, page, limit int) (list []models.ArticleModel, count int, err error) {

	boolSearch := elastic.NewBoolQuery()
	from := page
	if key != "" {
		boolSearch.Must(
			elastic.NewMatchQuery("title", key),
		)
	}
	if limit == 0 {
		limit = 10
	}
	if from == 0 {
		from = 1
	}

	res, err := global.ESClient.
		Search(models.ArticleModel{}.Index()).
		Query(boolSearch).
		From((from - 1) * limit).
		Size(limit).
		Do(context.Background())
	if err != nil {
		logrus.Error(err.Error())
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
		model.ID = hit.Id
		demoList = append(demoList, model)
	}
	return demoList, count, err
}
func CommDetail(id string) (model models.ArticleModel, err error) {
	res, err := global.ESClient.Get(). //调用全局变量 ESClient 的 Get() 方法
						Index(models.ArticleModel{}.Index()). //获取 ArticleModel 模型所在的索引名称的方法
						Id(id).                               //设置要查询的文档 ID
						Do(context.Background())              //Do执行查询请求。context.Background() 是上下文对象
	if err != nil {
		return
	}
	err = json.Unmarshal(res.Source, &model) //将 res.Source 中的 JSON 数据解码并填充到 model 结构体中，就是传入数据而已
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
