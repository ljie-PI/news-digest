---
title: "ghostty-org/ghostty"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-ghostty-org-ghostty"
summary: "- **Description:** 👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration."
---

# ghostty-org/ghostty

- **Description:** 👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.
- **Stars:** 53,169 ⭐ (今日 +584)
- **Language:** Zig

## 定位与痛点

Ghostty 是 HashiCorp 创始人 Mitchell Hashimoto 主导的跨平台终端模拟器，目标是同时拿下「**速度、特性、原生 UI**」这三点——而现存终端往往只能在三者中二选一：Alacritty/WezTerm 快但 UI 单薄；iTerm2/Terminal.app 体验好但慢；Kitty 特性强但 GUI 不够 native。Ghostty 想做「在每个平台上都让人觉得这是为本平台量身打造」的终端，今日 +584 stars 直接登顶趋势榜，热度持续溢出。

## 架构与技术

核心用 Zig 编写，渲染线程在 macOS 走 Metal，在 Linux 走 OpenGL，每个终端拥有独立的 read/write/render 线程；解析器用 SIMD 指令加速 VT 序列处理。macOS 版是真正的 SwiftUI 应用，集成 AppleScript / Apple Shortcuts (AppIntents)，字体走 CoreText；Linux 版基于 GTK，与 systemd 深度集成（cgroup 隔离、单实例多窗口、always-on）。功能上支持 Kitty graphics/image 协议、剪贴板序列、同步渲染、light/dark 模式通知等现代序列，并完成了对 xterm 的全面合规审计。还分拆出零依赖的 C/Zig 库 `libghostty`（已落地 `libghostty-vt`，可在 macOS/Linux/Windows/WebAssembly 上嵌入终端能力），配套示例项目 Ghostling。

## 竞品

Alacritty（Rust，性能基准但功能少）、WezTerm（Rust + Lua，多功能但渲染较重）、Kitty（Python+C，特性强、UI 偏自绘）、iTerm2（macOS 老牌，但慢）、Apple Terminal.app、Windows Terminal、foot（Wayland）。差异化：Ghostty 同档次性能 + 真正的原生 UI + Kitty 级现代序列 + 可嵌入的 libghostty 库。

## 反馈与局限

发布后口碑极佳，被反复评为 2024–2025 年最受期待的开发者工具之一，已被「数百万用户和机器」日常使用。局限：暂无 Windows 原生 GUI（Linux 用 GTK，Windows 仅 libghostty 可用）；Zig 语言生态小、贡献门槛偏高；尚未实现路线图最后一项「Ghostty 专属控制序列」（团队明确表示要避免生态碎片化，所以这一步刻意推后）；libghostty API 仍在变动，没打 stable tag。

## 链接

- 仓库：https://github.com/ghostty-org/ghostty
- 官网：https://ghostty.org
- 文档：https://ghostty.org/docs
- 下载：https://ghostty.org/download
- libghostty 文档：https://libghostty.tip.ghostty.org/
