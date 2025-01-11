package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) ChatRouter() {
	app := api.ApiGroupApp.ChatApi
	router.GET("chat_groups", app.ChatGroupView)
	router.GET("chat_groups_records", app.ChatListView)
	router.DELETE("chat_groups_records", middleware.JwtAdmin(), app.ChatRemoveView)
}
