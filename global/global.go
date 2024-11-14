package global

import (
	"github.com/go-redis/redis"
	"github.com/olivere/elastic/v7"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/config"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var (
	Config   *config.Config
	Log      *logrus.Logger
	DB       *gorm.DB
	MysqlLog logger.Interface
	Redis    *redis.Client
	ESClient *elastic.Client
)
