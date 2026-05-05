---
title: "DeepSeek V4 — almost on the frontier, a fraction of the price"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-12-deepseek-v4-frontier"
summary: "- HN: 501 points"
---

# DeepSeek V4 — almost on the frontier, a fraction of the price

- HN: 501 points
- 链接: https://simonwillison.net/2026/Apr/24/deepseek-v4/

## 事件背景
DeepSeek 在沉寂数月后于 4 月底推出 V4 系列首批 preview：DeepSeek-V4-Pro（1.6T 总参 / 49B 激活，1M 上下文 MoE）与 DeepSeek-V4-Flash（284B 总参 / 13B 激活）。两者均以 MIT 协议放在 Hugging Face 上。Pro 一举成为目前体量最大的开源权重模型，超过 Kimi K2.6（1.1T）与 GLM-5.1（754B）。

## 核心观点 / 产品机制
- **架构**：双双采用 Mixture-of-Experts，1M token 上下文；Pro 期望比 Flash 在长上下文 + 推理 + 代码上略好；
- **价格**：Flash 输入 $0.14 / 输出 $0.28 每百万 token；Pro 输入 $1.74 / 输出 $3.48 每百万 token——比 Anthropic Opus 4.7、OpenAI GPT-5.5 便宜 5-10 倍；
- **基准**：Simon 在 SVG-pelican-on-bicycle 这一非正式但具区分度的任务上对比，V4-Pro 已接近前沿模型，V4-Flash 显著优于 V3.2；
- **本地化部署**：Pro 在 Hugging Face 上 865 GB，需要数据中心级显存；Flash 160 GB，配合 Q4 量化在 128GB Apple Silicon 上有运行可能。

## 社区热议与争议点
- 性价比派（顶赞）：「即使 V4 在 benchmark 上比 GPT-5.5 略弱，但 5-10x 价格差让大量企业 RAG / agent 工作流彻底重做经济账」；
- 安全 / 出口管制派：讨论 DeepSeek 在芯片受限环境下仍能发布 1.6T MoE，意味着 H100 + Ascend 910C 混合训练栈成熟；
- 中国 AI 生态派：与 Qwen3.6、Kimi K2.6、GLM-5.1 形成「四大开源前沿」格局；
- 谨慎派：1M 上下文 + agentic 任务的真实表现仍需更多评估，RoPE 长程衰减问题在 MoE 上没完全解决。

## 行业影响与未来展望
DeepSeek V4 大概率会在两个月内引发新一轮「开源价格战」——Anthropic / OpenAI 将面临中端工作负载用户群迁出闭源 API 的压力。对 Agent 框架（LangChain / LlamaIndex / Claude Code）开发者来说，本周就值得把 V4-Flash 接入 OpenRouter，对常用 RAG/agent 流跑一轮 A/B；对自有数据中心的企业，V4-Pro 是最值得评测的开源旗舰之一。

## 附带链接
- 文章: https://simonwillison.net/2026/Apr/24/deepseek-v4/
- HN 讨论: https://news.ycombinator.com/item?id=47900000
- Hugging Face: https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro
