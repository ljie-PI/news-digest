---
title: "android-reverse-engineering-skill — Claude Code 的 Android 逆向工程技能"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "GitHub"
slug: "2026-04-25_07-android-reverse-engineering-skill"
summary: "Android 逆向工程长期以来是一项高门槛的手动工作：反编译 APK、在混淆代码中追踪 API 调用、理解认证模式……每一步都需要深厚的工具链知识。该项目"
---

# android-reverse-engineering-skill — Claude Code 的 Android 逆向工程技能

> ⭐ 本周 +2,258 | 作者: SimoneAvogadro | 许可: Apache 2.0

## 1. 定位与痛点

Android 逆向工程长期以来是一项高门槛的手动工作：反编译 APK、在混淆代码中追踪 API 调用、理解认证模式……每一步都需要深厚的工具链知识。该项目将整套逆向流程封装为 Claude Code 技能插件，让开发者只需一句「反编译这个 APK」即可自动完成依赖检查、反编译、结构分析和 API 端点提取。

## 2. 核心架构

项目分为五个阶段的工作流（SKILL.md 定义）：

- **依赖检查**：自动检测 jadx、Vineflower/Fernflower、dex2jar 等工具是否安装，缺失则自动安装
- **反编译引擎**：支持 jadx（默认）和 Fernflower/Vineflower，可单引擎或双引擎对比输出
- **格式支持**：APK、XAPK（自动解包内部多个 APK）、JAR、AAR
- **API 提取**：自动扫描 Retrofit 端点、OkHttp 调用、硬编码 URL、认证头/Token 模式
- **调用流追踪**：从 Activity/Fragment 沿 ViewModel → Repository → HTTP 调用链路追踪

脚本可独立使用（bash 命令行），也可通过 Claude Code Plugin 系统全局安装。项目结构清晰，scripts/ 目录存放可执行脚本，references/ 存放各工具使用指南。

## 3. 竞品对比

传统 Android 逆向依赖 jadx-gui（图形界面）、Ghidra、JEB 等重型工具，学习曲线陡峭。该项目的差异化在于**AI 驱动的自动化流程**——不需要手动在反编译结果中搜索，Claude Code 会智能理解代码结构并提取关键信息。与 apktool 相比侧重点不同：apktool 主要处理资源文件，该项目聚焦 Java/Kotlin 源码和 API 提取。

## 4. 开发者反馈

项目是 Claude Code 技能生态的早期实践，展示了 Skill 系统在非编码领域（安全研究）的应用潜力。README 明确声明了合法使用边界（安全研究、互操作性分析、恶意软件分析、教育用途），体现了对法律合规的重视。对于处理 ProGuard/R8 混淆代码也有专门的策略指引。

## 5. 相关链接

- GitHub: https://github.com/SimoneAvogadro/android-reverse-engineering-skill
- jadx: https://github.com/skylot/jadx
- Vineflower: https://github.com/Vineflower/vineflower
