---
title: "Mistral Medium 3.5 is now on OpenCode"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "Reddit"
slug: "2026-05-01_13-mistral-medium-35-opencode"
summary: "- **来源**: r/opencodeCLI"
---

# Mistral Medium 3.5 is now on OpenCode

- **来源**: r/opencodeCLI
- **原帖**: https://www.reddit.com/r/opencodeCLI/comments/1t0glvf/mistral_medium_35_is_now_on_opencode/
- **外链**: https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5
- **路由**: https://models.sulat.com/models/mistral-mistral-medium-2604-ef03359b

## 事件背景

OpenCode CLI 刚把 Mistral 最新发布的 Medium 3.5 接入官方 model 路由层。Mistral 本次发布定位为 "vibe remote agents" —— 针对长 trajectory coding agent 工作负载优化，是 Mistral 在被 Anthropic Claude / OpenAI gpt-5 / Qwen3-coder 三家挤压之后，重新切回主战场的一次尝试。

## 核心观点

帖子内容简短——只是宣告上线 + 官方公告链接。从 Mistral 官方公告里摘出的关键点：(1) Medium 3.5 在 SWE-Bench Verified 上达到 ~62% 通过率（比 Medium 3.0 提升 8 个百分点）；(2) 长 context 支持 256K，agent trajectory 记忆持续性好；(3) 价格策略激进——大约是 Sonnet 4.5 的 1/3，定位"中端价位、agent 专用"；(4) 在 OpenCode 中可直接 `/model mistral-medium-3.5` 切换。

## 社区热议

OpenCode 社区反应分两层：(1) **欢迎派**：CLI 用户喜欢 OpenCode 的 multi-provider 思路，新模型上线意味着可以用不同模型做 model-A/B benchmark；(2) **质疑派**：Mistral 在中文与 codegen 长尾测试上仍弱于 Qwen3-coder；某用户做 head-to-head 后表示"agentic code refactor 仍然 Claude Sonnet 4.5 更稳"；(3) 价格党：在 token 成本敏感的小公司中得到关注，因为 Sonnet 4.5 的成本对副业项目偏高。也有用户提醒 Mistral 历史上 model card 与实测表现差距较大，建议自己跑 SWE-Bench Verified 验证。

## 行业影响

模型市场进入"中端价位 agent-grade"细分赛道。过去半年频繁出现的同类对手：DeepSeek V3.2 Coder、Qwen3-Coder-32B、Z.ai GLM-4.6 Flash、Mistral Medium 3.5。共同特征：单价 ~$0.5-2/M tokens、上下文 200K+、SWE-Bench 60%+。对 vibe coding 用户，最佳实践是把 router 配置成 "Sonnet 4.5 for hard tasks / Mistral Medium 3.5 or Qwen3-Coder for routine tasks"，能把成本降到 1/3 以内。OpenCode CLI 这种 multi-provider 工具会因此而吃到更多份额。
