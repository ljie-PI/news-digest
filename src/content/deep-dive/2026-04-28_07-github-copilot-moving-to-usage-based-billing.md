---
title: "GitHub Copilot 转向按量计费模式"
date: "2026-04-28"
generated: "2026-04-28 07:00"
source: "HN"
slug: "2026-04-28_07-github-copilot-moving-to-usage-based-billing"
summary: "2026年4月27日，GitHub 官方宣布从6月1日起，所有 Copilot 计划将全面转向按量计费（usage-based billing）。新模式下，原有的\"高级请求单元\"（PRU）将被 GitHub AI"
---

# GitHub Copilot 转向按量计费模式

> 来源: GitHub Blog | HN 热度: 490 points, 375 comments

## 事件背景

2026年4月27日，GitHub 官方宣布从6月1日起，所有 Copilot 计划将全面转向按量计费（usage-based billing）。新模式下，原有的"高级请求单元"（PRU）将被 GitHub AI Credits 取代，用量按 token 消耗计算（包括输入、输出和缓存 token），按各模型公布的 API 费率结算。各档套餐月费不变——Pro $10/月、Pro+ $39/月、Business $19/用户/月、Enterprise $39/用户/月——但每档包含等额的 AI Credits。代码补全和 Next Edit 建议仍包含在所有计划中且不消耗 Credits。值得注意的是，原有的"降级到低成本模型"回退机制将被取消，用完额度后不再提供备选体验。此前一周，GitHub 已经开始限制个人版用户的使用量，并暂停了 Copilot Business 的自助购买。

## 核心观点

这次计费模式变革的核心逻辑在于：Copilot 已从一个编辑器内的代码补全助手进化为一个能运行长时间、多步骤编码会话的智能代理平台（Agentic Platform）。一个简单的聊天提问和一次持续数小时的自主编码会话，成本可以相差数十甚至数百倍，但在旧模式下用户支付的费用相同。GitHub 长期为此吸收了高昂的推理成本，但这种模式已不可持续。按量计费的本质是将定价与实际使用对齐，同时引入了企业级的"池化额度"机制（团队成员未用完的额度可以在组织内共享），以及管理员预算控制功能。对企业客户，6-8月还将提供提升后的促销额度（Business $30/月、Enterprise $70/月）。

## 社区热议

HN 社区的375条评论中，情绪以质疑和焦虑为主：

1. **与直接 API 的价格对比** 多位用户指出新模式下 Copilot 的 token 价格与直接使用 OpenRouter 或 Anthropic API 几乎持平，Copilot 的增值空间大幅缩小。一位用户表示："降级到 Pro，然后用 OpenRouter（同等价格）处理溢出。对微软来说这似乎是巨大的损失，估计后面还会有更多变化。"

2. **企业锁定效应** 有用户指出微软真正的护城河在于企业合规。用户 dxuh 分析道："企业已经与微软有数据协议，所有数据存储在那里。GitHub Copilot 被这些协议覆盖，而与 Anthropic 签个人协议需要律师介入。" 另一位用户补充说，数据安全审查起步要6周、最长可达6个月。

3. **ZIRP 时代的终结** 用户指出当前的价格变动本质上是 ZIRP（零利率政策）时代增长策略的收尾："以 $20/$100/$200 每月获得如此大量的使用额度本来就不可能持久。这是一种先烧投资者资金、获取用户规模，再转向盈利的经典策略。"

4. **开源与推理成本的未来** 有用户持乐观态度，认为"完全够用的模型的推理成本未来可能持续下降……有人总可以建一个数据中心，塞满开源 DeepSeek 推理服务，以1/10的价格提供服务，同时获得很好的回报——这本身就是一个商业模式。"

## 行业影响

GitHub Copilot 的按量计费转型是 AI 编程工具行业的风向标事件。**AI 工具补贴时代终结**：各大 AI 编码助手（Cursor、Windsurf 等）很可能跟进调整定价，开发者将面临更透明但也可能更高的实际使用成本。**企业采购逻辑变化**：按量计费意味着企业需要更精细地管理 AI 工具支出，CFO 将对 AI 投入有更直接的可见性和控制权。**开源替代加速**：更高的使用成本将推动企业评估开源 LLM（如 DeepSeek）+ 自部署方案的可行性。**Agentic 工作流的成本问题**：当 AI 编码代理成为主流使用模式，token 消耗将呈指数级增长，这对整个行业的定价和可持续性提出了根本性挑战。

## 相关链接

- 原文: https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/
- HN 讨论: https://news.ycombinator.com/item?id=47923357
