---
title: "My Experience Testing Local Models To Prepare For June"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "Reddit"
slug: "2026-05-01_13-local-models-prepare-june"
summary: "- **来源**: r/GithubCopilot"
---

# My Experience Testing Local Models To Prepare For June

- **来源**: r/GithubCopilot
- **原帖**: https://www.reddit.com/r/GithubCopilot/comments/1t0gzya/my_experience_testing_local_models_to_prepare_for/

## 事件背景

用户 *Jsquared534* 分享了一个月以来在 MacBook Pro M5 Max (48GB) 上用 Continue 与 Cline 跑本地模型代替 GitHub Copilot 的实战记录。背景是 6 月 1 日 GitHub Copilot 计费策略调整在即（社区猜测会有 token 限额收紧），不少 Copilot Pro+ 老用户开始未雨绸缪做 local fallback 评估。

## 核心观点

关键发现：(1) **Continue 跟最新 Qwen 系列兼容差**，曾让作者一度想放弃 local agent；(2) **Cline 在 M5 Max + 48GB 上很丝滑**——每个 session 显示 token usage，作者一晚 2 小时跑完三个 session 共消耗约 300 万 token，其中输出 token ~4 万；(3) 用 Qwen 3.6 27B / Gemma 4 31B 做 daily coding，复杂 refactor 仍然不及 Claude Sonnet，但 boilerplate / 单元测试 / 简单 bug fix 完全够用。换算成 frontier API 价格大概节省 $40-80/天。

## 社区热议

正方：(1) 很多 Copilot 老用户回应"我也开始 evaluate local 了"，特别是 M-series Mac 群；(2) 提倡 Cline + Ollama / LM Studio 的组合最稳，配合 cloud router fallback；(3) Mistral Medium 3.5 上线 OpenCode CLI 也被反复提及，作为 hosted "近本地"选择。反方：(1) 担心本地模型 codegen 质量天花板低，复杂 codebase 仍需 frontier model；(2) M5 Max 48GB 是相对高端硬件，普通开发者不一定能复现体验；(3) Continue 的 bug 多年没解决，社区分裂到 Cline / Aider / OpenCode 已成定局。

## 行业影响

GitHub Copilot June 2026 计费调整的预期推动了一次 local model 替代潮。短期看 Cline + LM Studio + Qwen3.6 27B 组合是 sweet spot；中期会出现"本地负责高频简单任务、cloud 负责难任务"的混合 routing 范式（类似 RouteLLM）。对量化/coding 工作流：建议把 Cline 设为 primary、Claude Code / OpenCode 当难题 escalate；不要把所有鸡蛋放在一家厂商的计费策略上。
