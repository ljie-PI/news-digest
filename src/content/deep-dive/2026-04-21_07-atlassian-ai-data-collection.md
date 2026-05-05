---
title: "Atlassian 默认开启用户数据收集用于 AI 训练"
date: "2026-04-21"
generated: "2026-04-21 07:00"
source: "HN"
slug: "2026-04-21_07-atlassian-ai-data-collection"
summary: "---"
---

# Atlassian 默认开启用户数据收集用于 AI 训练

> 来源：Hacker News 热议 · 2026-04-21

---

## 1. 事件背景

2026 年 4 月，Atlassian 宣布将从 **8 月起**默认收集旗下 Jira、Confluence 等云产品中的用户数据，用于训练其 AI 模型。此举影响其全球约 **30 万客户**。

收集的数据分为两类：

- **元数据（Metadata）**：包括 Confluence 页面的可读性评分、语义相似度分数、Jira 故事点数、Sprint 截止日期、SLA 等。对于 Free、Standard、Premium 用户，元数据收集**始终开启且无法关闭**。
- **应用内数据（In-app Data）**：包括 Confluence 页面标题与正文、Jira 工单标题/描述/评论、自定义 emoji 名称、自定义工作流名称等。Free 和 Standard 层级**默认开启**但可以手动关闭；Premium 和 Enterprise 层级**默认关闭**。

数据收集后将保留**最长 7 年**。Atlassian 声称数据会经过去标识化和聚合处理。唯一完全豁免的用户群体包括：使用客户托管密钥（BYOK）、Atlassian Government Cloud、Isolated Cloud 的客户，以及有 HIPAA 合规要求的客户。

## 2. 核心观点

Atlassian 此举的核心争议在于**"默认开启 + 无法完全退出"**的设计。低层级用户的元数据收集没有任何退出选项，这意味着除非升级到最昂贵的 Enterprise 方案或受法律保护，用户数据将被强制纳入 AI 训练管线。

这一策略被批评为典型的 **"暗模式"（dark pattern）**——利用用户惰性，通过默认开启来最大化数据收集量。Atlassian 方面辩称这是为了改善搜索结果、内容摘要和智能工作流，但社区对此并不买账。

## 3. 社区热议

HN 社区的讨论迅速转向对 Atlassian 整体产品质量和企业文化的批判：

> **用户评论 1**（匿名 HN 用户）：*"Atlassian just goes from misstep to misstep... I tried their AI stuff on the free trial, didn't work at all, tried to cancel, can't cancel the free trial online and had to write a load of support tickets (of which the support ticket contact form bugged out multiple times)."*
> ——描述了 AI 功能不可用、免费试用无法在线取消的荒诞经历。

> **用户评论 2**（自称前 Atlassian 员工）：*"I worked there and the answer is the engineering talent isn't great, in addition to being very unfocused, and tons of pointless org churn. Bitbucket pipelines/workers was originally implemented, essentially, by two guys... That office doesn't even physically exist anymore, and the people are long gone."*
> ——从内部视角揭示了工程人才流失和组织混乱的问题。

> **用户评论 3**（HN 用户）：*"Absolutely insane that this is legal. The only reason to do this is to trick and abuse customers. Atlassian seems like a typical entrenched big company... They make money by selling to the bosses of their users and being the default name brand."*
> ——直指 Atlassian 依赖品牌惯性而非产品质量生存的商业模式。

> **用户评论 4**（HN 用户）：*"The search function in Jira has always been unusable. It's perhaps the worst part of the entire platform, but nice to see they're still focused on adding features I will never use."*
> ——讽刺 Atlassian 忽视基础功能却执迷于新功能堆叠。

## 4. 行业影响

Atlassian 此举折射出 SaaS 行业在 AI 时代的一个重要趋势：**用户数据正在成为 AI 模型训练的默认燃料**。与 Adobe、Zoom 此前引发争议的类似政策一脉相承，企业级软件厂商正在将客户数据的 AI 利用权写入默认条款。

对企业用户的影响尤为深远：

- **数据主权风险**：存储在 Jira/Confluence 中的项目文档、代码评审、内部讨论等敏感数据可能被用于模型训练
- **合规压力**：受 GDPR、行业监管约束的企业需要主动审查并调整设置
- **替代方案需求上升**：Linear、Notion、GitLab 等竞品可能从中受益
- **定价分层成为数据保护工具**：只有付费最高层级才能获得完整的数据保护，这实质上是将隐私变成了付费功能

## 5. 相关链接

- 📰 原文：[Atlassian enables default data collection to train AI](https://letsdatascience.com/news/atlassian-enables-default-data-collection-to-train-ai-f71343d8)
- 💬 HN 讨论：[Hacker News](https://news.ycombinator.com/item?id=47833247)
- 📰 The Register 报道：[Atlassian to train AI on user data unless law or cash say no](https://www.theregister.com/2026/04/18/atlassians_new_data_collection_policy/)
