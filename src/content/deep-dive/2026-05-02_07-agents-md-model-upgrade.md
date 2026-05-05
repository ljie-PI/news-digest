---
title: "agents-md-model-upgrade"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-agents-md-model-upgrade"
---

## A good AGENTS.md is a model upgrade. A bad one is worse than no docs at all

### 事件背景

Augment Code 在自家博客发布一份基于实证的 AGENTS.md 系统研究，方法是把数十份内部 monorepo 中的 AGENTS.md 文件拿到 AuggieBench（基于真实 PR 的 agent 评测）上跑：每个任务跑两次（带 / 不带 AGENTS.md），与 senior engineer 已合并的 golden PR 对比打分。结论惊人：好 AGENTS.md 给 agent 带来的提升相当于「从 Haiku 升级到 Opus」级别的质量飞跃；差的 AGENTS.md 反而让结果比没有更糟。同一个文件甚至在同模块下，对一个 bug fix 任务把 best_practices 拉高 25%，对一个复杂 feature 任务把 completeness 拉低 30%。

### 核心观点 / 产品机制

文章给出 7 条可操作模式：(1) 渐进式披露 > 全面覆盖：100–150 行主文件 + 几个 reference 文档，是中型模块（约 100 文件）的最佳配方，提升 10–15%。超过这个长度收益反转。(2) 程序化工作流：把任务写成编号多步流程，能把「无法完成」变成「一次过」——示例：deploy 新 integration 的 6 步流程，让缺文件 PR 比例从 40% 降到 10%，正确性 +25%、完整性 +20%。(3) Decision Table：当代码库有 2–3 种合理做法，用决策表强制提前选型，best_practices +25%。(4) 真实代码片段：3–10 行生产代码示例提升复用率，多了反而 mis-pattern。(5) 领域规则有用，但堆几十条会反向。(6) 每个「don't」配一个「do」——纯禁止性文档让 agent 过度探索、保守、产出更少。(7) 文档要模块化，与代码同结构。最大的失败模式叫「overexploration trap」——agent 被太多 architecture overview 牵着鼻子去读 500K～2MB 的周边文档，本质是 context rot。

### 社区热议与争议点

HN 评论区反应分成几派。第一派（top 评论）扩展原文：「不只是 AGENTS.md，你 harness 看到的所有东西——skills、commands、auto-created memories——都在为你提升或破坏生产力。很多人换了 GSD 或 Superpowers 之后效果变差，恰恰可能是因为用了它们」。这条把研究上升到「所有 agent context 都是双刃剑」的高度。第二派以 Simon Willison 为代表：「我大多数项目根本没有 AGENTS.md/CLAUDE.md。如果项目本身好——清晰文档、完备测试，agent 不需要太多指令也能干活。我经常一句『run tests with uv run pytest』，agent 看了测试就自己学到风格」。第三派反驳：「Greenfield 项目和最近 12 个月发布的新平台版本里，预训练几乎没有，没 AGENTS 不行，模型会用旧语法」。第四派分享重型 AGENTS 实践——一位用 uv workspace 的开发者贴了 60 多行严格规约（构建后端必须 uv_build、禁止 namespace package、禁止 logging 里的 f-string 等），直言「无 .md 文件没有任何 agent 能搞懂我的 layout」。第五派从 token 经济：用 GLM 包月+本地 Strix Halo 「token 不要钱」之后，问题变成 explore-exploit 困境，harness 不透明使「helping vs hurting」无法识别。

### 行业影响与未来展望

这篇文章是 2026 年「prompt engineering 是死的」叙事的反例：在 agent 时代，工程化的 context 设计本身具备类似模型层的杠杆效应。可预期演化：(1) 「AGENTS.md as a skill」的范式会标准化，工具链会出现 AGENTS.md 静态分析器，自动检测 don't 无 do、过长、未模块化等反模式；(2) Auggie/Cursor/Claude Code 会内置评测「我的 context 让 agent 更好还是更差」的 A/B 工具；(3) 模块级 AGENTS.md + 自动加载的层级化结构（类似 CMakeLists.txt）会成为大型 monorepo 标配；(4) 「context rot」会和「context window pollution」一起，成为 AI 编程基础设施的一类核心 bug；(5) 写 AGENTS.md 这件事可能反而被 agent 自己接管——模型自己根据 PR 失败模式自动维护规则集。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47938417
- 原文：https://www.augmentcode.com/blog/how-to-write-good-agents-dot-md-files
