---
title: "七种编程\"元语言\"——重新审视编程语言的本质分类"
date: "2026-04-20"
generated: "2026-04-20 08:00"
source: "HN"
slug: "2026-04-20_08-the-seven-programming-ur-languages-2022"
summary: "2022年由 madhadron（Fred Ross）撰写的博文《The Seven Programming Ur-Languages》近日重新登上 Hacker News 热榜，获得 272 点赞和 102 条评论。文章提出了一个独特的编"
---

# 七种编程"元语言"——重新审视编程语言的本质分类

## 1. 事件背景

2022年由 madhadron（Fred Ross）撰写的博文《The Seven Programming Ur-Languages》近日重新登上 Hacker News 热榜，获得 272 点赞和 102 条评论。文章提出了一个独特的编程语言分类框架：与其纠结于"学 Java 还是 Python"，不如理解所有编程语言背后的七种"元语言"（ur-languages）——它们代表了根本不同的思维模式和编程范式。

## 2. 核心观点

作者将现存编程语言追溯到七种"元语言"，以古生物学中"模式标本"的方式命名：

- **ALGOL**：赋值、条件、循环组成的顺序编程，几乎所有主流语言（C、Java、Python、JavaScript）都属此类
- **Lisp**：以括号表达式和宏系统为核心，代码即数据，程序员可重定义语言语义（Common Lisp、Scheme、Clojure）
- **ML**：函数作为一等公民 + Hindley-Milner 类型系统，一切迭代通过递归完成（Haskell、OCaml、Standard ML）
- **Self**：基于原型和消息传递的面向对象编程，源自 Smalltalk 思想（Self、Smalltalk、Ruby）
- **Forth**：基于栈的拼接式语言，程序由词（word）的组合构成
- **APL**：面向数组的符号语言，代码片段本身即是行为的标签
- **Prolog**：逻辑编程，通过声明规则和事实让系统自行推导

作者的关键洞察是：在同一元语言家族内切换语言很容易（如从 Java 到 Python），但跨元语言学习则需要建立全新的"神经通路"。这解释了为什么许多程序员觉得 Haskell 或 Prolog "难学"——它们不只是新语法，而是完全不同的思维方式。

## 3. 社区热议

Hacker News 讨论中出现了多个高质量的争论方向：

**关于 Ruby 的分类归属：** 一位用户指出文章将 Ruby 归入 ALGOL 族是不准确的——"Ruby is object oriented from the ground up. Everything (and I do mean everything) is an object, and method call is conceived as passing messages to objects." 该用户认为 Ruby 的灵感来自 Smalltalk，应归入 Self 族，并形象地将 Ruby 比作"温顺的羊驼"，而 Python 是"会吐口水的骆驼"。

**关于 Python 的 OOP 本质：** 有用户反驳称 Python 引入新式类后也成了纯 OOP 语言，展示了 `type(42)` 返回 `<class 'int'>` 来证明。但用户 **对此提出质疑**，认为 OOP 的定义本身就很模糊——"I program in Python regularly, but don't program in an OOP style; I use dataclasses and enums as the basis, in a way similar to Rust"，即语言支持 OOP 不等于必须以 OOP 风格编程。

**关于定理证明语言是否应单独成类：** 用户提议 Lean 等基于 Curry-Howard 对应的证明语言应成为第八种元语言。随后引发了关于 Agda、Idris、Lean 本质的深入技术讨论。有用户指出定理证明需要"全体性"（totality），即基础语言不能是图灵完备的，这与普通函数式语言有本质区别。但也有人反驳称 Idris "absolutely is a general-purpose functional language in the ML family"，只是增加了依赖类型。

**关于 OO 是否算独立元语言：** 用户认为将"面向对象"作为独立元语言类别容易造成混淆——"OO is just a style of programming in the same way that procedural is"，就像德里和拉斯维加斯都很热，但不代表它们是同类城市。

## 4. 行业影响

这篇文章虽写于 2022 年，但在 2026 年重新获得关注有其深层原因：

- **AI 编程时代的反思**：当 AI 能自动生成代码时，理解编程范式的根本差异比掌握具体语法更加重要
- **多范式融合趋势**：现代语言（Rust、Kotlin、Swift）越来越多地混合多种元语言的特性，理解"源头"有助于理解这些混合设计的取舍
- **教育价值**：该分类框架为编程教育提供了清晰的"学习路线图"——学过 ALGOL 族的程序员应该有意识地去接触 ML、Lisp 或 Prolog，以拓展思维边界
- **定理证明语言的崛起**：社区讨论中对 Lean 等语言的热烈讨论反映了形式化验证在工业界日益增长的重要性

## 5. 相关链接

- 📄 原文：[The Seven Programming Ur-Languages](https://madhadron.com/programming/seven_ur_languages.html)
- 💬 HN 讨论：[Hacker News](https://news.ycombinator.com/item?id=47822486)
- 🔗 相关讨论中提到的资源：
  - [Lean 作为通用编程语言](https://kirancodes.me/posts/log-ocaml-to-lean.html)
  - [Rust trait 求解与逻辑编程](https://rustc-dev-guide.rust-lang.org/traits/chalk.html)
