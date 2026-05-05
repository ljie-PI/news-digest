---
title: "mistral-medium-3-5"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "Reddit"
slug: "2026-05-02_07-mistral-medium-3-5"
---

## Mistral Medium 3.5 重磅登场：128B 稠密模型 + 256k 上下文，欧洲队的反击

### 事件背景

2026 年 4 月底，Mistral AI 发布 Medium 3.5——128B 稠密参数、256k 上下文窗口，并直接在 Le Chat 取代了上一代 Magistral 与 3.1。r/LLM 上由 u/AlanzhuLy 发起的帖子在 24 小时内冲上分区头条。这是 Mistral 自 Mistral Large 2 之后再次以"中等参数 + 长上下文 + 强代码"组合出击。社区敏感地注意到：3.5 的 SWE-Bench Verified 得分 77.6%，已经超越自家 Devstral 2 编码模型——"自己的子弹打掉自己的产品线"。在欧洲 AI 主权叙事日益强烈的 2026 年，这次发布也被视为 Mistral 重新争夺企业级闭源市场份额的关键一战。

### 核心观点 / 产品机制

- **架构**：128B Dense（非 MoE），强调推理一致性与可预期延迟，瞄准企业部署。
- **上下文**：256k tokens，覆盖整本代码库 / 季度财报 / 法律案卷场景。
- **代码能力**：SWE-Bench Verified 77.6%，超过 Devstral 2，社区认为这意味着 Mistral 编码线产品策略将整合归并。
- **定价**：Le Chat 默认接入；API 价格按帖子讨论约为输入 $2.7/M、输出 $8/M tokens——比 Claude Sonnet 便宜约 30%、比 GPT-5 mini 贵但能力更强。
- **多语种**：欧洲语种与中文表现据社区基准接近 Claude Sonnet。

### 社区热议与争议点

- **价格 vs 能力辩论**：原帖作者立场"我不在乎榜单，我在乎钱包"，引来 u/StunningEffective99 反驳："$8/M 输出对长上下文用例是劝退价，128B Dense 在 H100 上跑 256k 不是消费者能 self-host 的尺寸。"
- **Devstral 2 之死**：评论区调侃"刚买 Devstral 2 年付的人现在表情管理失败"。Mistral 工程师在跟评中暗示 Devstral 线"将作为开源蒸馏延续"，但未给路线图。
- **Dense 路线 vs MoE 路线**：有人对比 DeepSeek V3 的 MoE 架构成本优势，质疑 Mistral 坚持 Dense 是"为企业稳定性牺牲性价比"；支持者则认为 Dense 在工具调用、长链推理上更稳定。
- **欧盟合规卖点**：法语区开发者强调 Medium 3.5 是少数明确符合 GDPR 数据驻留要求的高端模型，对政府订单是关键。

### 行业影响与未来展望

Medium 3.5 标志着 LLM 市场进入"细分定价 × 细分能力"阶段：OpenAI 用 GPT-5 占据天花板、Anthropic 用 Claude 守住企业、DeepSeek 用 MoE 卷成本，Mistral 选择**"中端稠密 + 长上下文 + 欧洲合规"**做切片。未来值得观察：(1) 是否会推出真正开源版本以维系社区 mindshare；(2) 256k 长上下文 + SWE-Bench 高分的组合，会不会让"代码 Agent + 整库阅读"变成默认工作流；(3) 对欧洲 AI 法案下的政企标，Mistral 是否能借此拿下更多政府订单。对量化与开发者而言，Medium 3.5 在"价格-能力-上下文"三维上提供了新的甜点选择。

### 附带链接

- Reddit 帖子：https://www.reddit.com/r/LLM/comments/1szihn6/mistral_medium_35_dropped_128b_dense_256k_context/
- Mistral 官网：https://mistral.ai/
