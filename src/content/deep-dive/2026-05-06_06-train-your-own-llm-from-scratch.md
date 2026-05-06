---
title: "Train Your Own LLM from Scratch：手写 GPT 训练管线的极简教学项目"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "HN"
slug: "2026-05-06_06-train-your-own-llm-from-scratch"
summary: "**HN ID**: 48017948 | **Score**: 411 | **Comments**: 49"
---

# Train Your Own LLM from Scratch：手写 GPT 训练管线的极简教学项目

**HN ID**: 48017948 | **Score**: 411 | **Comments**: 49
**URL**: https://github.com/angelos-p/llm-from-scratch
**HN**: https://news.ycombinator.com/item?id=48017948

## 事件梗概

GitHub 项目 `angelos-p/llm-from-scratch` 是一个 hands-on workshop：从 tokenizer、自注意力、transformer block、训练循环到采样推理，全部手写。模型规模约 **10M 参数**，规模刻意压低到能在普通笔记本一小时内完成训练。仓库 README 称是 nanoGPT 的"再精简版"——nanoGPT 复刻 GPT-2 124M 是工程教学，本项目是**最小可运行教学**。HN 帖在不到 24 小时拿到 411 分，但只有 49 条评论，是典型"读完就收藏"的高价值学习贴。

## 评论区主线

### 1. 教学路径与同类资源对比
最高赞（48018371）推荐 Stanford **CS336**："覆盖更深，包含 scaling law、内核优化、profiling 等系统视角"——前提是你要做完作业。本帖项目则定位为"两小时速通版"。其他被多次提及的资源：Karpathy 的 nanoGPT / nanochat、Sebastian Raschka 的 *Build a Large Language Model From Scratch* 书。

### 2. "From Scratch" 的语义之争
最热的争论（48025899, 48023892）：依赖 PyTorch 还能叫 "from scratch" 吗？反对者主张 tensor、autograd 必须自己写才算；支持者反驳 stdlib 边界是相对的，仓库只是不依赖 *for-purpose* 库（已有 LLM 库）。一位评论者（48025899）展示了用 Rust + 标准库手写 tensor、kernel、自定义 JSON parser，连 rayon 风格 CPU 并行抽象也手搓——"很慢，但可跑"，提供了"真·from scratch"的参考。

### 3. 在普通硬件上能不能训
（48020053, 48021253）讨论：消费 GPU + 信用卡 + Hugging Face / Mistral Forge / Lambda neocloud 即可。Karpathy 的 nanochat 走得更远：**100 美元在 8×H100 训出 GPT-2 量级模型**。本项目目标更低，10M 参数在 CPU/M 系列 Mac 都能跑。

### 4. "Large" 在 LLM 中的边界
（48019473, 48022345）一位评论者吐槽：1.5B 都能叫 LLM，那 1T 叫什么？提议"凡是塞不进消费级 32GB VRAM 的才算 Large"。微软自己用 SLM（Small LM）形容 Phi 也佐证业界已意识到分级问题。

### 5. 个人故事：早期教育尝试
（48019186）一位评论者分享 2019 年用 fastai + ULMFiT 在 GTX 2080 实验室一晚训 Wikipedia base 的经历，坦言代码"工程上很糟"，但**亲手训过的人才真的理解"GPU 是真金白银"**。

## Pros / Cons

**Pros**
- 入门门槛低，跑通即获得实质性的"我训出过 LLM"经验。
- 与 nanoGPT / CS336 / Raschka 教程互补，不需要重复劳动。
- 10M 参数足够在笔记本上做 ablation 实验，是教学甜点。

**Cons**
- 依赖 PyTorch，对希望理解 autograd 内部的学习者不够"从零"。
- 模型太小，无法体验真正的 scaling law / 涌现现象，可能误导初学者对 LLM 能力的预期。
- 没有覆盖 RLHF / preference tuning / 长上下文等现代关键步骤。

## 量化研究员视角

教学项目意义最直接：让一线工程师重新对**模型成本与训练动力学**形成肌肉记忆。三个交易/产品角度的延伸：(1) "100 美元训 GPT-2"门槛意味着研究/小团队可以**在内部数据上 from-scratch 训特定领域 SLM**，不再被 API 价格曲线锁死；(2) 当 *teach-yourself* 资源越多、越浅显，**SaaS 套壳价值越脆弱**——这与 #15 (AI Product Graveyard) 一帖互为印证；(3) 量化机构的内部自训 SLM（用于因子文档检索、研报摘要）将在未来 12 个月成为标配，本仓库这类资源是新人 onboarding 的合格路径。

## 后续观察点

- 仓库是否补充 SFT / RLHF 阶段，构成完整 pipeline。
- 类似教学项目是否扩展到 Mamba/SSM 等新架构。
- 是否被高校直接采纳进 ML 入门课。
