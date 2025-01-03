package user_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/ctype"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service/common"
	"go-vue-blog-study/utils/desens"
	"go-vue-blog-study/utils/jwts"
)

type UserResponse struct {
	models.UserModel
	RoleID int `json:"role_id"`
}

type UserListRequest struct {
	models.PageInfo
	Role int `json:"role" form:"role"`
}

// UserListView 用户列表
// @Tags 用户管理
// @Summary 用户列表
// @Description 用户列表
// @Param data query models.PageInfo  false  "查询参数"
// @Param token header string  true  "token"
// @Router /api/users [get]
// @Produce json
// @Success 200 {object} res.Response{data=res.ListResponse[models.UserModel]}
func (UserApi) UserListView(c *gin.Context) {
	_claims, _ := c.Get("claims")
	claims := _claims.(*jwts.CustomClaims)
	var page UserListRequest
	if err := c.ShouldBindQuery(&page); err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	var users []UserResponse
	list, count, _ := common.ComList(models.UserModel{Role: ctype.Role(page.Role)}, common.Option{
		PageInfo: page.PageInfo,
		Likes:    []string{"nick_name", "user_name"},
	})
	for _, user := range list {
		if ctype.Role(claims.Role) != ctype.PermissionAdmin {
			// 管理员
			user.UserName = ""
		}
		user.Tel = desens.DesensitizationTel(user.Tel)
		user.Email = desens.DesensitizationEmail(user.Email)
		// 脱敏
		users = append(users, UserResponse{
			UserModel: user,
			RoleID:    int(user.Role),
		})
	}

	res.OkWithList(users, count, c)
}
