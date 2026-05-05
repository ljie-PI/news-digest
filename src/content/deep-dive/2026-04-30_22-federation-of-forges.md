---
title: "We need a federation of forges"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-federation-of-forges"
summary: "**链接**：[blog.tangled.org/federation](https://blog.tangled.org/federation/) · [HN 讨论](https://news.ycombinator.com/item?id=47948603) · 501 points · 316 comments"
---

# We need a federation of forges

**链接**：[blog.tangled.org/federation](https://blog.tangled.org/federation/) · [HN 讨论](https://news.ycombinator.com/item?id=47948603) · 501 points · 316 comments

## 事件背景

文章作者来自 Tangled 团队，针对"GitHub 最近几周持续动荡、世界 90% OSS 依赖单一厂商"的现状，提出 forge 必须像 email、git、IRC 一样实现联邦化。这篇博客在 HN 上引爆，是过去一周关于"GitHub 替代品"讨论的核心节点。

## 核心观点

作者把代码协作分两层：**代码传输** + **沟通协议**。历史上：email 流是 git+email；GitHub 是 git+网站；ForgeFed 是 git+ActivityPub；Tangled 是 git+AT Protocol（Bluesky 同款）。Tangled 在每个独立的 git 服务器（"knot"）之间联邦事件——你可以在自己的服务器上 push，对另一台服务器上的 repo 发 PR；issue、PR、follow、star、collaborator 邀请、SSH 公钥都通过 AT Protocol 同步分发。本质是"自托管 cgit + email 工作流"的现代化版本。

## 社区热议与争议点

- **支持方**：很多人认为 AT Protocol 比 ActivityPub 更适合 forge 联邦——身份是 DID、内容可签名、可移植，避开了 ActivityPub 的实例锁定问题。
- **怀疑方**：高票评论质疑联邦化能否解决 GitHub 真正的护城河——issue 跨仓搜索、CI/CD 编排、Actions 生态、Copilot 等。技术联邦不等于产品力联邦。
- **路线之争**：ForgeFed 拥护者反对再造 AT Protocol 派系，主张 ActivityPub 更通用；也有人认为 NIP-34（Nostr）和 radicle 的密码学路线更纯粹。
- **现实派**：评论指出企业不会因协议优雅而搬家，必须先有 mirror/migration 工具与商业托管方。

## 行业影响与未来展望

这是 GitHub 当前可用性事件触发的连锁反应之一，与荷兰政府开源平台、Codeberg/Forgejo 增长形成共振。短期内 Tangled 体量小、不会动摇 GitHub；但若 Bluesky 生态持续扩张，"AT 系 forge"可能成为开发者社交身份的天然延伸。中期看，最可能落地的不是统一标准，而是多套联邦协议并存，配合 universal mirror。开发者值得开始保留自己 repo 的离线 bundle 与 SSH key 备份。

## 链接

- 原文：https://blog.tangled.org/federation/
- HN 讨论：https://news.ycombinator.com/item?id=47948603
