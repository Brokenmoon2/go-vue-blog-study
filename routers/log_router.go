package routers

import "go-vue-blog-study/api"

func (router RouterGroup) LogRouter() {
	app := api.ApiGroupApp.LogApi
	router.GET("logs", app.LogListView)
}
