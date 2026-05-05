---
title: "Open-source local analyzer for Claude Code / Codex session costs"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-03-claude-cost-analyzer"
summary: "- Subreddit: r/LLMDevs"
---

# Open-source local analyzer for Claude Code / Codex session costs

- Subreddit: r/LLMDevs
- 讨论: https://www.reddit.com/r/LLMDevs/

## 事件背景
社区里 Claude Code、OpenAI Codex 这类 *agentic IDE* 用户越来越多对账单不透明感到困扰：一次 refactor 可能花掉 2-5 美元 token 费却看不到细分。一位开发者发布开源 CLI 工具，本地解析这些 IDE 的 session log（JSON / SQLite），按工具调用、文件、模型、时间维度展示成本曲线与 top spender。

## 定位与痛点剖析
- 痛点：① 用户不清楚每次会话的真实成本；② 模型 token 消耗在 "thinking" / tool call / context expansion 上，普通账单看不出明细；③ 团队希望对比哪些 prompt / 哪些工具调用最贵；
- 工具支持 Claude Code（`~/.claude/projects/` 下的 jsonl）、OpenAI Codex 配套 IDE 的 sqlite session 数据库；
- 输出 HTML 报告 + CSV，可与 BI / Notion 集成。

## 核心架构与技术细节
- 用 Node.js / TypeScript 写，零依赖（仅用 better-sqlite3）；
- 解析 session 文件抽取 `usage_input_tokens` / `usage_output_tokens` / `cache_read` / `cache_create` 字段；
- 按价格表（Anthropic / OpenAI 当前定价）做成本估算；
- 支持自定义价格 yaml；
- 可视化：用 Chart.js 直接渲染。

## 竞品对比与生态站位
- ClaudeLog / Claude Cost Tracker：仅看总账单；
- OpenAI usage dashboard：粗粒度，仅按 API key；
- 此工具差异：本地、保护隐私、按工具调用粒度、能与 git diff 联动看「每次 commit 的 AI 成本」。

## 开发者反馈与局限性
- 顶赞：「我以为我每月 100 刀，结果工具显示 380；终于找到 prompt loop 黑洞」；
- 缺陷：不同版本 Claude Code 的 jsonl schema 变化频繁，需要持续维护；
- 建议：增加 *cost alert* webhook，触发时自动停止 agent；以及多机汇总模式给团队用。

## 附带链接
- Reddit: https://www.reddit.com/r/LLMDevs/
