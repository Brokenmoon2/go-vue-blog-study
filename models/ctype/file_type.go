package ctype

import "github.com/goccy/go-json"

// 定义ImageType枚举类型
type ImageType int

// 定义ImageType的常量
const (
	Local ImageType = 1 // 本地
	QiNiu ImageType = 2 // 七牛云
)

// MarshalJSON方法将ImageType的值转换为JSON格式
func (s ImageType) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

// String方法将ImageType的值转换为字符串表示
func (s ImageType) String() string {
	var str string
	switch s {
	case Local:
		str = "本地"
	case QiNiu:
		str = "七牛云"
	default:
		str = "其他"
	}
	return str
}
