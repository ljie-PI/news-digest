---
title: "Bugs Rust won't catch"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-bugs-rust-wont-catch"
summary: "**Score:** 659 points · 359 comments"
---

# Bugs Rust won't catch

**Score:** 659 points · 359 comments
**Link:** https://corrode.dev/blog/bugs-rust-wont-catch/
**HN Discussion:** https://news.ycombinator.com/item?id=47943499

## 事件背景
Matthias Endler（corrode 咨询公司）发布长文《Bugs Rust won't catch》，是给从 C++/Go 转 Rust 的工程师的一份"清醒剂"。文中把"Rust 安全"语义拆开：内存安全 ≠ 整体正确性。文章在 4 月 29 日登 HN 首页，与"Rust 是否过度被推崇"的长期讨论再次合流。

## 核心观点
作者列出 Rust 类型系统/借用检查无法覆盖的典型 bug 类别：(1) 业务逻辑错误（货币四舍五入、单位混淆——Mars Climate Orbiter 类）；(2) 浮点比较与 NaN 传播；(3) 时间区/夏令时；(4) 数据库事务不正确隔离级别；(5) 异步任务取消语义；(6) 资源泄漏（连接池、文件句柄循环引用）；(7) 安全侧的逻辑漏洞（IDOR、TOCTOU）。文章给出每种 bug 的 Rust 代码示例，说明类型系统帮不到，并推荐使用 newtype、proptest、tokio-console、loom 等工具弥补。

## 社区热议
HN 评论分三层：第一层是"原文是对 Rust 公平的评价"——绝大多数 Rust 用户表示同意，并补充"async cancellation safety"是最大坑；第二层是 C++/Go 派的反讽："欢迎来到现实"，强调 Rust 的不安全和复杂度溢出；第三层是更深的讨论——"是否有更上一层的语言能在 type level 表达业务约束"，提到 Lean、Idris、Liquid Haskell。也有评论指出文章本可加一节"Rust 难表达的高级 invariants"。

## 行业影响
对一线团队的实际影响：(a) 招聘 Rust 工程师不能只看是否会过 borrow checker，而要考察 newtype/property test 习惯；(b) 写关键业务的 Rust 库越来越多依赖 proptest/cargo-mutants/loom 形成第二层防线；(c) 这类教育内容的兴起（continued by Jon Gjengset 视频）将让 Rust 社区更接近"工程师文化"而非"语言信仰文化"。

## 链接
- 原文：https://corrode.dev/blog/bugs-rust-wont-catch/
- HN 讨论：https://news.ycombinator.com/item?id=47943499
