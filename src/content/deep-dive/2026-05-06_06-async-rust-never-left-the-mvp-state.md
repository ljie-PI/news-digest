---
title: "\"Async Rust 从未走出 MVP 阶段\"——一篇引爆 220 条评论的批判长文"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "HN"
slug: "2026-05-06_06-async-rust-never-left-the-mvp-state"
summary: "**HN ID**: 48019163 | **Score**: 411 | **Comments**: 220"
---

# "Async Rust 从未走出 MVP 阶段"——一篇引爆 220 条评论的批判长文

**HN ID**: 48019163 | **Score**: 411 | **Comments**: 220
**URL**: https://tweedegolf.nl/en/blog/237/async-rust-never-left-the-mvp-state
**HN**: https://news.ycombinator.com/item?id=48019163

## 事件梗概

Tweede Golf 工程师撰文批评 Rust 异步生态停滞：标题虽夸张，但论据扎实——Rust async 自 2019 年稳定以来，许多本应配套的语言能力至今缺位，包括：标准化的 `Spawn`/`Timer` trait、`async fn in trait` 不支持 dyn dispatch、`AsyncRead/AsyncWrite` 仍在 third-party crates、整个生态对 Tokio 形成事实垄断、函数染色（function coloring）问题实质未解。文章主张：把当年发布的 `Future` 看成 MVP 是合理的，但七年过去仍没补完核心抽象，已说明 Rust 在这条路径上失去了推进力。

## 评论区两派

### "现状已经够好"派
顶赞（48020849）：用 Tokio 没毛病，smol/async-std/glommio/embassy 多元执行器并存反而健康；把 Tokio 塞进 stdlib 反而会**杀死小众执行器**和影响嵌入式可移植性。这一派认为：选型痛只发生在新人入门和库作者，对实际产品工程师影响小。

### "缺标准抽象就是缺氧"派
另一高赞（48021347, 48021733）：Rust 的合理路径是**仿照 system allocator 模式**——stdlib 提供 trait（spawn / timer / async I/O），可被覆盖；同时 stdlib 提供合理默认执行器，开箱即用。这样既保证生态互操作性，又允许嵌入式、单线程模型替换。这一派把 *Tokio 非锁定* 现状形容为"Java 的 GC 居然是 third-party 的"，难以想象。

### 嵌入式视角的实战回怼
来自 embassy 用户的有力反驳（48023690）：你说"全 Tokio 化"，但当我在 RP2040/ARM-M0 上写 async I/O，代码看起来与桌面端几乎一样，**只是换了 backend**——这恰恰证明 Rust 现在的小内核 + 多 backend 设计是有效的。

### 抽象不可能命题
高质量评论（48023503）解释为什么"统一标准"难做：Tokio 是 work-stealing，要 `Send`；monoio 等单线程执行器不要求 `Send`，能用 `Rc/RefCell`；某些 JS 风格执行器是单线程显式 worker。**任何统一抽象都会强加约束牺牲一部分模型**。Future 之所以是当下唯一的稳定共识，正是因为它"什么都不假设"。

### 核心 Trait 在生态分裂
另一关键吐槽（48021569）：`Stream`/`AsyncRead` 散落在 `tokio`、`futures`、`async-std` 各自版本，导致同一程序里出现多个不兼容的同名类型——这才是当下生态的真痛点。

## Pros / Cons

**Pros（文章立场的合理面）**
- 准确指出生态裂缝：核心 trait 不在 stdlib 是切实痛苦。
- 推动 Rust Project 把标准化推上议程的舆论压力是有价值的。
- 帮新人理解为什么"学了 async 还是处处踩坑"。

**Cons（对立观点的支撑）**
- 标题贬得过头："MVP" 暗示"功能不全"，但 Rust async 已支撑 Cloudflare、Discord、AWS Lambda runtime、Linkerd 等大量生产负载。
- "应有 stdlib 标准"忽视了执行器模型本质差异——并非政治问题而是技术约束。
- Tokio 的事实垄断换来的是**生态稳定**——若每年换默认 runtime，Rust async 还活不到今天。

## 量化研究员视角

对量化/系统工程视角三个洞察：(1) **嵌入式 + 实时金融系统**是 Rust 当下最稳的根据地——embassy/monoio/glommio 三派各自针对不同延迟特性，正在把 Rust async 推向"可调度策略可换"的成熟态，比 Go runtime 提供更细颗粒；(2) Tokio 的"Java GC 化"反而是**生产级稳定性的护城河**——量化基础设施宁愿要一个稳定 backend，也不要标准化带来的 churn；(3) 长尾痛点是 trait 分裂，谁能把 `AsyncRead`/`Stream` 推进 stdlib（很可能 2026 内发生），就拿到 Rust 5.0 时代的话语权。

## 后续观察点

- Rust Project 的 async-foundation working group 路线图是否有重大更新。
- `dyn Trait` for `async fn in trait` 的 RFC 是否在 2026 内稳定。
- 是否会出现"Rust async 标准 trait crate"被官方接管的过渡方案。
