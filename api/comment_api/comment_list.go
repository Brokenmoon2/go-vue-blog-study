package comment_api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/liu-cn/json-filter/filter"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/redis_ser"
)

type CommentListRequest struct {
	ArticleID string `form:"article_id"`
}

func (CommentApi) CommentListView(c *gin.Context) {
	var cr CommentListRequest
	err := c.ShouldBindQuery(&cr)
	if err != nil {
		res.FailWithError(err, &cr, c)
		return
	}
	rootCommentList := FindArticleCommentList(cr.ArticleID)
	res.OkWithData(filter.Select("c", rootCommentList), c)
	return
}

func FindArticleCommentList(articleID string) (RootCommentList []*models.CommentModel) {
	// 先把文章下的根评论查出来
	global.DB.Preload("User").Find(&RootCommentList, "article_id = ? and parent_comment_id is null", articleID)
	// 遍历根评论，递归查根评论下的所有子评论
	diggInfo := redis_ser.NewCommentDigg().GetInfo()
	for _, model := range RootCommentList {
		var subCommentList, newSubCommentList []models.CommentModel
		FindSubComment(*model, &subCommentList)
		for _, commentModel := range subCommentList {
			digg := diggInfo[fmt.Sprintf("%d", commentModel.ID)]
			commentModel.DiggCount = commentModel.DiggCount + digg
			newSubCommentList = append(newSubCommentList, commentModel)
		}
		modelDigg := diggInfo[fmt.Sprintf("%d", model.ID)]
		model.DiggCount = model.DiggCount + modelDigg
		model.SubComments = newSubCommentList
	}
	return
}

// FindSubComment 递归查评论下的子评论
func FindSubComment(model models.CommentModel, subCommentList *[]models.CommentModel) {
	global.DB.Preload("SubComments.User").Take(&model)
	for _, sub := range model.SubComments {
		*subCommentList = append(*subCommentList, sub)
		FindSubComment(sub, subCommentList)
	}
	return
}

func FindSubCommentCount(model models.CommentModel) (subCommentList []models.CommentModel) {
	findSubCommentList(model, &subCommentList)
	return subCommentList
}

func findSubCommentList(model models.CommentModel, subCommentList *[]models.CommentModel) {
	global.DB.Preload("SubComments").Take(&model)
	for _, sub := range model.SubComments {
		*subCommentList = append(*subCommentList, sub)
		FindSubComment(sub, subCommentList)
	}
	return
}
