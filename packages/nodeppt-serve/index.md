title: 述职报告-杨凯
speaker: 杨凯

<slide class="bg-black-blue aligncenter" image="https://cn.bing.com/az/hprichbg/rb/SwiftFox_ZH-CN9413097062_1920x1080.jpg .dark">

# 述职报告 {.text-landing.text-shadow}

Antispam 杨凯 {.text-intro.animated.fadeInUp.delay-500}

<slide>

## 年度参与项目

:::flexblock

## 反垃圾
* 批量文字审核
* 照片墙审核
* moderation脚手架
* 部署金山审核后台
* 规则引擎编辑器

---

## 朋友圈
* 先审后发
* Kafka化
* 朋友圈评论审核
* 拆分海外朋友圈队列，回国安检
* 打标签后台
* 朋友圈增加审核日志详情
* 话题动态评论审核

---

## 真人认证

* 改版，新增高级审核工具
* 认证信息嵌入用户页
* 增加认证历史
* 队列数据更精确
* 增加真人认证复审支持
* 请求统计
* 钓鱼
:::

<slide :class="size-60 aligncenter">

## 技术驱动
---

* ### generic hot reloader
* ### 队列数据计算集中到一台线上机器
* ### 规则引擎编辑器

<slide :class="size-80">

:::column {.sm.vertical-align}
### profiler
迅速排查后台慢的原因。

----
```go
// usage:
// import "gitlab.p1staff.com/antispam/tantan-backend-moderation/tools/profile"
// defer longTimeWarning(time.Now())
func LongTimeWarning(invocation time.Time) {
	elapsed := time.Since(invocation)
	if elapsed < time.Second {
		return
	}
	programCounter, _, _, _ := runtime.Caller(1)
	fnName := runtime.FuncForPC(programCounter).Name()
	names := strings.Split(fnName, "tantan-backend-moderation/")
	name := names[len(names)-1]
	slog.Warning("longTimeFunction found: %s, duration: %s", name, elapsed)
}
```
:::


<slide :class="size-80">

:::column {.sm.vertical-align}
### 通用的队列实现
将取任务动作抽象出来，把db状态映射到内存中。

----
```go
package queue

type IQueueProducer interface {
	Preload() ([]Job, error)
}

type IQueueConsumer interface {
	GetOriginal(map[string]interface{}) ([]Job, error)
	Get(*Queue, map[string]interface{}) ([]Job, error)
	Validate([]Job, map[string]interface{}) ([]Job, error)
}
```
:::

---
目前用于新、老后台预加载队列 {.aligncenter}

<slide class="fullscreen">

:::card

![](http://localhost:8001/img/untitled.jpg)

---

## 保密提醒

每日保密提醒弹窗 {.text-intro}

:::

<slide class="fullscreen">

:::card

![](http://localhost:8001/img/untitled2.jpg)

---

# 数字指纹

#### 水印
#### 页面埋点
:::

<slide :class="size-60">

## 个人发展展望
---

### 业务方面
* ### 产品层面多积极参与讨论，从更上游为团队更好更快完成任务作出贡献
### 技术方面
* ### 保障新、老审核后台的平稳运行
* ### 多向同事请教和学习
* ### 开阔视野，多调研新技术，日后给技术团队更多选择余地

<slide class="bg-black-blue aligncenter" image="https://cn.bing.com/az/hprichbg/rb/SwiftFox_ZH-CN9413097062_1920x1080.jpg .dark">

# End
