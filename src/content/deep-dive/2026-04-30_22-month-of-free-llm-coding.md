---
title: "I tried doing a month of real coding work using only free LLMs"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-month-of-free-llm-coding"
summary: "**Subreddit:** r/vibecoding"
---

# I tried doing a month of real coding work using only free LLMs

**Subreddit:** r/vibecoding
**Permalink:** https://www.reddit.com/r/vibecoding/comments/1szs4b3/i_tried_doing_a_month_of_real_coding_work_using/

## 事件背景
作者在 r/vibecoding 发出长篇实测报告：过去一个月用纯免费层 LLM 做真实工作（重构、bug fix、跨文件改动），不再依赖 Claude Pro / GPT Plus。结论是：可行，但需改变与 AI 协作的方式。

## 核心观点
作者总结的实操要点：(1) Groq 免费层 + Llama 3.3 70B 是速度王，>200 tok/s，适合"高频 + 短"的小任务；(2) Gemini 2.5 Flash 免费层每天上千次调用是稳定主力；(3) Mistral Le Chat 免费层适合 plan mode；(4) DeepSeek V3.2 网页版做长任务"思考"；(5) 关键策略：把"一个 agent 多步推理"拆成"多个免费 LLM 接力"——Plan 用 A，Code 用 B，Review 用 C，避免单 token 上限；(6) 在 IDE 里用 Continue.dev / Aider 直连 Groq/Gemini；(7) 心态调整：免费模型在工具调用、多轮对话稳定性上一定不如付费旗舰，必须改写 prompt 习惯。

## 社区热议
评论分四派：(1) 共鸣——很多自由职业者表示"已经 2 个月没用 Claude Pro"；(2) 怀疑——做 1k 行以上 agent 重构必须付费，免费层 context 不够；(3) 中道——"免费 + 付费混用"才是真实最优；(4) 政治派——讨论免费 LLM 时代是否会让付费产品打折，OpenAI/Anthropic 的订阅模型在 2026 是否承压。也有评论补充 OpenRouter 上的免费 model 路由，作为接力的中转。

## 行业影响
帖子折射出"模型免费化 + 产品付费化"的分化趋势：(a) 通用免费模型快速逼近付费旗舰，门槛降低；(b) 付费的不再是 token，而是 agent 框架、IDE 集成、托管与隐私；(c) 这进一步压缩中小 LLM API 厂商的议价空间，加快聚合到 OpenRouter / Groq / Cerebras 等推理基础设施层。

## 链接
- 原帖：https://www.reddit.com/r/vibecoding/comments/1szs4b3/i_tried_doing_a_month_of_real_coding_work_using/
