---
title: "Claude 4.7 x-high 模式\"把道听途说当事实\"：开发者的集体愤怒"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-claude-4-7-hearsay-as-fact"
summary: "---"
---

# Claude 4.7 x-high 模式"把道听途说当事实"：开发者的集体愤怒

> 原帖：[I am getting SO tired of this. 4.7 x-high is latching on to hearsay as fact](https://www.reddit.com/r/ClaudeCode/comments/1suqvv3/)
> 来源：Reddit r/ClaudeCode | 2026年4月

---

## 一、事件背景

Claude Opus 4.7 发布后，Anthropic 为 Claude Code 引入了多级"effort"（推理努力程度）系统，包含 low、medium、high、xhigh、max 五个等级，其中 **xhigh 为默认级别**。然而，自发布以来，大量开发者反馈 4.7 在 xhigh 模式下出现了一种令人抓狂的行为模式——**将未经验证的推测、假设甚至错误信息当作既定事实来执行**。Reddit 用户在帖子中直言"I am getting SO tired of this"（我真的受够了），引发了广泛共鸣。

这并非个别现象。在 4.7 发布后的一两周内，r/ClaudeCode 和 r/ClaudeAI 子版块涌现了大量类似投诉帖，标题从"serious regression"（严重退化）到"dogshit"（垃圾）不等，社区情绪可见一斑。

## 二、核心观点与产品机制

帖主指出的核心问题是：Claude 4.7 在 xhigh effort 级别下，会**将对话上下文中模糊的、推测性的信息"锁定"为确定事实**，然后基于这些错误前提继续推理和生成代码。这种行为在编程场景中尤为危险——模型可能基于一个错误的 API 假设，连续生成大段看似合理但完全不可用的代码。

从产品机制层面看：
- **Effort 级别影响推理深度**：xhigh 模式下模型投入更多 token 进行思考，但"想得越多"不等于"想得越对"——过度推理反而可能放大初始偏差
- **4.7 相比 4.6 更"严格遵守" effort 设定**：低 effort 时收紧范围，高 effort 时则过度展开，导致在 xhigh 下容易"过度自信"
- 有社区成员猜测 4.7 可能是"算力受限版本"（compute-starved），Anthropic 在竞争压力缓解后缩减了推理计算资源

## 三、社区热议与争议点

**1. "幻觉升级"论** — 多位开发者指出 4.7 不仅会产生常规幻觉，还会**将自己编造的"最佳实践"反复注入代码**，越到后期偏离越远。一位处理 700 条数据卡片的用户表示，明明是简单重复任务，模型却"不断幻觉出它认为好的想法，越做越偏"。

**2. Effort 级别选择之争** — 社区出现了激烈的"该用什么级别"讨论。有分析帖指出"大多数人以为 max = 最佳质量"是误解，不同任务应匹配不同 effort。但反对者认为，需要用户手动调参来避免模型犯低级错误，本身就是产品设计失败。

**3. Token 消耗暴增** — 有用户对比发现，同样的工作在 4.6 max 模式下每天消耗约 10% 的周限额，而 4.7 在 high 模式下消耗就已远超此数。即使使用 token 优化工具（如 Caveman），节省也杯水车薪。

**4. "算力阴谋论"** — 一种流传甚广的观点认为，Opus 4.5 之所以强大是因为当时 Anthropic 面对 Gemini 3 的竞争压力而"全力开放算力"，而 4.7 发布时 Google 已"阉割"了 Gemini 3，Anthropic 便不再提供同等算力。这种说法虽缺乏实证，但获得了不少赞同。

## 四、行业影响与未来展望

此事件折射出 AI 辅助编程领域的几个深层问题：

- **可靠性信任危机**：当模型在高推理模式下反而更容易"把猜测当事实"，开发者的信任基础将被动摇。对于依赖 AI 编码的"Vibe Coding"工作流而言，这是致命隐患。
- **Effort 系统的双刃剑效应**：多级 effort 机制本意是让用户按需调节，但实际上增加了认知负担，且默认级别的选择直接影响大多数用户的体验。
- **竞争格局的微妙影响**：社区中 Cursor、Windsurf 等竞品的讨论明显增多。如果 Anthropic 不能快速修复 4.7 的核心问题，可能面临开发者工具市场的份额流失。

Anthropic 需要在后续版本中解决 xhigh 模式下的"过度自信"问题，并对 effort 级别与推理质量的关系做更透明的说明。否则，"道听途说当事实"可能不仅是模型的问题，也会成为用户对 Anthropic 产品承诺的质疑。

---

**相关链接：**
- 原帖：https://www.reddit.com/r/ClaudeCode/comments/1suqvv3/
- 相关讨论 - Opus 4.7 退化论：https://www.reddit.com/r/ClaudeAI/comments/1snhfzd/
- Effort 级别解析：https://www.reddit.com/r/ClaudeCode/comments/1soqwfl/
- Effort 级别数据分析：https://www.reddit.com/r/ClaudeCode/comments/1snun4e/
- "Claude 已经疯了"：https://www.reddit.com/r/ClaudeCode/comments/1sou3q9/
