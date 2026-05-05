---
title: "google-research/timesfm"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-google-research-timesfm"
summary: "- ⭐ Stars: 19216 (今日 +174)"
---

# google-research/timesfm

> TimesFM (Time Series Foundation Model) is a pretrained time-series foundation model developed by Google Research for time-series forecasting.

- ⭐ Stars: 19216 (今日 +174)
- 💻 Language: Python
- 🔗 https://github.com/google-research/timesfm

## 定位与痛点

TimesFM 是 Google Research 推出的**时间序列基础模型 (Foundation Model for Forecasting)**，定位类似 NLP 里的 GPT，但面向预测任务：单一预训练模型、零样本上手任意时间序列。它瞄准的痛点非常具体——传统时序预测（ARIMA、Prophet、N-BEATS、LightGBM）需要逐数据集调参、对短样本/冷启动场景脆弱，而工业界的零售销量、能耗、广告投放、运维监控、金融指标等场景都希望"开箱即用"。TimesFM 通过在覆盖 1000 亿+ 时间点的混合语料上预训练 decoder-only Transformer，实现了 **zero-shot 接近主流 SOTA** 的效果，让 ML 团队从"训练一个模型"转向"调用一个模型"。

## 架构与技术

模型核心是 patched decoder-only Transformer：把输入序列切分为定长 patch 作为 token，用因果自注意力滚动预测下一段。预训练数据混合了 Google Trends、Wiki Pageviews、合成 ARMA、M4/M5 等公开语料。当前已开源 v1（200M）、v2（500M）以及 2.5 系列 200M 版本，新版本支持更长上下文（最长 16k 点）和分位数预测，同时显著降低显存占用。仓库提供 PyTorch / JAX 双实现，Hugging Face 上有 checkpoint，能直接 `pipeline.forecast()`，也支持微调和协变量条件预测。

## 竞品对比

直接对手是 Amazon Chronos / Chronos-Bolt（基于 T5 token 化 + 量化 bin）、Salesforce Moirai、Nixtla TimeGPT（闭源 API）以及 IBM TinyTimeMixer。TimesFM 的差异点：纯 Google 语料工程 + decoder-only 结构推理更快，零样本基准（GIFT-Eval、Monash）通常领先 Chronos 同尺寸版本；对短序列鲁棒性较好；缺点是协变量支持仍较弱、长程不确定性表达不如 Chronos 量化方案精细。

## 反馈与局限

社区主要反馈：1) 安装链路较重（JAX/TPU 影子较深，Linux + CUDA 友好度待提升）；2) 在高频金融数据上零样本表现不稳定，需要微调；3) 协变量/外生变量接口仍在迭代。优点是 issue 响应速度快、Colab 示例完整、对工业用户的"零样本基线"价值极高。今日 +174 stars 主因是 v2.5 长上下文和量化版本陆续放出，叠加多个 LLM/时序对比博客集中传播。

## 链接

- Repo: https://github.com/google-research/timesfm
- HF Models: https://huggingface.co/google/timesfm-2.5-200m-pytorch
- Paper: arXiv:2310.10688 "A decoder-only foundation model for time-series forecasting"
