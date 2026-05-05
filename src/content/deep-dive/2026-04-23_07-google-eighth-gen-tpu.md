---
title: "Google 发布第八代 TPU：为 Agentic 时代设计的双芯片架构"
date: "2026-04-23"
generated: "2026-04-23 07:00"
source: "HN"
slug: "2026-04-23_07-google-eighth-gen-tpu"
summary: "在 Google Cloud Next 大会上，Google 宣布推出第八代 Tensor Processing Unit（TPU），首次采用双芯片架构：**TPU 8t** 专注训练，**TPU 8i** 专注推理。TPU 8t 单个 superpo"
---

# Google 发布第八代 TPU：为 Agentic 时代设计的双芯片架构

## 事件背景

在 Google Cloud Next 大会上，Google 宣布推出第八代 Tensor Processing Unit（TPU），首次采用双芯片架构：**TPU 8t** 专注训练，**TPU 8i** 专注推理。TPU 8t 单个 superpod 扩展至 9600 芯片、2PB 共享高带宽内存，芯片间带宽翻倍，提供 121 ExaFlops 算力，训练性能较上代提升近 3 倍。TPU 8i 配备 288GB HBM 和 384MB 片上 SRAM（上代 3 倍），专为低延迟推理和 agent 群体协作设计。两款芯片均与 Google DeepMind 联合设计，目标是将前沿模型训练周期从数月缩短至数周。

## 核心观点

Google 的核心洞察是：在 AI Agent 时代，模型需要推理、执行多步骤工作流并在连续循环中从自身行为中学习，这对基础设施提出了新的要求。将训练和推理分离成专用芯片是一个关键的架构决策。TPU 8t 追求 97%+ 的"goodput"（有效计算时间），通过实时遥测、自动故障链路绕行和光学电路切换（OCS）实现。TPU 8i 则通过突破"内存墙"来消除推理延迟中的"等候室效应"。Citadel Securities 等机构已选择 TPU 支持其前沿 AI 工作负载。

## 社区热议

HN 讨论聚焦于 Google AI 的竞争力和模型质量：

1. 一位用户高度评价 Gemini 3 的效率：*"I already felt that gemini 3 proved what is possible if you train a model for efficiency... They produce drastically lower amount of tokens to solve a problem... I feel like google will surprise everyone with a model that will be an entire generation beyond SOTA."*

2. 关于 Gemini 的多语言能力，有用户指出：*"Gemini 3 Pro is the most 'intelligent' in an all-round human way. Especially in the humanities... The top 4 models at multilinguality are all Google."* 但也承认它在数学和 agentic 任务方面较弱。

3. 一位关注创意写作的用户反驳了"Gemini 最好"的说法，指出 Claude 3 Opus 在文学风格上的优势：*"Claude 3 was best at this, including dead and low-resource languages... Anthropic basically reversed their 'character training' policy and started optimizing their models for code generation at the cost of everything else."*

4. 关于 Gemini CLI 的实用性存在分歧。有人认为 *"Gemini-cli is terrible compared to CC and even Codex"*，但另一位用户反驳：*"I can use gemini-cli with English descriptions of features or entire projects and it just cranks out the code... Can't think of anything it's currently lacking."*

## 行业影响

Google 将训练和推理拆分为专用芯片的策略，反映了 AI 基础设施正从"通用加速器"向"任务专用化"演进的趋势。121 ExaFlops 的训练集群规模和百万芯片近线性扩展能力，将显著降低前沿模型训练的时间和成本门槛。对 NVIDIA 而言，TPU 8 系列的发布加大了在超大规模客户市场的竞争压力。对整个行业来说，专为 agent 工作负载优化的推理芯片可能加速 AI Agent 从概念到大规模部署的转化。

## 相关链接

- Google 博客: https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/eighth-generation-tpu-agentic-era/
- HN 讨论: https://news.ycombinator.com/item?id=47862497
