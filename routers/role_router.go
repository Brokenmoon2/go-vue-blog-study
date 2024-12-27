package routers

import "go-vue-blog-study/api"

func (router RouterGroup) RoleRouter() {
	app := api.ApiGroupApp.RoleApi
	router.GET("role_ids", app.RoleIDListView)
}
