package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) GaodeRouter() {
	app := api.ApiGroupApp.GaodeApi
	r := router.Group("gaode")
	r.GET("weather", middleware.JwtAuth(), app.WeatherInfoView)
}
