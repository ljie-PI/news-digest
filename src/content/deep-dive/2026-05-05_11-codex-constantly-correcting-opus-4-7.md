---
title: "\"Codex 在不断修正 Opus 4.7\"：Claude Code 用户对 Opus 退化的体感记录"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "Reddit"
slug: "2026-05-05_11-codex-constantly-correcting-opus-4-7"
summary: "r/ClaudeCode 老问题再上热门：Anthropic Opus 4.7 的\"退化\"在过去几周成为 Claude Code 圈持续抱怨的话题。本帖作者明确写：\"不是 hater，我自己几个月前被 Opus 4."
---

# "Codex 在不断修正 Opus 4.7"：Claude Code 用户对 Opus 退化的体感记录

## 事件背景
r/ClaudeCode 老问题再上热门：Anthropic Opus 4.7 的"退化"在过去几周成为 Claude Code 圈持续抱怨的话题。本帖作者明确写："不是 hater，我自己几个月前被 Opus 4.6 巅峰时期惊艳过，从 4.7 起明显感到代码质量下滑"。他现在的工作流是 Opus 与 Codex 并跑，所有 Opus 输出都过 Codex 二次审。

## 核心观点
作者的具体抱怨集中在：(1) **过度工程化**——给 Opus 4.7 一个简单任务，它会自己增加多层抽象、拆出无意义工具函数；(2) **错失任务核心**——绕着边缘需求转，主诉求反而没改；(3) **死循环**——重复在同一个错误的方向打补丁。换 Codex 后他发现："Codex 在大半场景下要把 Opus 改一遍才像合格代码"。这与上周 Louis Rossmann 关于 Anthropic 计费"暗 patterns"的视频遥相呼应——同一笔订阅费，模型质量下降 + 用量限制收紧 = 双重缩水。

## 社区热议与争议
帖子下面分裂为三派：(1) 共鸣派（最多）—— 大量 Claude Max 用户报告同感，特别是从 4.6 升 4.7 后；(2) 反方—— Anthropic 内部 RLHF 偏好"长且解释充分的代码"，对资深工程师显得啰嗦但对新手有用；(3) 工具派—— 有人提示开 OpenClaw / Cline 把 Opus + Codex 拼成 router，用便宜模型做 80% 工作，Opus 只在真硬骨头时上；与 r/openclaw 同期的"我取消 200刀 Max 订阅，路由后实际只花 30 美元"高赞帖形成呼应。一个普遍 cons：盲信 Codex 也会出问题，"Codex 修 Opus" 不等于"Codex 是对的"，多模型互相 lint 仍需人类做最后判断。

## 行业影响
2026 年代码 Agent 市场已经从"哪个模型最强"转向"哪个组合性价比最高"。Anthropic 计费透明度受持续舆论压力，OpenAI Codex 在下载量上首次超越 Claude Code（同期另一篇热门帖证据）。这种"双模型交叉审"的工作流，可能成为下一波 Vibe Coding 默认范式。

## 链接
- 原帖：https://www.reddit.com/r/ClaudeCode/comments/1t3t3k1/codex_constantly_correcting_opus_47/
