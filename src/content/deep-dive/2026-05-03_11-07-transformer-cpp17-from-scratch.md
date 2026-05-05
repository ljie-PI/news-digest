---
title: "Built a transformer in C++17 from scratch — no PyTorch, no BLAS, no dependencies"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-07-transformer-cpp17-from-scratch"
summary: "- Subreddit: r/LocalLLaMA"
---

# Built a transformer in C++17 from scratch — no PyTorch, no BLAS, no dependencies

- Subreddit: r/LocalLLaMA
- 讨论: https://www.reddit.com/r/LocalLLaMA/comments/1t1x9jv/

## 事件背景
作者在 200 行不依赖第三方库的 C++17 中实现完整 transformer：手写矩阵乘、softmax、layer norm、analytical backprop；模型 0.83M 参数；CPU 训练 76 分钟到 val loss 1.64。目标不是 SOTA，而是教学 + 验证「不靠 BLAS 也能完整跑通」。

## 定位与痛点剖析
- 大量 ML 教学项目只在 PyTorch / NumPy 之上写；学生不理解 autograd 与底层数值；
- 这一项目从内存布局开始解释，每一层都有显式 forward + backward 函数；
- 适合算法工程师、面试准备、教学。

## 核心架构与技术细节
- 数据：tinyshakespeare-like 文本；
- 实现：手写 GEMM（多线程 + cache blocking 但无 SIMD），attention 用 O(n²) naive；
- 数值：fp32；analytical gradient 全程，没有 reverse-mode tape；
- 优化器：plain SGD + momentum；
- 性能：CPU 单机 76 min，相比同样模型在 PyTorch CPU 仅慢 3-4 倍——证明手写也能逼近 BLAS 性能下限。

## 竞品对比与生态站位
- karpathy/llm.c：C 实现，500 行，更专注 CUDA；
- ggml.cpp：偏推理；
- 此项目独特：纯 C++17、无依赖、analytical bp，最适合教学。

## 开发者反馈与局限性
- 顶赞：「这是我读过最干净的 transformer 教学代码之一」；
- 局限：没有 SIMD / GPU；scaling 过 100M 参数即不可行；
- 建议：加一个章节式 README，逐函数解释；可以发展成「从零开始 LLM」开源教材。

## 附带链接
- Reddit: https://www.reddit.com/r/LocalLLaMA/comments/1t1x9jv/
