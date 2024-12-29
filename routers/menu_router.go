package routers

import (
	"go-vue-blog-study/api"
	"go-vue-blog-study/middleware"
)

func (router RouterGroup) MenuRouter() {
	app := api.ApiGroupApp.MenuApi
	router.POST("menus", middleware.JwtAdmin(), app.MenuCreateView)
	router.GET("menus", app.MenuListView)
	router.GET("menu_names", app.MenuNameList)
	router.PUT("menus/:id", middleware.JwtAdmin(), app.MenuUpdateView)
	router.DELETE("menus", middleware.JwtAdmin(), app.MenuRemoveView)
	router.GET("menus/:id", app.MenuDetailView)
	router.GET("menus/detail", app.MenuDetailByPathView)
}
