---
title: "attention-sink-nope"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "Reddit"
slug: "2026-05-02_07-attention-sink-nope"
---

## 没有位置编码（NoPE）就一定逃不掉 attention sink 吗？

### 1. 事件背景
原帖来自 r/MachineLearning，提问者注意到一个矛盾：研究界长期把 attention sink（注意力被异常多地分配给序列首 token）解释为"Softmax 必须要有出口阀"，但更新的工作（如 OpenReview 上 *No Universal Mechanism for Attention Sink in Transformers*）发现 GPT-2 的 sink 实际由"learned query bias + 第一层变换 + 绝对位置嵌入"三者交互产生。问题随之而来：如果完全去掉位置编码（NoPE），sink 还会出现吗？或者这是 Transformer 在因果掩码下绕不过去的几何宿命？

### 2. 核心观点 / 产品机制
- **理论侧**：NoPE 在因果 Transformer 中虽然取消了显式 PE，但 causal mask + softmax 仍然让位置 0 成为唯一始终可见的 token，导致 attention probability 长期回流，本质上等价于"隐式偏置"；
- **实证侧**：ACL 2024 *Length Generalization of Causal Transformers without Position Encoding* 等工作显示 NoPE 模型仍然会自发学到类似 T5 相对位置的注意力模式，并且在长上下文下出现注意力分布的"分心"；
- **结论倾向**：sink 与显式 PE 解耦，更深层原因是 softmax 归一化 + causal 结构。换句话说，去 PE 治不了 sink，要治得动 softmax 或 mask（如 sigmoid attention、StreamingLLM 的显式 sink token）。

### 3. 社区热议与争议点
- **"Softmax 罪魁"派**：引用 Evan Miller 那篇老博客《Attention Is Off By One》以及后续 sigmoid attention 实验，认为只要 softmax 强制归一化、就总得有 token 当"接收方"，NoPE 改不了这件事；
- **"显式锚定 token"派**：StreamingLLM 思路的拥趸认为应该承认 sink 的存在，主动塞一个可训练的 sink token 进去，比试图消除更工程友好；
- **"NoPE 派的反击"**：有人贴出 NoPE 在中等长度下的注意力可视化，认为 sink 强度比 RoPE 弱得多，说明 PE 其实加重了 sink，而不是 NoPE 制造了它；
- **"长度泛化才是真问题"派**：把话题拉回到 NeurIPS 2023 关于五种 PE 长度泛化的对比，强调与其纠结 sink，不如直接看长度外推性能。

### 4. 行业影响与未来展望
这场讨论折射出一个工程现实：长上下文模型（128k–1M）越普及，attention sink 越成为推理可观察的"病灶"——KV-cache 中首 token 一旦驱逐就立刻崩坏。短期看，"显式 sink token + 合适 PE"会是默认架构；中期看，sigmoid/线性 attention、Mamba 等 SSM 路线则尝试从根上绕过 softmax 归一化诱导的 sink。对推理框架（vLLM、SGLang）而言，sink 处理已成为 KV-cache 抢占策略的设计前提。

### 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/MachineLearning/comments/1szqzeq/is_attention_sink_without_positional_encoding/
- ACL 2024：https://aclanthology.org/2024.findings-acl.834/
- OpenReview：https://openreview.net/forum?id=n7scrIymwb
- NeurIPS 2023 PE 长度泛化：https://neurips.cc/virtual/2023/poster/72346
