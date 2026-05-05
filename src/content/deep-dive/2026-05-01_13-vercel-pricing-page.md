---
title: "Vercel's pricing page (The Vercel Upsell Game)"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-vercel-pricing-page"
summary: "- **来源**: Hacker News (front, 151 points)"
---

# Vercel's pricing page (The Vercel Upsell Game)

- **来源**: Hacker News (front, 151 points)
- **原帖**: https://news.ycombinator.com/item?id=47963895
- **外链**: https://theupsellgame.com/

## 事件背景

匿名作者上线 *theupsellgame.com*，把 Vercel 的定价页拆解成一份"步步诱导升级"的调查报告。背景是过去半年 Vercel 围绕 AI Gateway、Fluid Compute、Edge Functions 系列升级，把不少免费/Pro 用户在不知情中跨档计费——Reddit/HN 上多次出现"账单从 $20 变成 $1200"的截图。这次的调查站把所有 dark pattern 系统化展示。

## 核心观点

调查列出几个被认为"不诚实"的设计：(1) 计量单位混淆——同一个产品页用 GB-hour、function invocations、edge requests 三种单位互换；(2) 默认勾选打开"AI Gateway include premium models"，超量后按 token 计费且无 hard cap；(3) Spending Cap 被刻意藏在 Settings 二级菜单且默认关闭；(4) 当用户超出 Hobby 限额时，UI 不强制升级，但服务降速并隐性切到按量计费；(5) 团队邀请页直接默认 Enterprise 询价。作者建议把以上每一项与 ToS、FTC dark pattern 指南条文做对应。

## 社区热议

正方观点（认同站点）：很多前端开发者贴出自己的"惊喜账单"，Cloudflare Pages、Netlify 老用户开始迁移；某 Solo dev 提到"$890 from one weekend deploy of an AI playground"。反方观点：Vercel 的客户成功团队 Mike T. 在评论里反驳，称账单都有 invoice 与告警，超量用户多数确实在用功能；也有 SaaS 创业者认为"upsell 是商业现实，免费用户不是公司义务"。中立讨论焦点是：是否应该立法强制 PaaS 类产品提供 hard spending cap。

## 行业影响

短期：Vercel 公关层面会被迫回应（去年类似事件后他们曾推出 spend alerts）；竞品 Cloudflare、Netlify 趁势宣传"defaults to free，不会自动加档"。中期：可能催生类似 EU 数字服务法案对 cloud upsell 的规则。对工程团队的实操建议：(1) 强制启用 spending cap；(2) 把 production 部署绑定独立支付账户；(3) 监控 invocation 计费单位，避免被同一 metric 多次计价。

## 链接

- 调查站: https://theupsellgame.com/
