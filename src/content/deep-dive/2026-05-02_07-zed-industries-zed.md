---
title: "zed-industries/zed"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-zed-industries-zed"
summary: "- ⭐ Stars: 81146 (今日 +338)"
---

# zed-industries/zed

> Code at the speed of thought – Zed is a high-performance, multiplayer code editor from the creators of Atom and Tree-sitter.

- ⭐ Stars: 81146 (今日 +338)
- 💻 Language: Rust
- 🔗 https://github.com/zed-industries/zed

## 定位与痛点

Zed 是 Atom/Tree-sitter 原班团队（Nathan Sobo 等）打造的下一代代码编辑器，定位是**"思维速度的协作 IDE"**——直接挑战 VS Code 的霸主地位。痛点抓得很准：VS Code 基于 Electron，启动慢、键入延迟大、占内存高，而其 AI 化又使插件层愈发拥挤；JetBrains 系列重型而封闭。Zed 把延迟压到 GPU 帧级、内存占用降到 VS Code 的几分之一，并把"实时多人协作 (multiplayer)"做成原生能力，再叠加 Agentic AI 编程界面，瞄准的是从初创到资深工程师的全谱用户。

## 架构与技术

Zed 完全用 **Rust** 实现，自研 GPU 加速 UI 框架 GPUI（Metal/Vulkan/DirectX），文本缓冲使用 rope+CRDT 支持协作编辑，语法层基于 Tree-sitter，LSP 直连。Agent 模式集成 Claude / GPT / Gemini / 本地 OpenAI 兼容模型，支持 ACP (Agent Client Protocol) 与外部 agent (Codex、Claude Code) 对接，并内置 edit prediction（自训练 Zeta 模型）。后端用 Rust + Postgres 跑协作和 LLM 路由，Linux/macOS 已稳定，Windows 在持续 alpha。

## 竞品对比

VS Code/Cursor 是头号对手：Cursor 借 VS Code fork 在 AI 体验占先发，但仍受 Electron 与 fork 维护拖累；Zed 的差异是原生性能 + 自有协议栈 (ACP)。其他对手 Helix（同 Rust，但 TUI、单人）、Lapce（同 Rust，社区驱动）、Fleet（JetBrains，闭源）。Zed 的 multiplayer 仍是独家能力——pair programming、跨地理调试是杀手锏。

## 反馈与局限

社区反馈两极：拥趸喜欢丝滑响应、AI 体验和 Vim 模式；批评集中在 Windows 缺位、扩展生态远不及 VS Code、远程开发体验弱、AI 订阅费用透明度。开源协议 GPL-3 使得商业插件生态较保守。今日 +338 stars 主要驱动是近期 ACP 协议公开化、与多个 coding agent 厂商的整合公告，以及若干 hackernews/技术博客对比文章。

## 链接

- Repo: https://github.com/zed-industries/zed
- Site: https://zed.dev
- Blog: https://zed.dev/blog
- ACP: https://agentclientprotocol.com
