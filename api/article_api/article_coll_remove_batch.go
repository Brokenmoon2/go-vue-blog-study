package article_api

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/olivere/elastic/v7"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/es_ser"
	"go-vue-blog-study/utils/jwts"
)

func (ArticleApi) ArticleCollBatchRemoveView(c *gin.Context) {
	var cr models.ESIDListRequest

	err := c.ShouldBindJSON(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}

	_claims, _ := c.Get("claims")
	claims := _claims.(*jwts.CustomClaims)

	var collects []models.UserCollectModel
	global.DB.Find(&collects, "user_id = ? AND article_id IN (?)", claims.UserID, cr.IDList)

	if len(collects) == 0 {
		res.FailWithMessage("请求非法", c)
		return
	}

	// 更新Elasticsearch中的收藏计数
	for _, collect := range collects {
		boolSearch := elastic.NewTermsQuery("_id", collect.ArticleID)
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
			count := article.CollectsCount - 1
			err = es_ser.ArticleUpdate(hit.Id, map[string]any{
				"collects_count": count,
			})
			if err != nil {
				global.Log.Error(err)
				continue
			}
		}
	}

	// 删除数据库中的特定收藏记录
	global.DB.Where("user_id = ? AND article_id IN (?)", claims.UserID, cr.IDList).Delete(&models.UserCollectModel{})

	res.OkWithMessage(fmt.Sprintf("成功取消收藏 %d 篇文章", len(collects)), c)
}
