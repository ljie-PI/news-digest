---
title: "Portable Async Rust：抽象作为标准化的补充"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "Reddit"
slug: "2026-05-06_06-portable-async-rust"
summary: "OP 是技术战略顾问，长期为 R&D 团队做选型咨询，他在 r/rust 撰文讨论一个看似哲学却影响 ecosystem 的问题：Async Rust 应当通过\"语言层面标准化\"还是\"抽象"
---

# Portable Async Rust：抽象作为标准化的补充

## 事件背景

OP 是技术战略顾问，长期为 R&D 团队做选型咨询，他在 r/rust 撰文讨论一个看似哲学却影响 ecosystem 的问题：Async Rust 应当通过"语言层面标准化"还是"抽象层"获得可移植性。文章把 Rust 当下 async runtime 碎片化（Tokio / async-std / smol / monoio / glommio）和厂商锁定焦虑关联起来，引发广泛讨论。

## 核心观点

OP 主张：标准化（如 std 增加 async fn in trait、AsyncRead、AsyncWrite）是必要但不充分；现实中可移植 async Rust 仍依赖**抽象层**——他举出三类有意义的抽象：(1) **runtime 适配**层（如 agnostic / smol-hyper / async-trait-layer）；(2) **execution model 抽象**——Tokio 多线程 vs glommio thread-per-core 在性能模型上完全不同，应用应面向 trait 编程；(3) **异步生态隔离层**，让业务代码不直接 import tokio::time，而是经过自家 prelude。OP 反思自己过去反对"抽象"，但在 async Rust 这个特定问题上，抽象其实是免被 runtime 绑架的唯一防线。

## 社区热议与争议点

正方：多名 Rust 老兵认同 Tokio 事实垄断本身就是技术风险，"标准化要五年，但抽象现在就能写"。反方：(1) 抽象层每加一层都损失 inlining，async Rust 已经 clousure 多得难调试，再封装会让 stack trace 进一步崩塌；(2) tokio 不是恶意垄断，而是工程优势自然结果，"抽象"未必能产出真正可移植代码——大多数尝试最后还是绑了 Tokio；(3) std 已在推进 trait 中的 async fn、AsyncDrop 等，标准化进度其实在加速。也有评论指出 monoio / glommio 在 io_uring 上的优势会迫使 ecosystem 长期分化，标准化短期内不现实。

## 行业影响与未来展望

讨论强化了一个共识：Rust async 生态中期会是"std + 多 runtime + 厂商无关抽象库"三层结构，而非"std + 一统 runtime"。对企业用户的实际指导是：今天就把代码组织成"业务层无 runtime 直接依赖"。

## 链接

- 原帖：https://www.reddit.com/r/rust/comments/1t4oo77/

