---
title: "GitHub Issues/Webhooks 故障 + \"Days Without GitHub Incident\" 段子站走红"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "HN"
slug: "2026-05-05_11-github-issues-webhooks-incident"
summary: "- HN：https://news.ycombinator.com/item?id=48010301（421 points · 258 comments）"
---

# GitHub Issues/Webhooks 故障 + "Days Without GitHub Incident" 段子站走红

- HN：https://news.ycombinator.com/item?id=48010301（421 points · 258 comments）
- 配套：https://news.ycombinator.com/item?id=48012022（"Days without GitHub incidents" · 359 points）
- 状态页：https://www.githubstatus.com/incidents/72q3n8yxthcy

## 1. 事件背景

5 月 4 日，GitHub 状态页再次更新事故：Issues 与 Webhooks 服务出现降级，部分 webhook 投递失败、Issue 创建/编辑超时，事故持续约一小时后恢复。本身是一次普通 incident，但叠加近几个月 GitHub 频发的 Actions/Codespaces/Pull Requests 故障，让"GitHub 还稳吗"成为 HN 当日热议焦点。同日另一条帖子 — 一个名叫 **Days Without GitHub Incidents** 的极简戏谑站点（永远归零的"安全生产看板"风格计数器，附带状态页历史链接）— 也冲上 359 分高位，形成网络梗联动。

## 2. 核心机制：负载暴增叠加单点架构

HN 高赞评论引用了 GitHub COO Kyle Daigle 4 月 3 日的官方数字解释成因：(1) 2025 年全平台共 10 亿次 commits；(2) 当下每周 2.75 亿 commits，全年线性外推 140 亿；(3) GitHub Actions 用量从 2023 年每周 5 亿分钟，飙到 2025 年 10 亿，本周一度跑到 21 亿。**根因是 agentic coding（Claude Code、Codex、Cursor 等）让 push/CI 频率出现"step function"上升**——每个开发者在每天可以触发的 commit 数从十几跳到上百。底层 Actions/Webhooks/Issues 全部共享 GitHub 主存储，写流量翻数倍直接打穿余量。

## 3. 社区热议与争议点

- **架构派**（AlexB138、eddyg）：GitHub 必须很快改 rate limit、砍免费额度或推付费层级；当前 SLA 已经吃紧，加上 agentic 用量还在涨，未来肯定有更多事故。
- **EEE 派**（munk-a、blks）：微软收购后 GitHub 一直在做"Embrace-Extend-Extinguish"——把 Travis CI、Reviewable、Heroku 等周边平台逼出市场，把所有流量收进自己机房；现在出问题是"自己挖坑自己填"，不是单纯 AI 流量锅。
- **AI 流量派**（skylerwiernik、crystal_revenge）：从开发者侧观察，agent 自主跑实验、并行 worktree、半夜 commit 的现象激增，单人产出 commit 数翻倍很正常；GitHub 的存储/索引/通知层就是被这种"机器人写代码"拖累。
- **数据怀疑派**：怀疑 GitHub 公布的 1B commits/2.1B Actions 分钟有水分（包含 push event 和 force push，可能重复计），但即便砍一半也仍在数量级上吃力。
- **替代方案派**：GitLab self-hosted、Codeberg、Gitea + Forgejo、Sourcehut 等 alternative 又被翻出来讨论，但社区现实承认"GitHub network effect 是当前 OSS 最大壁垒"。

## 4. 行业影响与展望

(1) **定价信号**：GitHub Actions / Issues 大概率在未来 6 个月内迎来一次费率调整，特别是面向"agentic 多 commit"的滥用模式；(2) **架构动向**：GitHub 已透露在做 multi-cell / multi-region 重构（公开 blog 也提到了），但 monolith 拆分有现实成本；(3) **生态再分布**：自托管 forge（Gitea/Forgejo）和 mirror 工具（git-mirror）进入"安全网"的认知，越来越多企业把"如果 GitHub 又挂了我们怎么继续干活"列入 BCP；(4) **AI 工具反思**：agent 厂商也得开始在客户端做 rate-limit 和 batching，否则 push 风暴会反向毁掉自己赖以生存的 GitHub。本次事故 + 段子站联动，是开发者社区集体宣告"我们对 GitHub 稳定性已经失去耐心"的重要信号点。

## 5. 链接

- HN 主帖：https://news.ycombinator.com/item?id=48010301
- "Days Without" 段子站 HN：https://news.ycombinator.com/item?id=48012022
- 状态页：https://www.githubstatus.com/incidents/72q3n8yxthcy
- 段子站：https://www.dayswithoutgithubincident.com/
