package chat_api

import (
	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	"github.com/sirupsen/logrus"
	"go-vue-blog-study/models/res"
	"net/http"
)

var ConnGroupMap = map[string]*websocket.Conn{}

func (ChatApi) ChatGroupView(c *gin.Context) {
	var upGrader = websocket.Upgrader{
		CheckOrigin: func(r *http.Request) bool {
			// 鉴权 true表示放行，false表示拦截
			return true
		},
	}
	// 将http升级至websocket
	conn, err := upGrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		res.FailWithCode(res.ArgumentError, c)
		return
	}
	addr := conn.RemoteAddr().String()
	ConnGroupMap[addr] = conn
	logrus.Infof("%s 连接成功", addr)
	for {
		// 消息类型，消息，错误
		_, p, err := conn.ReadMessage()
		if err != nil {
			// 用户断开聊天
			break
		}
		SendGroupMsg(string(p))
	}
	defer conn.Close()
	delete(ConnGroupMap, addr)
}

// SendGroupMsg 群聊功能
func SendGroupMsg(text string) {
	for _, conn := range ConnGroupMap {
		conn.WriteMessage(websocket.TextMessage, []byte(text))
	}
}
