---
title: "Built a small runtime to actually use the NPU on Snapdragon X Elite laptops"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-hexrun-npu-snapdragon-x-elite"
summary: "**Subreddit:** r/LLM"
---

# Built a small runtime to actually use the NPU on Snapdragon X Elite laptops

**Subreddit:** r/LLM
**Permalink:** https://www.reddit.com/r/LLM/comments/1szwona/built_a_small_runtime_to_actually_use_the_npu_on/
**Repo:** https://github.com/bpbonker/hexrun

## 事件背景
开发者 bpbonker 在 r/LLM 发帖，分享一个名为 hexrun 的小型 Rust 运行时，目标是把 Snapdragon X Elite 笔记本里的 ~45 TOPS NPU 真正用起来。问题驱动：现有 LLM 工具链（Ollama、llama.cpp、LM Studio）基本都把 X Elite 的 NPU 当不存在，全部 fallback 到 CPU。

## 核心架构
hexrun 的关键设计：(1) 直接基于 Qualcomm 官方的 QNN/Genie SDK，避开 ONNX Runtime 这层"好用但慢"的间接调用；(2) Rust 实现，提供 `hex pull / run / serve` CLI，使用习惯模仿 Ollama；(3) 模型权重以 QNN 内部格式（.qnn）下载并 cache，启动时 mmap 进 NPU；(4) 当前支持的模型有限——主要是 Qualcomm 已发布的 Phi-3、Llama-3.2-1B、Qwen2.5-1.5B 量化版；(5) HTTP server 兼容 OpenAI Chat Completions API。

## 竞品对比
hexrun 在 X Elite 上是少数能真正驱动 NPU 的方案：(a) DirectML / Windows AI Foundry 仍以 GPU 为主，NPU 只对 Copilot 系特定模型开放；(b) MLX 是 Apple Silicon 专属；(c) ZLUDA / 第三方驱动方向尚未成熟。它最大的瓶颈仍然是模型选择受限于 QNN 的 SDK 转换工具，社区等价 GGUF 自由度差。

## 社区反馈
评论关注：(1) 性能数据——作者贴出 Phi-3 mini 在 X Elite 上 ~75 tok/s（CPU 仅 12 tok/s），内存 4GB；(2) 对比 ARM 同类——Snapdragon 8 Gen 3 手机用 Genie 也大约 30 tok/s，X Elite 的能效比明显领先；(3) 现实使用——大家关心 Linux 支持（暂不支持，QNN 仅 Windows）、是否支持 LoRA（计划中）。

## 链接
- 原帖：https://www.reddit.com/r/LLM/comments/1szwona/built_a_small_runtime_to_actually_use_the_npu_on/
- 仓库：https://github.com/bpbonker/hexrun
