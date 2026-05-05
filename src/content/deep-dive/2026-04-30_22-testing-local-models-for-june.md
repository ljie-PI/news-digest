---
title: "My Experience Testing Local Models To Prepare For June"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-testing-local-models-for-june"
summary: "**链接**：[r/GithubCopilot 帖子](https://www.reddit.com/r/GithubCopilot/comments/1t0gzya/my_experience_testing_local_models_to_prepare_for/) · subreddit: GithubCopilot"
---

# My Experience Testing Local Models To Prepare For June

**链接**：[r/GithubCopilot 帖子](https://www.reddit.com/r/GithubCopilot/comments/1t0gzya/my_experience_testing_local_models_to_prepare_for/) · subreddit: GithubCopilot

## 事件背景

GitHub Copilot 即将在 6 月 1 日变更计费 / 配额（"June" 一词在帖中所指），引发用户大规模评估 Plan B——即用本地模型替代云端 Copilot agent 模式。发帖人系统性测试了 Continue 和 Cline 两个开源 IDE agent，搭配 Qwen 系列本地模型，记录了一手经验。

## 核心观点

测试结论：(1) Continue 与新版 Qwen 适配差，agentic 任务频繁卡死或循环——这导致作者一度想放弃本地模型路线；(2) 切换到 Cline 后体验大幅好转，M5 Pro MacBook（约 48-64GB 统一内存）跑 Qwen3-Coder 30B 量化能达到"日常可用"段位；(3) 关键瓶颈是 IDE 集成层而非模型本身；(4) 准备 6 月配额变化的策略：保留 Copilot 作为 SOTA 任务，把日常重构 / 编辑切到本地 Cline。

## 社区热议与争议点

- **同感派**：很多评论确认 Continue 在 Qwen3-Coder 上的 bug；推荐 Cline + LM Studio / Ollama 的组合更稳。
- **怀疑派**：质疑作者的硬件门槛（M5 Pro + 48GB+）远超普通用户，本地路线对预算友好度仍不足。
- **数据派**：有人贴出在 Qwen3-Coder 30B 与 Devstral / Mistral Medium 3.5 的横评，建议替换为最新模型再测。
- **政策派**：讨论 GitHub Copilot 6 月变化是否真如传闻严重——Microsoft 至今未官方明示。

## 行业影响与未来展望

这是 2026 年 AI 编码工具"Plan B"心理的缩影：用户对云厂商的计费变更高度敏感，开始系统性建立本地 fallback。短期看，Cline / Aider / Continue 这类开源 agent 进入快速增长期；中期看，云 + 本地的混合编排（重活云端、轻活本地）会成为主流，类似当年云原生时代的 hybrid cloud。值得关注 Copilot 6 月正式公告对市场情绪的实际影响。

## 链接

- 原帖：https://www.reddit.com/r/GithubCopilot/comments/1t0gzya/my_experience_testing_local_models_to_prepare_for/
