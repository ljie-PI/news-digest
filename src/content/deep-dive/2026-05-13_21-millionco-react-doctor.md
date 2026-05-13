---
title: "millionco-react-doctor"
date: "2026-05-13"
generated: "2026-05-13 21:00"
source: "GitHub"
slug: "2026-05-13_21-millionco-react-doctor"
---

---
title: "millionco/react-doctor — 深度解读"
date: "2026-05-13"
generated: "2026-05-13 21:00"
source: "GitHub"
slug: "deep-github-millionco-react-doctor"
---

## 项目概览

`millionco/react-doctor` 是 Million.dev 团队推出的一款专门面向 React 代码库的"健康体检"工具，凭借一句犀利的口号 **"Your agent writes bad React. This catches it"**（你的 AI 智能体写了烂 React，这工具能抓出来），在短时间内冲到约 9k Stars。它的定位非常清晰：在 AI 编码代理（Claude Code、Cursor、Codex、OpenCode 等 50+ 工具）大量生成 React 代码的时代，传统 ESLint 规则远远不够，需要一个专门识别"AI 反模式"的诊断器。

## 核心能力

只需一行命令即可完成全量扫描：

```bash
npx -y react-doctor@latest .
```

输出是一个 **0–100 的健康分数** 加上详细诊断报告，分数划分为三档：75+ 优秀、50–74 待改进、<50 危急。诊断覆盖六大类：**state 与 effects、性能、架构、安全、可访问性、死代码**。规则会根据当前框架（Next.js、Vite、React Native、TanStack Start/Query）和 React 版本自动启用或关闭，避免误报。

## 面向 AI 代理的工作流

`react-doctor` 不只是给人用的 lint 工具，它把"给 AI 修 bug"作为一等公民：

```bash
npx -y react-doctor@latest install
```

该命令会自动把诊断规则注入到主流 AI 编码工具的上下文配置中，让代理在生成代码时即可读取 `react-doctor` 的反馈进行自我修正，形成"生成 → 体检 → 修复"的闭环。这种与 Agent 深度协作的设计正是它能迅速走红的关键。

## CI/CD 集成

仓库提供了官方 GitHub Action，可在 PR 上自动留言并暴露 `score` 输出，便于卡控合并门槛：

```yaml
- uses: millionco/react-doctor@main
  with:
    diff: main
    github-token: ${{ secrets.GITHUB_TOKEN }}
```

支持 `fail-on: error|warning|none`、`offline`、`diff`（仅扫描差异文件）、`--staged`（pre-commit 钩子）等参数，覆盖从本地提交到流水线的完整链路。

## 配置与可扩展性

通过 `react-doctor.config.json` 或 `package.json` 中的 `reactDoctor` 字段进行配置，支持三种忽略策略：全局规则忽略、文件级忽略、以及推荐的 **overrides**（仅在指定文件忽略指定规则，避免大面积失去覆盖）。它会自动尊重 `.gitignore`、`.eslintignore`、`.oxlintignore`、`.prettierignore`，并自动合并已存在的 `.oxlintrc.json` / `.eslintrc.json`，迁移成本极低。

行内抑制采用独立前缀 `// react-doctor-disable-next-line`，避免与 ESLint 抑制冲突，并提供 `--explain <file:line>` 帮助调试为何某条抑制未生效——这种"透明可解释"的取向在同类工具中并不多见。

## 作为独立 Lint 插件

`react-doctor` 还能以 **oxlint 插件** 或 **ESLint flat config** 形式嵌入现有工程，提供 `recommended`、`next`、`react-native`、`tanstack-start`、`tanstack-query` 等预设。可选搭配 `eslint-plugin-react-hooks` v6/v7（React Compiler 正确性）与 `eslint-plugin-react-you-might-not-need-an-effect`，进一步覆盖 effect 反模式。

## 规则示例与价值

仓库强调的几条特色规则极具针对性：`no-cascading-set-state`（连锁 setState）、`rerender-state-only-in-handlers`（只在事件处理中改 state）、`no-derived-useState`（衍生状态不应放进 useState）、`no-fetch-in-effect`、`no-render-in-render`、`no-array-index-as-key`。这些恰恰是 LLM 最常写错、却又难被 ESLint 默认规则覆盖的"高频 AI bug"。

## 总结

在 AI 写代码已成常态的 2026 年，`react-doctor` 抓住了一个明确的痛点：**Agent 能把代码写出来，但写不"对"**。它用一行命令、一个分数、一套面向代理的接入方式，把质量门槛标准化，并以 MIT 协议开源。对于任何重度依赖 AI 编码的 React 团队而言，它都值得作为默认的体检工具集成进 CI 与本地工作流。
