---
title: "What's new in CC 2.1.124 (+166 tokens) and 2.1.126 (-87 tokens) system prompt"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-cc-system-prompt-changes"
summary: "**链接**：[r/ClaudeAI 帖子](https://www.reddit.com/r/ClaudeAI/comments/1t0gomk/whats_new_in_cc_21124_166_tokens_and_21126_87/) · subreddit: ClaudeAI"
---

# What's new in CC 2.1.124 (+166 tokens) and 2.1.126 (-87 tokens) system prompt

**链接**：[r/ClaudeAI 帖子](https://www.reddit.com/r/ClaudeAI/comments/1t0gomk/whats_new_in_cc_21124_166_tokens_and_21126_87/) · subreddit: ClaudeAI

## 事件背景

社区里有用户系统性追踪 Claude Code（CC）每个小版本的 system prompt 变更，逐 token 统计 diff。这次 4 月底连发的 2.1.124（+166 tokens）和 2.1.126（-87 tokens）两个版本被对比解析，揭示了 Anthropic 在 CC 内部 harness 上的快速迭代。

## 核心观点

发帖人列出了 2.1.124 新增的 system reminder："当用户/linter 修改了文件，但 diff 因为其他已修改文件超过 snippet budget 而被省略时，agent 必须先读文件再操作"。这折射出三件事：(1) Anthropic 通过 system prompt 直接补救 prompt budget 引发的"看不见的修改"；(2) Claude Code 的 harness 已经形成了精细的 token 预算管理机制；(3) 2.1.126 又把部分 reminder 砍掉，说明他们在持续做 ablation。

## 社区热议与争议点

- **逆向工程派**：高赞评论认为这是"通过 system prompt 暴露的工程细节"——agent 框架的真正智能不在模型，而在 orchestration。
- **批评派**：有人讽刺"靠 system prompt 修补 bug"是技术债，正确做法应是 harness 层面强制 stat / read。
- **对比派**：评论拿出 OpenAI Codex CLI、Cursor、Aider 的 prompt 对比，结论是 CC 的 reminder 体系最复杂、也最容易膨胀。
- **隐私争论**：CC 是闭源 binary，但 system prompt 在客户端能被抓取——这种"半透明"是否算开放？

## 行业影响与未来展望

这反映了 2026 年 agent 产品竞争已从模型转向 harness 层。每次 system prompt 微调都直接影响数百万开发者的工具行为，且**这些行为变更没有 release notes**——这是新型的"silent policy update"。中期看，社区会推动 agent 厂商把 system prompt 视为 SemVer 化的契约公开，否则将影响企业合规审计。

## 链接

- 原帖：https://www.reddit.com/r/ClaudeAI/comments/1t0gomk/whats_new_in_cc_21124_166_tokens_and_21126_87/
