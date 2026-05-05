---
title: "Me clicking \"accept all\" on 22,469 Claude Code changes without reading a single one"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-claude-code-22k-accept-all"
summary: "**Subreddit:** r/ClaudeAI"
---

# Me clicking "accept all" on 22,469 Claude Code changes without reading a single one

**Subreddit:** r/ClaudeAI
**Permalink:** https://www.reddit.com/r/ClaudeAI/comments/1szvjde/me_clicking_accept_all_on_22469_claude_code/
**Media:** https://v.redd.it/wd5tukantbyg1

## 事件背景
一位用户在 r/ClaudeAI 发了一段调侃视频：屏幕上 Claude Code 显示需要 review 22,469 个变更，他全部一键 accept all。配文"This is humor /s"。帖子在 24 小时内冲到 ClaudeAI 子版前列，是当下 vibe coding/coding agent 文化的一面镜子。

## 核心观点
帖子在反讽"AI 写代码我盖章"的工作模式：当 Claude Code 这类工具一次产出上万行 diff，人工 review 早已失去意义。表面是段子，背后是行业争论：autonomous coding agent 的 review 流程到底如何安排？是 batch 全收、出问题再 rollback？还是分阶段 review？还是干脆放弃 review、靠 test/CI 拦截？

## 社区热议
评论数百条，分四类反应：(1) 共鸣派——"我前天 5000 个 diff 一键 accept，凌晨 3 点才发现把数据库迁移文件也改了"；(2) 工程派——讨论方法论：必须用 git worktree、配合 codex auto-review 二次 LLM 审查，或要求 Claude 自己生成 PR 摘要；(3) 警示派——分享真实事故：同事一夜全 accept 把 customer 字段重命名，第二天客户系统全崩；(4) 工具派——推荐 `git diff --stat | claude review` 这类 anti-pattern 检测脚本。Anthropic 工程师在评论区也回复，提示 v0.27 之后会加入"diff complexity heuristic"自动建议人工 review 阈值。

## 行业影响
段子折射的是真实痛点：随着 coding agent 的产出规模提升 2–3 个数量级，传统 PR review 流程已不适用。短期会催生新型工具：分级 review（按文件类别）、AI 与 AI 互审、自动化"危险变更"检测。中期则可能让团队的工程文化转向"测试覆盖率 + 监控"为主、"代码 review"为辅。

## 链接
- 原帖：https://www.reddit.com/r/ClaudeAI/comments/1szvjde/me_clicking_accept_all_on_22469_claude_code/
