package es操作

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/core"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
)

func FindArticleList(key string, page, limit int) {

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
		FetchSourceContext(
			elastic.NewFetchSourceContext(true).Exclude("content"),
		).
		From((from - 1) * limit).
		Size(limit).
		Do(context.Background())
	if err != nil {
		logrus.Error(err.Error())
		return
	}
	count := int(res.Hits.TotalHits.Value) //搜索到结果总条数
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
	fmt.Println(demoList, count)

}

func main() {
	core.InitConf()
	core.InitLogger()
	global.ESClient = core.EsConnect()

	FindArticleList("", 1, 10)
}
