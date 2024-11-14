package main

import (
	"fmt"
	"go-vue-blog-study/core"
	"go-vue-blog-study/global"
	"go-vue-blog-study/utils/jwts"
)

func main() {
	core.InitConf()
	global.Log = core.InitLogger()
	token, err := jwts.GenToken(jwts.JwtPayLoad{
		UserID:   1,
		Role:     1,
		Username: "fengfeng",
		NickName: "xxx",
	})
	fmt.Println(token, err)

	claims, err := jwts.ParseToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZlbmdmZW5nIiwibmlja19uYW1lIjoieHh4Iiwicm9sZSI6MSwidXNlcl9pZCI6MSwiYXZhdGFyIjoiIiwiZXhwIjoxNzMwNDUwNjY2LCJpc3MiOiIxMjM0In0.aLbBrLL0Wzlfc0sCLzv3OswTj9X8ZrXrgM-DnD7StLk")
	fmt.Println(claims, err)

}
