---
title: "Building AI agents is mostly plumbing"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-19-ai-agents-mostly-plumbing"
summary: "- Subreddit: r/AI_Agents"
---

# Building AI agents is mostly plumbing

- Subreddit: r/AI_Agents
- 讨论: https://www.reddit.com/r/AI_Agents/comments/1t1pz5d/

## 事件背景
一篇经验贴：作者反思过去半年构建 production AI agent 的工作量分布，结论是「LLM prompt 与模型选择只占 5%，剩下 95% 是 plumbing——错误处理、retry、observability、状态管理、UI 集成、cost monitor、用户权限、audit log」。这一句子在 r/AI_Agents、r/LLMDevs 同步爆款。

## 核心观点 / 产品机制
- 定义 plumbing 工作：
  1. 工具调用边界与 schema 校验；
  2. 长任务的进度持久化（断电恢复）；
  3. 多模型回退 / cost-aware router；
  4. 安全沙箱（容器、网络隔离、secrets）；
  5. 用户体验：streaming、cancel、interrupt；
  6. 计费 / 配额 / 异常告警；
  7. 可观测性（OpenTelemetry trace + LLM-specific span）；
  8. 数据合规（PII、行业法规）。
- 作者强调：这些工作和过去 SaaS / distributed system 的工程问题非常类似——所以 *优秀软件工程师* 的优势在 agent 时代被放大。

## 社区热议与争议点
- 共鸣派（顶赞）：「我也是这种感受，prompt 我两天写完，error handling 写两个月」；
- 反驳派：「prompt 与产品定义才是关键 5%，没有它另外 95% 没意义」；
- 工具派：分享 LangSmith、Helicone、Langfuse、Arize 等可观测平台；
- 框架派：争论 LangGraph、CrewAI、AutoGen 哪个把 plumbing 做得最好；
- 商业派：plumbing 工作量正在催生新一类「agent infra」公司——Temporal-AI、Inngest-AI 等。

## 行业影响与未来展望
2026 年 AI agent 工程化将沿两条线走：① 模型能力更强 → 简单任务一行解决；② 复杂任务的工程难度不降反升 → 需要专门的「agent ops」团队。建议公司：把 agent 项目按真实工程项目立项，配备 SRE，避免「prompt 做完就上线」的劣质实践。

## 附带链接
- Reddit: https://www.reddit.com/r/AI_Agents/comments/1t1pz5d/
