package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) LogRouter() {
	app := api.ApiGroupApp.LogApi
	router.GET("logs", app.LogListView)
	router.DELETE("logs", middleware.JwtAdmin(), app.LogRemoveListView)
}
