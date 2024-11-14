package service

import (
	"go-vue-blog-study/service/image_ser"
	"go-vue-blog-study/service/user_ser"
)

type ServiceGroup struct {
	ImageService image_ser.ImageService
	UserService  user_ser.UserService
}

var ServiceApp = new(ServiceGroup)
