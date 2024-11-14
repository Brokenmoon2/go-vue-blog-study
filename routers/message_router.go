package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) MessageRouter() {
	app := api.ApiGroupApp.MessageApi
	router.POST("messages", app.MessageCreateView)
	router.GET("messages_all", app.MessageListAllView)
	router.GET("messages", middleware.JwtAuth(), app.MessageListView)
	router.GET("messages_record", middleware.JwtAuth(), app.MessageRecordView)
}
