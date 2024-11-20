package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) CommentRouter() {
	app := api.ApiGroupApp.CommentApi
	router.POST("comments", middleware.JwtAuth(), app.CommentCreateView)
	router.GET("comments", app.CommentListView)
}
