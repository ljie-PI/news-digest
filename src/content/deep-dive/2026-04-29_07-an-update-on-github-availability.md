---
title: "GitHub 可用性更新：AI 时代的基础设施困局"
date: "2026-04-29"
generated: "2026-04-29 07:00"
source: "HN"
slug: "2026-04-29_07-an-update-on-github-availability"
summary: "2026 年 4 月 28 日，GitHub 发布了一篇关于平台可用性问题的官方博客更新，回应近期两起重大事故：4 月 23 日的合并队列（merge queue）事件和 4 月 27 日的 "
---

# GitHub 可用性更新：AI 时代的基础设施困局

## 事件背景

2026 年 4 月 28 日，GitHub 发布了一篇关于平台可用性问题的官方博客更新，回应近期两起重大事故：4 月 23 日的合并队列（merge queue）事件和 4 月 27 日的 Elasticsearch 故障。文章由 GitHub 高层撰写，承认"两起事故都不可接受"，并详细说明了改进计划。该帖在 HN 上获得 295 分和 205 条评论。此博文的发布时间与 Ghostty 宣布离开 GitHub 几乎同步，形成了强烈的叙事对照。

## 核心观点

GitHub 承认了一个关键事实：自 2025 年 12 月以来，AI 代理开发工作流急剧加速，平台需要从最初计划的 10 倍扩容提升到 30 倍。增长不是单一系统的压力——一个 PR 可能触及 Git 存储、可合并性检查、分支保护、GitHub Actions、搜索、通知、权限、Webhooks、API、后台任务、缓存和数据库等多个系统。短期措施包括将 Webhooks 迁出 MySQL、重新设计用户会话缓存、重构认证授权流程以减少数据库负载。长期方面，GitHub 正在推进多云架构（从自有数据中心迁移到公有云，并开始规划多云路径），以及将性能敏感代码从 Ruby 单体迁移到 Go。

## 社区热议

HN 讨论聚焦于 Azure 迁移争议和 GitHub 的可靠性文化：

- **mijoharas** 引发了最热议的讨论线。**derwiki** 简洁评价："相当严重。但作为用过 Azure 的人，我信。"（"It's pretty damning. But as someone who has used Azure, I buy it."）**everfrustrated** 进一步指出："微软的两个子公司—— GitHub 和 LinkedIn——要么搁置了强制迁移到 Azure 的计划，要么在考虑非 Azure 选项，这相当说明问题。"
- **embedding-shape** 用讽刺的对话还原了可能的内部场景："微软高管：都去 Azure！GitHub 开发者：Azure 处理不了我们的负载，我们有自己的数据中心！微软高管：好吧，你是微软人了，请发博客说半年内 100% 上 Azure……几个月后……"。**alper** 总结："Azure 是云计算界的 MS Teams。"（"Azure is the MS Teams of clouds."）
- **PunchyHamster** 对比了 AWS 的策略："Amazon 是'我们给自己建了 AWS 然后发现可以卖给别人'。而 Azure 感觉像是云计算的拼多多仿品。"（"Azure feels like Temu clone of Cloud"）
- **jasoncartwright** 指出了一个尴尬事实：GitHub 的官方博客本身并没有托管在 Azure 上，而是使用了 Cloudflare（通过 WPEngine），这更加说明了对自家云的信心问题。

## 行业影响

这篇更新揭示了 AI 时代对开发基础设施的深层冲击。当 AI 代理开始大规模创建仓库、提交 PR、调用 API 时，传统的平台容量规划完全失效。GitHub 的困境并非个例——任何服务于开发者工作流的平台都将面临类似的指数级增长挑战。同时，被迫使用母公司（微软/Azure）基础设施带来的"内部政治成本"正在以可靠性的代价体现出来。GitHub 向多云架构的转变可能成为企业级平台的范式参考：即使是万亿美元公司的子公司，也需要基础设施的独立性来确保可靠性。

## 相关链接

- 原文：https://github.blog/news-insights/company-news/an-update-on-github-availability/
- HN 讨论：https://news.ycombinator.com/item?id=47932422
- GitHub 状态页：https://www.githubstatus.com/
- 此前的可用性声明：https://github.blog/news-insights/company-news/addressing-githubs-recent-availability-issues-2/
