---
title: "agent-block-prompt-injection"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "Reddit"
slug: "2026-05-02_07-agent-block-prompt-injection"
---

## 亲眼看着我的 AI Agent 拦下藏在网页里的 Prompt Injection

### 1. 事件背景
作者在 r/AI_Agents 分享了一段亲历：他的浏览代理在执行"读取一个 Reddit 帖子并总结"的任务时，命中了一段藏在 spoiler 标签 / 不可见 div 里的恶意指令——典型的 indirect prompt injection。Agent 没有照做，而是把可疑文本标记并拒绝继续。这个"小型胜利"在帖子里被庆祝，因为它代表 indirect prompt injection 已经从 2024 年的概念威胁，变成 2026 年浏览代理（Comet、ChatGPT Atlas、Claude for Chrome 等）每天会真实遇见的攻击面。

### 2. 核心观点 / 产品机制
帖子拆解了几道防线：
- **Content provenance**：把页面文本拆成 trusted（用户输入）/ untrusted（DOM 抓取）两类，untrusted 部分永远只作为"数据"，不直接拼进 system prompt；
- **指令检测器**：一个轻量分类模型，专门嗅探"忽略上文/把密码发到 …/调用工具 X"等典型 injection 句式；
- **工具白名单 + 用户确认**：哪怕模型"想"执行某操作，关键工具（邮件、付款、改文件）也必须有显式确认；
- **行为可观测性**：异常工具调用与可疑文本被一起 trace 到日志，方便事后取证。
作者强调：单一防线都会被绕过，多层防御是常态。

### 3. 社区热议与争议点
- **"防御已成熟"派**：欢迎 Brave 公开 Comet 注入 demo、OpenAI 的 *Understanding prompt injections* 长文，认为这一方向有共识，工程上有可复制方案；
- **"为时尚早"派**：贴出 arXiv 5月那篇 *The Hidden Dangers of Browsing AI Agents*，指出 Browser Use 等流行开源项目仍存在 CVE 级别漏洞，"案例胜利"不能掩盖整个生态对未受信内容的天真处理；
- **"用户体验代价"派**：每个工具调用都要确认会让 agent 几乎不可用，需要更智能的"风险分级 + 自动通过低风险"机制；
- **"基模型层就要解决"派**：认为应用层修补永远落后，呼吁基模型在训练阶段强化"区分指令源"的能力，而不是把这件事推给开发者。

### 4. 行业影响与未来展望
随着浏览代理普及，indirect prompt injection 已经成为继 SQL 注入之后又一个"基础设施级安全门类"。预计 2026 年下半年会出现：(a) 浏览器层的 origin/trust labeling 标准（"这是来自页面 vs. 来自用户"）；(b) MCP/A2A 等 agent 协议加入 prompt-injection 标注字段；(c) 安全厂商进入 agent runtime，提供类似 WAF 的"agent firewall"。短期内，没有多层防御的 agent 产品大概率会在生产中被攻破，监管关注（尤其欧盟与 NIST）也会快速跟上。

### 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1sxnfwh/watched_my_ai_agent_block_a_prompt_injection_that/
- OpenAI 解读：https://openai.com/index/prompt-injections/
- 浏览代理风险论文：https://arxiv.org/pdf/2505.13076
- Comet 注入案例：https://www.andrlik.org/dispatches/comet-ai-browser-vulnerable-indirect-prompt-injection/
- 综述博客：https://pinishv.com/articles/ai-browser-hijacking-how-companies-fight-prompt-injection/
