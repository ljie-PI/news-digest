---
title: "msitarzewski/agency-agents"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "GitHub"
slug: "2026-05-05_11-msitarzewski-agency-agents"
summary: "agency-agents 是一个由 Reddit 讨论催生、迭代数月的\"AI Agency\"角色扮演 prompt 集合：把一支虚拟数字代理的所有岗位（前端、后端、移动端、AI 工程、DevOps、"
---

# msitarzewski/agency-agents

## 定位与痛点剖析
agency-agents 是一个由 Reddit 讨论催生、迭代数月的"AI Agency"角色扮演 prompt 集合：把一支虚拟数字代理的所有岗位（前端、后端、移动端、AI 工程、DevOps、SRE、安全工程、UX 设计、UI 设计、技术写作、Solidity、Embedded、CMS、Feishu 集成…）固化为可即装即用的 agent persona Markdown，每个角色含身份、性格、工作流、可交付物示例与成功指标。它解决的痛点是"通用 LLM 在专业岗位上提示过于宽泛、风格漂移、可交付物不可控"——用户不再每次都要从零写系统提示，而是通过 `./scripts/install.sh --tool claude-code|cursor|aider|kimi|opencode|openclaw|gemini-cli` 一键写入对应工具的 agents 目录。92.7k stars 说明该思路在通用开发者社区共鸣极强。

## 核心架构与技术细节
项目本质是结构化 Markdown 内容仓库 + 多 IDE/CLI 转换脚本：`scripts/convert.sh` 生成各家工具的特定文件格式，`scripts/install.sh --tool <name>` 拷贝到正确目录。每个 agent .md 含统一字段（Identity、Mission、Workflow、Deliverables、Success Metrics、Communication Style），使其在任何支持系统提示或 sub-agent 的工具中都能被加载。已经显式适配的工具包括 Claude Code、Cursor、Aider、Windsurf、Antigravity、Gemini CLI、OpenCode、Copilot（GitHub Copilot Chat）、OpenClaw、Kimi 等。仓库按职能分包：engineering/、design/、（推断还有）product/、marketing/、ops/，便于裁剪安装。

## 竞品对比与生态站位
与 awesome-claude-prompts、awesome-chatgpt-prompts、cursor.directory、Anthropic Skills Library、ComposioHQ 的 awesome-codex-skills 处于同一生态层。差异在于：agency-agents 强调"可交付物 + 性格 + 度量"的工程化包装，且明确以"组建团队"心智组织内容；劣势是大量 prompt 是文本契约，没有自动化校验机制，依赖宿主工具的 sub-agent 调度能力。在 LLM IDE 的 sub-agent 化潮流（Claude Code skills、Cursor rules、OpenClaw skills）中，它扮演"通用人物模板源"的角色，下游再做项目特化。

## 开发者反馈与局限性
仓库今日仍在涨（+87k stargazers 周期内已经累积，说明发布期或被 HN/Reddit 推上首页带量）。社区好评聚焦在"开箱即用"和"能直接落 PR"；批评点常见于：persona 仍偏美式风格、对国内开发栈支持有限（虽然有 WeChat Mini Program 和 Feishu 集成两个角色）、长文本会挤占模型 context。总体属于"prompt-as-content"的工程化范本，对学习如何写出可复用 agent 提示极有参考价值。

## 附带链接
- GitHub: https://github.com/msitarzewski/agency-agents
- 安装脚本: `./scripts/install.sh --tool <claude-code|cursor|aider|...>`
