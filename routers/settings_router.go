package routers

import "go-vue-blog-study/api"

func (router RouterGroup) SettingsRoutes() {
	settingsApi := api.ApiGroupApp.SettingsApi
	router.GET("settings/:name", settingsApi.SettingsInfoView)
	router.PUT("settings/:name", settingsApi.SettingsInfoUpdateView)
}
