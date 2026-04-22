---
title: "Gemma 4 vs Qwen 3.5 Vision on vLLM：一场视觉模型的本地化对决"
date: "2026-04-23"
generated: "2026-04-23 07:00"
source: "Reddit"
slug: "2026-04-23_07-gemma4-vs-qwen35-vision-vllm"
summary: "---"
---

# Gemma 4 vs Qwen 3.5 Vision on vLLM：一场视觉模型的本地化对决

> 来源：r/LocalLLM | 作者：lukaLLM  
> 原帖：https://www.reddit.com/r/LocalLLM/comments/1ssy08g/  
> 配套仓库：https://github.com/lukaLLM/Gemma4_vs_Qwen3.5_Vision_Setup_Dockers

---

## 一、事件背景

2026 年 4 月，Reddit 用户 lukaLLM 在 r/LocalLLM 发布了一篇引起广泛关注的帖子——**"Gemma 4 vs Qwen 3.5 Vision on vLLM — 5 things I learned benchmarking them side-by-side"**，分享了在本地环境中使用 vLLM 同时部署 Google Gemma 4 31B 和阿里 Qwen 3.5 27B 进行视觉任务对比的实战经验。

这篇帖子并非简单的跑分报告，而是配套了完整的开源工具链：两个 Docker 化的 vLLM 服务分别跑 Qwen 3.5-27B-FP8 和 gemma-4-31B-it-FP8，加上一个 Gradio 比较界面，支持图像、视频、纯文本的 side-by-side 对比。作者还录制了系列视频教程，从搭建到调优到长视频处理，形成了一套完整的本地 VLM 实战方法论。

背景上看，Gemma 4（2026年4月发布）和 Qwen 3.5（2026年2月起分批发布）是当前开源多模态领域最强的两个模型家族。前者来自 Google DeepMind，后者来自阿里 Qwen 团队，都采用 Apache 2.0 许可，都支持视觉理解，在社区中的人气旗鼓相当。

## 二、核心观点与技术对比

从帖子标题和 GitHub 仓库中可以提炼出作者的五个关键发现，围绕以下维度展开：

### 1. Reasoning Budget（推理预算）差异显著
两个模型都支持"思考模式"，但机制不同。Qwen 3.5 继承了混合思考模式（hybrid thinking），可通过 `thinking_token_budget` 精细控制推理深度。Gemma 4 则使用 `max_soft_tokens` 控制推理 token 上限。作者在 Docker 配置中为 Gemma 设置了默认 280 soft tokens，暗示 Gemma 的推理需要更保守的资源管理。

### 2. FP8 量化下的实际表现
两个模型都使用 FP8 量化部署（Qwen/Qwen3.5-27B-FP8 和 RedHatAI/gemma-4-31B-it-FP8-block），这意味着可以在单张高端消费级 GPU 上同时运行两个服务。作者的 Docker 配置都设置了 `--max-model-len 10000` 和 `--max-num-seqs 1`，属于保守策略，确保两模型能共存于一张 GPU。

### 3. 输入预处理的重要性
仓库中一个被低估的亮点是共享预处理管线——两个模型看到的是经过相同 ffmpeg 处理的图像/视频输入（统一分辨率、帧率），确保对比公平。这体现了一个成熟的 benchmarking 理念：**控制变量比跑分数字更重要**。

### 4. 视频理解能力的分水岭
仓库支持长视频分段处理，包含 "Balanced (30s/2s)" 和 "Fine-grained (2s/0.5s)" 两种分段策略。结合社区反馈，**Qwen 3.5 在多图/视频理解上明显更强**——有用户测试过一次输入约 280 帧，Qwen 表现出色，而 Gemma 在此类场景下则相对吃力。

### 5. 文本推理质量 vs 工具调用可靠性的取舍
多个社区讨论表明，Gemma 4 在纯文本推理和分析质量上更胜一筹（AIME 2026 得分 89.2% vs Qwen 的约 49%），但在工具调用（tool calling）和 agent 场景中可靠性不足。有用户反映 Gemma 4 在 Home Assistant 和 agent 框架中频繁出错，最终回退到 Qwen 3.5 122B。

## 三、社区热议与争议点

这一话题在 r/LocalLLM 和 r/LocalLLaMA 都引发了大量讨论，以下是几个有代表性的观点：

1. **"Gemma 推理更深，但 Qwen 更实用"**——有用户在 r/LocalLLaMA 指出，Gemma 4 31B 在复杂分析任务上首次尝试就能给出更全面的结果，能更好地关联多个子任务，但推理和输出阶段明显更慢。

2. **"Qwen 视觉碾压 Gemma"**——一位用户明确表示，在图像和图像序列处理上 Qwen 远胜 Gemma，特别是在视频帧批量输入的场景中。

3. **"Gemma 的 tool calling 不可靠"**——有用户用 Gemma 4 31B 8bit + vLLM 测试了一天，发现简单聊天没问题，但在智能家居控制和 agent 编排中频繁失败，最终切回 Qwen 3.5 122B MoE。

4. **规模选择之争**——Qwen 3.5 提供从 0.8B 到 397B 的 8 个尺寸，Gemma 4 仅有 4 个。社区普遍认为 Qwen 在硬件适配灵活性上胜出，但 Gemma 的 26B MoE（每 token 仅激活 4B 参数）被认为是性价比甜点。

## 四、行业影响与未来展望

这次社区驱动的对比实验揭示了几个重要趋势：

**本地多模态进入实用阶段**——FP8 量化 + vLLM + Docker 化部署让两个 30B 级别的视觉模型可以在单机共存运行，这在一年前几乎不可想象。

**Benchmark ≠ 实用性**——Gemma 4 在标准测试中大幅领先，但在真实 agent 场景中反而不如 Qwen 稳定，这再次证明跑分和落地之间存在鸿沟。

**视觉理解成为新战场**——随着越来越多用户需要本地处理图像和视频（安防、内容审核、本地搜索索引），视觉模型的实际部署体验将成为开源模型竞争的关键维度。

**开源工具链的价值被低估**——lukaLLM 的贡献不仅是跑分，更是提供了一套可复现的对比框架。这种"compare lab"模式值得更多开发者采纳。

展望未来，Gemma 和 Qwen 团队都在快速迭代。Qwen 在多语言（201 种语言）和视觉领域的优势短期内难以撼动，而 Gemma 在纯推理质量上的领先也为其在特定垂直场景（如代码分析、数学推理）奠定了基础。最终赢家可能不是某一个模型，而是能灵活切换两者的工作流——正如 lukaLLM 的 compare lab 所展示的那样。

---

## 参考链接

- 📌 原帖：https://www.reddit.com/r/LocalLLM/comments/1ssy08g/
- 🔧 GitHub 仓库：https://github.com/lukaLLM/Gemma4_vs_Qwen3.5_Vision_Setup_Dockers
- 📹 配套视频（第5集）：https://www.youtube.com/watch?v=lqjuztEiyD0
- 📊 Gemma 4 vs Qwen 3.5 基准对比（r/LocalLLaMA）：https://www.reddit.com/r/LocalLLaMA/comments/1sbp8ny/
- 📊 共享基准讨论：https://www.reddit.com/r/LocalLLaMA/comments/1saoyj7/
- 📝 MindStudio 综合对比：https://www.mindstudio.ai/blog/gemma-4-vs-qwen-3-5-open-weight-comparison
