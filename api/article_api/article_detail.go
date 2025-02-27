package article_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/es_ser"
	"go-vue-blog-study/service/redis_ser"
	"strings"
)

type ESIDRequest struct {
	ID string `json:"id" form:"id" uri:"id"` //从 URL 路径、JSON 请求体和表单数据中获取 "id" 参数，分别绑定到 UserRequest 结构体的 ID 字段。
}

func (ArticleApi) ArticleDetailView(c *gin.Context) {
	var cr models.ESIDRequest
	err := c.ShouldBindUri(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	redis_ser.NewArticleLook().Set(cr.ID)
	model, err := es_ser.CommDetail(cr.ID)
	if err != nil {
		res.FailWithMessage(err.Error(), c)
		return
	}

	// 在 BannerUrl 前面加上 /，避免重复添加
	if model.BannerUrl != "" && !strings.HasPrefix(model.BannerUrl, "/") {
		model.BannerUrl = "/" + model.BannerUrl
	}

	res.OkWithData(model, c)
}

type ArticleDetailRequest struct {
	Title string `json:"title" form:"title"`
}

func (ArticleApi) ArticleDetailByTitleView(c *gin.Context) {
	var cr ArticleDetailRequest
	err := c.ShouldBindQuery(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	model, err := es_ser.CommDetailByKeyword(cr.Title)
	if err != nil {
		res.FailWithMessage(err.Error(), c)
		return
	}

	// 在 BannerUrl 前面加上 /，避免重复添加
	if model.BannerUrl != "" && !strings.HasPrefix(model.BannerUrl, "/") {
		model.BannerUrl = "/" + model.BannerUrl
	}

	res.OkWithData(model, c)
}
