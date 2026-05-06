---
title: "Roxum — 安卓上的开源 Lua IDE"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "Reddit"
slug: "2026-05-06_06-roxum-lua-ide"
summary: "solo 学生开发者 NoBeginning2551 在 r/lua 发布 Roxum——一款开源 Android Lua IDE，集成 EmmyLua LSP、Git/GitHub、245 个主题。2 年开发周期，强调\"不是 vibe coded 出来的"
---

# Roxum — 安卓上的开源 Lua IDE

## 事件背景

solo 学生开发者 NoBeginning2551 在 r/lua 发布 Roxum——一款开源 Android Lua IDE，集成 EmmyLua LSP、Git/GitHub、245 个主题。2 年开发周期，强调"不是 vibe coded 出来的玩具"，让它在以"AI 一键生成 IDE"泛滥的当下显得格外稀缺，从而冲上板块当日榜首。

## 核心机制 / 产品

技术细节：(1) 编辑器内核基于 CodeEditor + Lua TextMate grammar；(2) 集成 EmmyLua LSP server，支持悬停、跳转、重命名；(3) 内置 Git client（jgit）+ GitHub OAuth；(4) 245 个主题是从 VS Code 主题库转译；(5) 已上 Play Store，源码 MIT 在 GitHub。目标用户是 Lua 学生、Roblox / Defold / OpenResty 开发者，需要在 Android 平板/手机上写脚本的人。

## 社区热议与争议点

正面：r/lua 用户欣喜"终于有一个不水的移动端 Lua IDE"，对 LSP 集成度、主题数、独立完成 2 年这件事尤为赞许，许多 Roblox / Pico-8 玩家立即下载试用。质疑：(1) Lua 在移动端 IDE 的市场需求真有多大？OP 承认主要是兴趣项目；(2) Play Store 收费策略不清；(3) 没有说明对 LuaJIT 5.1 与 Lua 5.4 语法的兼容差异处理；(4) 245 主题里很多是 VS Code 直接 port，颜色在小屏上对比度堪忧。

## 行业影响与未来展望

Roxum 是一个 anti-vibe 信号：在"AI 写一切"潮流中，社区依然珍视"2 年单刷做成的工具"。对开源生态而言，独立开发者用单一平台精耕的产品仍会获得高品质用户和长期声誉。Lua 的移动场景（Roblox、Defold、Love2D-android）也因这类工具被进一步激活。

## 链接

- 原帖：https://www.reddit.com/r/lua/comments/1t4kzlf/
- GitHub：https://github.com/heckmon/roxum-ide

