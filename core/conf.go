package core

import (
	"fmt"
	"go-vue-blog-study/config"
	"go-vue-blog-study/global"
	"gopkg.in/yaml.v2"
	"io/fs"
	"io/ioutil"
	"log"
)

const ConfigFile = "setting.yaml" //配置文件的位置

func InitConf() {
	c := &config.Config{} //c 可以被用来指向 Config 结构体实例，并且可以通过该指针来访问或修改结构体的字段。
	yamlConf, err := ioutil.ReadFile(ConfigFile)
	if err != nil {
		panic(fmt.Errorf("get yamlConf error:%s", err))
	}
	err = yaml.Unmarshal(yamlConf, c)
	if err != nil {
		log.Fatalf("config Init Unmarshal:%v", err)
	}
	log.Println("config yamlFile load Init success.")
	global.Config = c
}

// SetYaml 修改yaml文件配置
func SetYaml() error {
	byteData, err := yaml.Marshal(global.Config)
	if err != nil {
		return err
	}
	err = ioutil.WriteFile(ConfigFile, byteData, fs.ModePerm)
	if err != nil {
		return err
	}
	global.Log.Info("配置文件修改成功")
	return nil
}
