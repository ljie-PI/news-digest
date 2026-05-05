---
title: "mike-open-source-legal-ai"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-mike-open-source-legal-ai"
---

## Mike: open-source legal AI

### 事件背景

Mike（mikeoss.com）作为 Harvey、Legora 等闭源企业级法律 AI 的开源替代品发布。其产品定位是把这些动辄需要企业合同的「律所 AI 助手」功能完全开源化：Assistant（带文档引用的多步骤 chat）、Projects（按 matter 分组的工作区）、Tabular Review（百份文档并行结构化抽取，每个 cell 可回溯到具体页面引文）、Workflows（CP 清单、信贷合同摘要、控制权变更审查等可复用 prompt 模板）。卖点是零 license 成本、可自托管、可分叉、对接律所自有 DMS、完全开源 prompt 工程链路，使用 Claude / Gemini 自带 key 计费。

### 核心观点 / 产品机制

Mike 的设计核心是「让律所拥有自己的 AI」，把数据驻留与权属问题处理为产品第一性问题。文档不离开律所周边、prompt 与引用解析逻辑公开可审计，这些是受监管行业（律师特权 privilege、客户保密 confidentiality）能否落地 AI 的硬约束。它把 Tabular Review 这种企业级杀手功能开源化，意味着律所即便没几百万美元年费预算，也能在少量工程力下复用 Harvey 级别的批量条款抽取流水线。技术架构上是典型的「模型自带 key + RAG + workflow 模板 + 引用追溯」，没有自训练模型，依赖前沿 LLM 的能力 + 自有文档库。

### 社区热议与争议点

HN 评论区第一条高票来自一位法律从业者，泼了重要一盆冷水：「这不是 Westlaw 等正经法律 AI 助手的替代品，它本质是 LLM 包装层，能做的你用 ChatGPT 加好 prompt 也能做」。他指出真正难复制的是「case law 数据库访问权」——Thomson Reuters/Westlaw 之所以收费上千美元/年，是因为它们与判例报告公司签了独家合同，掌握公开渠道无法获得的完整判例集。第二条讨论：判例理论上是公共的，但在 UK/US，逐案申请、付费、等待让现实里的研究流程无法跑通。一位律师列了 10 步法律研究流程，强调步骤 5–10 全部依赖完整可检索的判例库 + 「这案是否还是 good law」的引用追溯系统。第三条争论：「这正是 RAG agent 擅长的，只要科技公司投 10% 的 coding agent 资源到法律 AI，就能解决」——立刻被反驳：「RAG 再多也救不了你没有判例数据本身」。第四条建设性建议：加拿大有公开判例库 CanLII，如果有人爬下来塞进 Mike 这类开源项目，就能成为本地律师真正的工具。

### 行业影响与未来展望

Mike 的真实价值不在于「干掉 Harvey」，而在于把法律 AI 的工程基础设施部分变为公共品——这会让数百家中小型律所第一次有能力跑出自己的合同审查、尽调流水线，避免被一两家头部 SaaS 锁定。但它的天花板被「判例数据闭环」死死压住：在没有公共判例数据库的司法辖区（包括美英），自托管 LLM 永远做不到 Westlaw 级研究。可预期的演化：(1) 各国监管和行业协会会被推着考虑「判例公共数据基础设施」立法（已有 CanLII、EU EUR-Lex、UK Caselaw 等先例）；(2) 律所采购模式会分裂为「Westlaw（数据） + Mike-class（工具链）」的双供应商组合，而不是 Harvey 一站式；(3) 中小律所市场会出现一批基于 Mike 的二次开发服务商，类似当年 WordPress 之于网站。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47956739
- 原文：https://mikeoss.com/
