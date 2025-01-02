package routers

import "go-vue-blog-study/api"

func (router RouterGroup) NewsRouter() {
	app := api.ApiGroupApp.NewsApi
	router.POST("news", app.NewListView)
}
