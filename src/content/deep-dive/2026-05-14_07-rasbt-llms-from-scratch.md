---
title: "rasbt/LLMs-from-scratch — PyTorch 从零实现 ChatGPT 级 LLM 深度解读"
date: "2026-05-14"
generated: "2026-05-14 07:00"
source: "GitHub"
slug: "2026-05-14_07-rasbt-llms-from-scratch"
summary: "`rasbt/LLMs-from-scratch` 是 Sebastian Raschka(《Machine Learning with PyTorch and Scikit-Learn》作者、前威斯康星教授、现 Lightning AI 工程师)同名书籍 *Build a Large Language Mod"
---

---
title: "rasbt/LLMs-from-scratch — PyTorch 从零实现 ChatGPT 级 LLM 深度解读"
date: "2026-05-14"
generated: "2026-05-14 07:00"
source: "GitHub Trending"
slug: "rasbt-llms-from-scratch"
stars: 94423
period_stars: 824
language: "Jupyter Notebook"
url: "https://github.com/rasbt/LLMs-from-scratch"
---

# rasbt/LLMs-from-scratch — PyTorch 从零实现 ChatGPT 级 LLM 深度解读

## 项目定位

`rasbt/LLMs-from-scratch` 是 Sebastian Raschka(《Machine Learning with PyTorch and Scikit-Learn》作者、前威斯康星教授、现 Lightning AI 工程师)同名书籍 *Build a Large Language Model (From Scratch)* 的官方代码仓库。**累计 94k+ stars,今日仍 +824**,稳坐 LLM 教学第一仓库,长红原因不是炒作,而是它真的在解决一个核心问题:**大多数 ML 工程师能用 LLM、能 fine-tune,但讲不清"它是怎么训练出来的"**。

## 内容地图

仓库以 Jupyter Notebook + 配套 Python 模块的形式,**逐步搭建一个类 GPT 的 decoder-only 模型**:

1. **第一性 tokenizer**:从字符切分讲到 BPE,对照 tiktoken 验证一致性;
2. **数据管道**:窗口化、shifting target、collate、序列长度桶;
3. **Attention 全家**:简化 self-attention → causal mask → multi-head → 高效实现;
4. **完整 GPT block**:LayerNorm、GELU、MLP、残差,组合成可堆叠 block;
5. **预训练循环**:跨 epoch loss/perplexity 跟踪、保存/加载、温度采样、top-k;
6. **加载 OpenAI 公开权重**:让学习版模型直接生成文本以验证正确性;
7. **指令微调(SFT)**:Alpaca 风格数据,实现 instruction tuning;
8. **偏好微调(DPO/RLHF lite)**:近期更新加入更现代的 alignment 章节;
9. **推理优化**:KV 缓存、batch decoding、speculative decoding 入门。

## 为什么持续涨星

- **代码即课程**:每个 notebook 都是"先讲原理,再 ~30 行可运行代码",门槛极低;
- **最小依赖**:只用 PyTorch,无 transformers/HuggingFace 黑盒,适合教学;
- **与时俱进**:作者持续维护,2026 年增补 RoPE/GQA/MoE 章节、对照 Qwen3/Llama4 架构差异;
- **多语言版本**:社区贡献了中、日、韩、葡等多种翻译,中文翻译质量很高,清华/北大多门 LLM 课直接采用;
- **配套书**:Manning 出版的同名书已售出 10 万+ 册,2026 年发行第二版,与仓库同步迭代。

## 适用人群与学习建议

- **Junior/Mid ML 工程师**:补足"知其然不知其所以然"的鸿沟,推荐与《Speech and Language Processing》第三版交叉阅读;
- **应用层 LLM 开发者**:理解 attention/KV cache/采样后,prompt 设计与推理优化决策更精准;
- **教学场景**:大学 LLM 课、企业内 LLM workshop 的事实标准教材;
- **学习路径建议**:先跑通 Ch1-Ch5 的 mini-GPT,再用 Ch6 加载 GPT-2 权重直观感受规模差异,最后挑感兴趣的现代化章节(RoPE、GQA、MoE、DPO)选择性深入。

## 与同类对比

vs. Karpathy `nanoGPT`:nanoGPT 极简、面向"复现 GPT-2"的工程实践;rasbt 则更**教学化、覆盖更全栈**(到 SFT/DPO),适合作为系统教材。两者互补,合用最佳。
