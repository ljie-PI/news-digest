---
title: "ChatGPT Plus 连接 OpenCode 后，到底用的是哪个模型？"
date: "2026-04-23"
generated: "2026-04-23 07:00"
source: "Reddit"
slug: "2026-04-23_07-opencode-chatgpt-plus-model"
summary: "---"
---

# ChatGPT Plus 连接 OpenCode 后，到底用的是哪个模型？

> 来源：r/opencodeCLI · 2026-04-23
> 原帖：https://www.reddit.com/r/opencodeCLI/comments/1ssxioc/

---

## 1. 事件背景

Reddit 用户在 r/opencodeCLI 社区发帖提问：「我有 ChatGPT Plus 订阅，并把它连接到了 OpenCode，那我在 OpenCode 里聊天时，实际使用的是哪个模型？」

这个问题看似简单，实则触及了当前 AI 编程工具生态中一个普遍的困惑点——**当第三方终端工具通过 OAuth 或 API 对接 ChatGPT 订阅时，模型的选择、路由和计费逻辑并不透明**。OpenCode 是一款基于 AI SDK 的开源命令行编程助手，支持 75+ LLM 提供商，用户可以通过 `/connect` 命令接入 OpenAI、Anthropic、Google 等多家模型。

## 2. 核心观点与技术机制

根据 OpenCode 官方文档和社区第三方插件（如 `opencode-openai-codex-auth`）的信息，技术机制如下：

- **模型选择权在用户手中**：OpenCode 并不会自动「继承」你 ChatGPT Plus 网页端的默认模型。连接 ChatGPT Plus 后，你需要通过 `/models` 命令显式选择要使用的模型（如 `openai/gpt-5.2`、`openai/gpt-5.1-codex` 等）。
- **OAuth 认证 ≠ 模型绑定**：ChatGPT Plus 的 OAuth 认证只是提供了访问凭证，具体调用哪个模型取决于 OpenCode 配置中的 `provider_id/model_id` 设置。
- **Codex 系列模型需额外配置**：社区开发者 Numman Ali 发布了 `opencode-openai-codex-auth` 插件，专门帮助 ChatGPT Plus/Pro 用户在 OpenCode 中一键解锁 GPT-5.2、GPT-5.2 Codex、GPT-5.1 Codex 等 22 个模型预设，走的是 ChatGPT OAuth → Codex 后端 → OpenCode 的链路。
- **模型加载优先级**：命令行 `--model` 参数 > 配置文件 `model` 字段 > 上次使用的模型 > 内部默认优先级。

**简言之：你用的不是「ChatGPT Plus 的模型」，而是你在 OpenCode 里主动选择的那个模型，ChatGPT Plus 只是提供了认证和配额。**

## 3. 社区热议与争议点

这类问题在 r/opencodeCLI 社区频繁出现，反映了几个核心争议：

- **「OpenCode Zen 够用吗，还是该升级到 ChatGPT Plus？」**——有用户纠结于免费的 OpenCode Zen 计划与付费订阅之间的模型差异（[相关讨论](https://www.reddit.com/r/opencodeCLI/comments/1rc8bev/)）。
- **「GPT-5.4 被移除后该用什么？」**——GitHub Copilot 学生订阅用户发现 Claude 和 GPT-5.4 被下架后，对模型选择产生困惑（[相关讨论](https://www.reddit.com/r/opencodeCLI/comments/1rpun8y/)）。
- **模型选择器的误导性**——在 OpenAI 官方 Codex 项目的 Issue 中，有用户指出：「如果用 ChatGPT 账号登录后某些模型不可用，就不应该在选择器里显示它们，这会造成混淆。」（[GitHub Issue #18293](https://github.com/openai/codex/issues/18293)）
- **第三方插件的信任问题**——`opencode-openai-codex-auth` 虽然标注使用「OpenAI 官方 OAuth 流程」，但作为第三方 npm 包，社区对其安全性存在讨论。

## 4. 行业影响与未来展望

这个看似入门级的问题，实际上折射出 AI 编程工具链的一个系统性痛点：**模型即服务（MaaS）时代，用户订阅的是平台，但使用的是工具，两者之间的模型路由关系缺乏标准化**。

随着 OpenCode、Cursor、Windsurf 等 AI 编程工具百花齐放，用户面临的不再是「用哪个 AI」的选择，而是「用哪个 AI 的哪个模型、通过哪个工具、走哪条认证链路」的组合爆炸。未来可能的发展方向包括：

- 工具端更清晰的模型标识和计费透明度
- OpenAI 等平台为第三方工具提供更规范的 OAuth scope 和模型访问控制
- 社区推动建立统一的模型路由标准

## 5. 相关链接

- [OpenCode 模型文档](https://opencode.ai/docs/models/)
- [OpenCode 提供商文档](https://opencode.ai/docs/providers/)
- [opencode-openai-codex-auth 插件](https://github.com/numman-ali/opencode-openai-codex-auth)
- [Reddit: 该选哪个模型？](https://www.reddit.com/r/opencodeCLI/comments/1rc8bev/)
- [GitHub: Codex 模型选择器问题](https://github.com/openai/codex/issues/18293)
