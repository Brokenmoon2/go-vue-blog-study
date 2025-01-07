package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) MessageRouter() {
	app := api.ApiGroupApp.MessageApi
	router.POST("messages", middleware.JwtAuth(), app.MessageCreateView)
	router.GET("messages_all", app.MessageListAllView)
	router.GET("messages", middleware.JwtAuth(), app.MessageListView)
	router.POST("messages_record", middleware.JwtAuth(), app.MessageRecordView)
	router.GET("message_users/record", middleware.JwtAdmin(), app.MessageUserRecordView)
	router.GET("message_users", middleware.JwtAdmin(), app.MessageUserListView)
	router.GET("message_users/user", middleware.JwtAdmin(), app.MessageUserListByUserView)

}
