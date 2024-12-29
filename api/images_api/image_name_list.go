package images_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
)

type ImageResponse struct {
	ID   uint   `json:"id"`
	Path string `json:"path"` // 图片路径
	Name string `json:"name"` // 图片名称
}

// ImageNameListView 图片名称列表
// @Tags 图片管理
// @Summary 图片名称列表
// @Description 图片名称列表
// @Router /api/image_names [get]
// @Produce json
// @Success 200 {object} res.Response{data=[]ImageResponse}
func (ImagesApi) ImageNameListView(c *gin.Context) {
	var imageList []ImageResponse
	// 查询图片信息
	global.DB.Model(models.BannerModel{}).Select("id", "path", "name").Scan(&imageList)

	// 遍历图片列表，给每个 Path 字段前面加上 "/"
	for i := range imageList {
		if imageList[i].Path != "" {
			imageList[i].Path = "/" + imageList[i].Path
		}
	}

	// 返回修改后的数据
	res.OkWithData(imageList, c)
}
