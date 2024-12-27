package jwts

import (
	"github.com/golang-jwt/jwt/v4"
	"go-vue-blog-study/global"
	"time"
)

// GenToken 创建 Token
func GenToken(user JwtPayLoad) (string, error) {
	MySecret = []byte(global.Config.Jwy.Secret)
	claim := CustomClaims{
		user,
		jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * 24 * time.Duration(global.Config.Jwy.Expires))),
			// 默认2小时过期
			Issuer: global.Config.Jwy.Issuer, // 签发人
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claim)
	return token.SignedString(MySecret)
}
