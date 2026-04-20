---
title: "Claude Opus 4.6 vs 4.7 争议：一张图引爆的社区大战"
date: "2026-04-21"
generated: "2026-04-21 07:00"
source: "Reddit"
slug: "2026-04-21_07-opus-46-vs-47-controversy"
summary: "2026 年 4 月中旬，Anthropic 发布 Claude Opus 4.7，官方宣称在 14 项基准测试中有 12 项超越前代 Opus 4.6，定价不变（$5/$25 per million tokens）。然而发布仅数天，r"
---

# Claude Opus 4.6 vs 4.7 争议：一张图引爆的社区大战

> 来源：r/ClaudeAI | 2026-04-21

## 1. 事件背景

2026 年 4 月中旬，Anthropic 发布 Claude Opus 4.7，官方宣称在 14 项基准测试中有 12 项超越前代 Opus 4.6，定价不变（$5/$25 per million tokens）。然而发布仅数天，r/ClaudeAI 社区便爆发大规模争议。用户 u/ 发布了一篇题为 *"The Opus 4.6 vs 4.7 Controversy in one image"* 的帖子，用一张对比截图直观展示两版模型在同一任务上的输出差异，迅速引发数百条讨论。

同期另一热帖 *"Claude Opus 4.7 is a serious regression, not an upgrade"* 更是直接定性 4.7 为"严重退步"，将社区情绪推至高潮。

## 2. 核心观点

争议的核心在于 **"基准分数提升 ≠ 实际使用体验提升"**：

- **反对方（大量用户）**：认为 Opus 4.7 在实际编码和长上下文推理中表现退步——模型变"懒"、忽略 `claude.md` 中的指令、输出不完整。
- **支持方（包含官方与评测机构）**：llm-stats.com 数据显示 4.7 在 Graphwalks 推理测试上从 38.7% 飙升到 58.6%；PM 视角评测（boringbot）在 5 项任务中 4.7 赢 4 项（202/250 vs 198/250）。
- **Anthropic 回应**：工程师 Boris Cherny 表示旧版 MRCR 基准过度依赖 distractor-stacking 技巧，正在被淘汰，Graphwalks 更能代表真实推理能力。

## 3. 社区热议与争议点

以下为有代表性的社区声音：

1. **"Overwhelming consensus: massive regression"** —— r/ClaudeAI 热帖评论区的主流声音，多位开发者报告 4.7 在编码任务中"明显变笨"，忽视系统提示词。

2. **"Low-effort 4.7 matches medium-effort 4.6"** —— llm-stats.com 的分析指出，4.7 在低 thinking budget 下即可匹配 4.6 中等 thinking 的质量，意味着单任务成本下降。但用户质疑：这是否以牺牲深度推理为代价？

3. **"Token guzzler"** —— 多名用户（@dejavucoder, @madiator）抱怨 4.7 的 tokenizer 变化导致实际 token 消耗显著增加，虽然单价不变但有效成本上升。

4. **"No explicit force-thinking toggle"** —— 用户 @Yuchenj_UW 指出 Claude Web 端只暴露 "Adaptive" 模式而无强制深度思考开关，导致非编码任务体验明显变差，用户无法手动干预推理深度。

## 4. 行业影响与未来展望

此次争议折射出 LLM 迭代中的深层矛盾：

- **基准 vs 体感**：模型公司依赖 benchmark 讲故事，但用户用的是"手感"。当两者背离时，信任危机随之而来。
- **成本隐性上升**：tokenizer 优化若增加 token 数，等效涨价——这对 API 重度用户是实质性影响。
- **用户控制权**：缺乏 thinking budget 的精细控制已成痛点，未来模型可能需要暴露更多推理参数给用户。
- **版本回退需求**：社区呼声表明，模型提供商可能需要像软件一样提供版本选择（pin to version），而非强制升级。

Anthropic 若不能在后续更新中解决"指令遵循退步"的核心问题，可能面临高端用户流向竞品（如 GPT-5、Gemini Ultra）的风险。

## 5. 相关链接

- [The Opus 4.6 vs 4.7 Controversy in one image](https://www.reddit.com/r/ClaudeAI/comments/1sr4gq2/the_opus_46_vs_47_controversy_in_one_image/)
- [Claude Opus 4.7 is a serious regression, not an upgrade](https://www.reddit.com/r/ClaudeAI/comments/1snhfzd/claude_opus_47_is_a_serious_regression_not_an/)
- [Regression Comparisons From Opus 4.7 to Opus 4.6 for long context reasoning](https://www.reddit.com/r/ClaudeAI/comments/1sn7d6g/regression_comparisons_from_opus_47_to_opus_46/)
- [Claude Opus 4.7 vs Opus 4.6 - llm-stats.com](https://llm-stats.com/blog/research/claude-opus-4-7-vs-opus-4-6)
- [AINews: Anthropic Claude Opus 4.7](https://www.latent.space/p/ainews-anthropic-claude-opus-47-literally)
- [Claude Opus 4.7 - A PM Perspective](https://boringbot.substack.com/p/claude-opus-47-heres-what-works-and)
