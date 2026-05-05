---
title: "mksglu/context-mode — 用 MCP 把 LLM 上下文压缩到 1/100"
date: "2026-05-05"
generated: "2026-05-05 12:00"
source: "GitHub"
slug: "2026-05-05_12-context-mode"
summary: "- 项目链接: https://github.com/mksglu/context-mode"
---

# mksglu/context-mode — 用 MCP 把 LLM 上下文压缩到 1/100

- 项目链接: https://github.com/mksglu/context-mode
- 时间段新增 stars: +1,929 (this week) | 语言: TypeScript

## 1. 定位与痛点剖析

context-mode 把"上下文窗口管理"做成了一个**MCP server**，覆盖 14 个 AI Coding 平台（Claude Code、Cursor、Codex、Gemini CLI、Cline、Roo Code、Kilo Code、Windsurf、Antigravity 等）。它解决的痛点是用 MCP 工具（尤其是 Playwright、GitHub、log fetcher）会迅速塞爆上下文：一次 Playwright snapshot 56KB，20 个 GitHub issue 59KB，单条 access log 45KB；30 分钟 40% context 蒸发，紧接着触发 compact，模型忘记当前编辑的文件、待办、上一句问题。该仓库把这个问题分成"四面"全面打——非常工程化。

## 2. 核心架构与技术细节

四个机制：
- **Context Saving（沙箱化）**：所有"重输出"工具走 sandbox，原始数据落 SQLite，模型只看到摘要——315KB → 5.4KB（98% 降）；
- **Session Continuity（会话延续）**：每次文件编辑、git 操作、错误、用户决策都进 SQLite 事件流，FTS5 + BM25 索引；compact 后**只检索相关事件回填**，而非整段重写；
- **Think in Code**：把 LLM 当代码生成器而非数据处理器——`ctx_execute("javascript", "...")` 让 agent 写脚本算结果，只 `console.log` 答案；50 文件 700KB 读 → 3.6KB 一脚本；
- **Output Compression**：用一个非常激进的"穴居人语法"系统提示，强制模型砍冠词、礼貌话、铺垫，节省 65-75% 输出 token，但对安全警告/不可逆操作自动展开。

11 个 MCP 工具：6 个沙箱（`ctx_batch_execute`、`ctx_execute`、`ctx_execute_file`、`ctx_index`、`ctx_search`、`ctx_fetch_and_index`）+ 5 个 meta（`ctx_stats`、`ctx_doctor`、`ctx_upgrade`、`ctx_purge`、`ctx_insight`）。Claude Code 是最深集成（plugin marketplace + SessionStart hook 自动注入路由说明 + statusline 显示节省金额）。

## 3. 竞品对比与生态站位

最直接对手是 **rtk**（同周 trending 第 3，Rust 单二进制做 CLI 输出压缩）。两者哲学互补：rtk 在 OS Bash 层做事，无侵入但只覆盖 shell 命令；context-mode 在 MCP 层做事，覆盖更广（Playwright、HTTP fetch、SQL 查询都在沙箱内）但需要 plugin 安装+维护。还有 **memGPT**、**Letta** 这类长期记忆方案，但它们做的是"模型外脑"，不专注 tool 输出压缩。

## 4. 开发者反馈与局限性

正面：HN 讨论（item 47193064）热烈，开发者实测 ctx_stats 显示**单 session 节省数美元**有强烈正反馈；FTS5 + BM25 选型务实，不强引向量检索。
局限：
- **侵入性大**：要装 plugin、要 hook、要 SessionStart 注入——14 平台的安装文档都不一样，bug 面广；
- **Output Compression 风格**："穴居人语法"激进，对面向用户的回答可读性可能下降；
- **Continuity 数据隐私**：本地 SQLite 含每次编辑/错误，需注意敏感项目；
- **Meta-tools 名字冲突**：跟其他 MCP server 的 `ctx_*` 工具有重名风险。

## 5. 附带链接

- 仓库: https://github.com/mksglu/context-mode
- npm: https://www.npmjs.com/package/context-mode
- HN 讨论: https://news.ycombinator.com/item?id=47193064
- Discord: https://discord.gg/DCN9jUgN5v
