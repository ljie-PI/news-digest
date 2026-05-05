---
title: "andrej-karpathy-skills (+9230⭐)"
date: "2026-04-15"
generated: "2026-04-15 07:00"
source: "GitHub"
slug: "2026-04-15_07-01_andrej-karpathy-skills"
summary: "andrej-karpathy-skills 是一个单文件 CLAUDE.md 项目，旨在系统性解决 LLM 编码助手（尤其是 Claude Code）在实际开发中的常见缺陷。该项目直接源自 Andrej Karpathy "
---

# andrej-karpathy-skills (+9230⭐)

## 定位与痛点剖析

andrej-karpathy-skills 是一个单文件 CLAUDE.md 项目，旨在系统性解决 LLM 编码助手（尤其是 Claude Code）在实际开发中的常见缺陷。该项目直接源自 Andrej Karpathy 在 X 上的观察：LLM 编码时会在错误假设上一路狂奔、过度工程化、修改不该碰的代码、不主动确认歧义。

这些问题对实际工程影响巨大——一个本该 50 行解决的功能被 LLM 写成 1000 行，diff 里充满无关改动，PR review 成本飙升。该项目用四条原则（Think Before Coding、Simplicity First、Surgical Changes、Goal-Driven Execution）将 Karpathy 的观察转化为可操作的行为约束。

## 核心架构与技术细节

技术实现极其简洁——就是一个 CLAUDE.md 文件，利用 Claude Code 的 memory 机制（项目级指令文件）注入行为规则。四条原则互相补充：

1. **Think Before Coding**：强制 LLM 在编码前表述假设、呈现多种解读、遇到困惑时停下询问
2. **Simplicity First**：禁止投机性功能、单次使用的抽象、未被请求的灵活性
3. **Surgical Changes**：只改必须改的代码，不做 drive-by 重构，匹配现有代码风格
4. **Goal-Driven Execution**：将命令式指令转化为可验证的声明式目标（写测试→让测试通过）

安装支持两种方式：Claude Code Plugin Marketplace（推荐，跨项目生效）和直接 curl 到项目根目录。项目还关联了 Multica 平台用于管理编码 agent。

## 竞品对比与生态站位

直接竞品包括 obra/superpowers（完整开发工作流框架）和 shanraisshan/claude-code-best-practice（全面的 Claude Code 最佳实践集合）。相比之下，本项目的优势是**极致简洁**——一个文件、四条原则、零配置。superpowers 提供完整的子代理驱动开发流程，适合大型项目；本项目更适合快速提升日常编码质量。

劣势在于覆盖面有限，只解决编码行为问题，不涉及项目规划、测试策略、代码审查等完整工程流程。

## 开发者反馈与局限性

9230 星的爆发增长说明痛点确实普遍。项目坦承这些规则"偏向谨慎而非速度"，对于简单改动（typo fix）可能过于严格。此外，规则的有效性取决于 LLM 的遵循能力——Claude Code 对 CLAUDE.md 指令的遵循并非 100%，在复杂场景下仍可能"忘记"规则。

## 附带链接

- GitHub: https://github.com/forrestchang/andrej-karpathy-skills
- Karpathy 原帖: https://x.com/karpathy/status/2015883857489522876
