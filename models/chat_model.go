package models

import "go-vue-blog-study/models/ctype"

type ChatModel struct {
	MODEL    `json:","`
	NickName string        `gorm:"size:15" json:"nick_name"`
	Avatar   string        `gorm:"size:128" json:"avatar"`
	Content  string        `gorm:"size:256" json:"content"`
	IP       string        `gorm:"size:32" json:"ip,omit(list)"`
	Addr     string        `gorm:"size:64" json:"addr,omit(list)"`
	IsGroup  bool          `json:"is_group"` // 是否是群组消息
	MsgType  ctype.MsgType `gorm:"size:4" json:"msg_type"`
}
