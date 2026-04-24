---
title: "Spec-Kit 正在吞噬你的 Token？深度解读规范驱动开发的代价与出路"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-spec-kit-eating-tokens-alive"
summary: "---"
---

# Spec-Kit 正在吞噬你的 Token？深度解读规范驱动开发的代价与出路

> 原帖：[Spec-driven development with Spec-Kit is eating my tokens alive. What actually works?](https://www.reddit.com/r/GithubCopilot/comments/1sus656/)
> 来源：Reddit r/GithubCopilot · 2026-04-25

---

## 一、事件背景

2025 年 9 月，GitHub 正式开源了 **Spec-Kit**——一款面向 AI 编码助手的"规范驱动开发"（Spec-Driven Development）工具包。其核心理念是：与其让 AI 随意"Vibe Coding"，不如先写好规范（Specify → Plan → Tasks → Implement），让 AI 在结构化约束下逐步交付代码。Spec-Kit 兼容 GitHub Copilot、Claude Code、Gemini CLI 等多个主流编码代理。

然而，随着 2026 年 GitHub Copilot 全面转向 Token 计费模式，Spec-Kit 的高 Token 消耗问题迅速成为社区痛点。Reddit 用户发帖直言：**"Spec-Kit 正在把我的 Token 吃活了，到底什么方法才真正管用？"**

## 二、核心问题：18.6k Token 的"上下文税"

问题的技术根源已在 GitHub Issue #1401 中被详细量化。Spec-Kit 初始化后会向编码代理注入一系列斜杠命令（如 `/specify`、`/plan`、`/tasks` 等），这些命令文件在**每次会话启动时都会被加载到上下文窗口**，无论用户是否正在使用 Spec-Kit。

具体数据：

| 命令 | Token 消耗 |
|------|-----------|
| speckit.checklist | 4,200 |
| speckit.specify | 3,100 |
| speckit.implement | 3,100 |
| speckit.clarify | 2,800 |
| 其他命令 | ~5,400 |
| **合计** | **~18,600** |

影响最严重的平台是 **Cursor 默认聊天模式**（~20k 上下文），Spec-Kit 几乎占满整个窗口（93%）。即使在 GitHub Copilot 标准模式（64k）下也要吃掉近 30% 的上下文空间。这意味着更少的代码上下文、更早的对话截断、以及更差的推理质量。

## 三、社区热议与争议点

**1. "这就是高级 Prompt 工程，没什么新鲜的"**
在另一个热帖《GitHub Spec-Kit is Just Too Complex》中，多位用户直言：Spec-Kit、BMAD、OpenSpec 本质上都是"prompt engineering"的不同包装。有人讽刺道——"这个工具就是为月底烧完你的 Token 而设计的，而且它在这个用途上表现出色！"

**2. 替代方案之争：OpenSpec 的崛起**
不少用户转向了更轻量的替代品 **OpenSpec**，认为其更简洁高效。评论区中"Have you tried OpenSpec? It works well for me"一类推荐频繁出现，反映出社区对 Spec-Kit 复杂度的疲劳。

**3. 子代理（Subagent）策略的实用建议**
在讨论 Token 限制的帖子中，有经验用户建议：**将具体实现任务委托给子代理处理**，主对话只保留摘要，从而避免冗长的调试过程吞噬主会话上下文。这种"分治法"被认为是当前最实用的缓解策略。

**4. 非开发者的积极反馈**
值得注意的是，部分非专业开发者对 Spec-Kit 持正面态度——"作为非开发者，我用 Spec-Kit 成功搭建了集成 Prisma、Stripe 和认证系统的 Web 应用，而且持续添加新功能也能正常运作。" 这表明 Spec-Kit 的结构化流程对新手仍有独特价值。

## 四、行业影响与未来展望

Spec-Kit 暴露的 Token 消耗问题折射出 AI 编码工具领域的深层矛盾：**结构化程度越高，前期 Token 投入越大，但代码质量可能更可控；"Vibe Coding"省 Token 却容易失控。** 随着 Token 计费成为行业主流，这一权衡将变得更加尖锐。

Martin Fowler 团队在其深度分析中也指出：上下文窗口变大并不意味着 AI 能有效利用其中所有内容——Spec-Kit 的 research 步骤虽然能大量收集代码库信息，但 AI 并不总能准确理解和运用这些上下文。

未来可能的方向包括：按需加载命令（`specify enable/disable`）、更紧凑的规范格式、以及编码代理平台侧的上下文管理优化。但在此之前，开发者需要在"规范的充分性"与"Token 的经济性"之间找到自己的平衡点。

## 五、相关链接

- [原帖 - Reddit r/GithubCopilot](https://www.reddit.com/r/GithubCopilot/comments/1sus656/)
- [GitHub Spec-Kit 仓库](https://github.com/github/spec-kit)
- [GitHub Blog: Spec-driven development with AI](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/)
- [GitHub Issue #1401: Token 消耗问题](https://github.com/github/spec-kit/issues/1401)
- [Martin Fowler: Understanding Spec-Driven Development](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html)
- [Microsoft Developer Blog: Diving Into Spec-Driven Development](https://developer.microsoft.com/blog/spec-driven-development-spec-kit)
- [Reddit: GitHub Spec-Kit is Just Too Complex](https://www.reddit.com/r/GithubCopilot/comments/1o6iy7c/github_speckit_is_just_too_complex/)
