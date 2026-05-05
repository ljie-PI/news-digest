---
title: "Qwen3.6-35B-A3B：即使 VRAM 有限，用更大量化也可能更好"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-qwen36-35b-a3b-vram-quants"
summary: "阿里巴巴通义千问团队于 2026 年 4 月中旬发布了 Qwen3.6-35B-A3B，这是一个基于 MoE（混合专家）架构的大语言模型，总参数量 350 亿，但每个 token 仅激活 30"
---

# Qwen3.6-35B-A3B：即使 VRAM 有限，用更大量化也可能更好

> 来源：r/LocalLLaMA | 2026-04-25

## 事件背景

阿里巴巴通义千问团队于 2026 年 4 月中旬发布了 Qwen3.6-35B-A3B，这是一个基于 MoE（混合专家）架构的大语言模型，总参数量 350 亿，但每个 token 仅激活 30 亿参数（256 个专家中激活 8+1 个）。Reddit r/LocalLLaMA 社区用户发帖分享了一个反直觉的发现：在 VRAM 受限的场景下，使用更大的量化精度（bigger quants）反而可能比预期表现更好。这一发现挑战了"VRAM 不够就用最小量化"的传统认知。

## 核心观点

MoE 架构的独特之处在于：虽然需要加载全部 350 亿参数到内存中，但实际计算只使用 30 亿参数。这意味着量化主要影响的是内存占用而非计算速度。根据 Unsloth 提供的量化表，Q4_K_M 需要 22.1GB，Q3_K_M 需要 16.6GB，而 IQ1_M 仅需 10GB。社区测试表明，在 RTX 3090（24GB）上运行 Q4_K_M 量化可达到约 101 tok/s 的推理速度。关键发现是：由于 MoE 的稀疏激活特性，较高精度量化对输出质量的提升非常显著，而对速度的影响相对较小。

## 社区热议

> ⚠️ 注：因 Reddit 反爬策略限制，无法直接获取评论内容。以下基于 r/LocalLLaMA 社区的广泛讨论趋势和第三方报道进行概述。

据 insiderllm.com 报道，Qwen3.6-35B-A3B "took over the r/LocalLLaMA weekend threads"。社区讨论焦点包括：（1）MoE 模型的量化策略与 Dense 模型有本质区别，不能简单套用经验；（2）16GB 显卡通过 KV cache offload 也能运行 Q4 量化版本；（3）该模型在 SWE-bench Verified 上达到 73.4% 的成绩，仅用 3B 激活参数就接近了许多更大模型的表现。同时也有用户指出 MoE 变体在指令遵循方面的表现不如 Dense 版本稳定。

## 行业影响

Qwen3.6-35B-A3B 代表了本地 LLM 运行范式的重要转变：（1）MoE 架构让"消费级显卡运行准前沿模型"成为现实，16GB VRAM 即可运行 350 亿参数模型；（2）量化策略需要针对 MoE 架构重新思考，社区正在形成新的最佳实践；（3）Apache 2.0 开源许可和 262K 上下文窗口使其成为本地 AI 应用的强力选择。对于量化研究者和硬件厂商而言，MoE 模型的内存访问模式将推动新一轮优化。

## 相关链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1sutct2/qwen3635ba3b_even_in_vram_limited_scenarios_it/)
- [Qwen3.6 完整指南 - InsiderLLM](https://insiderllm.com/guides/qwen-3-6-local-ai-guide/)
- [Qwen3.6-35B-A3B SWE-Bench 评测](https://www.buildfastwithai.com/blogs/qwen3-6-35b-a3b-review)
- [Unsloth GGUF 量化版本](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF)
