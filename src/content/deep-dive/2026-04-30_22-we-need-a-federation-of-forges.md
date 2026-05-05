---
title: "We need a federation of forges"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-we-need-a-federation-of-forges"
summary: "**Score:** 583 points · 374 comments"
---

# We need a federation of forges

**Score:** 583 points · 374 comments
**Link:** https://blog.tangled.org/federation/
**HN Discussion:** https://news.ycombinator.com/item?id=47948603

## 事件背景
Tangled.org（基于 ATProto/Bluesky 的去中心化代码托管实验）发布博文《We need a federation of forges》，呼吁开源社区把 "forge"（代码托管平台）做成像 ActivityPub 邮件服务一样可联邦的协议。文章发布的时间点恰逢 GitHub 多次大规模降级、Anthropic Hermes.md 计费风波（同一天上 HN 的另一条），以及 Hashicorp 创始人公开"GitHub 不再是认真工作之地"。

## 核心观点
文章主张：(1) 单一中心化 forge 已成系统性风险——账号封禁、商业利益冲突（GitHub 与 OpenAI/Microsoft 的紧密绑定）、法律辖区单点；(2) Git 本身天然分布式，但 issue/PR/CI 不是；(3) 应建立 forge-to-forge 的联邦协议，让 issue、PR、code review、reactions 跨实例同步，类似 Mastodon 之于推特；(4) Tangled 现有原型基于 ATProto 的 record 模型，已实现跨实例的 issue 同步与 cross-fork PR。文章给出协议草稿。

## 社区热议
HN 评论高度活跃。支持派强调 ForgeFed（先前的 ActivityPub 扩展）是 7 年前的尝试，可惜没人推动，现在是重启的好时候；中立派指出真正难点不是协议，而是激励——"开发者已经在 GitHub，搬迁成本高"；批评派认为 Tangled 选择 ATProto 而非 ActivityPub 会再次造成生态割裂，应该聚焦协议而非平台；还有 Codeberg/Forgejo/Sourcehut 用户站出来描述各自的现状与瓶颈。

## 行业影响
事件标志着"去 GitHub 化"从口号进入了协议层讨论。预计未来 12-18 个月将看到：(a) Forgejo、Codeberg 推出实验性联邦支持；(b) 欧洲（已经在 NL、DE 推动政府开源）会成为联邦 forge 的主要采用者；(c) AI 时代，模型评估和数据集分发对单点 forge 的依赖会被加速重新审视。

## 链接
- 原文：https://blog.tangled.org/federation/
- HN 讨论：https://news.ycombinator.com/item?id=47948603
