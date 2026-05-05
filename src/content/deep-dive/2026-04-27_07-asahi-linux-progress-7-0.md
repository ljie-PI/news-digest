---
title: "Asahi Linux 进展报告：Linux 7.0"
date: "2026-04-27"
generated: "2026-04-27 07:00"
source: "HN"
slug: "2026-04-27_07-asahi-linux-progress-7-0"
summary: "经过将近三年的 6.x 系列内核开发，Linux 7.0 终于发布，Asahi Linux 团队也随之发布了最新进展报告。Asahi Linux 是一个致力于将 Linux 移植到 Apple Silicon Mac 上"
---

# Asahi Linux 进展报告：Linux 7.0

> HN 热度：580 点 | 267 条评论

## 事件背景

经过将近三年的 6.x 系列内核开发，Linux 7.0 终于发布，Asahi Linux 团队也随之发布了最新进展报告。Asahi Linux 是一个致力于将 Linux 移植到 Apple Silicon Mac 上的开源项目，一直以来在逆向工程和驱动开发方面做出了令人瞩目的贡献。本次报告涵盖了安装器自动化改进、环境光传感器（ALS）支持、能耗优化，以及一项令人惊喜的音频芯片发现。

## 核心观点

1. **安装器全面自动化**：Asahi Installer 此前已两年未更新（上次标签是 2024 年 6 月），因为发布流程极其繁琐且需要 CDN 管理权限。团队将镜像清单移至独立 GitHub 仓库，并通过 GitHub Workflows 实现自动构建和部署，彻底解决了安装器版本滞后问题。最新版 0.8.0 还新增了 Mac Pro 支持和固件更新模式。

2. **环境光传感器（ALS）驱动**：Apple 设备的 True Tone 显示功能依赖 ALS 通过 AOP（Always-On Processor）获取环境亮度和色彩数据。chaos_princess 开发了 AOP+ALS 驱动，并实现了校准固件的自动更新机制，用户只需重新运行 Asahi Installer 即可完成固件升级。

3. **音频采样率突破**：团队发现 macOS 仅将 CS42L84 音频编解码器编程为 48 kHz 和 96 kHz 运行，但通过对比 CS42L42 数据手册中的寄存器值，成功启用了 44.1、88.2、176.4 和 192 kHz 等额外采样率支持，补丁已合并至上游 7.1 内核。

4. **能耗优化**：针对 Pro/Max/Ultra SoC 设备的空闲能耗问题持续改进，这些芯片的电源管理架构极其复杂。

## 社区热议

1. HN 用户对音频芯片的逆向工程表示赞赏，有人评论道："Nice bit of chip sleuthing and reverse engineering from the Asahi team!" 并引用了原文中关于从 CS42L42 数据手册"借用"采样率参数的精彩发现。

2. 关于为何 Apple 自身不支持更多采样率，社区展开了热烈讨论。一位用户指出："The Asahi team thinks that only supporting 48 or 96 kHz wastes battery life by forcing the software to resample audio streams. But why does Apple still do this?" 另一位用户回应认为这很可能只是一个优先级不高的 P2 bug："They do know about it and have a 5000 other things to do, and it never gets fixed."

3. 有用户好奇 Apple 工程师对 Asahi 项目的看法，提问"do we ever get apple engineers rolling thru here or on mastodon?"，得到的回答是 Apple 文化极度保密，员工被合同禁止分享工作细节。

4. Linux 音频子系统的历史也引发了一波怀旧讨论——从早期 ALSA 独占硬件、PulseAudio 的出现到如今 PipeWire 的流行，多位用户分享了各自的经历和观点。

## 行业影响

Asahi Linux 项目持续证明了开源社区在逆向工程专有硬件方面的强大能力。安装器自动化的完成标志着项目进入更加成熟和可持续的开发模式，降低了第三方发行版的维护门槛。音频采样率的发现不仅提升了用户体验，也暴露了即使是 Apple 这样的大厂也可能在细节上存在疏忽。随着 Linux 7.0 的发布和 Apple Silicon 支持的日趋完善，Asahi Linux 正在成为 Mac 用户选择 Linux 桌面的可行方案。

## 相关链接

- 原文：https://asahilinux.org/2026/04/progress-report-7-0/
- HN 讨论：https://news.ycombinator.com/item?id=47909226
- Asahi Installer 仓库：https://github.com/AsahiLinux/asahi-installer
- Asahi Installer Data 仓库：https://github.com/AsahiLinux/asahi-installer-data
