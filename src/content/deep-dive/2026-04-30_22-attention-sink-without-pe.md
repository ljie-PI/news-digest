---
title: "Is Attention Sink without Positional Encoding unavoidable? [D]"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-attention-sink-without-pe"
summary: "**Subreddit:** r/MachineLearning"
---

# Is Attention Sink without Positional Encoding unavoidable? [D]

**Subreddit:** r/MachineLearning
**Permalink:** https://www.reddit.com/r/MachineLearning/comments/1szqzeq/is_attention_sink_without_positional_encoding/

## 事件背景
作者在 r/MachineLearning 发起 [D]iscussion 帖：他在小规模 Transformer（Encoder-Decoder 与 Cross-attention only）上做实验，移除 Positional Encoding (PE) 之后开始出现"attention sink"——即注意力在 heatmap 上呈现固定的"热竖线"，所有 query 都把权重倾倒到少数几个固定 key。这与 2024 年 StreamingLLM 论文中 sink token 的现象同源，但作者想问：在没有 PE 的纯结构里，sink 是否是数学上不可避免的？

## 核心观点
帖子核心论点：(1) attention 本质是 softmax 加权和，必须把 logit 总质量分配到某处；(2) 无 PE 时模型无法以位置区分 token，只能依赖内容相似性，导致少数特殊 token（如开头 padding 或常见词）天然吸收"无差别"的概率质量；(3) 这与 Xiao 等 (2023) 的 attention sink 发现 + Cancedda (2024) 的"the attention sink token is just the largest-norm token" 解释一致。作者询问：能否用 RoPE 之外的方式（contrastive bias、mixer-style attention）规避？

## 社区热议
评论者多为研究/工程师：(1) 有人引用 SoftPick / Differential Transformer 给出"减负注意力分布"的方案，确认部分场景可缓解；(2) 也有评论认为 sink 不是 bug 而是 feature——它给模型一个"什么也不关心"的去处，去掉 sink 反而会损失稳定性；(3) 推荐相关论文：Off-by-one attention、Sigmoid Attention、Register tokens；(4) 实务建议：保留若干 register/sink token，让 sink 不漂移到真实内容上。

## 行业影响
讨论帖虽小，但触及当下 LLM 训练实务核心：是否一定需要 PE？随着 RoPE 长度泛化、ALiBi、NoPE 等路线交错出现，attention sink 已成评估"位置泛化"是否健康的标志性现象。预计未来一年的小模型开源研究会更多地讨论"sink token 是否应当显式化"。

## 链接
- 原帖：https://www.reddit.com/r/MachineLearning/comments/1szqzeq/is_attention_sink_without_positional_encoding/
