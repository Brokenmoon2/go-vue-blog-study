package article_api

import (
	"context"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/olivere/elastic/v7"
	"go-vue-blog-study/global"
	"go-vue-blog-study/models"
	"go-vue-blog-study/models/res"
	"time"
)

type CalendarResponse struct {
	Date  string `json:"date"`
	Count int    `json:"count"`
}

type BucketsType struct {
	Buckets []struct { // Buckets 是一个结构体切片，表示多个 bucket 的数据
		KeyAsString string `json:"key_as_string"`
		Key         int64  `json:"key"`
		DocCount    int    `json:"doc_count"`
	} `json:"buckets"`
}

var DateCount = map[string]int{}

func (ArticleApi) ArticleCalendarView(c *gin.Context) {

	// 时间聚合，一些方法，暂时不用着急了解
	agg := elastic.NewDateHistogramAggregation().Field("created_at").CalendarInterval("day")

	// 时间段搜索
	// 从今天开始，到去年的今天
	now := time.Now()
	aYearAgo := now.AddDate(-1, 0, 0)

	format := "2006-01-02 15:04:05"
	// lt 小于  gt 大于
	query := elastic.NewRangeQuery("created_at").
		Gte(aYearAgo.Format(format)).
		Lte(now.Format(format))

	result, err := global.ESClient.
		Search(models.ArticleModel{}.Index()).
		Query(query).
		Aggregation("calendar", agg).
		Size(0).
		Do(context.Background())
	if err != nil {
		global.Log.Error(err)
		res.FailWithMessage("查询失败", c)
		return
	}

	var data BucketsType
	_ = json.Unmarshal(result.Aggregations["calendar"], &data)

	var resList = make([]CalendarResponse, 0)
	for _, bucket := range data.Buckets {
		Time, _ := time.Parse(format, bucket.KeyAsString)
		DateCount[Time.Format("2006-01-02")] = bucket.DocCount
	}
	days := int(now.Sub(aYearAgo).Hours() / 24)
	for i := 0; i <= days; i++ {
		day := aYearAgo.AddDate(0, 0, i).Format("2006-01-02")

		count, _ := DateCount[day]
		resList = append(resList, CalendarResponse{
			Date:  day,
			Count: count,
		})
	}

	res.OkWithData(resList, c)

}
