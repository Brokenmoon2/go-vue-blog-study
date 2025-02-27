package settings_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models/res"
)

type SettingsUri struct {
	Name string `uri:"name"`
}

// SettingsInfoView 显示某一项的配置信息
// @Tags 系统管理
// @Summary 显示某一项的配置信息
// @Description 显示某一项的配置信息  site email qq qiniu jwt chat_group
// @Param name path string  true  "name"
// @Param token header string  true  "token"
// @Router /api/settings/{name} [get]
// @Produce json
// @Success 200 {object} res.Response{}
func (SettingsApi) SettingsInfoView(c *gin.Context) {

	var cr SettingsUri
	err := c.ShouldBindUri(&cr)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}

	switch cr.Name {
	case "email":
		info := global.Config.Email
		info.Password = "******"
		res.OkWithData(info, c)
	case "qq":
		info := global.Config.QQ
		info.Key = "******"
		res.OkWithData(info, c)
	case "qiniu":
		info := global.Config.QiNiu
		info.SecretKey = "******"
		res.OkWithData(info, c)
	case "jwt":
		info := global.Config.Jwy
		info.Secret = "******"
		res.OkWithData(info, c)
	case "chat_group":
		res.OkWithData(global.Config.ChatGroup, c)
	case "gaode":
		info := global.Config.Gaode
		info.Key = "******"
		res.OkWithData(info, c)
	default:
		res.FailWithMessage("没有对应的配置信息", c)
	}
}
