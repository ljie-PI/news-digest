---
title: "CJackHwang/ds2api — DeepSeek Web 转 OpenAI/Claude/Gemini 兼容 API"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-cjackhwang-ds2api"
summary: "⭐ 本周高增 · Go + Node + React WebUI"
---

# CJackHwang/ds2api — DeepSeek Web 转 OpenAI/Claude/Gemini 兼容 API

⭐ 本周高增 · Go + Node + React WebUI

## 1. 定位与痛点剖析
ds2api 把 **DeepSeek 官方网页对话** 反向适配成 OpenAI、Claude (Anthropic Messages)、Gemini 三种主流 SDK 都能调用的兼容接口，让用户绕开官方 API 限额和计费，用网页账号能力驱动 LangChain、Cline、Aider、Cursor、Continue 等下游工具。痛点群体很明确：用 DeepSeek 网页版重度对话、但又想把它接到 IDE / 编排框架里的开发者。

## 2. 核心架构与技术细节
后端核心是 Go（强调高并发协议适配），Vercel 流式桥接用少量 Node Runtime，前端是 React WebUI 管理台（webui/ 编译到 static/admin）。提供 4 种部署：Release 包、Docker、Vercel 模板、本地源码。鉴权模式可切换；适配了 OpenAI Responses API 和 Tool Call；自带本地抓包工具方便调试。仓库登上 trendshift.io 榜单，README 同时给中英文双版本。

## 3. 竞品对比与生态站位
同赛道有 ChatGPT-Next-Web 的反向 API、coze-discord-proxy、deepseek-free-api 等。ds2api 的差异点是 Go 后端 + 三协议（OpenAI/Claude/Gemini）齐全 + 自带管理 WebUI——大多数同类只支持 OpenAI 协议、用 Node/Python 实现。这条赛道本身游走在 ToS 灰色地带，社区热度高但商用风险也高。

## 4. 开发者反馈与局限性
README 已用大篇幅打出"仅供学习研究、不承担账号封禁/数据丢失/法律风险"的免责声明，说明账号被风控是真实存在的常态问题。Tool Call 适配仍在迭代，部分复杂 schema（嵌套结构、anyOf）可能掉精度；Gemini 协议目前覆盖度比 OpenAI/Claude 略弱；Vercel 部署受限于 serverless 流式持久连接时长。

## 5. 链接
- GitHub Repo: https://github.com/CJackHwang/ds2api
- 部署文档: https://github.com/CJackHwang/ds2api/blob/main/docs/DEPLOY.md
