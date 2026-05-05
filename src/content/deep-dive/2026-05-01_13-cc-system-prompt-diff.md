---
title: "What's new in CC 2.1.124 (+166 tokens) and 2.1.126 (-87 tokens) system prompt"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "Reddit"
slug: "2026-05-01_13-cc-system-prompt-diff"
summary: "- **来源**: r/ClaudeAI"
---

# What's new in CC 2.1.124 (+166 tokens) and 2.1.126 (-87 tokens) system prompt

- **来源**: r/ClaudeAI
- **原帖**: https://www.reddit.com/r/ClaudeAI/comments/1t0gomk/whats_new_in_cc_21124_166_tokens_and_21126_87/

## 事件背景

用户 *Dramatic_Squash_3502* 持续做 Claude Code 系统提示词的逆向 diff，这一期对比了 CC 2.1.124（+166 tokens）与 2.1.126（-87 tokens）两个版本的差异。这是 Claude Code 社区少数几条"权威 reverse-engineered changelog"系列之一，每次都被认真讨论，反映出开发者对模型 harness/系统提示透明度的强需求。

## 核心观点

提取出的三条主要变更：(1) **新增 System Reminder：File modification detected (budget exceeded)** — 当 user/linter 修改了文件，但其它已修改文件已经超过 snippet budget 时，diff 会被省略，新提示告诉 agent "如需当前内容请重新读文件"；(2) **System Prompt：Harness instructions** — 把 core-identity 那段 function call 替换成显式的 introductory-line 与 security-note 插入点，方便定制；(3) **REPL tool usage and scripting conventions** — 澄清 thenable shorthand 只在 return 时自动 await，inline 需要显式 await。整体方向是让 agent 在长 session 下对"信息缺失"的处理更稳健。

## 社区热议

正面反馈：(1) "File modification budget exceeded" 解决了一个常见 bug——agent 改了 A 文件但没 reload B 文件就基于旧 diff 操作；(2) Harness instructions 抽象出插入点意味着第三方 wrapper（Cursor、Cline）能更容易复用 Claude prompt 风格。争议：(1) 部分用户怀疑这些"省 token"优化是 Anthropic 在悄悄缩小思考预算，把性能压力转给用户；(2) 有人指出 2.1.124 → 2.1.126 token 净变化只有 +79，但模型行为差异感受比这大得多，质疑"系统提示之外还有别的 RL 调整"。

## 行业影响

对 coding agent 生态的启示：harness 设计正成为厂商间真正的差异点（远超模型本体）。我们能在两个 patch 版本里看到 *budget-aware reminders* 与 *plug-in points for harness instructions* 这种成熟做法，意味着 SOTA 系统提示已经走向"操作系统化"。对自建 agent 团队：尽量把这种设计点抄过来——尤其是 file-budget exceeded 的回退提示，对稳定性提升明显。
