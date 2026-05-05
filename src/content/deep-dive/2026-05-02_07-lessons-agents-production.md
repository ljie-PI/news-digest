---
title: "lessons-agents-production"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "Reddit"
slug: "2026-05-02_07-lessons-agents-production"
---

## 把 AI Agent 推进生产环境后，我们学到的几件事

### 1. 事件背景
原帖来自 r/AI_Agents，作者以"长文回顾"的方式分享在过去一年把多个 agent 系统推向生产、服务真实付费用户后的经验教训。这是 2025–2026 行业关键转折期的常见反思帖：从"demo 好看 → 生产能跑"是绝大多数团队踩坑最深的一段路，与 Datadog 的 *State of AI Engineering* 报告中的结论高度呼应——失败的并不是模型，而是工程。

### 2. 核心观点 / 产品机制
帖子提炼的高频教训：
- **Tool 设计胜过 prompt 调优**：80% 的可靠性来自把工具接口设计得"agent 看一眼就知道怎么用"——明确的 schema、严格的失败信息、幂等语义；
- **小步多 step，少一次大 plan**：长 plan 一旦走偏，恢复成本极高；状态机 / 短 plan + 显式 critic 比 ReAct 大循环稳；
- **Eval 必须先于 prompt**：没有 golden set 的 prompt 调优是赌博；用真实生产 trace 回放是最好的回归测试；
- **成本与延迟一起治理**：单看 token cost 会忽略人月成本；frontier 模型用于 plan，廉价模型用于 extract/format，是性价比最优解；
- **Memory 谨慎 + 可解释**：vector memory 容易"污染"，纯文本 wiki/notes 更可控；
- **Human-in-the-loop 的退路**：关键操作（写库、付款、发邮件）必须留 confirm 钩子。

### 3. 社区热议与争议点
- **"Tooling 才是壁垒"派**：评论里有人激进地说"框架（LangChain/CrewAI）几乎不重要，工具与数据接口才决定 agent 能力上限"；
- **"反 ReAct"派**：多位用户认同 ReAct 在长任务上的脆弱性，分享自己改写为 plan-execute-verify 三段式后稳定性显著提升；
- **"Memory 是陷阱"派**：贴出案例——agent 把一次错误结论写进 memory，之后所有 session 都被污染；强调 memory 必须有 TTL + 人审；
- **"被低估的成本侧"派**：有创业者算账，agent 的真实成本来自 retry/反思/工具调用链路放大，发现 90 天账单膨胀 4 倍，呼吁默认开启 budget guard。

### 4. 行业影响与未来展望
这类总结帖正在变成行业的"非正式 RFC"。它们与 Anthropic 的 *Building effective agents*、OpenAI 的 agent design guide、LangChain 的 production agents 文档共同收敛出一套早期工程共识：**agent 工程 ≈ 分布式系统 + 工具设计 + eval pipeline**，而不是 prompt 创意。下一阶段，工具协议（MCP、A2A）的标准化、eval-as-code 的工具链、可观测性（OpenLLMetry）会迅速成为新基础设施。会写 prompt 的红利结束，懂工程纪律的团队开始拉开身位。

### 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1t09uei/lessons_learned_building_agents_in_production/
