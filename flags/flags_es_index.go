package flags

import (
	"go-vue-blog-study/models"
	"go-vue-blog-study/service/es_ser/indexs"
)

func ESIndex() {
	indexs.CreateIndex(models.FullTextModel{})
	indexs.CreateIndex(models.ArticleModel{})
}
