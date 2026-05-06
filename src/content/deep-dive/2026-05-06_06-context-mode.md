---
title: "mksglu/context-mode — 给 AI Coding Agent 的上下文沙箱 MCP"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "GitHub"
slug: "2026-05-06_06-context-mode"
summary: "- 仓库：https://github.com/mksglu/context-mode"
---

# mksglu/context-mode — 给 AI Coding Agent 的上下文沙箱 MCP

- 仓库：https://github.com/mksglu/context-mode
- 时间段新增：今日 +344 stars（总 12,971，主语言 TypeScript）

## 1. 定位与痛点剖析

Claude Code / Codex / Cursor 等 AI coding agent 的隐藏成本是上下文窗口被"工具输出"撑爆：一次 Playwright 快照 56KB，20 条 GitHub issue 59KB，单条访问日志 45KB；30 分钟会话后 40% 的 context 被吞噬。当 agent 因 context 不足 compact 对话，又会忘记当前在改哪个文件、最初的任务是什么。Context Mode 把这一痛点直接定为产品名："Context Saving + Session Continuity + Token Efficiency"。

## 2. 核心架构与技术细节

实现形式是一个 MCP Server：在 agent 与原本各种工具之间加一层"沙箱"。被沙箱化的工具调用，原始数据不进 context window，而是落地在本地存储；agent 拿到的是一个极小的 handle / 摘要（315KB → 5.4KB，约 98% 缩减）。配套机制：1) Sandbox tools 隔离 raw output；2) Session continuity 保存任务/文件焦点；3) Output economy 减少模型自身废话。仓库声称已覆盖 14 个平台（Claude Code、Codex、Cursor、Windsurf、Continue、Cline 等），并被多家团队内部采用。

## 3. 竞品对比与生态站位

竞品维度多样：Anthropic 的 Sub-Agents（用子 agent 隔离上下文）、Claude Code 的 `/compact`、各类 vector memory 方案（Mem0、Letta）。Context Mode 的差异：通用 MCP 协议、对所有 agent 都生效、不依赖某厂商 sub-agent；它解决的是"工具数据过大"这个最常见、最常被忽视的 token 漏洞。在 MCP 工具生态中，它属于"中间件"层（MCP Proxy / Gateway 类型），与 portal、smithery 等并列。

## 4. 开发者反馈与局限性

讨论焦点：1) 多 agent 之间共享沙箱数据的一致性；2) 大文件落盘后的清理策略；3) 在受限网络的企业环境中如何与既有 SIEM 合规。局限：Agent 必须真的"按 handle 工作"，如果模型行为偏好直接读 raw 内容，效果打折；对纯文本 chat（非 coding）场景收益没那么显著。

## 5. 附带链接

- GitHub Repo: https://github.com/mksglu/context-mode
- MCP 协议：https://modelcontextprotocol.io
