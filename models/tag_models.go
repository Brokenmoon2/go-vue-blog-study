package models

type TagModel struct {
	MODEL
	Title string `gorm:"size:16" json:"title"` //标签名称
}
