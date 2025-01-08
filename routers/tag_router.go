package routers

import "go-vue-blog-study/api"

func (router RouterGroup) TagRouter() {
	app := api.ApiGroupApp.TagApi
	router.POST("tags", app.TagCreateView)
	router.GET("tags", app.TagListView)
	router.GET("tag_names", app.TagNameListView)
	router.PUT("tags/:id", app.TagUpdateView)
	router.DELETE("tags", app.TagRemoveView)
}
