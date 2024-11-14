package menu_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
)

type MenuNameResponse struct {
	ID    uint   `json:"id"`
	Title string `json:"title"`
	Path  string `json:"path"`
}

// MenuNameList 菜单名称列表
// @Tags 菜单管理
// @Summary 菜单名称列表
// @Description 菜单名称列表
// @Router /api/menu_names [get]
// @Produce json
// @Success 200 {object} res.Response{data=[]MenuNameResponse}
func (MenuApi) MenuNameList(c *gin.Context) {
	var menuNameList []MenuNameResponse
	global.DB.Model(models.MenuModel{}).Select("id", "title", "path").Scan(&menuNameList)
	res.OkWithData(menuNameList, c)
}
