package settings_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/config"
	"go-vue-blog-study/core"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models/res"
)

// SettingsSiteUpdateView 编辑网站信息
// @Tags 系统管理
// @Summary 编辑网站信息
// @Description 编辑网站信息
// @Param data body config.SiteInfo true "编辑网站信息的参数"
// @Param token header string  true  "token"
// @Router /api/settings/site [put]
// @Produce json
// @Success 200 {object} res.Response{data=config.SiteInfo}
func (SettingsApi) SettingsSiteUpdateView(c *gin.Context) {
	var info config.SiteInfo
	err := c.ShouldBindJSON(&info)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	global.Config.SiteInfo = info
	core.SetYaml()
	res.OkWithMessage("网站信息更新成功", c)
}
