---
title: "He asked AI to count carbs 27000 times. It couldn't give the same answer twice"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-ai-count-carbs-27000-times"
summary: "**链接**：[diabettech.com 文章](https://www.diabettech.com/i-asked-ai-to-count-my-carbs-27000-times-it-couldnt-give-me-the-same-answer-twice/) · [HN 讨论](https://news.ycombinator.com/item?id="
---

# He asked AI to count carbs 27000 times. It couldn't give the same answer twice

**链接**：[diabettech.com 文章](https://www.diabettech.com/i-asked-ai-to-count-my-carbs-27000-times-it-couldnt-give-me-the-same-answer-twice/) · [HN 讨论](https://news.ycombinator.com/item?id=47947490) · 232 points · 295 comments

## 事件背景

作者是糖尿病患者，需要根据食物图像估算碳水以决定胰岛素剂量。他在 4 月底发布了一项实验：对同一张餐盘照片，反复询问主流 LLM（GPT-4 / Claude / Gemini）共 27,000 次，记录每次给出的碳水估算。结论醒目——AI 给出的数字方差巨大、几乎从不重复，并且在一些场景下偏差超过临床安全阈值。

## 核心观点

文章核心结论：(1) 同一图像同一 prompt，GPT-4o 类视觉模型给出的克数分布极宽，标准差可达 20-40g；(2) 模型经常在"米饭碗"和"通心粉"之间无视纹理特征做错主分类；(3) 即便提示给出参考餐具尺寸，估算波动依旧；(4) 最致命的是：用户无法从单次回答中得知不确定性——LLM 的"自信口吻"恰恰是医疗误用的根源。

## 社区热议与争议点

- **临床派**：高票评论强调"碳水计数 ±30g"在 1 型糖尿病中可能直接导致严重低/高血糖，呼吁监管把 LLM 健康类应用归入医疗器械审查范畴。
- **技术派**：争论"是否应该温度=0、是否应让模型输出区间"。多数同意行业目前对 LLM 在医疗中的"概率口径"训练严重缺失。
- **替代方案**：被多次提到的对比是专用 CV 模型（食物识别）+ 营养数据库 + 体积估算的传统流水线，仍比 LLM 更可靠。
- **反方**：少数评论认为患者本就不应单一依赖 AI；这相当于"用错工具被切到手"。

## 行业影响与未来展望

这篇文章在 HN 引爆，是 AI 应用边界的一次重要现实校准。短期看，它会催化食品+健康类 AI 应用对"模型不确定性披露"的合规化讨论；中期看，medical-grade 模型微调与"calibrated confidence"将成为差异化卖点。对开发者的启发：任何把 LLM 直接置于决策回路的"健康 / 财务 / 法律"类应用，都需要 N>1 的统计校验，并且把 variance 暴露给用户而非掩盖。

## 链接

- 原文：https://www.diabettech.com/i-asked-ai-to-count-my-carbs-27000-times-it-couldnt-give-me-the-same-answer-twice/
- HN 讨论：https://news.ycombinator.com/item?id=47947490
