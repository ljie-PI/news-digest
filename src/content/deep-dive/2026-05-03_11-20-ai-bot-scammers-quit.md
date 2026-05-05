---
title: "My AI bot made scammers quit"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-20-ai-bot-scammers-quit"
summary: "- Subreddit: r/AI_Agents"
---

# My AI bot made scammers quit

- Subreddit: r/AI_Agents
- 讨论: https://www.reddit.com/r/AI_Agents/comments/1t1nr33/

## 事件背景
开发者分享一个反诈骗 *人皮气球* (scam-baiting) AI agent：当收到诈骗短信 / 邮件时，agent 假装上钩，与对方进行漫长、看似合作的对话，使对方浪费时间。最终若干诈骗团伙在与 bot 交流数小时后主动放弃。视频展示对方愤怒切断聊天的截图。

## 核心观点 / 产品机制
- 架构：① 接收手机 / 邮件 forward；② 通过分类器判断 *诈骗* / *合法*；③ 进入 agent 回复模式；
- 角色：由 LLM 扮演一个迟钝、健忘、对支付细节不熟悉的「目标」；
- 节奏控制：每 5-15 分钟回一次，模拟真人；
- 副作用产物：自动收集诈骗资料 + 钓鱼链接，定期上报给 banks / SpamCop / 国家反诈骗中心；
- 类似项目灵感：英国节目 *Scammer Payback*、whitey.ai 等。

## 社区热议与争议点
- 拥护派：「以子之矛攻子之盾，太爽了」；
- 法律派：讨论「故意拖延对方时间」是否构成 *honeypot* 行为，绝大多数司法辖区合法但需谨慎；
- 安全派：警告若诈骗者怀疑后转向更恶意行为（DDoS、人肉），普通用户使用风险大；
- 资源派：把诈骗者拉到聊天的副作用是占用大量 LLM token；建议用本地小模型（Qwen 7B）即可，省钱。

## 行业影响与未来展望
这是「攻击性 AI agent」的良性应用，可能催生公益型反诈服务，类似当前的 *do-not-call list*，但以 AI 防御。未来值得关注：① 监管对 honeypot agent 的边界；② 银行 / 通信运营商把这种 agent 作为 default opt-in；③ 公益开源版本，和 SMS 转发 webhook 集成。

## 附带链接
- Reddit: https://www.reddit.com/r/AI_Agents/comments/1t1nr33/
