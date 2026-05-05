---
title: "HERMES.md in commit messages causes requests to route to extra usage billing"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-hermes-md-claude-code-billing"
summary: "**Score:** 1189 points · 505 comments"
---

# HERMES.md in commit messages causes requests to route to extra usage billing

**Score:** 1189 points · 505 comments
**Link:** https://github.com/anthropics/claude-code/issues/53262
**HN Discussion:** https://news.ycombinator.com/item?id=47952722

## 事件背景
一位用户在 Anthropic Claude Code 仓库提交 issue（#53262），指出当代码仓库根目录或 commit 信息中存在名为 `HERMES.md` 的文件时，Claude Code 客户端会把请求自动路由到 "extra usage" 计费通道，每次调用计入额外费用而非订阅额度。issue 在 24 小时内冲到 HN 首页，1189 分、505 条讨论。

## 核心机制
根据 issue 描述与早期 Anthropic 工程师的回复，Claude Code 内部在加载 repo context 时会扫描特定的"魔法文件"（如 CLAUDE.md、AGENTS.md 等）注入系统提示。`HERMES.md` 是 Anthropic 内部用于 A/B 测试 Hermes 路由实验的标记，意外被发布到 GA 客户端：检测到该文件即把会话切换到付费通道，绕过订阅配额。该行为没有公开文档，也没有 UI 提示，被用户视为"暗计费"。

## 社区热议
评论区争议点集中在三处：(1) 信任与透明——很多人称这是"客户端代码质量灾难"，"PostHog/Sentry 的 telemetry 都比这透明"；(2) 是否构成欺诈——美国/欧洲用户讨论是否触发不公平商业行为的合规线，建议 Anthropic 主动退款；(3) 类似机制还有多少——有人指出曾发现 commit message 中含"benchmark"也会触发不同模型路由。Anthropic 官方在 6 小时内回复确认 bug、承诺退款并下个 patch 移除该 fallback。

## 行业影响
事件再次提醒 Agentic 工具链的"隐藏路由"问题：当客户端可以根据本地文件改变服务器端计费/模型，开发者必须能审计每一次 API 调用。短期内会推动 Claude Code 加入 `--dry-run-routing`、用量明细查看等能力；长期看，所有"AI 平台 + 本地客户端"产品都会被要求标准化路由透明度，这是从 2025 年 OpenAI Operator 计费风波之后的延续。

## 链接
- 原 issue：https://github.com/anthropics/claude-code/issues/53262
- HN 讨论：https://news.ycombinator.com/item?id=47952722
