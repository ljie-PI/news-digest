---
title: "microsoft/edit"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-microsoft-edit"
summary: "- **Description:** We all edit."
---

# microsoft/edit

- **Description:** We all edit.
- **Stars:** 14,037 ⭐ (今日 +51)
- **Language:** Rust

## 定位与痛点

`microsoft/edit` 是微软用 Rust 重写的现代版 MS-DOS Editor，在终端里提供一个**轻量、TUI、零学习成本**的纯文本编辑器。痛点很具体：vim/emacs 学习曲线陡，nano 又过于简陋，对终端不熟的用户（尤其 Windows、运维、教学场景）几乎没有一个「打开就会用」的命令行编辑器。Edit 重新拾起当年 MS-DOS Editor 的精神，但保留 VS Code 风格的菜单与快捷键（Ctrl+S/Ctrl+F/鼠标选择），让从未碰过模态编辑器的人也能立刻上手；Windows 下已通过 `winget install Microsoft.Edit` 一行装好，并打算作为 Windows 默认 CLI 编辑器分发。

## 架构与技术

代码库 100% Rust，bin 名 `edit`/`msedit`。可选依赖 ICU（icuuc / icui18n）支持 Search & Replace 的 Unicode 处理；通过 `EDIT_CFG_ICUUC_SONAME` / `EDIT_CFG_ICUI18N_SONAME` / `EDIT_CFG_ICU_RENAMING_VERSION` 等环境变量给发行版打包者灵活适配不同版本的 ICU。构建支持 stable Rust（设置 `RUSTC_BOOTSTRAP=1` 可获得最佳体积/性能）。i18n 走 `i18n/edit.toml`，编译期可裁剪语言。Linux 提供 `install.sh` 脚本，从 GitHub Releases 拉预编译产物到 `~/.local/bin`。

## 竞品

终端编辑器赛道：nano（最接近的 UX 竞品）、micro（同样 modeless、Go 写）、kakoune、helix、neovim、emacs。Edit 的差异化：Rust 实现 + 极轻量 + 微软官方维护 + Windows 一等公民 + VS Code 风格快捷键。相比 micro，Edit 更追求「DOS Editor 的克制 + 现代字体/渲染」，没有插件生态野心。

## 反馈与局限

发布以来在 r/programming、HN 上讨论度高，被视为「Windows 终端体验回归」的一环。当前局限：功能相对克制（无插件系统、无 LSP）、生态早期、Linux 包源覆盖不全（README 里 Repology 表格说明仍在铺）；ICU 配置对 Linux 打包者不算友好，需要逐发行版调参；高级用户仍会回到 vim/helix。今日 +51 stars 显示持续被关注。

## 链接

- 仓库：https://github.com/microsoft/edit
- Releases：https://github.com/microsoft/edit/releases/latest
- 安装脚本：https://raw.githubusercontent.com/microsoft/edit/main/assets/install.sh
