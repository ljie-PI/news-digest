---
title: "TradingAgents: Multi-Agent LLM Financial Trading Framework"
date: "2026-05-07"
generated: "2026-05-07 07:00"
source: "GitHub"
slug: "2026-05-07_07-tradingagents-multi-agent-trading"
summary: "传统量化交易系统依赖固定规则和统计模型，缺乏动态适应市场情绪和基本面变化的能力。深度学习模型虽能捕捉模式，但黑箱决策难以解释和调试。Tr"
---

# TradingAgents: Multi-Agent LLM Financial Trading Framework

> **GitHub:** [TauricResearch/TradingAgents](https://github.com/TauricResearch/TradingAgents) | **Stars:** 70,290 | **Period Stars:** 14,697 | **Language:** Python

## 定位痛点

传统量化交易系统依赖固定规则和统计模型，缺乏动态适应市场情绪和基本面变化的能力。深度学习模型虽能捕捉模式，但黑箱决策难以解释和调试。TradingAgents 提出用 **多 Agent LLM 协作** 模拟真实交易公司的组织结构和决策流程，实现透明、可解释、动态适应的智能交易。

## 核心架构

系统采用 **5 阶段流水线**，包含 7 种专业角色：

| 阶段 | 角色 | 职责 |
|------|------|------|
| I 信息收集 | 分析师团队（4 人） | 并行收集基本面、情绪、新闻、技术面数据 |
| II 辩证分析 | 研究团队（Bull & Bear） | 对收集的信息进行辩论式评估 |
| III 交易决策 | 交易员 | 基于研究分析做出交易决策 |
| IV 风险控制 | 风险管理团队 | 评估决策风险，提出缓释措施 |
| V 最终执行 | 基金经理 | 审批并执行最终交易 |

**通信协议**采用结构化报告与自然语言对话的混合方式：
- 分析师→交易员：结构化信号报告，减少信息损失
- 研究团队/风控：自然语言辩论与深度推理

所有 Agent 使用 **ReAct 提示框架**，根据任务选择不同推理深度的 LLM（快速检索用轻量模型，分析决策用深度模型）。

## 竞品对比

| 项目 | 定位 | 差异 |
|------|------|------|
| **TradingAgents** | 多 Agent LLM 模拟交易公司 | 角色专业化 + 辩证辩论 + 透明可解释 |
| **传统量化框架** | 规则/统计/深度学习模型 | 黑箱、静态、难以适应突变 |
| **Dexter (virattt)** | 自主金融研究 Agent | 侧重深度研究而非交易执行 |
| **Kronos** | 金融市场语言基础模型 | 侧重市场语言理解，非完整交易框架 |

TradingAgents 的实验结果显示，在 AAPL/GOOGL/AMZN 等标的上，累计收益、夏普比率显著优于 Buy & Hold、MACD、KDJ/RSI 等基线策略，且最大回撤控制在极低水平。

## 开发者反馈

- 社区评价其为“寻找已久的多 Agent LLM 交易框架”，认为角色分工和辩论机制是 game-changer
- 研究者关注其无需 GPU 即可运行，易于集成替代模型
- 部分用户希望看到更多资产类别（期货、加密货币）和实时交易接口的支持

## 附带链接

- [GitHub 仓库](https://github.com/TauricResearch/TradingAgents)
- [项目官网](https://tradingagents-ai.github.io/)
- [arXiv 论文](https://arxiv.org/abs/2412.20138)
- [Tauric Research GitHub](https://github.com/TauricResearch)
