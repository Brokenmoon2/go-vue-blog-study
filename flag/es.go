package flag

import "go-vue-blog-study/models"

func EsCreateIndex() {
	models.ArticleModel{}.CreateIndex()
}
