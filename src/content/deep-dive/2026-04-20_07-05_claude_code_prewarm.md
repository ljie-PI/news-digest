---
title: "Claude Code 预热守护进程——不再等待重置窗口"
date: "2026-04-20"
generated: "2026-04-20 07:00"
source: "Reddit"
slug: "2026-04-20_07-05_claude_code_prewarm"
summary: "r/ClaudeCode 用户开发了一个小型守护进程，自动预热 Claude Code 会话，确保用户坐下工作时不需要等待 5 小时重置窗口。"
---

# Claude Code 预热守护进程——不再等待重置窗口

## 事件背景
r/ClaudeCode 用户开发了一个小型守护进程，自动预热 Claude Code 会话，确保用户坐下工作时不需要等待 5 小时重置窗口。

## 核心观点
关键痛点：Claude Code 的 5 小时重置计时器从你开始使用时算起，而非停止使用时。这意味着如果你在下午 2 点用完配额，需要等到 7 点才能继续——恰好是你最需要工作的时间。

守护进程的做法是在后台保持会话活跃状态，让重置窗口在用户不活跃时自然过期。

## 社区热议
1. "这解决了 Claude Code 最大的 UX 痛点——计时器应该从停止使用开始算"
2. "Anthropic 应该直接修改重置逻辑，而不是让用户写 hack 来绕过"

## 链接
- Reddit: https://www.reddit.com/r/ClaudeCode/comments/1spaqh5/
