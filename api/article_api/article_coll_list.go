package article_api

import (
	"context"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/olivere/elastic/v7"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/common"
	"go-vue-blog-study/utils/jwts"
)

type CollResponse struct {
	models.ArticleModel
	CreatedAt string `json:"created_at"`
}

func (ArticleApi) ArticleCollListView(c *gin.Context) {

	var cr models.PageInfo

	c.ShouldBindQuery(&cr)

	_claims, _ := c.Get("claims")
	claims := _claims.(*jwts.CustomClaims)

	var articleIDList []interface{}

	list, count, err := common.ComList(models.UserCollectModel{UserID: claims.UserID}, common.Option{
		PageInfo: cr,
	})

	var collMap = map[string]string{}

	for _, model := range list {
		articleIDList = append(articleIDList, model.ArticleID)
		collMap[model.ArticleID] = model.CreatedAt.Format("2006-01-02 15:04:05")
	}

	boolSearch := elastic.NewTermsQuery("_id", articleIDList...)

	var collList = make([]CollResponse, 0)

	// 传id列表，查es
	result, err := global.ESClient.
		Search(models.ArticleModel{}.Index()).
		Query(boolSearch).
		Size(1000).
		Do(context.Background())
	if err != nil {
		res.FailWithMessage(err.Error(), c)
		return
	}

	for _, hit := range result.Hits.Hits {
		var article models.ArticleModel
		err = json.Unmarshal(hit.Source, &article)
		if err != nil {
			global.Log.Error(err)
			continue
		}
		article.ID = hit.Id
		collList = append(collList, CollResponse{
			ArticleModel: article,
			CreatedAt:    collMap[hit.Id],
		})
	}
	res.OkWithList(collList, count, c)
}
