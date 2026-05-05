---
title: "lukilabs/craft-agents-oss — Document-Centric Agent 工作台"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-lukilabs-craft-agents-oss"
summary: "⭐ 本周高增 · TypeScript · Apache 2.0"
---

# lukilabs/craft-agents-oss — Document-Centric Agent 工作台

⭐ 本周高增 · TypeScript · Apache 2.0

## 1. 定位与撰点剖析
craft.do 团队（笔记/文档 SaaS Craft）开源的 agent 工作台，主打"文档优先（document-centric）而非代码优先"的 agent 交互范式。痛点：Claude Code、Codex 这些主流 agent 工具都是 CLI / 编辑器 first，对内容创作者、产品经理、研究员等非工程角色不友好。Craft Agents 提供一个流畅的 GUI，让普通用户也能直观地多任务、共享 session、把任意 API/MCP 接进来。

## 2. 核心架构与技术细节
底座同时使用 Claude Agent SDK 和 Pi SDK 双路并行——作者解释是"Claude SDK 的能力面 + Pi SDK 在他们想改进的部分上更好"。Agent Native 软件原则：高定制开箱即用。最有意思的是连接外部服务的方式——直接对 agent 说 "add Linear as a source"，agent 会自己搜公开 API + MCP server、读官方文档、配凭据；也支持粘贴现成 MCP JSON 或运行 stdio-based 本地 MCP（npx / python 子进程）。开发组自夸"Craft Agents 自己也是用 Craft Agents 写出来的，没有用任何代码编辑器"。

## 3. 竞品对比与生态站位
和 Open WebUI、LibreChat、AnythingLLM、LobeChat 这些通用前端比，Craft Agents 不是"chat UI"而是"document workspace"——session 围绕文档组织。和 Cursor、Claude Code 比则相反方向：弱代码、强文档。和本周 GitHub Trending #1 的 mattpocock/skills 一起，体现 agent 工程社区两种价值观：一种是面向工程师做"可组合的小 skill"，一种是面向白领做"开箱可用的工作台"。

## 4. 开发者反馈与局限性
README 暗示这是 Craft 自家内部工具的开源版本——意味着早期生态、扩展、社区文档相对稀薄；双 SDK 架构带来一定复杂度，二次开发需要同时熟悉 Claude Agent SDK + Pi SDK；自动添加 source 的功能依赖公网 API 和 MCP 文档质量，遇到不规范的 API 会失败。

## 5. 链接
- GitHub Repo: https://github.com/lukilabs/craft-agents-oss
- 介绍视频: https://www.youtube.com/watch?v=xQouiAIilvU
- 在线 Demo: https://agents.craft.do
