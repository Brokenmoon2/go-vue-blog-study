package api

import (
	"go-vue-blog-study/api/advert_api"
	"go-vue-blog-study/api/article_api"
	"go-vue-blog-study/api/chat_api"
	"go-vue-blog-study/api/comment_api"
	"go-vue-blog-study/api/data_api"
	"go-vue-blog-study/api/digg_api"
	"go-vue-blog-study/api/feedback_api"
	"go-vue-blog-study/api/gaode_api"
	"go-vue-blog-study/api/images_api"
	"go-vue-blog-study/api/log_api"
	"go-vue-blog-study/api/log_v2_api"
	"go-vue-blog-study/api/menu_api"
	"go-vue-blog-study/api/message_api"
	"go-vue-blog-study/api/role_api"
	"go-vue-blog-study/api/settings_api"
	"go-vue-blog-study/api/tag_api"
	"go-vue-blog-study/api/user_api"
)

type ApiGroup struct {
	SettingsApi settings_api.SettingsApi
	ImagesApi   images_api.ImagesApi
	AdvertApi   advert_api.AdvertApi
	MenuApi     menu_api.MenuApi
	UserApi     user_api.UserApi
	TagApi      tag_api.TagApi
	MessageApi  message_api.MessageApi
	ArticleApi  article_api.ArticleApi
	DiggApi     digg_api.DiggApi
	CommentApi  comment_api.CommentApi
	ChatApi     chat_api.ChatApi
	RoleApi     role_api.RoleApi
	LogApi      log_api.LogApi
	LogV2Api    log_v2_api.LogApi
	DataApi     data_api.DataApi
	GaodeApi    gaode_api.GaodeApi
	FeedbackApi feedback_api.FeedbackApi
}

var ApiGroupApp = new(ApiGroup)
