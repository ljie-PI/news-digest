---
title: "I've been building AI agents with n8n for a few months"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-n8n-ai-agents-experience"
summary: "**Subreddit:** r/AI_Agents"
---

# I've been building AI agents with n8n for a few months

**Subreddit:** r/AI_Agents
**Permalink:** https://www.reddit.com/r/AI_Agents/comments/1szui73/ive_been_building_ai_agents_with_n8n_for_a_few/

## 事件背景
作者分享自己用 n8n（开源 workflow 自动化工具）+ AI Agent 节点替客户做实际项目的经验。最新案例：为黑山一家中型酒店搭建 Instagram 内容生成 agent——以塞尔维亚语、温暖语调，每天自动产出可发布的图文，结果通过 Google Sheet 交付，客户根本不需要碰任何 AI 工具。

## 核心观点
作者经验提炼：(1) 客户不在乎技术栈，只在乎产出和"我能不能直接发到 Instagram"；(2) 多语言/小语种本地化是溢价点——通用 ChatGPT 模板对塞尔维亚语温度欠缺；(3) 交付层（Google Sheet 而不是 dashboard）极重要——降低使用门槛、绕开权限审批；(4) Workflow ≠ Agent，但 n8n 把节点 + AI 串起来，足以应付 90% 中小客户需求；(5) 报价模式建议按月订阅（包含模型 API + 维护），而非一次性项目费。

## 社区热议
评论分两类：(1) 实操派——分享自己用 n8n / Make / Zapier 跑 RAG、客服、自动报价的经验，常见问题是 n8n self-host 的稳定性、AI 节点 Google Gemini vs OpenAI 选择；(2) 怀疑派——质疑这种"包装 LLM" 的咨询业务能持续多久，"客户自己学会 ChatGPT 后就不需要中介了"。作者反驳：客户不是不会，而是不愿意维护——这个差异在未来 2-3 年仍是稳定的商业机会。

## 行业影响
帖子是 2026 年 "Agent 即业务"热潮的具体案例：低门槛工具（n8n、Make、ComfyUI）+ 通用 LLM API 已经足够覆盖大量中小企业的内容/客服/数据流自动化。未来 12 个月，垂直行业（餐饮、健身、酒店、医美）的 "AI Agency" 商业模型会更普遍，并推动 n8n / Make 等工具加更多"agent first"原生节点。

## 链接
- 原帖：https://www.reddit.com/r/AI_Agents/comments/1szui73/ive_been_building_ai_agents_with_n8n_for_a_few/
