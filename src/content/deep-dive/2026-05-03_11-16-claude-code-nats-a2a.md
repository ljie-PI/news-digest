---
title: "Orchestrating Claude Code teams with NATS and Google's A2A protocol"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-16-claude-code-nats-a2a"
summary: "- Subreddit: r/AI_Agents"
---

# Orchestrating Claude Code teams with NATS and Google's A2A protocol

- Subreddit: r/AI_Agents
- 讨论: https://www.reddit.com/r/AI_Agents/comments/1t1z90q/

## 事件背景
作者展示了一种「多 Claude Code 实例协同」架构：用 NATS 做消息总线 + Google 最近开源的 A2A (Agent-to-Agent) 协议封装跨实例通信，实现 *manager / planner / coder / reviewer* 角色协作。

## 核心观点 / 产品机制
- 每个 Claude Code 实例（不同 system prompt + 工具集）订阅 NATS 主题；
- 任务以 A2A 协议消息流转：A2A 定义了角色、能力声明、消息生命周期、结果回执；
- Manager 拆解任务 → Planner 给方案 → Coder 改代码并提 PR → Reviewer 评审 → Manager 决定 merge；
- 若任意 worker 卡住，Manager 重新分配；
- 全程产物（patch、commit message、review comments）保存到工件存储。

## 核心架构与技术细节
- NATS JetStream 提供 at-least-once 投递；
- 每个 agent 启动 sidecar 把 stdin/stdout 桥接成 NATS subject；
- A2A 信封含 `task_id`, `role`, `intent`, `payload`, `parent_id`，便于 trace；
- 加入 OpenTelemetry，能在 Grafana 看到完整 trace。

## 社区热议与争议点
- 工程派：「比 LangGraph 等 state machine 路径更通用；NATS 不会是瓶颈」；
- 怀疑派：「同一台机器跑一堆 Claude Code 容易被 token 上限击穿，账单很贵」；
- A2A 派：探讨 Google A2A 与 Anthropic MCP、Microsoft AGNTCY 的标准之争；
- 实战派：分享在内部用 5 个 Claude Code worker 并行 refactor 大型 monorepo 的真实成本与产出。

## 行业影响与未来展望
2026 年 *agent orchestration* 已经从 toy demo 走向工程实战。NATS / Kafka / Temporal / A2A / MCP 多种方案百花齐放。未来 12 个月可能形成「MCP 是 tool 调用、A2A 是 agent 协作、NATS/Temporal 是底座」的层级结构。建议团队从单 agent 工具调用走起，再尝试小规模多 agent，先把 *观察、回放、回滚* 三件套做好，再上规模。

## 附带链接
- Reddit: https://www.reddit.com/r/AI_Agents/comments/1t1z90q/
