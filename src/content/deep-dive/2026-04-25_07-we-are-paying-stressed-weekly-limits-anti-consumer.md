---
title: "\"我们花钱买焦虑\"——GitHub Copilot 新周限额引发用户强烈反弹"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-we-are-paying-stressed-weekly-limits-anti-consumer"
summary: "2026年4月20日，GitHub 官方博客发布公告，宣布对 Copilot 个人订阅计划实施一系列重大调整：**暂停所有新用户注册**（包括 Pro、Pro+ 和学生计划）、**收紧"
---

# "我们花钱买焦虑"——GitHub Copilot 新周限额引发用户强烈反弹

## 事件背景

2026年4月20日，GitHub 官方博客发布公告，宣布对 Copilot 个人订阅计划实施一系列重大调整：**暂停所有新用户注册**（包括 Pro、Pro+ 和学生计划）、**收紧使用限额**、并**调整可用模型**——Pro 计划直接移除所有 Opus 系列模型，Pro+ 也将下架 Opus 4.5 和 4.6，仅保留 Opus 4.7。

这一变化的直接导火索是 GitHub 在2026年3月发现的一个严重 bug：其速率限制系统一直在**低估新模型（如 Claude Opus 4.6、GPT-5.4）的 token 消耗量**。这些模型实际消耗的基础设施资源远超前代，但 bug 让它们"看起来很便宜"。修复后，限额骤然收紧，大量用户突然遭遇长达数十甚至上百小时的锁定。据 The Register 报道，有用户遭遇了 **181 小时的封锁**，编码 Agent 在任务中途被直接终止。

Reddit 社区 r/GithubCopilot 上，一篇题为 *"We are paying to be stressed. The new weekly limits are completely anti-consumer"* 的帖子引发了广泛共鸣，直指这一系列操作的反消费者本质。

## 核心观点与产品机制

GitHub 引入了两层限额机制：

1. **会话限额（Session Limits）**：防止高峰时段服务过载，触发后需等待窗口重置。
2. **周限额（Weekly Limits）**：对用户7天内消耗的总 token 数设上限，针对"并行化、长轨迹的 Agent 请求"。

关键争议在于：**周限额与 Premium Request 配额完全独立**。用户可能还有大量 Premium Request 剩余，却已触发周限额被锁定。触发后只能切换到 Auto 模式（由系统自动选择模型），而 Auto 模式普遍被用户反映质量大幅下降。

GitHub 给出的"解决方案"本质是：升级到 Pro+（限额为 Pro 的 5 倍以上），或减少并行工作流、使用低 multiplier 模型。对于每月已支付数百美元额外费用的用户而言，这无异于"花更多钱买更少服务"。

## 社区热议与争议点

围绕此事，社区意见激烈对立：

**反对方（主流）：**

- **付费用户的愤怒**：一位名为 John Clary 的用户向 The Register 反映，他作为 Pro+ 用户每月额外花费数百英镑购买积分，却在周一晚间遭遇 44 小时的周限额锁定。切换到 Auto 模式后，AI 频繁"偷工减料"，项目几乎停滞。他直言："Auto 模式选择的模型质量极差，经常在不通知的情况下走捷径。"

- **学生用户被连环打击**：GitHub 社区讨论中有用户梳理了一条"反消费者时间线"——先移除学生包→转为免费试用→暂停试用→移除顶级模型→在更贵的计划中替换为成本翻倍的模型。一位用户评论："这是几周之内能做到的最反消费者的操作了。"

- **"不是 bug，是商业决策"**：GitHub 社区用户 Delsin-Yu 的评论被 The Register 引用："GitHub 的补贴水平似乎已经到了不可持续的地步。这感觉不像是 bug，更像是一个商业决策。"

**理解方（少数）：**

- 部分技术用户承认，Agent 模式下的并行工作流确实会产生远超订阅价格的推理成本。GitHub 官方也坦承"少数请求的成本就能超过整个计划的价格"。研究咨询公司 StratoAtlas 创始人 Roman Kir 分析指出，问题根源在于"订阅单元与实际成本单元的脱钩"——定价结构已经崩塌。

## 行业影响与未来展望

GitHub Copilot 的困境并非孤例。Anthropic 同样因容量问题在高峰期限制 Claude 使用，OpenAI 的 Codex 也面临速率限制投诉。正如 The Register 所评论的：**"风投补贴的 AI 无限自助餐，账单终于到了。"**

这一事件揭示了当前 AI 编码工具行业的深层矛盾：

- **定价模型滞后于技术演进**：Agent 和子 Agent 的并行化使得 token 消耗呈指数增长，但订阅制定价无法弹性匹配。
- **从"无限"到"有限"的信任危机**：用户以"无限使用"的预期付费，却在事后被追溯性限制，信任遭到严重损害。
- **行业可能转向基于 token 的计费模式**：据独立媒体 Where's Your Ed At 独家报道，微软内部文件显示 Copilot 的周运营成本自年初已翻倍，公司正计划将用户转向基于 token 的计费体系。

对于开发者而言，当前的教训很明确：不要将核心工作流完全押注在单一 AI 工具上，"无限量"的承诺在经济现实面前终将让步。

## 相关链接

- 原帖：[We are paying to be stressed. The new weekly limits are completely anti-consumer](https://www.reddit.com/r/GithubCopilot/comments/1susxug/)
- GitHub 官方公告：[Changes to GitHub Copilot Individual plans](https://github.blog/news-insights/company-news/changes-to-github-copilot-individual-plans/)
- GitHub 社区讨论：[Announcement & FAQ: Changes to GitHub Copilot Individual Plans](https://github.com/orgs/community/discussions/192963)
- The Register 报道：[Customers revolt as GitHub Copilot 'fixes' rate limits](https://www.theregister.com/2026/04/15/github_copilot_rate_limiting_bug/)
- Where's Your Ed At 独家：[Microsoft To Shift GitHub Copilot Users To Token-Based Billing](https://www.wheresyoured.at/news-microsoft-to-shift-github-copilot-users-to-token-based-billing-reduce-rate-limits-2/)
