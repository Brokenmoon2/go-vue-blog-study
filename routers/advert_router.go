package routers

import "go-vue-blog-study/api"

func (router RouterGroup) AdvertRouter() {
	app := api.ApiGroupApp.AdvertApi
	router.POST("adverts", app.AdvertCreateView)
	router.GET("adverts", app.AdvertListView)
	router.PUT("adverts/:id", app.AdvertUpdateView)
	router.DELETE("adverts", app.AdvertRemoveView)

}
