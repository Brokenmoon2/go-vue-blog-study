package routers

import (
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	gs "github.com/swaggo/gin-swagger"
	"go-vue-blog-study/global"
	"go-vue-blog-study/middleware"
	"net/http"
)

type RouterGroup struct {
	*gin.RouterGroup
}

func InitRoutes() *gin.Engine {
	gin.SetMode(global.Config.System.Env)
	router := gin.Default()

	router.Use(middleware.LogMiddleWare())
	router.StaticFS("uploads", http.Dir("uploads"))
	router.GET("/swagger/*any", gs.WrapHandler(swaggerFiles.Handler))
	apiRouterGroup := router.Group("api")
	// 系统配置api
	routerGroupApp := RouterGroup{apiRouterGroup}
	routerGroupApp.SettingsRoutes()
	routerGroupApp.ImagesRoutes()
	routerGroupApp.AdvertRouter()
	routerGroupApp.MenuRouter()
	routerGroupApp.UserRouter()
	routerGroupApp.TagRouter()
	routerGroupApp.MessageRouter()
	routerGroupApp.ArticleRouter()
	routerGroupApp.DiggRouter()
	routerGroupApp.CommentRouter()
	routerGroupApp.ChatRouter()
	routerGroupApp.RoleRouter()
	routerGroupApp.LogRouter()
	routerGroupApp.LogV2Router()
	routerGroupApp.DataRouter()
	return router
}
