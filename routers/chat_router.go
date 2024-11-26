package routers

import "go-vue-blog-study/api"

func (router RouterGroup) ChatRouter() {
	app := api.ApiGroupApp.ChatApi
	router.GET("chat_groups", app.ChatGroupView)
	router.GET("chat_groups_records", app.ChatListView)
}
