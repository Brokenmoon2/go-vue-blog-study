package images_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/common"
	"strings"
)

// ImageListView 图片列表
// @Tags 图片管理
// @Summary 图片列表
// @Description 图片列表
// @Param data query models.PageInfo    false  "查询参数"
// @Router /api/images [get]
// @Produce json
// @Success 200 {object} res.Response{data=res.ListResponse[models.BannerModel]}
func (ImagesApi) ImageListView(c *gin.Context) {
	var cr models.PageInfo
	err := c.ShouldBindQuery(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}

	list, count, err := common.ComList(models.BannerModel{}, common.Option{
		PageInfo: cr,
		Debug:    true,
	})

	// 遍历 list 并给图片路径加上前缀 /
	for i := range list {
		// 假设 BannerModel 中有一个字段 ImagePath
		// 如果路径本身没有 /，则加上 /
		if list[i].Path != "" && !strings.HasPrefix(list[i].Path, "/") {
			list[i].Path = "/" + list[i].Path
		}
	}

	// 返回修改后的 list
	res.OkWithList(list, count, c)
}
