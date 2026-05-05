---
title: "ZhuLinsen/daily_stock_analysis — LLM 驱动的 A/H/美股自选股每日分析"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-zhulinsen-daily-stock-analysis"
summary: "⭐ 本周高增 · Python · GitHub Actions 零成本"
---

# ZhuLinsen/daily_stock_analysis — LLM 驱动的 A/H/美股自选股每日分析

⭐ 本周高增 · Python · GitHub Actions 零成本

## 1. 定位与痛点剖析
项目主张"零成本、白嫖式"运行：用 GitHub Actions 定时跑（不用买服务器），把 A 股、港股、美股自选股自动跑一遍多维度分析（技术面、行情、筹码、新闻、公告、资金流、基本面），最后输出"决策仪表盘"——一句话核心结论 + 评分 + 买卖点位 + 风险警报 + 操作 checklist——再推给企业微信、飞书、Telegram、Discord、Slack、邮件。痛点：散户白天上班没空盯盘，希望开盘前自动收到结构化的研判简报。

## 2. 核心架构与技术细节
LLM 端兼容 AIHubMix、Gemini、OpenAI、DeepSeek、通义千问、Claude、Ollama 等几乎所有主流 backbone。行情数据走 TickFlow / AkShare / Tushare / Pytdx / Baostock / YFinance / Longbridge 多源容灾。新闻搜索接 Anspire / SerpAPI / Tavily / Bocha / Brave / MiniMax / SearXNG。社交舆情接 Stock Sentiment API（Reddit / X / Polymarket，仅美股）。Web 控制台双主题，支持手动分析、批量回测、AI 回测、Agent 问股（多轮对话 + 11 种内置策略：均线金叉/缠论/波浪/A 股复盘/美股 Regime 等）。Docker / FastAPI / GitHub Actions / 本地 cron 四套部署都打通。

## 3. 竞品对比与生态站位
对比 OpenBB（专业级开源金融终端，门槛高）、akshare 裸用（只有数据没有 LLM 决策）、Stoxx-AI 这类闭源，daily_stock_analysis 卡在"散户够用 + 全流程自动化 + 中文友好"的甜点位。和本周同时上榜的 TauricResearch/TradingAgents 是不同生态：TradingAgents 是研究型多 agent 框架，本项目是面向 retail user 的成品工具。HelloGitHub 收录、trendshift 上榜进一步推热。

## 4. 开发者反馈与局限性
免责声明强调"非投资建议"。常见 issue：LLM token 成本随自选股数量线性飙升；新闻情绪聚合精度依赖搜索 API 配额；A 股盘前公告抓取偶有延迟；回测口径"事后验证"未严格控制 lookahead bias，因此结论应作为参考而非依据。

## 5. 链接
- GitHub Repo: https://github.com/ZhuLinsen/daily_stock_analysis
- 完整指南: https://github.com/ZhuLinsen/daily_stock_analysis/blob/main/docs/full-guide.md
