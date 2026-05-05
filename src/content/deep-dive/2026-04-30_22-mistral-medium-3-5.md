---
title: "Mistral Medium 3.5"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-mistral-medium-3-5"
summary: "**链接**：[mistral.ai 公告](https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5) · [HN 讨论](https://news.ycombinator.com/item?id=47949642) · 394 points · 185 comments"
---

# Mistral Medium 3.5

**链接**：[mistral.ai 公告](https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5) · [HN 讨论](https://news.ycombinator.com/item?id=47949642) · 394 points · 185 comments

## 事件背景

Mistral 在 4 月 29 日同步发布了三件事：(1) Medium 3.5 公测——他们自称的"首个 merged flagship"模型；(2) Vibe 远程 agent——把编码 agent 从笔记本搬到云端、可在 Le Chat 内启动；(3) Le Chat 的 Work mode——多步任务 agent 落地。HN 讨论焦点是 Medium 3.5 本身。

## 核心机制

Medium 3.5 是 128B 稠密模型，256k context，把 instruction-following、reasoning、coding 收敛进一组权重，按请求可配置 reasoning effort（轻问轻答、重活重推）。视觉 encoder 从零训练，支持可变图像尺寸/比例。Mistral 公布了关键 benchmark：SWE-Bench Verified 77.6%（高于 Devstral 2 与 Qwen3.5 397B A17B），τ³-Telecom 91.4。**最有杀伤力的细节是开源**：Medium 3.5 以"修改版 MIT 许可"释出权重，并且自托管只需 4 张 GPU 起步。

## 社区热议与争议点

- **支持方**："开源 + 4 GPU 自托管 + 77.6 SWE-Bench"被视为对 Anthropic / OpenAI 闭源溢价的正面挑战；评论者尤其欣赏它定位明确——cloud agent runtime + 本地可部署的对偶。
- **怀疑方**：(1) "modified MIT" 含商业条款，需细读是否限制 SaaS 转售；(2) SWE-Bench 数字与真实仓库表现仍待社区独立复测；(3) 远程 agent 与 Vibe CLI 的产品差异化是否能撼动 Cursor / Codex。
- **争议点**：是否还能称作"开源"？"modified MIT" 在 OSI 严格意义上有争议，社区对此分歧明显。

## 行业影响与未来展望

Medium 3.5 的真正影响是把"开源 SOTA 编码模型"门槛进一步压低到 128B 稠密 + 4 GPU 自托管。这对企业内部部署 AI 编码 agent 是利好——以前需要 200B+ 才达到的 SWE-Bench 段位，现在能在中等私有 GPU 集群跑起来。中期看，Mistral 把 Vibe 做成与 Zed ACP / Anthropic Claude Code 同台的 agent runtime 平台，是对 Cursor 商业模式的正面冲击。

## 链接

- 公告：https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5
- HN 讨论：https://news.ycombinator.com/item?id=47949642
