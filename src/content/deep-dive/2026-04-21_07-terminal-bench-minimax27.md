---
title: "Terminal Bench：MiniMax M2.7 高调登场却\"摔了一跤\"？"
date: "2026-04-21"
generated: "2026-04-21 07:00"
source: "Reddit"
slug: "2026-04-21_07-terminal-bench-minimax27"
summary: "---"
---

# Terminal Bench：MiniMax M2.7 高调登场却"摔了一跤"？

> 来源：r/LocalLLM · [原帖链接](https://www.reddit.com/r/LocalLLM/comments/1sr54k7/terminal_bench_minimax27_lands_with_a_splat/)
> 日期：2026-04-21

---

## 1. 事件背景

2026 年 4 月中旬，中国 AI 公司 MiniMax 发布了其最新旗舰模型 **MiniMax M2.7**——一个 230B 参数的 MoE 开源模型，主打"自我进化"（Self-Evolution）概念。官方宣称该模型在多项软件工程基准上表现卓越：SWE-Pro 56.22%（匹配 GPT-5.3-Codex）、VIBE-Pro 55.6%（接近 Opus 4.6）、**Terminal Bench 2 达到 57.0%**。MiniMax 还特别强调 M2.7 参与了自身迭代过程，能够自主构建 agent harness、运行强化学习实验，是"首个深度参与自身进化的模型"。

然而，当社区用户在 r/LocalLLM 上以 **"Terminal Bench: Minimax2.7 lands with a splat"**（啪叽一声摔了个大马趴）为标题发帖时，画风就完全不同了。帖子的核心论点是：**官方公布的 Terminal Bench 成绩看似亮眼，但在实际独立测试和社区复现中，M2.7 的表现远未达到宣传水平。**

## 2. 核心观点与测试结果

从已有的社区反馈和独立评测来看，M2.7 面临几个关键质疑：

- **官方 Terminal Bench 2 得分 57.0%** 是在特定条件下测得的——使用 Claude Code 2.0.64 作为评测脚手架（scaffolding），修改了部分 Dockerfile，统一扩展了 sandbox 规格至 8 核 CPU / 16GB 内存，超时设为 7200 秒。这些条件在普通用户本地环境中很难复现。
- 在 **vals.ai 的独立评测**中，M2.7 的 Vals Index 准确率仅为 **59.58% ± 2.00**，延迟高达 619.59 秒，单次测试成本 $0.16——与官方宣传的"接近 Opus"定位存在落差。
- r/LocalLLaMA 上的用户对比测试显示，虽然 M2.7 单价便宜，但实际使用中 **token 消耗量是 Kimi 的 3.9 倍**，综合下来反而更贵 2.4-4 倍。Kimi 在缓存命中率上也大幅领先。
- 与 GLM-5.1 的对比中，M2.7 在 Terminal Bench 2.0 上得分 56.2（接近官方数据），但 GLM-5.1 在多文件编辑、跨模块重构等实际工程任务中表现更稳定。

## 3. 社区热议与争议点

Reddit 社区的讨论围绕几个焦点展开：

**争议一：Benchmark 条件的公平性。** 多位用户指出，MiniMax 在测试 Terminal Bench 时使用了定制化的 Docker 环境和特定脚手架，这让结果难以在标准条件下复现。有评论直言："如果你需要 Claude Code 来当拐杖才能跑出好成绩，那到底是在测你的模型还是在测 Claude？"

**争议二：实际成本与宣传脱节。** 一位用户在 r/LocalLLaMA 详细测算后发现，M2.7 虽然纸面单价低于 Kimi，但因为 token 消耗量远高于竞品，实际使用成本反而更高。评论写道："While MiniMax is cheaper on paper, it took 3.9x as many total tokens as Kimi, which makes it between 2.4x and 4x more expensive."

**争议三：benchmark 饱和与区分度不足。** 有用户指出截图中多个模型得分都在 85% 以上，质疑 benchmark 已经饱和（"most models from the screenshot are within the error margin, plus the bench seems saturated"），难以真正区分模型能力。

**争议四：自我进化叙事的营销成分。** M2.7 最大的卖点是"参与自身进化"，但社区中不少人认为这更像是精心包装的 PR 叙事而非技术突破。自主优化 scaffold 参数（温度、frequency penalty 等）并不算新鲜事，将其包装为"自我进化"有过度营销之嫌。

## 4. 行业影响与未来展望

M2.7 的这次"着陆"折射出当前 LLM 行业几个深层趋势：

**Benchmark 信任危机加深。** 当厂商可以通过定制脚手架、调整 Docker 环境、选择性报告来优化成绩时，benchmark 数字的可信度正在被系统性地侵蚀。Terminal Bench、SWE-bench 等曾被视为"接近真实工程"的评测，现在也面临与传统学术 benchmark 同样的 gaming 问题。

**开源 MoE 模型的落地困境。** M2.7 是 230B 参数的 MoE 模型，虽然 Unsloth 已提供 4-bit GGUF 量化方案，但仍需 128GB 的 Mac 或等量 VRAM 才能本地运行。对于 r/LocalLLM 社区用户来说，这与"本地可用"之间仍有很大距离。

**中国 AI 公司的全球化路径。** MiniMax 从 M2 系列开始持续在开源社区发力，M2.7 在 HuggingFace 和 Ollama 上都有部署。但社区的苛刻评价说明，仅靠 benchmark 数字已不够——需要在实际用户场景中经受住考验，才能真正赢得开发者信任。

未来值得关注的是：MiniMax 是否会针对社区反馈调整评测方法论，以及 M2.7 的"自我进化"框架能否在后续版本中展现出真正的复合增长效应。

## 5. 相关链接

- [Reddit 原帖 - r/LocalLLM](https://www.reddit.com/r/LocalLLM/comments/1sr54k7/terminal_bench_minimax27_lands_with_a_splat/)
- [MiniMax M2.7 官方发布](https://www.minimax.io/news/minimax-m27-en)
- [MiniMax M2.7 模型页](https://www.minimax.io/models/text/m27)
- [HuggingFace 模型卡](https://huggingface.co/MiniMaxAI/MiniMax-M2.7)
- [Unsloth 本地运行指南](https://unsloth.ai/docs/models/minimax-m27)
- [Vals.ai 独立评测](https://www.vals.ai/models/minimax_MiniMax-M2.7)
- [r/LocalLLaMA 独立 benchmark 讨论](https://www.reddit.com/r/LocalLLaMA/comments/1rxwcda/benchmarked_minimax_m27_through_2_benchmarks/)
- [GLM-5.1 vs M2.7 对比](https://www.reddit.com/r/LocalLLaMA/comments/1s8b7ch/glm51_vs_minimax_m27/)
