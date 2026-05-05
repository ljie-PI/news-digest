---
title: "qwen36-vs-gemma4-packman"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "Reddit"
slug: "2026-05-02_07-qwen36-vs-gemma4-packman"
---

## Qwen 3.6 27B vs Gemma 4 31B 写 Pac-Man：当"快"遇上"创意"

### 事件背景

2026 年 5 月初，r/LocalLLaMA 上 u/SnooMarzipans2470 发起一场轻量级但颇具代表性的本地模型 PK：在 MacBook Pro M5 Max（64GB RAM）上让 **Qwen 3.6 27B** 与 **Gemma 4 31B** 一次性写一个 Pac-Man 游戏。结果出乎意料：Qwen 3.6 27B 跑了 18 分钟生成 33,946 tokens，输出洋洋洒洒"创意爆棚"；Gemma 4 31B 仅用 3 分 51 秒、6,209 tokens 就给出"短小精干"的可玩版本。视频对比片段刷屏后，引发了"本地 LLM 评测维度该如何重构"的深度讨论。

### 核心观点 / 产品机制

- **吞吐数据**：Qwen 32 tok/s vs Gemma 27 tok/s——Qwen 略快，但 Gemma 总耗时仅约 1/5。
- **输出风格分化**：Qwen 倾向"长链思考 + 视觉装饰 + 多文件结构"；Gemma 倾向"紧凑代码 + 一文件搞定 + 立刻可跑"。
- **One-shot 任务上 Gemma 完胜**：在没有迭代、没有调试反馈的"一次出货"场景下，Gemma 4 31B 的产物可玩性更高，被视为 RLHF + Instruction Tuning 的优势体现。
- **Qwen 的"创意溢价"**：长输出在多轮迭代/更复杂规模任务（如做一个完整小游戏框架、UI 系统）下可能反超，但 one-shot 不利。
- **硬件背景**：M5 Max 64GB 统一内存，对 27B-31B 量级 Q4/Q5 量化是甜蜜区，可视作 Apple Silicon 上的本地基准。

### 社区热议与争议点

- **"评测应该看什么"** 成为争论焦点。u/AaronFeng47 写"我宁愿 4 分钟拿到能跑的代码，也不要 18 分钟拿到一篇散文式响应"，得到大量赞同。
- **反对意见**：u/BalorNG 反驳"创意题不能用 one-shot 衡量，Qwen 是为'多轮共创'优化，Gemma 是为'一次完成'优化，定位不同"。
- **是否量化影响**：评论挖出 Qwen 3.6 在 Q4_K_M 与 BF16 之间表现差异较大，质疑测试是否使用相同量化级别——见同期发布的 Qwen 3.6 量化评测（同分区另一帖）。
- **Gemma 团队回应**：Google DeepMind 工程师在评论致谢，并暗示 Gemma 4 RLHF 阶段刻意优化了"代码任务紧凑性"作为差异化路线。
- **MacBook M5 Max 成为新基准机**：多人请求"以 M5 Max 64GB 为标准，建立社区评测基线"。

### 行业影响与未来展望

这次对决揭示了**"本地 LLM 评测正在从 benchmark 分数转向工作流贴合度"**：在终端用户场景里，"快 + 简洁 + 可用"的价值往往高于"长 + 创意 + 复杂"。短期影响：(1) 本地 LLM 用户会形成"任务-模型"匹配习惯——code one-shot 用 Gemma，长链思考用 Qwen；(2) Apple Silicon 64GB+ 设备会被视作"消费级 AI 工作站"标准，刺激 M-series Studio / Pro 销量；(3) 评测社区可能新增"任务时间预算"维度，关注"在 5 分钟内完成度"等真实约束。对开发者而言，"模型组合 + 路由"成为本地工作流标配。

### 附带链接

- Reddit 帖子：https://www.reddit.com/r/LocalLLaMA/comments/1t0epei/qwen_36_27b_vs_gemma_4_31b_making_packman_game/
- 视频片段：https://v.redd.it/s0czzkm85fyg1
