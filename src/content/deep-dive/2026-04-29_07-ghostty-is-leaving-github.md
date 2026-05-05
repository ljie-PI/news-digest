---
title: "Ghostty 宣布离开 GitHub：一封写给 18 年热爱的告别信"
date: "2026-04-29"
generated: "2026-04-29 07:00"
source: "HN"
slug: "2026-04-29_07-ghostty-is-leaving-github"
summary: "Ghostty 是由 Mitchell Hashimoto（HashiCorp 创始人、Vagrant 作者）开发的热门终端模拟器项目。2026 年 4 月 28 日，Mitchell 发表博客宣布 Ghostty 将离开 GitHub。作为 "
---

# Ghostty 宣布离开 GitHub：一封写给 18 年热爱的告别信

## 事件背景

Ghostty 是由 Mitchell Hashimoto（HashiCorp 创始人、Vagrant 作者）开发的热门终端模拟器项目。2026 年 4 月 28 日，Mitchell 发表博客宣布 Ghostty 将离开 GitHub。作为 GitHub 第 1299 号用户，Mitchell 自 2008 年加入以来每天都在使用 GitHub，超过 18 年。他在文中坦言，GitHub 的频繁宕机已经严重影响了他的工作效率——过去一个月他用日记记录 GitHub 宕机对工作的影响，几乎每天都有标记。值得注意的是，这一决定早在 4 月 27 日大规模 Elasticsearch 故障之前数月就已在酝酿中。

## 核心观点

Mitchell 强调，问题不在于 Git 本身（Git 是分布式的），而在于围绕 Git 构建的基础设施——Issues、PR、Actions 等服务的可靠性严重下降。他表示 GitHub "不再是做严肃工作的地方"，因为每天都会被阻塞数小时。Ghostty 项目将在未来几个月逐步迁移，当前 URL 将保留只读镜像。Mitchell 的个人项目暂时留在 GitHub。他表示希望有一天能回来，但前提是看到"真实的改善，而非承诺"。

## 社区热议

HN 讨论帖迅速获得 1300+ 分和 388 条评论，社区反应强烈：

- **PunchyHamster** 直言："微软收购后就开始变差了，推 AI 后变得更差。"（"It started being bad after MS. It started being very bad when MS pushed for AI"）
- **celestialcheese** 引用讨论指出 Azure 迁移是最可能的原因，并附上了相关 HN 讨论链接。**Reason077** 进一步解释称 GitHub 官方声称 AI 开发工具导致需求激增，需要扩容 30 倍。
- **dijit** 反驳称宕机问题在 AI 兴起前就已存在："2014-2017 年（收购前）是最稳定的时期。"（"The period before acquisition was the most stable (2014-2017)"）
- **mnau** 批评 GitHub 的基本 Git 操作只有 98% 的可靠性："这是最基础的组件。他们没有 24/7 盯着修复，这是优先级文化的问题。"（"GitHub gets only 98% reliability for git operation component... This is the result of a culture"）
- **vvillena** 则认为是 GitHub 自身贪婪导致的问题："他们本可以做一百万种不同的事来减少需求，但不想抑制增长。"

## 行业影响

Ghostty 的离开可能成为开源项目"去 GitHub 化"的标志性事件。GitHub 作为全球最大的代码托管平台，其可靠性问题正在动摇开发者的信任根基。此事件与同日发布的 GitHub 可用性更新博文形成鲜明对比——GitHub 承认需要从 10 倍扩容提升到 30 倍，并正在推进多云架构。如果更多大型开源项目效仿迁离，将深刻改变开源生态的基础设施格局，Codeberg、Sourcehut、Forgejo 等替代平台可能迎来增长机遇。

## 相关链接

- 原文：https://mitchellh.com/writing/ghostty-leaving-github
- HN 讨论：https://news.ycombinator.com/item?id=47939579
- GitHub 可用性更新：https://github.blog/news-insights/company-news/an-update-on-github-availability/
- GitHub 历史 Uptime 图表：https://damrnelson.github.io/github-historical-uptime/
