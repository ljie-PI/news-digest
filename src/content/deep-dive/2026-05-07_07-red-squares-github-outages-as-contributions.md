---
title: "Red Squares: GitHub Outages as Contributions"
date: "2026-05-07"
generated: "2026-05-07 07:00"
source: "HN"
slug: "2026-05-07_07-red-squares-github-outages-as-contributions"
summary: "2026 年 5 月 6 日，Hacker News 上出现了一款名为 **Red Squares** 的讽刺性可视化项目，由用户 cianmm 发布。该项目模仿 GitHub 的贡献图（contribution graph），但将"
---

# Red Squares: GitHub Outages as Contributions

## 事件背景

2026 年 5 月 6 日，Hacker News 上出现了一款名为 **Red Squares** 的讽刺性可视化项目，由用户 cianmm 发布。该项目模仿 GitHub 的贡献图（contribution graph），但将绿色方块替换为红色方块——每个红方块代表 GitHub 平台当天发生至少一次服务中断。颜色越深，表示中断时间越长。这一创意迅速在 HN 获得 731 分的高赞和 164 条评论，成为当日热门话题。

根据项目页面数据，过去一年中 GitHub 共有 **170 天**受到服务中断影响，累计停机时间达 **32.7 天**，其中最严重的一天是 2026 年 4 月 30 日。这些数据来自 GitHub 官方状态页面的公开记录，开发者通过自动化脚本抓取并可视化呈现。

## 核心观点与产品机制

Red Squares 的核心机制极其简单：将 GitHub 的「贡献」概念反转。传统贡献图鼓励开发者每日提交代码，而 Red Squares 则记录平台的「负面贡献」——服务不可用。这种黑色幽默直击现代开发者对 GitHub 的高度依赖：作为全球软件供应链的核心枢纽，GitHub 已从单纯的代码托管平台演变为包含 Actions、Copilot、Packages、Codespaces 的 AI 驱动生态。

项目的技术实现上，开发者利用 GitHub Status API 或状态页面的 RSS/JSON 源，定时抓取事件数据，并按照 GitHub 贡献图的视觉规范（周列、日格）渲染 SVG 或 HTML。每个方格的颜色深度与当天累计停机时长挂钩，形成直观的「健康热力图」。

## 社区热议与争议点

HN 讨论中出现了几个鲜明的观点阵营：

1. **共鸣派**：大量开发者表示「终于有人把这件事可视化出来了」。GitHub 近年的稳定性确实令人担忧，尤其是 Actions 和 Copilot 服务频繁出现延迟或中断，直接影响 CI/CD 流水线。

2. **反思派**：有评论指出，开发者过度依赖单一平台本身就是风险。建议采用「本地优先」或「去中心化」策略，如使用 Gitea、GitLab 自托管，或多平台镜像策略。

3. **质疑派**：部分用户认为 32.7 天的统计口径可能过于宽泛——GitHub 状态页面常将「性能降级」也标记为事件，而实际完全不可用的天数可能远少于此。

4. **幽默派**：有人调侃「这才是真正的 GitHub 贡献图」「我的红方块比绿方块还多」。

## 行业影响

Red Squares 的走红反映了行业对平台稳定性的集体焦虑。随着 GitHub Copilot 和 Actions 成为开发工作流的基础设施，其可用性直接影响全球软件交付速度。该项目也再次提醒开发者：

- **多云/多平台策略**的重要性，避免单点故障；
- **本地构建能力**不应完全依赖云端 CI；
- **供应商锁定风险**在 AI 时代被进一步放大。

## 附带链接

- 项目主页: https://red-squares.cian.lol/
- HN 讨论: https://news.ycombinator.com/item?id=48034587
- daily.dev 介绍: https://app.daily.dev/posts/red-squares-the-github-outage-graph-oaxczqfm7
