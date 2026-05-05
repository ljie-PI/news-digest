---
title: "yangshun/tech-interview-handbook"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-yangshun-tech-interview-handbook"
summary: "- **Description:** Curated coding interview preparation materials for busy software engineers"
---

# yangshun/tech-interview-handbook

- **Description:** Curated coding interview preparation materials for busy software engineers
- **Stars:** 139,260 ⭐ (今日 +76)
- **Language:** TypeScript

## 定位与痛点

`tech-interview-handbook` 是新加坡前 Meta 工程师 Yangshun Tay（Blind 75 题单作者）维护的求职面试准备项目，定位非常清晰：为「没时间刷几百道 LeetCode」的工程师提供一套**精炼且免费**的技术面试备战资料。痛点直击现实——大公司面试卷度持续上升，但市面上要么是付费课程，要么是堆链接的 awesome-list，缺少一套有取舍、有节奏的内容。它把刷题、简历、行为面、谈薪、前端专项等串成完整路径，并衍生出 Grind 75 题单作为 Blind 75 的进化版。

## 架构与技术

仓库实际上是一座内容站点：源码以 TypeScript + Docusaurus 站点形式承载（techinterviewhandbook.org），README 充当导览。内容侧重「指南 + 清单」，Grind 75 是一个独立的交互式题单生成器。前端项目还分拆出 frontendinterviewhandbook 子站，并关联作者另一个数据结构库 Lago。整体偏内容工程而非算法库，技术栈轻量，重点在长期内容运营。

## 竞品

直接对标的是 *Cracking the Coding Interview*（书）、CtCI 类的 awesome-* 仓库、NeetCode（视频 + 题单）、LeetCode 官方 Explore 模块，以及付费课程 AlgoMonster、Grokking the Coding Interview、ByteByteGo。差异点：Tech Interview Handbook 完全免费、内容自持（非外链堆砌），并且覆盖**算法之外**的简历、行为面、薪资谈判等 soft 部分；NeetCode 强在视频讲解，Grokking 强在模式化训练，CtCI 强在系统全面但更新慢。

## 反馈与局限

社区反馈长期正面，README 自述受益人数突破百万、是 GitHub 长青项目之一。今日 +76 stars 表明在春季招聘季仍持续吸量。局限也很明显：算法部分相对薄弱、不适合作为唯一刷题来源；系统设计章节自己也承认「仍在筹备」，目前只能外链 ByteByteGo / Design Gurus；README 中夹带较多联盟营销链接（AlgoMonster / Grokking 的 affiliate），对部分用户体验略打折扣。

## 链接

- 仓库：https://github.com/yangshun/tech-interview-handbook
- 站点：https://www.techinterviewhandbook.org/
- Grind 75：https://www.techinterviewhandbook.org/grind75/
