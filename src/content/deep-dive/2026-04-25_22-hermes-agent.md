---
title: "Hermes Agent：Nous Research 打造的\"会自我进化\"的 AI Agent"
date: "2026-04-25"
generated: "2026-04-25 22:00"
source: "GitHub"
slug: "2026-04-25_22-hermes-agent"
summary: "当前 AI Agent 生态面临一个核心矛盾：**模型能力在飞速进步，但 Agent 框架本身却是\"无状态\"的**。每次对话结束，Agent 就忘记了一切——你教它的技巧、"
---

# Hermes Agent：Nous Research 打造的"会自我进化"的 AI Agent

## 定位与痛点剖析

当前 AI Agent 生态面临一个核心矛盾：**模型能力在飞速进步，但 Agent 框架本身却是"无状态"的**。每次对话结束，Agent 就忘记了一切——你教它的技巧、你的使用习惯、上次任务的经验教训，全部归零。用户被迫反复教育自己的 AI 助手，这是一种巨大的效率浪费。

Hermes Agent 由 AI 研究机构 Nous Research 推出，精准瞄准了这一痛点。它的核心 slogan 是"The agent that grows with you"——一个**能跟随你成长的 Agent**。不同于 LangChain、AutoGPT 等偏重"编排"的框架，Hermes Agent 将重心放在了**闭环学习**上：从经验中自动创建技能（Skills）、在使用中自我改进技能、主动持久化知识、跨会话搜索历史对话，并逐步构建对用户的深层理解模型。本周暴涨 19000+ Stars，足以说明社区对这一方向的强烈需求。

## 核心架构与技术细节

Hermes Agent 的架构设计围绕几个关键支柱展开：

**1. 闭环学习系统（Closed Learning Loop）**
这是其最核心的差异化能力。Agent 在完成复杂任务后会**自主创建 Skill 文件**，后续遇到类似任务时自动调用并持续优化。记忆系统采用 FTS5 全文搜索引擎实现跨会话召回，配合 LLM 摘要生成；同时集成了 [Honcho](https://github.com/plastic-labs/honcho) 的辩证式用户建模，让 Agent 对用户偏好的理解不断加深。整套系统兼容 [agentskills.io](https://agentskills.io) 开放标准，技能可跨实例共享。

**2. 极致的模型自由度**
支持 Nous Portal、OpenRouter（200+ 模型）、NVIDIA NIM、小米 MiMo、智谱 GLM、Kimi/Moonshot、MiniMax、Hugging Face、OpenAI 等几乎所有主流 LLM 提供商，通过 `hermes model` 一键切换，零代码修改，彻底消除供应商锁定。

**3. 六种终端后端 + Serverless 部署**
支持 Local、Docker、SSH、Daytona、Singularity 和 Modal 六种运行环境。其中 Daytona 和 Modal 提供 Serverless 持久化——Agent 闲置时自动休眠，唤醒时恢复状态，从 $5 VPS 到 GPU 集群均可运行，闲时成本趋近于零。

**4. 全平台消息网关**
单一 Gateway 进程即可桥接 Telegram、Discord、Slack、WhatsApp、Signal 和 Email，支持语音转写和跨平台对话连续性。内置 cron 调度器，可用自然语言配置定时任务并推送到任意平台。

**5. 子代理并行化**
支持 spawn 隔离子代理处理并行工作流，还可编写 Python 脚本通过 RPC 调用工具，将多步流水线压缩为零上下文消耗的单轮操作。

**6. 研究友好**
内置批量轨迹生成、Atropos RL 环境、轨迹压缩等功能，直接服务于下一代工具调用模型的训练数据生产。

## 竞品对比与生态站位

| 维度 | Hermes Agent | OpenClaw | Claude Code / Codex CLI | AutoGPT / LangGraph |
|------|-------------|----------|------------------------|---------------------|
| 核心定位 | 自我进化的个人 Agent | 个人 AI 助手 | 编码专用 Agent | 通用 Agent 编排框架 |
| 学习闭环 | ✅ 自主创建/优化 Skill | ✅ 技能系统 | ❌ 无持久学习 | ❌ 需手动编排 |
| 模型自由度 | 200+ 模型，一键切换 | 多供应商 | 绑定单一供应商 | 依赖开发者配置 |
| 部署灵活性 | 6 种后端 + Serverless | 本地/Docker | 仅本地 CLI | 需自行部署 |
| RL 训练集成 | ✅ Atropos 内置 | ❌ | ❌ | ❌ |

值得注意的是，Hermes Agent 明确提供了 `hermes claw migrate` 命令来从 OpenClaw 迁移，可自动导入 SOUL.md、记忆文件、技能、API 密钥等。这种"正面竞争 + 平滑迁移"的策略非常务实，说明 Nous Research 对这个赛道是认真的。

从生态站位来看，Hermes Agent 占据了一个独特位置：它既不是纯开发者框架（如 LangChain），也不是封闭产品（如 Claude），而是一个**面向个人用户的开源、可自托管、会成长的 AI 代理**。Nous Research 的学术背景（以 Hermes 系列微调模型闻名）为其在 RL 训练和模型优化方面提供了天然优势。

## 开发者反馈与局限性

**社区热度方面**，一周 19000+ Stars 的增速在开源 Agent 项目中属于现象级表现，Discord 社区活跃，已有社区贡献的微信桥接插件 HermesClaw。

**潜在局限性**包括：
- **Windows 原生不支持**，必须通过 WSL2 使用，这对非技术用户是门槛
- **学习闭环的质量高度依赖底层 LLM**，使用较弱的模型时 Skill 自动生成的质量可能不稳定
- **Serverless 部署（Daytona/Modal）的冷启动延迟**在实际场景中是否影响体验，尚缺乏大规模用户反馈
- 项目仍处于快速迭代期，API 和配置项的稳定性需要时间验证
- 与 OpenClaw 的高度相似性（架构、术语、功能模块）引发了社区关于项目渊源的讨论

## 链接

- **GitHub 仓库**: https://github.com/NousResearch/hermes-agent
- **官方文档**: https://hermes-agent.nousresearch.com/docs/
- **Skills Hub**: https://agentskills.io
- **Discord 社区**: https://discord.gg/NousResearch
- **Nous Research 官网**: https://nousresearch.com
- **许可证**: MIT
