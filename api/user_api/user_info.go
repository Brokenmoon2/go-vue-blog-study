package user_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/utils/jwts"
)

// UserInfoView 用户信息
// @Tags 用户管理
// @Summary 用户信息
// @Description 用户信息
// @Router /api/user_info [get]
// @Param token header string  true  "token"
// @Produce json
// @Success 200 {object} res.Response{data=models.UserModel}
func (UserApi) UserInfoView(c *gin.Context) {

	_claims, _ := c.Get("claims")
	claims := _claims.(*jwts.CustomClaims)

	var userInfo models.UserModel
	err := global.DB.Take(&userInfo, claims.UserID).Error
	if err != nil {
		res.FailWithMessage("用户不存在", c)
		return
	}
	res.OkWithData(userInfo, c)

}
