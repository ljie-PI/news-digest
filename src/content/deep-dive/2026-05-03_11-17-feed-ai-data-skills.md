---
title: "Feed your AI Data to build Skills"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-17-feed-ai-data-skills"
summary: "- Subreddit: r/AI_Agents"
---

# Feed your AI Data to build Skills

- Subreddit: r/AI_Agents
- 讨论: https://www.reddit.com/r/AI_Agents/comments/1t1w347/

## 事件背景
讨论帖：随着 Anthropic / OpenAI / OpenClaw 等纷纷推出 *Skills* 概念（一种类似插件的指令集 + 资源包），社区开始研究「如何把企业内部数据 / SOP 转成 Skill 让 agent 一上手就能用」。

## 核心观点 / 产品机制
- Skill 通常包含：① SKILL.md（指令 / 触发条件）；② 引用的 scripts / dataset；③ 元数据（依赖、版本）；
- 与 RAG 不同：Skill 是「行为脚本」而非检索；适合工作流标准化；
- 把企业 SOP 转 Skill：① 拆出标准动作；② 写成可执行 shell / Python；③ 在 SKILL.md 描述触发与边界；
- 与 MCP server 区别：Skill 是 agent 内部「主动加载」的步骤包，MCP 是「外部能力暴露」。

## 社区热议与争议点
- 实践派：分享自己把财务报销、PR review、容器健康检查做成 Skill 的经验；
- 工程派：Skill 与 Agent 的边界、版本管理、安全沙箱；
- 数据派：把内部 wiki 直接转 Skill 是否过度——RAG 仍然是更高效的查询渠道；
- 对比派：Anthropic Skills、Cursor Rules、ClawHub Skills、OpenAI Apps SDK 的差异。

## 行业影响与未来展望
Skill 将是 2026 年的中型 agent 生态突破口：① 复用度高于普通 prompt template；② 比 fine-tune 更轻；③ 比 RAG 更具行为性。预计 6-12 个月会出现「Skill 市场」（类似 npm），并出现专业 Skill 设计岗位（prompt engineer 进阶版）。建议团队从「最常 ad-hoc 重复的 5 个工作流」起步，把它们做成 Skill。

## 附带链接
- Reddit: https://www.reddit.com/r/AI_Agents/comments/1t1w347/
