---
title: "到底什么在\"真正\"使用Rust？一篇全面盘点"
date: "2026-04-21"
generated: "2026-04-21 07:00"
source: "Reddit"
slug: "2026-04-21_07-10-what-actually-uses-rust"
summary: "2026年4月21日，r/rust 社区分享了一篇博客文章《Ok, what ACTUALLY uses Rust?》，全面盘点了在生产环境中真正使用Rust的项目和公司。这篇文章发布在 blog.goose.l"
---

# 到底什么在"真正"使用Rust？一篇全面盘点

## 1. 事件背景

2026年4月21日，r/rust 社区分享了一篇博客文章《Ok, what ACTUALLY uses Rust?》，全面盘点了在生产环境中真正使用Rust的项目和公司。这篇文章发布在 blog.goose.love 上，由作者 blyxyas 撰写，旨在回应"Rust到底有没有人用"这一常见疑问，用事实和证据展示Rust在2026年的实际采用状况。

Rust自2015年发布1.0以来，已经走过了十年的发展历程。从最初被视为"学术语言"到如今被Linux内核、Windows、Chromium等重量级项目采纳，Rust的增长轨迹令人瞩目。这篇文章是对这一历程的阶段性总结。

## 2. 核心观点/产品机制

根据博客文章内容，Rust的实际采用涵盖以下关键领域：

**操作系统与基础设施**：
- Linux内核自6.1起使用Rust，6.19后稳定化；Windows 11包含Rust组件
- Ubuntu采用uutils（Rust重写的Coreutils）替代GNU核心工具

**浏览器与网络**：
- Chromium集成Rust；Cloudflare使用Rust构建Pingora
- Brave浏览器用Rust重写广告拦截引擎，内存消耗降低75%

**大公司采纳**：
- Discord从Go迁移到Rust；AWS使用Firecracker（Rust编写的虚拟化引擎）
- Apple在云基础设施中使用Rust；Dropbox用Rust重写同步引擎
- Microsoft CTO推荐Rust替代C/C++

**开发工具**：
- Deno（Rust编写的JavaScript运行时）、Tauri（Electron替代品）
- ruff（Python最快的linter）、Typst（LaTeX替代品）、Zed编辑器
- ripgrep（grep的10倍速替代品，60K+ GitHub stars）

**政策推动**：
- 美国NSA推荐Rust用于内存安全；白宫敦促开发者转向Rust
- NIST将Rust列为更安全的编码工具

## 3. 社区热议与争议点

这篇文章在Rust社区中引发了广泛的讨论和转发。支持者认为它有力地回应了"Rust只是炒作"的质疑，展示了Rust已经深入到从操作系统内核到用户应用的各个层面。

然而也存在一些争论：有人认为列表中某些项目只是"在部分组件中使用Rust"而非"用Rust编写"，夸大了Rust的采用程度；一些人指出许多传统行业（金融、医疗、制造等）仍然以Java、C#、C++为主，Rust的实际市场份额仍然很小。此外，"大公司使用"和"适合大多数团队使用"之间存在差距——大公司有资源投入学习曲线，小团队可能没有。

## 4. 行业影响与未来展望

这篇盘点文章清晰地展示了Rust已经从实验性语言成长为生产级基础设施语言。随着内存安全法规的推进（如白宫和NSA的推荐）、Linux内核Rust支持的深化、以及越来越多的企业案例积累，Rust的采用将继续加速。到2028年，Rust很可能成为系统编程领域的默认选择之一，在Web后端和通用应用开发中也将占据更大份额。

## 5. 附带链接

- Reddit 原帖：https://www.reddit.com/r/rust/comments/1sqyjxa/blog_ok_what_actually_uses_rust/
- 博客文章：https://blog.goose.love/posts/what-actually-uses-rust/
