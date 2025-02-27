package images_api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
)

func (ImagesApi) ImageRemoveView(c *gin.Context) {
	var cr models.RemoveRequest
	err := c.ShouldBindJSON(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}

	var imageList []models.BannerModel
	count := global.DB.Find(&imageList, cr.IDList).RowsAffected

	if count == 0 {
		res.FailWithMessage("文件不存在", c)
		return
	}

	global.DB.Delete(&imageList)
	res.OkWithMessage(fmt.Sprintf("共删除%d张图片", count), c)
}
