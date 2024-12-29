package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) ImagesRoutes() {
	app := api.ApiGroupApp.ImagesApi
	router.GET("images", app.ImageListView)
	router.GET("image_names", app.ImageNameListView)
	router.POST("images", middleware.JwtAuth(), app.ImageUploadView)
	router.POST("image", middleware.JwtAuth(), app.ImageUploadDataView)
	router.DELETE("images", middleware.JwtAdmin(), app.ImageRemoveView)
	router.PUT("images", middleware.JwtAdmin(), app.ImageUpdateView)
}
