---
title: "GenericAgent — 从 3K 行种子代码生长的自进化 Agent"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "GitHub"
slug: "2026-04-25_07-genericagent"
summary: "当前 Agent 框架普遍存在两个问题：要么预装大量依赖却用不上（代码臃肿），要么每次任务都从零开始（无法积累经验）。GenericAgent 的设计哲学是「不"
---

# GenericAgent — 从 3K 行种子代码生长的自进化 Agent

> ⭐ 本周 +3,483 | 作者: lsdefine | 论文: arXiv:2604.17091

## 1. 定位与痛点

当前 Agent 框架普遍存在两个问题：要么预装大量依赖却用不上（代码臃肿），要么每次任务都从零开始（无法积累经验）。GenericAgent 的设计哲学是「不预装技能，而是进化技能」——核心代码仅约 3K 行，Agent Loop 仅约 100 行，但通过自动将每次任务的执行路径结晶为可复用技能，使用越久能力越强。

## 2. 核心架构

**分层记忆系统（5 层）：**
- L0 — 元规则：Agent 核心行为约束
- L1 — 洞察索引：最小化记忆索引，快速路由和召回
- L2 — 全局事实：长期运行积累的稳定知识
- L3 — 任务技能/SOP：可复用的特定任务工作流
- L4 — 会话归档：已完成会话的蒸馏记录

**9 个原子工具**：code_run、file_read 等，覆盖浏览器、终端、文件系统、键鼠输入、屏幕视觉和移动设备（ADB）。

**自主执行循环**：感知环境 → 任务推理 → 执行工具 → 写入记忆 → 循环。整个仓库包括 Git 初始化到每次提交，都由 GenericAgent 自主完成，作者声称从未打开过终端。

支持 Claude、Gemini、Kimi、MiniMax 等多模型，前端支持 Streamlit、Qt、Telegram、飞书、企业微信、钉钉等。

## 3. 竞品对比

README 中直接对比了 OpenClaw 和 Claude Code。与 OpenClaw（约 53 万行代码、多服务编排）相比，GenericAgent 极致精简；与 Claude Code（会话间无状态）相比，GenericAgent 具有自进化能力。其核心差异化在于 **Token 效率**——技能复用让重复任务的 Token 消耗大幅降低（官方称 6x less）。与 Evolver 的 Gene 方案思路类似，但 GenericAgent 更侧重端到端的系统控制。

## 4. 开发者反馈

项目获得机器之心报道，并已发布百万级技能库。技术报告（arXiv:2604.17091）阐述了「上下文信息密度最大化」理论。社区活跃度高，教程由 Datawhale 提供。实际演示包括外卖点单、量化选股、支付宝账单查询等场景，展示了强大的真实系统控制能力。

## 5. 相关链接

- GitHub: https://github.com/lsdefine/GenericAgent
- 技术报告: https://arxiv.org/abs/2604.17091
- 教程: https://datawhalechina.github.io/hello-generic-agent/
