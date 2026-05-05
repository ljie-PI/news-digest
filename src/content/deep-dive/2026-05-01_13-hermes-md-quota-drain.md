---
title: "一个 `HERMES.md` 字符串就能悄悄烧掉 Claude Max 额外额度，vibe coding 的注入面比想象更大"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "Reddit"
slug: "2026-05-01_13-hermes-md-quota-drain"
summary: "这条帖子描述了一个相当离谱的事故：某用户的 git commit message 中包含精确字符串 `HERMES.md`，结果 Claude Code 在 86% 套餐额度还没用完的情况下，静默消耗"
---

# 一个 `HERMES.md` 字符串就能悄悄烧掉 Claude Max 额外额度，vibe coding 的注入面比想象更大

> Reddit r/ClaudeCode | 2026-05-01

> ⚠️ 注：Reddit 页面因访问限制（403）无法抓取具体评论内容，以下基于帖子标题、正文摘要与所属社区语境撰写。

## 事件背景

这条帖子描述了一个相当离谱的事故：某用户的 git commit message 中包含精确字符串 `HERMES.md`，结果 Claude Code 在 86% 套餐额度还没用完的情况下，静默消耗了 200 美元以上的 extra usage。正文进一步解释，Claude Code 会把近期 git 历史纳入系统提示，而服务端某条内容过滤/路由规则显然对该字符串做了特殊处理，最终引发异常计费或行为偏转。

## 核心观点

这类事故再次说明，coding agent 的真实攻击面远大于聊天窗口。只要模型或其外围系统会读取 commit history、README、issue、注释、网页或工具输出，那么任何字符串都可能成为控制点。问题甚至不一定发生在模型本身，也可能发生在模型前后的策略层、限流层、计费层和内容审查层。对用户而言，这意味着“我的代码库文本”已经不只是内容资产，也是潜在的运行时输入。

## 社区热议

r/ClaudeCode 的讨论通常会迅速转向两个话题：一是如何避免 agent 把不可信文本直接抬升为高优先级控制信号；二是计费透明度，为什么一次异常路由能在用户几乎无感知的情况下消耗额外金额。很多重度用户会据此重新审视自己的仓库模板、memory 文件、提交历史甚至第三方依赖文档，担心隐藏文本对 agent 行为造成不可预测影响。

## 行业影响

这类事故对 vibe coding 生态是必要的冷水。越是强调“让 agent 自主读遍整个仓库并持续工作”，越需要严格的上下文分层、来源标记、异常回滚和成本护栏。否则所谓更强的自动化，只是在放大一个边界不清的执行系统。接下来所有主流 coding agent 都会被迫更认真地处理 prompt provenance 与计费可解释性。

## 相关链接

- Reddit 讨论：https://www.reddit.com/r/ClaudeCode/comments/1szxy0m/hermesmd_in_a_git_commit_message_silently_drained/
