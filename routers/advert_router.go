package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) AdvertRouter() {
	app := api.ApiGroupApp.AdvertApi
	router.POST("adverts", middleware.JwtAdmin(), app.AdvertCreateView)
	router.GET("adverts", app.AdvertListView)
	router.PUT("adverts/:id", middleware.JwtAdmin(), app.AdvertUpdateView)
	router.DELETE("adverts", middleware.JwtAdmin(), app.AdvertRemoveView)
}
