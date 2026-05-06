---
title: "BFCL benchmarks for Gemma4 26B on a 5070Ti 16GB VRAM"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "Reddit"
slug: "2026-05-06_06-bfcl-benchmarks-for-gemma4-26b-on-a-5070ti-16gb-vr"
summary: "OP 用 Unsloth UD-IQ4_XS 把 Gemma4 26B-A4B（MoE 架构、激活 ~4B）激进量化后塞进 RTX 5070 Ti 16 GB VRAM，并保留 96K context window。他在 OpenCode 中已用了近一个月，自评\""
---

# BFCL benchmarks for Gemma4 26B on a 5070Ti 16GB VRAM

## 事件背景

OP 用 Unsloth UD-IQ4_XS 把 Gemma4 26B-A4B（MoE 架构、激活 ~4B）激进量化后塞进 RTX 5070 Ti 16 GB VRAM，并保留 96K context window。他在 OpenCode 中已用了近一个月，自评"替代了 80% 的 Claude Code 用量"。这条帖子成为本周 r/LocalLLM 的热点，因为它给"消费级中端卡 + 本地 coder agent"提供了一份可直接复刻的配方。

## 核心机制 / BFCL 跑分

帖子给出完整 llama.cpp 启动参数：`--n-gpu-layers 99 --jinja --reasoning on --reasoning-format deepseek --chat-template-kwargs ...`，并配以 BFCL（Berkeley Function Calling Leaderboard）跑分对比。结论：在 single-turn tool-use、parallel tool 调用、composite reasoning 三个维度上，量化版 Gemma4 26B 与 Sonnet 3.7 mini-tier 同档；在多轮 agent 任务上仍落后 Opus 一档，但优于 Qwen3 32B + AWQ 同硬件配置。

## 社区热议与争议点

正向反馈：多名用户验证可以在 5070 Ti / 4080 Super 16 GB 上复现，体感"daily code 流畅度足够"；并称赞 OpenCode + Gemma 已成为"去 SaaS"工作流首选。质疑点：(1) UD-IQ4_XS 在长上下文下精度衰减明显，96K 真用上时召回率显著下降；(2) BFCL 子集偏窄，未涵盖大型代码仓的多文件编辑；(3) 16 GB 显存意味着 KV cache 几乎吃满，并发只有 1，难以做团队级网关。也有人提出更激进的 IQ3_XXS 方案，把同样模型挤到 14 GB。

## 行业影响与未来展望

它给"中端单卡 + MoE 小激活模型 + 重量化"路线又添一条强证据——这正是 Gemma4-A4B、Qwen3-Next-A3B 等"激活很小"架构的设计目标。短期内对 Claude Code 订阅会形成边际侵蚀，对 RTX 50 系也是一波购买驱动。

## 链接

- 原帖：https://www.reddit.com/r/LocalLLM/comments/1t4lomv/

