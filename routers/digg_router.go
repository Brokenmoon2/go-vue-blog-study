package routers

import "go-vue-blog-study/api"

func (router RouterGroup) DiggRouter() {
	app := api.ApiGroupApp.DiggApi
	router.POST("digg/article", app.DiggArticleView)
}
