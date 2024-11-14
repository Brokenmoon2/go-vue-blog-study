package main

import (
	"go-vue-blog-study/core"
	_ "go-vue-blog-study/docs"
	"go-vue-blog-study/flag"
	"go-vue-blog-study/global"
	"go-vue-blog-study/routers"
)

// @title go-vue-blog-study API文档
// @version 1.0
// @description go-vue-blog-study API文档
// @host 127.0.0.01:8080
// @BasePath /
func main() {
	// 初始化配置文件（读取配置文件）
	core.InitConf()
	// 初始化啊日志
	global.Log = core.InitLogger()
	// 初始化数据库
	global.DB = core.InitGorm()

	//命令行参数绑定
	option := flag.Parse()
	if flag.IsWebStop(option) {
		flag.SwitchOption(option)
		return
	}
	// 初始化redis
	global.Redis = core.ConnectRedis()
	// 连接es
	global.ESClient = core.EsConnect()

	router := routers.InitRoutes()
	// 注册自定义校验器

	addr := global.Config.System.Addr()
	global.Log.Infof("go-vue-blog-study运行在：%s", addr)
	err := router.Run(addr)
	if err != nil {
		global.Log.Fatal(err.Error())
	}
}
