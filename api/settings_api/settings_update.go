package settings_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/config"
	"go-vue-blog-study/core"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models/res"
)

// SettingsInfoUpdateView 修改某一项的配置信息
func (SettingsApi) SettingsInfoUpdateView(c *gin.Context) {
	var cr SettingsUri
	// 绑定URI参数到cr变量
	err := c.ShouldBindUri(&cr)
	if err != nil {
		// 如果绑定失败，返回错误信息
		res.FailWithCode(res.ArgumentError, c)
		return
	}

	// 根据cr.Name的值来决定更新哪一项配置信息
	switch cr.Name {
	case "site":
		// 声明一个SiteInfo类型的变量info
		var info config.SiteInfo
		// 绑定JSON请求体到info变量
		err = c.ShouldBindJSON(&info)
		if err != nil {
			// 如果绑定失败，返回错误信息
			res.FailWithCode(res.ArgumentError, c)
			return
		}
		// 更新全局配置中的SiteInfo
		global.Config.SiteInfo = info

	case "email":
		// 声明一个Email类型的变量info
		var info config.Email
		// 绑定JSON请求体到info变量，这里可能是一个拼写错误，正确的应该是ShouldBindJSON
		err = c.ShouldBindJSON(&info) // 应为ShouldBindJSON
		if err != nil {
			// 如果绑定失败，返回错误信息
			res.FailWithCode(res.ArgumentError, c)
			return
		}
		// 更新全局配置中的Email
		global.Config.Email = info
	case "qq":
		// 声明一个QQ类型的变量info
		var info config.QQ
		// 绑定JSON请求体到info变量
		err = c.ShouldBindJSON(&info)
		if err != nil {
			// 如果绑定失败，返回错误信息
			res.FailWithCode(res.ArgumentError, c)
			return
		}
		// 更新全局配置中的QQ配置
		global.Config.QQ = info

	case "qiniu":
		// 声明一个QiNiu类型的变量info
		var info config.QiNiu
		// 绑定JSON请求体到info变量
		err = c.ShouldBindJSON(&info)
		if err != nil {
			// 如果绑定失败，返回错误信息
			res.FailWithCode(res.ArgumentError, c)
			return
		}
		// 更新全局配置中的QiNiu配置
		global.Config.QiNiu = info

	case "jwt":
		// 声明一个Jwt类型的变量info
		var info config.Jwy // 注意这里应该是 Jwt，而不是 Jwy
		// 绑定JSON请求体到info变量
		err = c.ShouldBindJSON(&info)
		if err != nil {
			// 如果绑定失败，返回错误信息
			res.FailWithCode(res.ArgumentError, c)
			return
		}
		// 更新全局配置中的Jwt配置
		global.Config.Jwy = info // 注意这里应该是 Jwt，而不是 Jwy

	default:
		// 如果没有对应的配置信息，返回错误信息
		res.FailWithMessage("没有对应的配置信息", c)
	}
	// 保存配置到YAML文件
	core.SetYaml()
	// 返回成功的响应
	res.OkWith(c)
}
