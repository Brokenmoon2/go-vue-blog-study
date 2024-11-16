package digg_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/redis_ser"
)

func (DiggApi) DiggArticleView(c *gin.Context) {
	var cr models.ESIDRequest
	err := c.ShouldBindJSON(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	// 对长度校验
	// 查es
	redis_ser.Digg(cr.ID)
	res.OkWithMessage("文章点赞成功", c)
}
