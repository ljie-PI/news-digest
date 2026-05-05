---
title: "free-claude-code — 免费使用 Claude Code 的代理方案"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "GitHub"
slug: "2026-04-25_07-free-claude-code"
summary: "Claude Code 官方需要 Anthropic 订阅，对个人开发者和学生而言成本不低。该项目搭建了一个本地代理服务器，将 Claude Code 的 API 请求转发到免费或低成本的"
---

# free-claude-code — 免费使用 Claude Code 的代理方案

> ⭐ 本周 +5,160 | 作者: Alishahryar1

## 1. 定位与痛点

Claude Code 官方需要 Anthropic 订阅，对个人开发者和学生而言成本不低。该项目搭建了一个本地代理服务器，将 Claude Code 的 API 请求转发到免费或低成本的 LLM 提供商（NVIDIA NIM 40 req/min 免费额度、OpenRouter 免费模型、DeepSeek、LM Studio 本地模型、llama.cpp），实现零成本使用 Claude Code CLI 和 VSCode 扩展。

## 2. 核心架构

核心是一个基于 uvicorn 的 FastAPI 代理服务器，监听 8082 端口，模拟 Anthropic API 接口：

- **多 Provider 路由**：支持 5 种后端（NVIDIA NIM、OpenRouter、DeepSeek、LM Studio、llama.cpp），每种用 `BaseProvider` ABC 实现
- **Per-Model 映射**：可将 Opus/Sonnet/Haiku 分别路由到不同模型和不同 Provider，自由混搭
- **Thinking Token 支持**：解析 `<think>` 标签和 `reasoning_content` 为原生 Claude thinking blocks
- **启发式工具解析器**：当模型以文本输出工具调用时，自动解析为结构化 tool use
- **请求优化**：5 类简单 API 调用在本地拦截，节省配额和延迟
- **智能限流**：滚动窗口主动限流 + 429 指数退避 + 可选并发上限
- **Discord/Telegram Bot**：支持远程自主编码，树状线程、会话持久化、实时进度

安装方式支持 git clone + uv run，或 `uv tool install` 全局安装。同时兼容 VSCode 和 IntelliJ 扩展。

## 3. 竞品对比

类似思路的项目包括 aider（使用多模型编码）和各种 OpenAI 兼容代理。free-claude-code 的独特之处在于它是 Claude Code 的**无修改替代**——只需设置两个环境变量，无需改动任何 Claude Code 代码。支持 `claude-pick` 交互式模型选择器，体验接近原生。与直接用 API 调用其他模型不同，它保留了 Claude Code 的完整工具链体验。

## 4. 开发者反馈

项目增长迅速（周增 5000+ 星），反映出社区对降低 AI 编码工具使用门槛的强烈需求。子代理控制功能（强制 `run_in_background=False`）解决了 LLM 编码代理常见的「失控子进程」问题。但需要注意的是，免费模型的能力与原版 Claude 存在差距，复杂任务表现可能下降。

## 5. 相关链接

- GitHub: https://github.com/Alishahryar1/free-claude-code
- NVIDIA NIM: https://build.nvidia.com
- OpenRouter: https://openrouter.ai
