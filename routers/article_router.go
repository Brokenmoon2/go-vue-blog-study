package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) ArticleRouter() {
	app := api.ApiGroupApp.ArticleApi
	router.POST("articles", middleware.JwtAuth(), app.ArticleCreateView)
	router.GET("articles", app.ArticleListView)
	router.GET("articles/:id", app.ArticleDetailView)
	router.GET("articles/detail", app.ArticleDetailByTitleView)
	router.GET("articles/calendar", app.ArticleCalendarView)
	router.PUT("articles", app.ArticleUpdateView)
	router.GET("articles/tags", app.ArticleTagListView)
}
