package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) SettingsRoutes() {
	settingsApi := api.ApiGroupApp.SettingsApi
	router.GET("settings/site", settingsApi.SettingsSiteInfoView)
	router.PUT("settings/site", middleware.JwtAdmin(), settingsApi.SettingsSiteUpdateView)
	router.GET("settings/:name", settingsApi.SettingsInfoView)
	router.PUT("settings/:name", middleware.JwtAdmin(), settingsApi.SettingsInfoUpdateView)
}
