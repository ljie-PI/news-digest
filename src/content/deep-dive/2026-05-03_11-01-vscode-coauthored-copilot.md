---
title: "VS Code inserting 'Co-Authored-by Copilot' into commits regardless of usage"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-01-vscode-coauthored-copilot"
summary: "- HN: https://news.ycombinator.com/item?id=47989883 (900 points)"
---

# VS Code inserting 'Co-Authored-by Copilot' into commits regardless of usage

- HN: https://news.ycombinator.com/item?id=47989883 (900 points)
- 链接: https://github.com/microsoft/vscode/pull/310226

## 事件背景
社区发现 VS Code 在最近的版本里向 git commit message 末尾自动追加 `Co-Authored-by: Copilot <copilot@github.com>` 行，即使开发者并没有使用 Copilot 完成本次编辑、甚至完全没有启用 Copilot 也照样写入。引发讨论的 PR `microsoft/vscode#310226` 试图把这个写入逻辑改回「只在用户实际接受了 Copilot 建议」时才生效，但讨论很快从代码细节扩散到产品决策与商业动机层面。

## 核心观点 / 产品机制
内置的 Source Control 视图在生成 commit summary 时会调用 Copilot Chat 的 commit-message 建议；只要这一调用发生，写入器都会在尾部追加 trailer。问题在于 trailer 含义被混用：Git 社区里 `Co-Authored-by` 是一个有明确语义的署名字段，会出现在 GitHub 用户的贡献统计、PR 时间线、`shortlog` 上。把它无条件地贴到提交里，等于把每一笔人写代码也算成 Copilot 的产出。PR 的修复方向是：仅当用户接受了由 Copilot 产生的代码补全或编辑建议、并且 commit 中包含这些 hunk 时才追加 trailer。

## 社区热议与争议点
- 反对派最大的不满是「营销之名行污染版本历史之实」：开发者 Jonas 在评论里贴出公司内部 monorepo 的 `git log`，凡是过去几个月 VS Code 用户提交的几乎全部带 Copilot 署名，而其中大部分提交者根本没装 Copilot 扩展；
- 法务/合规视角：`@indrora` 等人指出在欧盟 AI Act 与企业内部源代码追溯流程里，「谁写了这行代码」是合规关键，错误标注可能被作为证据；
- 中立派认为：trailer 本身可以保留，但应当默认关闭，由用户显式 opt-in，并且写入前在 UI 中明示；
- 拥护派（少数）：trailer 让团队透明知道 AI 参与度，长远有利于代码审计。

## 行业影响与未来展望
这是一次典型的「AI 工具默默改变开发者行为留痕」的例子。GitHub 之后大概率会把 Copilot Trailer 调整为更细粒度的语义（例如 `Assisted-by` 而不是 `Co-Authored-by`），并默认关闭。更深层议题在于：当 IDE 后台与 LLM 交互越来越多，它们对 commit、issue、PR 等开发协作产物的隐性写入也会越来越多——透明度、可关闭、可审计将成为下一阶段的合规基线。对企业团队来说，建议立刻在 CI 上加一条对 commit trailer 的校验，同时检查内部统计仪表盘是否被 Copilot 署名污染。

## 附带链接
- PR: https://github.com/microsoft/vscode/pull/310226
- HN 讨论: https://news.ycombinator.com/item?id=47989883
