package main

import (
	"go-vue-blog-study/core"
	_ "go-vue-blog-study/docs"
	"go-vue-blog-study/flags"
	"go-vue-blog-study/global"
	"go-vue-blog-study/routers"
	"go-vue-blog-study/service/cron_ser"
	"go-vue-blog-study/utils"
)

// @title gvb_server API文档
// @version 1.0
// @description gvb_server API文档
// @host 127.0.0.1:8080
// @BasePath /
func main() {
	// 读取配置文件
	core.InitConf()
	// 初始化日志
	global.Log = core.InitLogger()
	// 连接数据库
	global.DB = core.InitGorm()

	core.InitAddrDB()

	// 连接redis
	global.Redis = core.ConnectRedis()
	// 连接es
	global.ESClient = core.EsConnect()

	defer global.AddrDB.Close()

	// 命令行参数绑定
	option := flags.Parse()
	if option.Run() {
		return
	}

	cron_ser.CronInit()

	router := routers.InitRouter()

	addr := global.Config.System.Addr()

	utils.PrintSystem()

	err := router.Run(addr)
	if err != nil {
		global.Log.Fatalf(err.Error())
	}
}
