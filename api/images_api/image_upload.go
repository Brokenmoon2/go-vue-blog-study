package images_api

import (
	"github.com/gin-gonic/gin"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models/res"
	"go-vue-blog-study/service"
	"go-vue-blog-study/service/image_ser"
	"io/fs"
	"os"
)

var (
	// WhiteImageList 图片上传的白名单
	WhiteImageList = []string{
		"jpg",
		"png",
		"jpeg",
		"ico",
		"tiff",
		"gif",
		"svg",
		"webp",
	}
)

// ImageUploadView 上传单个图片，返回图片的url
func (ImagesApi) ImageUploadView(c *gin.Context) {
	// 上传多个图片
	form, err := c.MultipartForm()
	if err != nil {
		res.FailWithMessage(err.Error(), c)
		return
	}
	fileList, ok := form.File["images"]
	if !ok {
		res.FailWithMessage("不存在的文件", c)
		return
	}

	// 判断路径是否存在
	basePath := global.Config.Upload.Path
	_, err = os.ReadDir(basePath)
	if err != nil {
		// 递归创建
		err = os.MkdirAll(basePath, fs.ModePerm)
		if err != nil {
			global.Log.Error(err)
		}
	}

	// 不存在就创建
	var resList []image_ser.FileUploadResponse

	for _, file := range fileList {

		// 上传文件
		serviceRes := service.ServiceApp.ImageService.ImageUploadService(file)
		if !serviceRes.IsSuccess {
			resList = append(resList, serviceRes)
			continue
		}
		// 成功的
		if !global.Config.QiNiu.Enable {
			// 本地还得保存一下
			err = c.SaveUploadedFile(file, serviceRes.FileName)
			if err != nil {
				global.Log.Error(err)
				serviceRes.Msg = err.Error()
				serviceRes.IsSuccess = false
				resList = append(resList, serviceRes)
				continue
			}
		}
		resList = append(resList, serviceRes)
	}

	res.OkWithData(resList, c)

}
