---
title: "HERMES.md in commit messages causes requests to route to extra usage billing"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-hermes-md-claude-billing"
summary: "**链接**：[GitHub Issue #53262](https://github.com/anthropics/claude-code/issues/53262) · [HN 讨论](https://news.ycombinator.com/item?id=47952722) · 899 points · 362 comments"
---

# HERMES.md in commit messages causes requests to route to extra usage billing

**链接**：[GitHub Issue #53262](https://github.com/anthropics/claude-code/issues/53262) · [HN 讨论](https://news.ycombinator.com/item?id=47952722) · 899 points · 362 comments

## 事件背景

2026 年 4 月 29 日，Anthropic Claude Code 仓库出现了一个让用户在 HN 上炸锅的 issue：当用户的 git 仓库或 commit message 中存在名为 `HERMES.md` 的文件，Claude Code 会把这些请求悄悄路由到一条"额外计费 (extra usage billing)"的通道，而不是用户预期的订阅额度。社区将其解读为暗箱计费，issue 当天被点爆。

## 核心机制

按 issue 描述，Claude Code 在处理请求时会把仓库内识别出的 `HERMES.md` 视作"高优先级 / 高资源"任务标记，从而切换到一条与按量付费挂钩的更贵路径。问题是：(1) 该文件的存在与切换逻辑都没有出现在公开文档；(2) 用户在 commit 中包含这个文件名也会触发，意味着任意第三方贡献者都可能让 maintainer 的账单被"放大"；(3) 没有显著的 UI 提示。

## 社区热议与争议点

- **Pro Anthropic 一方**：少数评论认为这可能是内部 routing 实验或 bug，呼吁等官方回应再下结论。
- **批评一方**：多数声音直指"暗模式 (dark pattern)"——即使是 bug，也暴露出 Claude Code 的计费层不透明。有评论指出他们在审计账单时发现了对应不上的 token 消耗。
- **安全与信任**：高赞评论强调，第三方 PR 引入特定文件名就能改变 maintainer 的账单——这是供应链攻击面。
- **对比讨论**：有人贴出 Cursor / Cline 的明面 routing 配置，反讽 Anthropic"反向 OpenAI"。

## 行业影响与未来展望

这是 AI 编程工具计费透明度的一个标志性事件。短期 Anthropic 几乎必须发出说明、修补并公开 routing 规则，否则将动摇企业用户对 Claude Code 的合规信任。中期这会推动行业对 AI 工具"按量计费 + 隐式 routing"的合规审视，可能催生"账单可解释性 (billable explainability)"成为采购合同的硬指标。开源 agent 框架（Aider、OpenHands）将获得"我们没有黑盒计费"的相对优势。

## 链接

- GitHub Issue: https://github.com/anthropics/claude-code/issues/53262
- HN 讨论: https://news.ycombinator.com/item?id=47952722
