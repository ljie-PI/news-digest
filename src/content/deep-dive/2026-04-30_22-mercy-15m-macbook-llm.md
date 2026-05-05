---
title: "I Built Mercy: a Tiny 15M LLM Trained Locally From Scratch on My MacBook"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-mercy-15m-macbook-llm"
summary: "**Subreddit:** r/LocalLLM"
---

# I Built Mercy: a Tiny 15M LLM Trained Locally From Scratch on My MacBook

**Subreddit:** r/LocalLLM
**Permalink:** https://www.reddit.com/r/LocalLLM/comments/1szs63b/i_built_mercy_a_tiny_15m_llm_trained_locally_from/

## 事件背景
一位独立开发者在 r/LocalLLM / r/LLM 同时发帖，分享自己用一台 MacBook（M3 Pro / M4）从零训练的 15M 参数语言模型 "Mercy"。规模只是当代主流模型的 0.0002%，但作者展示从 tokenizer 到模型代码、训练数据准备的全流程都在本地完成。

## 核心机制
据帖文与 GitHub README：(1) 模型结构是 6 层 Transformer Decoder，hidden 384、heads 6、context 1024；(2) 训练语料约 1.5B tokens，混合 TinyStories、Wikipedia 简单子集、自家清洗数据；(3) 用 PyTorch + MPS 后端，单张 M3 Pro 训练约 50 小时；(4) 最终在 TinyStories validation 上 perplexity ~6.5，可生成符合语法的故事，但事实知识极少。

## 竞品对比
15M 参数模型不是为生产，而是教学 / 复刻 nanoGPT 风格的"全栈训练实验"。同类近作：Karpathy 的 nanoGPT、TinyStories 论文复刻。Mercy 的差异化在于"全程在 MacBook 完成、利用 MPS"，证明个人设备已足够支撑教育级 LM 训练（不需 RTX/A100）。

## 社区反馈
评论中讨论：(1) 教育价值——很多人留言"想跟着复刻一遍"；(2) MPS vs CUDA 性能——有人测出 M3 Pro 在 fp32 训练 GPT-2 small 的吞吐相当于 RTX 3060；(3) 数据质量——TinyStories 带来的"过拟合优雅风格"是评分高的主因；(4) 期望——希望作者写 blog 详细记录从 tokenizer 到 batch size schedule 的所有决策。也有人提醒别误把这种小模型当作"通用 LLM 替代"用。

## 链接
- 原帖：https://www.reddit.com/r/LocalLLM/comments/1szs63b/i_built_mercy_a_tiny_15m_llm_trained_locally_from/
