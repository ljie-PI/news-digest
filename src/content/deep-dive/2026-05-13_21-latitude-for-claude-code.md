---
title: "Latitude for Claude Code — 深度解读"
date: "2026-05-13"
generated: "2026-05-13 21:00"
source: "PH"
slug: "2026-05-13_21-latitude-for-claude-code"
summary: "Latitude for Claude Code 是 Latitude（一个面向 AI Agent 的可观测性平台）最新推出的免费工具，主打一句话价值主张：\"See where Claude Code burns tokens. Hit your limits l"
---

---
title: "Latitude for Claude Code — 深度解读"
date: "2026-05-13"
generated: "2026-05-13 21:00"
source: "ProductHunt"
slug: "deep-ph-latitude-for-claude-code"
---

# Latitude for Claude Code — 深度解读

## 一、产品定位：给 Claude Code 装上「油耗表」

Latitude for Claude Code 是 Latitude（一个面向 AI Agent 的可观测性平台）最新推出的免费工具，主打一句话价值主张："See where Claude Code burns tokens. Hit your limits less."（看清 Claude Code 把 token 烧在哪里，让你少撞额度墙）。

对于任何重度使用 Claude Code 的开发者来说，"还没干多少活就被限速"是一种近乎日常的挫败感。Anthropic 的 Team Plan 与 API 计费都对上下文消耗极为敏感，但官方界面几乎不暴露 session 级别的 token 走向——你只知道"用完了"，却不知道"为什么用完了"。Latitude for Claude Code 正是切入这个盲区：把每一次会话的 token 消耗、工具调用、子代理派生、上下文增长全部可视化。

## 二、核心功能拆解

1. **完整 Session Trace**：记录 system prompt、每一次 tool call、subagent spawn，以及每个 turn 的 token 成本。这意味着你可以回放任何一次"耗尽额度"的会话，精确定位是哪个工具调用（例如读取超大文件、重复 grep）吃掉了上下文。
2. **上下文流向分析**：直观展示 context 去了哪里、哪些 action 最烧 token。对于经常让 Claude Code 自动读取整个仓库的用户，这部分能立刻揭示优化空间。
3. **自定义 Agent Harness**：不仅监控 Claude Code 本体，也可作为通用 harness 跟踪自建 agent 的成本与延迟。
4. **失败模式自动识别**：结合启发式规则与 ML 模式分析，自动标记跨多次运行反复出现的失败（例如某个 tool 经常超时、某类 prompt 经常触发幻觉）。
5. **零运行时开销**：遥测数据异步上传，不阻塞 Claude Code 本身的执行。
6. **完全免费**：trace 存储在用户的 Latitude 账户中，目前对 Claude Team Plan 与 API 均支持（仅限 Claude Code，不支持 Cowork）。

安装非常轻量：

```bash
npx -y @latitude-data/claude-code-telemetry install
```

## 三、创始人视角

César M.（Latitude 创始人）将这次发布定位为对其"Agent Observability Platform"主线的一次具体化落地。Latitude 自 2023 年首次登陆 Product Hunt 起，已经迭代过 Latitude 2.0（2025 年 9 月获得当日 #2）、Latitude Agents（2025 年 3 月）等多个版本，社区基础扎实（2.4K followers）。这次选择 Claude Code 作为切入点，恰逢 Claude Code 在开发者圈层快速渗透——一个被广泛使用却缺乏可观测性的工具，正是 observability 厂商的天然战场。

## 四、社区争议：安装器的「爆炸半径」

值得关注的是社区成员 Robert Douglass 提出的一个严肃问题：在 macOS 上，安装器会写入 `~/Library/LaunchAgents/so.latitude.claude-code-telemetry.plist`，每次登录都会执行 `launchctl setenv BUN_OPTIONS=--preload=...`。这意味着**机器上所有 Bun 进程**都会被注入该 preload，而不仅是 Claude Code。Robert 用一句话精准概括："Wider blast radius than 'just Claude Code.'"——这对追求最小权限的开发者是个红旗，团队需要尽快收窄实现方案。

## 五、横向对比与展望

同类产品包括 Langfuse、Langchain（tracing）、AppSignal、Scorecard 等通用 LLM observability 工具，但这些大多面向 API 调用而非 IDE/CLI agent 的真实交互轨迹。Latitude for Claude Code 的差异化在于**工具链原生**——它不要求你改写代码，只要装一次就开始记录。

对真正的目标用户（每天被 Claude Code 限额折磨的工程师），它解决的是一个具体而高频的痛点。如果团队能解决 Bun preload 的安全顾虑，并未来扩展到 Cowork、Cursor Agent 等更多 harness，这款工具有机会成为 AI 编码时代的"Chrome DevTools Network 面板"。
