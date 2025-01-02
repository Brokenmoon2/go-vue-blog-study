package core

import (
	geoip2db "github.com/cc14514/go-geoip2-db"
	"go-vue-blog-study/global"
	"log"
)

func InitAddrDB() {
	db, err := geoip2db.NewGeoipDbByStatik()
	if err != nil {
		log.Fatal("ip地址数据库加载失败", err)
	}
	global.AddrDB = db
}
