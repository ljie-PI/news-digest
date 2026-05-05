---
title: "Opus 4.7 全面翻车：社区多帖集中爆发质量回退问题"
date: "2026-04-19"
generated: "2026-04-19 07:00"
source: "Reddit"
slug: "2026-04-19_07-02_opus_47_quality_regression"
summary: "**来源**: r/ClaudeCode, r/ClaudeAI, r/artificial, r/GithubCopilot | **日期**: 2026-04-18"
---

# Opus 4.7 全面翻车：社区多帖集中爆发质量回退问题

**来源**: r/ClaudeCode, r/ClaudeAI, r/artificial, r/GithubCopilot | **日期**: 2026-04-18

---

## 事件背景

Claude Opus 4.7 发布后不到 48 小时，Reddit 多个 AI 相关子版块同时爆发大量负面反馈。r/ClaudeCode 的热门帖子标题包括"Opus 4.7 is dogshit"、"legendarily bad"、"unusable"；r/artificial 的帖子称 Anthropic "completely dropped the ball"。这不是个别用户的抱怨，而是一次**跨社区的集体性质量投诉**。

Anthropic 同期还发布了 Claude Design 产品和 $100K Claude Code 黑客松，但这些正面消息完全被 Opus 4.7 的负面反馈淹没。

## 核心观点/产品机制

社区报告的主要问题：

**1. 幻觉严重恶化**
- 多位用户报告 Opus 4.7 频繁编造不存在的 API、函数名和库
- 一位用户烧了 $120 API credits 测试，结论是"从未见过如此严重的幻觉"
- 有用户称 Claude 开始"制造数据和引用虚假来源"

**2. MRCR 准确率暴跌 50%**
- 一位技术用户引用 MRCR（多轮共指消解）基准，指出 4.7 的准确率只有 4.6 的一半
- MRCR 测试模型在长上下文中找到多个特定信息项的能力——这正是代码库导航的核心能力
- 这解释了为什么用户频繁报告"编辑了错误的文件"和"遗漏引用"

**3. 会话连贯性退化**
- 详细回退报告指出 4.7 出现"TOKEN 级生成异常"——首条消息产生 "somename I am on you" 这样的乱码
- 描述为"像失语症，不像风格选择"

**4. 代码删除而非完成**
- 多位用户报告 Opus 4.7 将"TODO"注释的代码直接删除，而非按提示完成——即使提示明确要求"完成代码"

## 社区热议与争议点

1. **"4.5 是巅峰"的共识**：大量用户认为 Opus 4.5 是 Claude 编码能力的高峰，4.6 开始下滑，4.7 加速恶化。这与 Anthropic 宣传的"每一代更强"形成鲜明对比

2. **自适应 thinking mode 被怀疑是元凶**：Anthropic 在 4.7 中引入了自适应思考模式。有用户引用 MineBench 基准结果，指出 4.7 在创意任务中表现不稳定，可能与此有关。默认 effort 级别从 `high` 静默降至 `xhigh`（但 Pro/Max 用户被压到 `medium`），加剧了不一致性

3. **Copilot 定价火上浇油**：GitHub Copilot 以 7.5x premium request 的"促销价"提供 Opus 4.7，同时计划移除 4.5 和 4.6。用户愤怒地发现：不仅模型变差了，还要付更多钱

4. **竞品趁机抢客**：r/GithubCopilot 的热帖 "Something people should realize" 中，用户发现在 OpenAI Codex 中使用 GPT 5.4 可以**一次通过**同样的 prompt，而 Copilot 中的 Opus 4.6 需要多次迭代。"dumbdown versions"的阴谋论找到了新证据

## 行业影响与未来展望

Opus 4.7 的翻车可能对 Anthropic 造成短期信任危机：
- **开发者正在积极寻找替代**：GPT 5.4、Gemini 3.1 Pro 都在收割 Claude 的不满用户
- **"越新越好"的模型叙事被打破**：用户开始要求保留旧版本的选择权，而非被迫升级
- **Anthropic 需要紧急回应**：沉默会加速用户流失；快速修复或回滚可以重建信任

长远来看，这提醒了一个行业性教训：**模型发布的速度不应以质量为代价**。在 AI 编码助手这种"用户的生产力直接依赖模型质量"的场景中，一次糟糕的发布可以抵消数月的品牌建设。

## 附带链接

- "Opus 4.7 is dogshit": https://www.reddit.com/r/ClaudeCode/comments/1sp4s1b/claude_opus_47_is_dogshit/
- "Legendarily bad": https://www.reddit.com/r/ClaudeCode/comments/1so9uta/opus_47_is_legendarily_bad_i_cannot_believe_this/
- "Unusable": https://www.reddit.com/r/ClaudeCode/comments/1sp7zk1/i_swear_to_god_opus_47_is_unusable/
- "Terrible" (r/artificial): https://www.reddit.com/r/artificial/comments/1so16hr/opus_47_is_terrible_and_anthropic_has_completely/
- MRCR 分析: https://www.reddit.com/r/ClaudeCode/comments/1sp5c2x/why_somemost_see_opus_47_as_a_regression/
- 回退报告: https://www.reddit.com/r/ClaudeAI/comments/1sp1b1b/opus_47_regression_in_conversational_coherence/
- GPT 5.4 对比: https://www.reddit.com/r/GithubCopilot/comments/1spagko/something_people_should_realize/
