---
title: "They Really Removed Opus 4.6! — GitHub Copilot 模型缩减风波"
date: "2026-04-21"
generated: "2026-04-21 07:00"
source: "Reddit"
slug: "2026-04-21_07-they-really-removed-opus-46"
summary: "2026 年 4 月 10 日，GitHub 官方通过 Changelog 宣布\"退役 Opus 4.6 Fast\"模型，理由是\"精简模型供给、聚焦用户最常用的模型\"。仅 10 天后（4 月 20 日），GitHub 进"
---

# They Really Removed Opus 4.6! — GitHub Copilot 模型缩减风波

## 事件背景

2026 年 4 月 10 日，GitHub 官方通过 Changelog 宣布"退役 Opus 4.6 Fast"模型，理由是"精简模型供给、聚焦用户最常用的模型"。仅 10 天后（4 月 20 日），GitHub 进一步升级限制：**Opus 模型从 Pro 计划中完全移除**，Opus 4.5 和 4.6 也将从 Pro+ 中下架，仅保留最新的 Opus 4.7。同时，Pro/Pro+/Student 三个付费计划暂停新用户注册，现有用户面临更严格的用量上限。

这一系列操作在 Reddit r/GithubCopilot 社区引爆讨论。帖子 *"They really removed Opus 4.6!"* 反映了用户从发现模型消失到确认为官方行为的震惊过程。

## 核心观点

GitHub 官方将此定性为"保障服务可靠性"的必要手段——高并发和密集使用对共享基础设施造成了"显著压力"。但用户普遍认为这是**变相降级服务**：付费用户失去了选择权，被迫使用"Auto mode"（由系统决定调用哪个模型），或升级到更贵的 Pro+ 计划。

## 社区热议与争议点

1. **学生用户首当其冲**：早在 3 月中旬，Student 计划就已移除 Claude Opus 4.6 和 Sonnet 4.6 的手动选择权。GitHub 社区 Discussion #189268 中有用户表示："I completely disagree and am deeply disappointed with the decision to remove Claude Opus 4.6, Claude Sonnet 4.6, and GPT-4 from the models available in the Student plan." 学生群体认为这违背了 GitHub 教育支持的初衷。

2. **"Auto mode" 信任危机**：官方建议用户使用 Auto 模式作为替代，但社区普遍质疑 Auto 模式会偷偷降级到廉价模型。用户无法确认实际调用的是哪个模型，透明度严重不足。

3. **付费用户的"背刺感"**：Pro+ 用户（月费 $39）发现自己花了更多钱，模型池反而在缩小。r/ClaudeAI 上也出现了"GitHub removed Opus 4.6 from student plan, what are you guys using now?"的讨论，用户开始集体迁移到 Anthropic 官方 API 或 Cursor 等竞品。

4. **退款窗口的微妙信号**：GitHub 在公告中提供了 4 月 20 日至 5 月 20 日的退款窗口，这一罕见举措本身就暗示官方预期到了大规模用户流失。

## 行业影响与未来展望

这次事件暴露了 AI 编码助手赛道的核心矛盾：**顶级模型的推理成本与订阅制定价之间的不可调和**。GitHub 作为中间商，需要向 Anthropic 支付 API 调用费用，当 Opus 级别模型被大量"Vibe Coding"用户高频调用时，利润空间被迅速压缩。

短期来看，这将加速用户向提供更透明模型选择的竞品（Cursor、Windsurf、直接 API 调用）迁移。长期来看，GitHub 可能需要引入按量计费或分级模型访问的混合定价模式，而非简单粗暴地砍模型。

对于 Anthropic 而言，这也是一个信号：其模型的分发渠道过度依赖 GitHub 等中间平台，可能需要强化自有开发者工具生态。

## 相关链接

- Reddit 原帖：https://www.reddit.com/r/GithubCopilot/comments/1sr3dlw/they_really_removed_opus_46/
- GitHub Changelog（4/10 退役 Opus 4.6 Fast）：https://github.blog/changelog/2026-04-10-enforcing-new-limits-and-retiring-opus-4-6-fast-from-copilot-pro/
- GitHub Changelog（4/20 计划调整）：https://github.blog/changelog/2026-04-20-changes-to-github-copilot-plans-for-individuals/
- GitHub 社区讨论 #189999：https://github.com/orgs/community/discussions/189999
- GitHub 社区讨论 #189268（学生计划）：https://github.com/orgs/community/discussions/189268
