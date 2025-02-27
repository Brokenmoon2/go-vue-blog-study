package comment_api

import (
	"context"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/olivere/elastic/v7"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/common"
	"time"
)

type CommentListResponse struct {
	ID              uint      `json:"id"`
	CreatedAt       time.Time `json:"created_at"` // 创建时间
	ArticleTitle    string    `json:"article_title"`
	ArticleBanner   string    `json:"article_banner"`
	ParentCommentID *uint     `json:"parent_comment_id"`
	Content         string    `json:"content"`
	DiggCount       int       `json:"digg_count"`
	CommentCount    int       `json:"comment_count"`
	UserNickName    string    `json:"user_nick_name"`
}

// CommentListAllView 评论列表
// @Tags 评论管理
// @Summary 评论列表
// @Description 评论列表
// @Param data query models.PageInfo  true  "表示多个参数"
// @Router /api/comments [get]
// @Produce json
// @Success 200 {object} res.Response{data=res.ListResponse[CommentListResponse]}
func (CommentApi) CommentListAllView(c *gin.Context) {
	var cr models.PageInfo

	c.ShouldBindQuery(&cr)

	if cr.Limit == 0 {
		cr.Limit = 10000 // 默认 10000 条记录
	}

	list, count, _ := common.ComList(models.CommentModel{}, common.Option{
		PageInfo: cr,
		Preload:  []string{"User"},
	})

	var commentList = make([]CommentListResponse, 0)

	var collMap = map[string]models.ArticleModel{}
	var articleIDList []interface{}
	for _, model := range list {
		articleIDList = append(articleIDList, model.ArticleID)
		collMap[model.ArticleID] = models.ArticleModel{}
	}
	boolSearch := elastic.NewTermsQuery("_id", articleIDList...)
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
		collMap[hit.Id] = article
	}

	for _, model := range list {
		commentList = append(commentList, CommentListResponse{
			ID:              model.ID,
			CreatedAt:       model.CreatedAt,
			ParentCommentID: model.ParentCommentID,
			Content:         model.Content,
			DiggCount:       model.DiggCount,
			CommentCount:    model.CommentCount,
			UserNickName:    model.User.NickName,
			ArticleTitle:    collMap[model.ArticleID].Title,
			ArticleBanner:   collMap[model.ArticleID].BannerUrl,
		})
	}

	res.OkWithList(commentList, count, c)

}
