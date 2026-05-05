---
title: "Aube：mise 作者的新 Node 包管理器，比 pnpm 快 4.6×"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "Reddit"
slug: "2026-05-05_11-aube-fast-nodejs-package-manager"
summary: "Aube（读作 \"ohb\"，法语\"黎明\"）由 mise（前身 rtx，运行时版本管理器）作者 jdx 发布。Node 包管理器赛道近年异常热闹：npm 慢、yarn 维护节奏慢、pnpm 用 hard"
---

# Aube：mise 作者的新 Node 包管理器，比 pnpm 快 4.6×

## 事件背景
Aube（读作 "ohb"，法语"黎明"）由 mise（前身 rtx，运行时版本管理器）作者 jdx 发布。Node 包管理器赛道近年异常热闹：npm 慢、yarn 维护节奏慢、pnpm 用 hardlink 解决磁盘空间但仍受限于 Node 解析逻辑，bun 把整个 runtime + 包管理器 + bundler 统一打包。Aube 的定位则是"只做包管理，但用 Rust 写到极致快"，强调可以零迁移 drop-in 到现有 JS/TS 项目，不需要改 lockfile。

## 核心机制
官网首页广告语是 4.6× faster than pnpm，2.6× faster than bun。设计上：(1) Rust 实现，重度并发下载与解压；(2) 全局 content-addressed store（类 pnpm），项目里只放符号链接；(3) 据宣称比 npm 节省 90% 磁盘——三个共用 React/Vite/TS/Playwright 的 app 共享同一份依赖；(4) 与 mise 深度集成，`mise use aube` 一键启用。它选择 不绑定 runtime（不像 bun 是个 runtime），以兼容 Node、Deno 用户。

## 社区热议与争议
r/rust 评论区基本"喜大普奔"，但争议明显：(1) 又一个 RIIR 项目 — 有人嘲讽"Yet Another Node PM"，质疑长期维护；(2) 与 bun install 的对比 — bun install 已经是事实最快，2.6× 听上去激进，社区在等独立 benchmark；(3) lockfile 兼容性 — 是否真的能无痛接入大型 monorepo（pnpm workspaces、turbo）尚未实测；(4) 安全与 supply chain — 全局 store 出现恶意包污染所有项目的风险更高，Aube 当前对签名/审计的回应较少。

## 行业影响
Node 包管理器战局正在从"功能竞赛"切到"启动速度+磁盘+CI 缓存"维度，CI 时间是大公司真金白银。若 Aube 性能宣称在真实项目上落地，pnpm 可能受冲击最大；bun 因绑定 runtime 反而护城河更深。从大趋势看，JS 工具链 Rust 化是不可逆的（swc、turbopack、oxc、biome、aube），mise 派开发者影响力上升。

## 链接
- 原帖：https://www.reddit.com/r/rust/comments/1t3qf00/aube_a_fast_nodejs_package_manager_from_the/
- 官网：https://aube.en.dev/
