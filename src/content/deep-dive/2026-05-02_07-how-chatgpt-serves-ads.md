---
title: "how-chatgpt-serves-ads"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-how-chatgpt-serves-ads"
---

## How ChatGPT serves ads

### 事件背景

技术博客 buchodi.com 发布逆向分析文章 "How ChatGPT serves ads — here's the full attribution loop"，公开了 OpenAI 在 ChatGPT 中投放广告的完整归因链路。HN 评分 503。文章指出，广告并非合并到主回答里，而是作为**独立事件流**注入，附带完整的曝光、点击、归因追踪。这与 Sam Altman 此前公开承诺的"广告是最后手段，因为它会让产品变得诡异"形成鲜明对照。

### 核心机制 / 产品形态

根据该文章描述，ChatGPT 的广告投放走"分离事件流 + 后置归因"路线：广告作为独立的 SSE 事件下发到客户端，与正文回答并列展示但格式区分；点击触发标准 affiliate / 广告网络归因。这种实现方式让前期屏蔽相对简单——客户端可以识别事件类型并过滤——但也意味着 OpenAI 已经搭好了完整的广告基础设施，下一步随时可以推进到"原生植入"（直接把广告嵌进对话）。这正是评论区最担忧的演进方向。

### 社区热议与争议点

评论区情绪极差，几乎全部为负面。**enshittification 派（gxs）**："这真恶心。感觉黄金时代正在落幕，enshittification 开始了。"**屏蔽派（WD-42）**指出技术弱点："既然作为独立事件下发，应该容易屏蔽。等广告直接注入主回答时才会有意思。"——意味着 ad blocker 圈正在准备对策。**讽刺派（keyle）**："等不及'看 90 秒广告解锁下一个 prompt 的 high 配额'了。"**信任崩塌派（avaer）**最尖锐：广告被 Sam Altman 自己定义为"最后手段，因为它独特地令人不安"。如今 OpenAI 顶着这个判断也要做，"要么 Sam 当初在撒谎，要么 OpenAI 已经放弃了不通过 enshittification 也能在经济上跑通的希望——两个选项都不好，我看不到第三种。"**收入结构派（infinite_spin）**点出反讽："OpenAI 从国防合同赚的钱比从聊天广告里多得多，不知道是谁的'高见'要冒这个公关风险。"

### 行业影响与未来展望

这件事与同期的"AI 经济不可持续"论述（wheresyoured.at 那篇 HN 头条 236 分）形成同一主旋律——**模型成本与订阅收入跑不通**，巨头开始转向广告变现。短期影响：广告屏蔽插件圈快速反应；隐私/信任议题在欧盟监管层升温（GDPR 与定向广告交叉点）。中期：Anthropic、Google、Perplexity 是否跟进将定义 LLM 商业化第二阶段。长期：聊天界面的"原生广告"形态会成为 2026-2027 年 UX 大战焦点——如果模型出口被广告污染，开源本地模型的拉力会进一步增强。

### 链接

- HN 讨论：https://news.ycombinator.com/item?id=47942437
- 原始文章：https://www.buchodi.com/how-chatgpt-serves-ads-heres-the-full-attribution-loop/
