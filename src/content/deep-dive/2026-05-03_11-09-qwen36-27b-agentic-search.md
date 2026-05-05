---
title: "Qwen3.6-27B + agentic search — 95.7% SimpleQA on a single 3090, fully local"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-09-qwen36-27b-agentic-search"
summary: "- Subreddit: r/LocalLLaMA"
---

# Qwen3.6-27B + agentic search — 95.7% SimpleQA on a single 3090, fully local

- Subreddit: r/LocalLLaMA
- 讨论: https://www.reddit.com/r/LocalLLaMA/comments/1t1n6o8/

## 事件背景
LocalLLaMA 用户报告：把 Qwen3.6-27B（量化到 Q4 / IQ3）配合自建 agentic search（本地 SearXNG + browser tool + 复读策略）跑 OpenAI SimpleQA 基准（4326 题），命中 95.7%，与 GPT-5.5 + Web Search 持平，硬件仅一张 3090（24 GB）。

## 核心观点 / 产品机制
- 模型：Qwen3.6-27B-Instruct，IQ3_M 量化，约 14 GB 显存；
- Agent 框架：LangGraph + 自定义 ReAct 循环；最多 5 次工具调用；
- 工具：① SearXNG 本地实例；② chromium-headless `web_fetch`；③ python repl；
- 关键 trick：① 让模型 *回答前列出搜索关键词三组*；② 给每个 chunk 做 reranker；③ 答案自检后再输出。
- 总耗时：单题 3-15 秒，平均 6 秒。

## 社区热议与争议点
- 拥护派：「这才是 LocalLLaMA 的方向 —— 不堆模型大小，堆 agent 架构」；
- 怀疑派：SimpleQA 偏事实查证，agent + 搜索本来就有先天优势；与开放式推理基准（GPQA）不同；
- 复现派：分享 docker-compose，要求 SearXNG 配 5 个上游搜索源以避免被限速；
- 优化派：把 Qwen3.6-32B-Coder 用作 plan 模型，27B 用作 read 模型，效果还能再涨。

## 行业影响与未来展望
中等规模本地模型 + agent 工程在事实问答任务上已逼近 GPT-5.5 级。这对企业内网部署（数据不出域）极有吸引力。未来趋势：① 更多团队会把 *RAG + Agent + 本地 LLM* 三件套做成产品（Pieces、Continue、Cline）；② 24-48 GB 单卡仍是甜点段；③ 本地搜索基础设施（SearXNG、Whoogle、Brave 自建）将成为关键。

## 附带链接
- Reddit: https://www.reddit.com/r/LocalLLaMA/comments/1t1n6o8/
