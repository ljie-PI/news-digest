---
title: "Google 加速 Gemma 4 推理：多令牌预测 draft 模型让吞吐显著提升"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "HN"
slug: "2026-05-06_06-accelerating-gemma-4-multi-token-prediction-drafters"
summary: "**HN ID**: 48024540 | **Score**: 365 | **Comments**: 166"
---

# Google 加速 Gemma 4 推理：多令牌预测 draft 模型让吞吐显著提升

**HN ID**: 48024540 | **Score**: 365 | **Comments**: 166
**URL**: https://blog.google/innovation-and-ai/technology/developers-tools/multi-token-prediction-drafters
**HN**: https://news.ycombinator.com/item?id=48024540

## 事件梗概

Google 在开发者博客发文披露 Gemma 4 的推理加速方案：用一个 **专门训练的小型 MTP（multi-token prediction）draft 模型** 并行预测后续 N 个 token，再让主 Gemma 4 在一次 forward 中并发 verify 这 N 个候选；命中即跳过。这套是 *speculative decoding* 的工程化标准化，但引入了 MTP 训练目标显著提升 draft 的命中率。报告关键数据：吞吐 **2–3×** 提升，能效比改善，质量与 baseline 持平。Google 同时把 draft 模型公开发布，鼓励 vLLM / SGLang / TGI 等开源 inference engine 接入。

## 评论区主线

### 1. Gemma 的"少 token 输出"再次被点名
最高赞（48026531）说出近期 Gemma 用户的共同感受：**Gemma 系列输出 token 数量极少**，相比 Qwen 等模型，同样任务可能少花 80% 时间但只低 5–10% benchmark 分数。结合 MTP draft 的 2–3× 加速，端到端时延差距进一步拉大——形成 Gemma 在 *latency-sensitive* 场景的独特护城河。

### 2. Gemini 计划与 CLI 的产品体验
分支讨论占据评论区半壁江山。最显眼是关于 Google 的 $15/月 Gemini 订阅 vs ChatGPT/Claude Code 的成本/质量对比：

- 支持派（48026592）：$15 计划够全天编码不撞限。
- 反对派（48027361）：Gemini CLI 本身体验很差，Pro 模型常 20–30 分钟才"思考"完，OpenAI 同档位每日额度 6 倍。
- 中间派（48027029）：必须强制 CLI 用 Pro 而非 Flash 才稳，Flash 写复杂代码"像喝醉的初级"。
- 翻译/特定任务上 Gemini 仍最优（48027029）。

### 3. Coding Agent 计划经济学
（48028019, 48028119）有人吐槽 Claude Code 的 5 小时限额很容易触达；另一条引申讨论 **AI 编码全天使用的 CO₂ 成本**：按美国电网 mix，8 小时使用 ~0.7-14 kg CO₂（取决于地区），等同每天通勤 9 英里小汽车。把 LLM 的环境成本从云提供商账面拉到了开发者个人账面。

### 4. 推理优化的下一步
评论区共识：MTP draft 是 2024 起 speculative decoding 演化的顺势之作。下一波看 **Medusa head / EAGLE / Lookahead Decoding**，再下一步是 **diffusion-LM 风格的并行采样**。

## Pros / Cons

**Pros（MTP drafter 方案的价值）**
- 工程标准化：可直接接入主流 inference engine。
- Google 公开 draft 权重，社区可立即复现。
- 与 Gemma 的"短输出"特性叠加效果显著。
- 降低端侧推理时延，对设备级 LLM 有利。

**Cons**
- Speculative decoding 不改变 *peak* throughput，吞吐增益依赖任务可预测性。
- 对极长上下文/工具调用密集场景，draft 命中率可能下降。
- 需要为每个主模型尺寸配套训练 draft，增加发版复杂度。

## 量化研究员视角

(1) **推理成本曲线持续下移**：MTP 类方案在 2026 内将让端侧 LLM 实际可用门槛进一步降低，与 #1（Chrome 4GB Gemini Nano）形成产业互补——OEM 把权重下发到端，加速方案让推理时延可接受，端侧 LLM 商业化拐点临近。(2) **Gemma 在 latency-sensitive 应用的优势开始量化**：算法交易、低延迟 NLP 推理、流式翻译等场景，Gemma + MTP 可能比 Qwen/DeepSeek 同尺寸更划算。(3) **环境成本进入采购决策**：评论区 CO₂ 计算虽然概略，但欧盟 CSRD 报告框架已要求 AI 大客户披露推理碳足迹，2026 年内会被纳入 RFP 关键评分项——支持低 token 输出 + 推理优化的厂商占优。

## 后续观察点

- vLLM / SGLang / TGI 是否在 1–2 个 release 内集成 Gemma MTP drafter。
- 同类方案是否扩展到 Gemini Pro 闭源模型并直接体现在 API 定价。
- 学术界对 "MTP loss vs draft 命中率" 的进一步消融研究。
