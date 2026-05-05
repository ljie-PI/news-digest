---
title: "Mentra-Community/MentraOS"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-mentra-community-mentraos"
summary: "- **Description:** MentraOS is the leading smart glasses platform + SDK. Stream your view, transcribe audio, talk to AI and capture photos hands-free on compatible glasses."
---

# Mentra-Community/MentraOS

- **Description:** MentraOS is the leading smart glasses platform + SDK. Stream your view, transcribe audio, talk to AI and capture photos hands-free on compatible glasses.
- **Stars:** 1,925 ⭐ (今日 +14)
- **Language:** C

## 定位与痛点

MentraOS 自称「智能眼镜领域的开源操作系统 + SDK」，由 Mentra Labs 与社区维护，前身是 TeamOpenSmartGlasses 的 DiscussPlusPlus 项目。痛点：当前智能眼镜（Even Realities G1、Mentra Mach 1、Mentra Live 等）硬件碎片化严重，每家厂商各自有 SDK 和配对协议，开发者要为每副眼镜各做一遍 app；用户也缺乏统一的应用商店和体验。MentraOS 把配对、连接、数据流（视频流、麦克风、摄像头、扬声器、显示）统一抽象成一套 TypeScript SDK，让开发者「写一次跑在所有兼容眼镜上」，并提供 Mentra Store 做分发。

## 架构与技术

仓库主语言标注 C，实际是个**多端工程**：包含 `mobile/`（React Native + TypeScript 移动端，支持 iOS / Android，用 bun 包管）、`cloud/`（云后端，Docker Compose 起本地开发环境）、以及 ASG client（Android Smart Glasses 客户端 APK）。眼镜端涉及 BLE 配对、音频上行转写、视频流推送、摄像头拍照、屏幕显示控制等系统级能力。已上架 App Store / Google Play，并提供 nightly APK。开发者控制台在 console.mentra.glass，应用市场在 apps.mentra.glass，已经有 Live Captions、Translation、Calendar、Notes、Dash、Link、Merge 等真实在用的应用。MIT 许可证，组件 100% 开源。

## 竞品

直接竞品：Meta Ray-Ban Meta（封闭）、Even Realities 自家 SDK、XReal Nebula、Brilliant Labs Frame（也走开源路线）、Snap Spectacles SDK。MentraOS 的差异：跨硬件兼容 + TS SDK 上手快 + 完整商店生态 + 完全 MIT 开源。比起 Brilliant Labs 更聚焦「OS + 商店」而非单款硬件。

## 反馈与局限

定位前沿、被视作智能眼镜「Android」的候选之一，社区在 Discord 活跃。局限：兼容硬件清单仍很短（G1 / Mach 1 / Mentra Live），主要绑定 Mentra 自家硬件；Windows 开发已知有问题，推荐 macOS / Linux；项目品牌从 AugmentOS / OpenSmartGlasses 多次改名，仓库内仍能看到老 badge URL；规模相对早期（1.9k stars），离真正的「智能眼镜 Android」仍有距离。

## 链接

- 仓库：https://github.com/Mentra-Community/MentraOS
- 官网：https://mentra.glass
- 文档：https://docs.mentra.glass
- 开发者控制台：https://console.mentra.glass
