---
title: "\"I am worried about Bun\"：被 Anthropic 收购后的开源运行时焦虑"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "HN"
slug: "2026-05-05_11-i-am-worried-about-bun"
summary: "- HN：https://news.ycombinator.com/item?id=48011184（429 points · 287 comments）"
---

# "I am worried about Bun"：被 Anthropic 收购后的开源运行时焦虑

- HN：https://news.ycombinator.com/item?id=48011184（429 points · 287 comments）
- 原文：https://wwj.dev/posts/i-am-worried-about-bun/
- 关联事件：Bun 仓库提交 PORTING.md，正式从 Zig 迁移到 Rust（https://news.ycombinator.com/item?id=48016880）

## 1. 事件背景

作者 William Johnston 在博客中写下一篇标题"我担心 Bun"的长文：Anthropic 已于 2025 年 12 月收购 Bun，官方口径是"保持 MIT 开源、原班团队继续、路线图不变"。但作者注意到：(1) Claude Code 近期被广泛吐槽"质量倒退"——速率限制收紧、回答变保守、上下文丢失；(2) Bun 同样位于 Anthropic 之下，作为 Claude Code 的"事实运行时基础"，未来很可能被推着走向 enshittification（产品先讨好用户、再剥削用户、再剥削商家）的轨迹；(3) 紧接着同日 oven-sh/bun 仓库提交了 PORTING.md，确认正在分阶段把核心代码从 Zig 移植到 Rust——这本身是一个"为大金主重写"的强信号。

## 2. 核心论点

作者把焦虑分成三层：(a) **治理层**：Bun 团队仍是同一拨人，但产品决策权已经在 Anthropic，路线图优先级会被 Claude Code 业务驱动而非纯运行时性能；(b) **技术层**：从 Zig 到 Rust 的重写代价巨大，作者担心是为了"和 Anthropic 内部基础设施统一语言栈"，而不是技术最优解；(c) **商业层**：所有 AI 大厂的 subscription 业务都在亏损补贴，未来必然要么涨价要么砍羊毛，Bun 作为"被打包进 Claude Code"的基础设施，可能被迫接受非中性的优化方向（限流、telemetry、闭源插件）。文章本身没下定论，留了大量"我希望我是错的"。

## 3. 社区热议与争议点

- **乐观派**（AntonyGarand）：Bun 是运行时，与 Anthropic 计费、用量没有直接耦合，Anthropic 没有动机把它做差；收购前 Bun 也得自己想办法 monetize，现在反而有钱继续做下去。
- **悲观派**（stkdump、原帖支持者）：所有 AI labs 现在的 subscription "质量退化" 本质是**商业模型在崩**——subscription 高 token 用户不挣钱，labs 是在烧钱打 harness 之战，等竞争分出胜负就要涨价/限流；Bun 被纳入这个战场是迟早的事。
- **重写派**（Bun 提交线下）：从 Zig 到 Rust 让大量原生贡献者的工作被推翻，社区担心 "ETOOMUCHREWRITE" 让 Bun 在 1.x 之后陷入 stop-the-world；同时 Rust 生态对 LSP/编译器/sandbox 的支持比 Zig 成熟，长期维护性更强。
- **中立派**：建议社区现在就 fork 一个 community-governed 备份分支（类似 OpenJDK / Rocky Linux 模式），万一 Anthropic 路线偏离也有 Plan B。

## 4. 行业影响与未来展望

这是 AI 厂商收购开源工具链后第一次面临的系统性公信力测试：(1) Anthropic 接下来 6-12 个月需要用具体动作（roadmap 透明、独立基金会托管、commit 提交人结构）证明 Bun 仍是 community-first；(2) Rust 重写若顺利，反而能给 Bun 带来更广的贡献者池，降低被单一大厂卡脖子的风险；(3) 行业层面，Vercel→Next.js、Anthropic→Bun、Cloudflare→Workers 这种"AI/云大厂 抓底层 JS 工具链"将常态化，社区将开始要求**收购时附带可验证的 governance 承诺**而不只是 license 承诺；(4) 对开发者实务建议：保持选项开放，project-level 可以同时支持 Node/Bun/Deno 三种运行时，不要把生产路径死锁在单一供应商身上。

## 5. 链接

- HN 讨论：https://news.ycombinator.com/item?id=48011184
- 原文：https://wwj.dev/posts/i-am-worried-about-bun/
- 配套事件 Bun 转 Rust：https://github.com/oven-sh/bun/commit/46d3bc29f270fa881dd5730ef1549e88407701a5
