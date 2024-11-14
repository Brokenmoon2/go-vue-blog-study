package core

import (
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/global"
)

func EsConnect() *elastic.Client { //返回类型为 *elastic.Client，即指向 Elasticsearch 客户端的指针。
	var err error
	sniffOpt := elastic.SetSniff(false) //嗅探（sniffing）是指客户端在连接时自动发现集群的节点，确定所有可用的节点地址。
	//此处为false，禁止了
	c, err := elastic.NewClient( //调用 elastic 包的 NewClient 函数来创建一个新的 Elasticsearch 客户端实例。
		elastic.SetURL(global.Config.ES.URL()), //设置 Elasticsearch 服务的 URL。global.Config.ES.URL() 调用之前定义的 ES 结构体中的 URL() 方法，获取 Elasticsearch 服务的主机地址和端口（如 localhost:9200）。
		sniffOpt,
		elastic.SetBasicAuth(global.Config.ES.User, global.Config.ES.Password),
	)
	if err != nil {
		logrus.Fatalf("es连接失败 %s", err.Error())
	}
	return c
}
