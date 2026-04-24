---
title: "DeepSeek V4 炸场了！—— Reddit 本地大模型社区深度解读"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-deepseek-v4-is-nuts"
summary: "---"
---

# DeepSeek V4 炸场了！—— Reddit 本地大模型社区深度解读

> 原帖：[Deepseek V4 is nuts](https://www.reddit.com/r/LocalLLM/comments/1susgbx/) · Reddit r/LocalLLM · 2026-04-24

---

## 一、事件背景

2026年4月24日，中国AI初创公司 DeepSeek 正式发布了旗舰模型 **DeepSeek-V4 Preview**，并同步开源权重。这是继2025年初 R1 推理模型震动华尔街以来，DeepSeek 发布的最重大模型更新。V4 发布当日，CNBC、Reuters、Bloomberg 等全球主流财经媒体均进行了报道，港股多家中国AI概念股应声大跌——MiniMax、智谱各跌约8%，蚂蚁旗下公司跌9%，而中芯国际和华虹半导体分别暴涨9%和15%。Reddit 的 r/LocalLLM 和 r/LocalLLaMA 社区迅速炸开了锅。

## 二、核心产品与技术亮点

V4 本次分为两个版本：

| 版本 | 总参数量 | 激活参数 | 定位 |
|------|---------|---------|------|
| **V4-Pro** | 1.6T | 49B | 旗舰性能，对标闭源顶尖模型 |
| **V4-Flash** | 284B | 13B | 高性价比、低延迟 |

**关键技术创新：**

- **1M 上下文窗口成为默认标配**，采用全新的 Token-wise 压缩 + DeepSeek Sparse Attention (DSA) 机制，在超长上下文下大幅降低计算和显存开销。
- **混合注意力架构**：不走纯 MLA 路线，也未采用 SSM/Mamba 方案，而是使用 CSA（压缩稀疏注意力）+ HCA（重度压缩注意力）的混合设计，被社区认为是架构层面的重大创新。
- **Agent 能力深度优化**：V4 在 Agentic Coding 基准测试中达到开源 SOTA，并原生集成了 Claude Code、OpenClaw 等主流 AI Agent 工具。
- **华为昇腾芯片适配**：华为确认其最新 Ascend AI 计算集群可原生支持 V4，这是 DeepSeek 从依赖英伟达芯片向国产芯片转型的重要信号。
- **双模式支持**（Thinking / Non-Thinking），API 兼容 OpenAI 和 Anthropic 两种接口格式。

## 三、社区热议与争议点

尽管无法完整抓取原帖评论区（Reddit 反爬限制），通过搜索结果可以看到社区讨论极为活跃，主要围绕以下焦点：

1. **架构创新引发技术讨论**：r/LocalLLaMA 上有帖子专门拆解 V4 技术报告，认为混合注意力机制（CSA+HCA）是"相比 V3 的重大架构革新"，与 Qwen 3.5+ 采用的 SSM/Gated DeltaNet 路线形成差异化竞争，引发了关于不同注意力范式优劣的深度讨论。

2. **Flash 版本定价引发惊叹**：有帖子专门指出"被忽略的重点：V4 Flash 在同参数级别中 API 价格低得离谱"，有评论指出 DeepSeek 在中文社区承认实际成本高于公布定价，疑似以补贴策略抢占市场。

3. **训练芯片之争**：在 V4 发布前，社区就有预测帖称 V4 可能使用华为 Ascend 950PR 训练。Reuters 报道证实华为芯片确实参与了 V4，但英伟达芯片的使用比例仍不透明，这成为社区持续争论的焦点——有人认为这是中国AI"去英伟达化"的里程碑，也有人质疑实际训练仍依赖英伟达。

4. **对闭源模型的威胁**：早在 V4 发布前，社区就有讨论称"Opus 和 GPT 是否该紧张了"，认为 DeepSeek 的技术积累可能带来突破性进展。V4 实际发布后，Pro 版本在数学/STEM/编程推理上击败所有开源模型，世界知识仅次于 Google Gemini-3.1-Pro，基本兑现了社区的高期望。

## 四、行业影响与未来展望

- **开源 vs 闭源格局变化**：V4 Pro 以49B激活参数实现接近闭源顶尖水平的性能，进一步压缩了闭源模型的商业护城河。Morningstar 分析师指出，与 R1 时期不同，V4 的竞争矛头更多指向国内同行（阿里、字节跳动等），标志着中国AI开源内卷进入新阶段。
- **本地部署的新标杆**：V4-Flash 仅 13B 激活参数即可接近 Pro 级性能，对本地大模型玩家极具吸引力——这也正是 r/LocalLLM 社区如此兴奋的核心原因。
- **芯片供应链博弈**：V4 对华为昇腾的原生适配，可能加速中国AI算力"去美化"进程。Counterpoint 分析师认为这将"最终加速全球AI发展"。
- **旧模型退役时间表**：DeepSeek 宣布 deepseek-chat 和 deepseek-reasoner 将于 2026年7月24日正式下线，全面切换至 V4 架构。

## 五、相关链接

- 📌 Reddit 原帖：https://www.reddit.com/r/LocalLLM/comments/1susgbx/
- 📄 DeepSeek 官方公告：https://api-docs.deepseek.com/news/news260424
- 📰 CNBC 报道：https://www.cnbc.com/2026/04/24/deepseek-v4-llm-preview-open-source-ai-competition-china.html
- 📰 Reuters 报道：https://www.reuters.com/technology/chinas-deepseek-returns-with-new-model-year-after-viral-rise-2026-04-24/
- 🤗 开源权重：https://huggingface.co/collections/deepseek-ai/deepseek-v4
- 📄 技术报告：https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf
- 🔬 架构讨论帖 (r/LocalLLaMA)：https://www.reddit.com/r/LocalLLaMA/comments/1subuve/takeaways_discussion_about_the_deepseek_v4/
- 💰 Flash 定价讨论帖 (r/LocalLLaMA)：https://www.reddit.com/r/LocalLLaMA/comments/1su5gj5/buried_lede_deepseek_v4_flash_is_incredibly/
