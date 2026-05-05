---
title: "ai-economics-dont-make-sense"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-ai-economics-dont-make-sense"
---

## AI's economics don't make sense

### 事件背景

知名 AI 怀疑派博主 Ed Zitron 在 Where's Your Ed At 发表长文，借 GitHub Copilot 宣布 2026 年 6 月 1 日全面切换到「按用量计费」（usage-based billing）这件事，重炮抨击整个 AI 行业的经济模型不可持续。GitHub Copilot 的官方说辞是「Copilot 已不是一年前的产品，agentic 用法变成默认，计算/推理需求大幅上升」。Zitron 把这翻译成大白话：「微软不能再继续补贴近两百万用户的算力了，否则 Amy Hood（CFO）会拿球棒打人」。WSJ 此前报道，Copilot $10/月套餐里，部分重度用户每月给微软带来 $80 成本，平均每人月亏 >$20，且这种状况持续了三年。

### 核心观点 / 产品机制

Zitron 的论点核心是「Subprime AI Crisis（次贷式 AI 危机）」：整个生成式 AI 服务赛道从 OpenAI、Anthropic、Perplexity 到 Lovable，定价逻辑都是订阅费 + 大幅补贴算力，用户为 $20/$100/$200 月费付钱时所消耗的真实算力远高于这个数。这种模式靠风投和大厂资本支撑了几年，但 Copilot 切换计费就是「补贴退潮」的第一张多米诺骨牌：用户花 $19/月得到的是 $19 等值 token——一旦 token 烧完，要么停手要么按表付费。Zitron 引用 Salesforce Agentforce 「$2 一次对话」的定价为反面教材，预言企业级客户也会开始觉得「即便钱多也对不起这账单」。文章结构上把 Copilot 政策、Anthropic/OpenAI 主流模式、Salesforce 企业 SKU 串在一起，论证「补贴拐点」已经到来。

### 社区热议与争议点

HN 评论区却出现了对 Zitron 本人的反弹。第一类批评：人设不一致——「半年前他还在反复说 LLM 啥也干不了、纯诈骗，现在不得不退到‘可能有用但不值这个价’，但他从不承认自己之前错了」。第二类是文体批评：「18000 字一篇博客，越往后越多 rage-bait 和填充词，给他个 2000 字预算他能写出更好的文章」。第三类是受众分析：「他真正的受众不是 HN 这种懂技术的人，而是那种对 LLM 有道德/审美顾虑但不太懂计算和商业的聪明人」。第四类替他辩护：「2024 年初他是反对 AI 炒作的少数声音，听他对那些 slop 解构很解压；只是技术变了，他没跟上，剧本变得僵硬」。也有对核心论点的反驳：「我自认为是 AI 怀疑派，但所谓怀疑应该是对短期投资回报、对 FOOM 假说的怀疑——而不是说 LLM 没用」。

### 行业影响与未来展望

无论你对 Zitron 文风如何评价，他指出的事实——Copilot 切按量付费——是真实的转折信号。可以预期：(1) 2026 年下半年会有一波订阅制 AI 产品集体调价或限速，「无限套餐」概念基本消亡；(2) Coding agent 这种长链 agentic 任务（一次几十万 token）会被率先按用量定价，订阅制能保留的将主要是低 token 高频次的 chat 场景；(3) 企业客户预算决策会从「投资 AI」转为「为单次任务付钱」，这要求 ROI 可量化，反过来淘汰一批 demo 看起来很美但实际产出难以核算的产品；(4) 风投耐心耗尽后，很多 wrapper 类初创没有自营 GPU 又不能锁定低价 API，将面临根本性毛利问题。Zitron 文章的瑕疵不能否定其结论的现实主义：补贴时代正在结束。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47936867
- 原文：https://www.wheresyoured.at/ais-economics-dont-make-sense/
