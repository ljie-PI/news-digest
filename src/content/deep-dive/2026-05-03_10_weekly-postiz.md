---
title: "Postiz — Agentic 社媒调度器（OpenClaw / Claude / nanoclaw 生态）"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "PH"
slug: "2026-05-03_10_weekly-postiz"
summary: "🗳️ 448 votes · Topics: Social Media · Marketing automation"
---

# Postiz — Agentic 社媒调度器（OpenClaw / Claude / nanoclaw 生态）

🗳️ 448 votes · Topics: Social Media · Marketing automation

## 1. 事件背景
社媒运营的痛点：30+ 平台（Twitter/X、LinkedIn、Threads、Mastodon、Bluesky、Instagram、TikTok、YouTube Shorts、小红书…）API 各异，调度、内容定时、跨平台改格式手工成本极高。Buffer、Hootsuite 等老牌工具是 SaaS 锁定，AI 集成弱。Postiz 把自己定位成"agent 时代的 Buffer"——不是给人用的 UI，而是给 AI agent 用的 backend。

## 2. 核心产品机制
两种接入方式：(1) **SKILL + CLI**——把 Postiz 安装为 OpenClaw / Claude / nanoclaw / PaperClip 的 skill，agent 用 CLI 命令调用，本地工作流；(2) **MCP 远程服务器**——任何支持 MCP 的 agent 都能通过远程 MCP 调用 Postiz。能力面包括 30+ 社媒网络的批量调度（"thousands of posts"）、自动适配各平台格式。这种"为 agent 而生"的产品定位非常少见——大多数 SaaS 仍把 AI 当 feature，Postiz 把 agent 当一等公民。

## 3. 社区热议与争议点
**正方**：开发者社区点赞"终于有面向 agent 的社媒后端"；MCP 协议接入意味着任何 agent 框架（Cursor、Claude Code、Codex）都即插即用，不依赖具体 IDE。**反方**：(1) 30+ 平台批量调度容易触发反垃圾算法（尤其是 X/LinkedIn 对自动化越来越敏感），ban 账号风险高；(2) 大量"AI 撰稿 + 多平台批量发"的内容会污染社媒生态，伦理争议在评论区已有讨论；(3) Postiz 自己也是开源项目，企业版定价模型尚不明确。

## 4. 行业影响与未来展望
Postiz 体现 SaaS "agent 化重写"趋势——预计未来 12 个月内大量传统 SaaS 会被"agent native"竞品挑战（Buffer、Calendly、Mailchimp 都可能有 agent native 版本）。MCP 协议作为粘合层会越来越重要——这与本周 PH 上榜的 Claude Connectors 形成呼应：一个连消费 app（Spotify/Uber），一个连开发者社媒栈。

## 5. 链接
- Product Hunt: https://www.producthunt.com/products/postiz
