---
title: "Notion 公开页面泄露所有编辑者邮箱地址"
date: "2026-04-20"
generated: "2026-04-20 08:00"
source: "HN"
slug: "2026-04-20_08-notion-leaks-email-addresses"
summary: "**来源:** Hacker News | **日期:** 2026-04-19 | **热度:** 311 points, 106 comments"
---

# Notion 公开页面泄露所有编辑者邮箱地址

**来源:** Hacker News | **日期:** 2026-04-19 | **热度:** 311 points, 106 comments

---

## 1. 事件背景

安全研究者 @weezerOSINT 在 Twitter/X 上披露，Notion 的公开页面（Public Pages）会在网页元数据中暴露所有曾编辑该页面的用户的姓名、头像和**电子邮件地址**。任何人只需访问一个 Notion 公开页面，即可通过页面元数据获取所有贡献者的个人身份信息（PII）。

这并非新发现。据 HN 用户反馈，该问题至少在 2022 年就已被报告，甚至有用户声称 5 年前就曾因此被去匿名化。Notion 官方帮助文档中其实埋了一条说明："当你将 Notion 页面发布到网络时，网页的元数据可能包含所有对该页面有贡献的 Notion 用户的姓名、头像和电子邮件地址。"但这条关键信息被深埋在文档角落，绝大多数用户根本不会注意到。

## 2. 核心观点

这一事件的核心争议在于：**Notion 将隐私泄露视为"已记录的行为"而非漏洞**。虽然 Notion 在帮助文档中做了披露，并在用户发布页面时显示了模糊的警告提示，但社区普遍认为这远远不够。当用户将页面设为"公开"时，他们的合理预期是页面内容公开——而不是所有编辑者的私人邮箱地址一并暴露。

Notion 员工 Max Schoening（mschoening）亲自在 HN 评论区回应，承认现有的警告"不够好"（"pretty meh"），并表示正在研究修复方案，包括从公开端点移除 PII 或采用类似 GitHub 的邮件代理机制。但他也坦言这"不是一分钟能修好的问题"。考虑到该问题已存在至少四年，这一回应引发了更大的不满。

## 3. 社区热议

**Tiberium**（帖子提交者）指出，这一行为其实在 Notion 官方文档中有记录，但被埋在一个不起眼的注释里：
> "When you publish a Notion page to the web, the webpage's metadata may include the names, profile photos, and email addresses associated with any Notion users that have contributed to the page."

**EMM_386** 对此直言不讳：
> "这本身就荒谬，但把它当作'设计如此'就更荒谬了。"

**RomanPushkin** 分享了亲身经历：
> "这个问题至少存在 5 年了。我记得大约 5 年前有个 HN 用户通过查看我的 Notion 页面将我去匿名化了。"

**hluska** 对 Notion 官方的回应毫不买账：
> "这个缺陷四年前就被报告了。恕我不信你说的任何一个字。"

## 4. 行业影响

这一事件折射出 SaaS 行业在隐私保护方面的深层问题：

- **"文档化"不等于"已解决"**：企业不能仅靠在帮助文档中添加一行小字就将隐私泄露合理化。尤其在 GDPR 等隐私法规日趋严格的背景下，将用户邮箱嵌入公开页面元数据可能构成合规风险。
- **修复优先级的错位**：一个已知四年的隐私问题迟迟未修复，反映出产品团队在功能迭代与安全修复之间的优先级失衡。Notion 近年大力推进 AI 功能，却未能解决这一基础性隐私问题。
- **信任危机**：对于将 Notion 用于企业知识库、公开文档站点的团队而言，编辑者邮箱的泄露可能导致社工攻击、垃圾邮件甚至人肉搜索。这将促使部分用户重新评估是否继续使用 Notion 发布公开内容，并可能推动用户转向 Obsidian、Outline、Docmost 等替代方案。

## 5. 相关链接

- **原文（Twitter/X）:** https://twitter.com/weezerOSINT/status/2045849358462222720
- **HN 讨论:** https://news.ycombinator.com/item?id=47824945
- **Notion 官方文档:** https://www.notion.com/help/public-pages-and-web-publishing#how-visitors-interact-with-your-notion-site
