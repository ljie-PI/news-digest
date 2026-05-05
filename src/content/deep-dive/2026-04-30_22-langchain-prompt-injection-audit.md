---
title: "I audited LangChain's core library and found 10+ Prompt Injection vulnerabilities"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-langchain-prompt-injection-audit"
summary: "**Subreddit:** r/AI_Agents"
---

# I audited LangChain's core library and found 10+ Prompt Injection vulnerabilities

**Subreddit:** r/AI_Agents
**Permalink:** https://www.reddit.com/r/AI_Agents/comments/1szq511/i_audited_langchains_core_library_and_found_10/

## 事件背景
作者在 r/AI_Agents 发布技术报告：他基于自研的 RepoInspect 引擎（AST-aware taint tracking + autonomous AI agents）对 LangChain 核心库做了一次自动化安全审计，声称发现了 10+ 处 Prompt Injection 漏洞，绝大多数被传统 SAST（Snyk、SonarQube 等）漏掉。

## 核心观点
帖子核心论点：(1) 传统 SAST 找的是"坏字符串"，但 agentic logic 的核心威胁是"用户数据如何劫持 LLM 指令"，靠静态匹配抓不到；(2) RepoInspect 把代码 AST + 数据流 + LLM call site 串起来，跟踪"用户输入是否流入了 system prompt / tool 描述 / function call 参数"；(3) 找到的 LangChain 漏洞类别包括：未 sanitize 的 RAG context 直接拼接到 prompt、Tool description 可被远程文件覆盖、LLM 输出回灌为 SQL 模板等；(4) 这些不是 LangChain 独有，而是当前所有 agent 框架共有问题。作者放出方法论与样本报告。

## 社区热议
评论高度活跃：(1) 安全派——表示 prompt injection 已被 OWASP LLM Top 10 列为 #1，但工程实践仍滞后，希望作者开源 RepoInspect；(2) 质疑派——LangChain 一直被诟病 API 复杂、易误用，"找出 10 个 injection 不奇怪"，更希望看到对 CrewAI / AutoGen / DSPy 的同类审计；(3) 防御派——讨论 prompt injection 的根本无解性，倡导分层 trust boundary 和 human-in-the-loop；(4) LangChain 作者 hwchase17 出现在评论区，表示已收到具体 issue 编号、正在 patch。

## 行业影响
事件再次提醒"agent 框架自身就是攻击面"。短期：所有主流 agent 框架将被推动接入更严格的 input sanitization 和 tool description signing 机制；中期：LLM 安全工具链（PromptArmor、Lakera、RepoInspect 类）会迎来一轮新融资潮；长期：agentic 应用上线前的"injection penetration test"会像 web app pen-test 一样标准化。

## 链接
- 原帖：https://www.reddit.com/r/AI_Agents/comments/1szq511/i_audited_langchains_core_library_and_found_10/
