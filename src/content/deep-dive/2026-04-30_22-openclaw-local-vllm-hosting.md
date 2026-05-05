---
title: "Local vllm hosting (OpenClaw)"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-openclaw-local-vllm-hosting"
summary: "**链接**：[r/openclaw 帖子](https://www.reddit.com/r/openclaw/comments/1t0j45y/local_vllm_hosting/) · subreddit: openclaw"
---

# Local vllm hosting (OpenClaw)

**链接**：[r/openclaw 帖子](https://www.reddit.com/r/openclaw/comments/1t0j45y/local_vllm_hosting/) · subreddit: openclaw

## 事件背景

发帖人冲动购入 2 张从阿里巴巴改造的 22GB 2080 Ti，原打算用它们本地托管 20-30B 模型给 OpenClaw（一个 agent 框架）使用。下单后开始"买家后悔"——担心硬件能否跑得动模型、跑得动后是否真能驱动 OpenClaw 的复杂 agent 流程。这个真实的 hobbyist 决策困境戳到 2026 年本地 agent 部署的核心问题。

## 核心观点

帖子和评论的关键讨论：(1) 2x 22GB = 44GB VRAM，可跑 30B 量化（Q4-Q5）模型，理论上覆盖 Qwen2.5-32B / Mistral Small / Gemma 3 27B 一档；(2) 但 OpenClaw 内部 prompt 体量大、tool schema 复杂，30B 量化容易出现 instruction-following 退化；(3) 真实工作流通常需要长上下文（>32k）+ 工具调用稳定性，这在 30B 段位仍不可靠；(4) vLLM 的 paged-attention 对 2080 Ti 兼容性中等，需要 fallback 到 SGLang 或 llama.cpp。

## 社区热议与争议点

- **务实派**：建议先跑 Qwen2.5-Coder-32B-Instruct + SGLang，本地 throughput 可接受；保留 fallback 到 OpenRouter 远程模型作为复杂任务的后端。
- **悲观派**：直言"30B 段位跑不动 OpenClaw"，建议跑 70B Q4 或者改用 Cline / Aider 这类对小模型更友好的 agent。
- **硬件派**：警告改装 2080 Ti（俗称"22GB 矿改卡"）的稳定性、保修与未来 CUDA 兼容性都成问题，建议长期看升级到 RTX 5090 或 GB10。

## 行业影响与未来展望

帖子揭示的是"agent 框架对模型门槛远高于聊天"。短期社区共识是：OpenClaw / Aider / Cline 这类 multi-tool agent 至少需要 30B 高质量微调（指令对齐+工具调用对齐）才有可用度，否则就是云模型 + 本地 cache 的混合方案。中期看，专门为 agent 任务训练的 7-13B 小模型（如 Qwen3-Coder-Agent / Devstral）将更适合 hobbyist 自托管。

## 链接

- 原帖：https://www.reddit.com/r/openclaw/comments/1t0j45y/local_vllm_hosting/
