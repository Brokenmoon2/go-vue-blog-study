package api

import (
	"go-vue-blog-study/api/advert_api"
	"go-vue-blog-study/api/article_api"
	"go-vue-blog-study/api/digg_api"
	"go-vue-blog-study/api/images_api"
	"go-vue-blog-study/api/menu_api"
	"go-vue-blog-study/api/message_api"
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
}

var ApiGroupApp = new(ApiGroup)
