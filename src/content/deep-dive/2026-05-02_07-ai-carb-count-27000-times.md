---
title: "ai-carb-count-27000-times"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-ai-carb-count-27000-times"
---

## He asked AI to count carbs 27000 times. It couldn't give the same answer twice

### 事件背景

一位糖尿病技术博主（Diabettech）发布预印本研究：他用 13 张真实餐食照片，针对 4 个主流模型（GPT-5.4、Claude Sonnet 4.6、Gemini 2.5 Pro、Gemini 3.1 Pro Preview）每张图重复发送 500 多次同一 prompt，温度设为最低，总查询量达 26,904 次。结果触目惊心：同一张图片、同一个模型、同一个 prompt，碳水估算值在重复查询间严重不一致——而对于 1 型糖尿病患者，碳水误差直接换算成胰岛素剂量，可能引发低血糖急症。

### 核心观点 / 产品机制

研究有几个关键数据点。Claude Sonnet 4.6 表现最稳：CV 中位数 2.4%，最差单次查询的胰岛素剂量误差不超过 2 单位。GPT-5.4 的 CV 中位数 8.4%；Gemini 3.1 Pro 10.3%；Gemini 2.5 Pro 11.0%。最极端的是西班牙海鲜饭那张图——Gemini 2.5 Pro 给出从 55g 到 484g 的 429g 区间，按 1:10 ICR 换算等于 42.9 单位胰岛素摆幅，「不是舍入误差，是潜在致命剂量」。还有「精确而错误」问题：芝士三明治标签写明 40g 碳水，但 Claude / Gemini 三个模型在 510 次查询里稳定收敛在 28g（每次都低估 12g），高一致性 ≠ 准确性。GPT-5.4 在「强参考值」食物上有 37% 的查询会造成 >2 单位剂量错误。模型还会幻觉食材（Gemini 3.1 在 17.4% 查询中给芝士三明治多加了「deli meat」）。最后所有模型都返回了高 confidence score——表明置信度无法用于剂量决策。

### 社区热议与争议点

HN 评论区分裂明显。第一派质疑研究方法：「这应该发到 astrology.com 而不是 HN，作者只发图片就期望准确响应？应当用 RAG 接食物营养数据库再测」——帖子很快被反驳：「正是因为 App Store 上一堆走红的应用就是这么做的，作者妻子还是注册营养师都被忽悠」。第二派（@swat550）讨论根本不可解的部分：「即便是人类专家也分不清蛋糕用的是全脂还是脱脂奶」，纯图片 → 营养只能在包装食品上 work，新鲜烹饪的食物理论上需要 bomb calorimeter。第三派提出务实视角：减肥用户对 ±20% 误差不敏感，但糖尿病剂量场景误差 5U 就是急性事件。第四派则警告：现在 App Store 顶级卡路里 app 没什么魔法，「无法做得比前沿模型更好」，这项研究的真正价值是替这一整类应用敲警钟。

### 行业影响与未来展望

这条新闻的真正意义不是「AI 不行」，而是把「医疗级 AI 应用门槛」量化清楚：(1) 对剂量决策类应用，single-shot 推理本质上不安全，必须做 N 次查询取分布、置信区间作为输出，否则用户拿到的就是分布尾端的随机数；(2) 视觉 → 营养的根本边界是「同一图像对应多种制备方式」，靠 prompt 解决不了，必须接称重秤、包装条码、用户自报告等地真值锚点；(3) 监管层面，这类用 AI 决定胰岛素剂量的 App 大概率会被 FDA、MHRA 视为 SaMD（医疗器械软件）重新审视；(4) 用户教育：confidence score 不可信，需要 UI 层面强制提示「这是估计而非测量」。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47947490
- 原文：https://www.diabettech.com/i-asked-ai-to-count-my-carbs-27000-times-it-couldnt-give-me-the-same-answer-twice/
