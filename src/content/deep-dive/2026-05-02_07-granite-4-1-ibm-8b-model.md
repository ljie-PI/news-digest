---
title: "granite-4-1-ibm-8b-model"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-granite-4-1-ibm-8b-model"
---

## Granite 4.1: IBM's 8B Model Matching 32B MoE

### 事件背景

IBM 发布了 Granite 4.1 开源大模型系列，包含 3B、8B、30B 三个尺寸，全部以 Apache 2.0 许可证开放，训练 token 量达到 15 万亿。最值得关注的是其 8B Dense 模型在 ArenaHard、BFCL V3、GSM8K 等多项主流基准上击败了上一代 32B 参数（9B active）的 Granite 4.0-H-Small MoE 模型。这意味着在企业级模型这条赛道，IBM 用「更小但更扎实」的路线，做出了与扩参数路线相反的一次反向证明。

### 核心观点 / 产品机制

Granite 4.1 三个尺寸共用一套 dense 解码器架构，没有 MoE、稀疏层或长链推理，强调可预测的延迟与成本。其训练分为五个阶段，数据配比按阶段调整：从初期的 CommonCrawl 主导，到中期数学/代码占比上升至 30–35%，再到后期注入 CoT 轨迹与高质量指令数据，最后扩展到 512K 上下文。微调阶段，IBM 用 LLM-as-Judge 在「指令遵循、正确性、完整性、简洁性、自然度、置信度校准」六个维度对每条样本打分，幻觉、错误前提、计算错误一票否决，最终筛出 410 万条高质量样本。RL 分四个阶段：联合多领域 → RLHF 提升 chat 能力 → 短身份校准 → 数学专项 RL，用以修复 RLHF 阶段对数学能力造成的回退。

### 社区热议与争议点

HN 评论区聚焦在「能不能本地跑、tool calling 行不行」上。一位用户实测后给出对比：「Qwen 3.6 35B-A3B 仍是我的本地冠军，但 Granite 因为训练数据更新所以会用作自动补全和小任务」。多名 Strix Halo / RTX 3090 用户附和，称 Qwen 3.6 在 agentic 多轮 tool calling 上压倒 Gemma 4，「Gemma4 在 vibecoding 三五轮之后就乱了」。也有用户为 Gemma 4 辩护——其 31B 在「世界知识深度」上更强，是唯一答对「1738 的意义」这种小众知识的本地模型。第三类讨论则聚焦工程细节：llama.cpp + ROCm + jinja chat template 的具体配置、tool calling jinja 模板最近一次的修复等。整体氛围是：业内已不再被「8B 打败 32B」的标题震撼，而是把它放进一张本地模型横向对比表里冷静评估。

### 行业影响与未来展望

Granite 4.1 的真正信号不是「IBM 又开源了一个模型」，而是数据流水线工艺的代际差距比参数量更值钱。当 8B Dense 能在企业相关基准上稳稳压过 9B-active 的 MoE，意味着：(1) 企业本地部署进一步下沉到 24GB 显卡甚至 Strix Halo 级别集成显卡；(2) 推理成本可预测、无 reasoning trace 的「窄而深」模型，会在 RAG、tool calling、SQL 等结构化任务里抢占预算；(3) 数据筛选 + 多阶段 RL 的组合拳正在成为开源模型的新护城河，单纯堆参数不再吃香。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47960507
- 原文：https://firethering.com/granite-4-1-ibm-open-source-model-family/
