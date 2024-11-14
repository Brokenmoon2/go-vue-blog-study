package main

import (
	"encoding/json"
	"fmt"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/models/res"
	"os"
)

const file = "models/res/err_code.json"

type ErrMap map[res.ErrorCode]string

func main() {
	// 读取文件
	byteData, err := os.ReadFile(file)
	if err != nil {
		logrus.Error(err)
		return
	}

	// 初始化 ErrMap 类型的变量
	var errMap ErrMap
	// 解析JSON数据到errMap
	err = json.Unmarshal(byteData, &errMap)
	if err != nil {
		logrus.Error(err)
		return
	}

	// 打印errMap的内容
	fmt.Println(errMap)

	// 打印errMap中对应res.SettingsError的错误信息
	fmt.Println(errMap[res.SettingsError])
}
