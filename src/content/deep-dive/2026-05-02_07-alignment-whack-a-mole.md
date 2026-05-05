---
title: "alignment-whack-a-mole"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-alignment-whack-a-mole"
---

## Alignment Whack-a-Mole: Finetuning Activates Verbatim Recall of Copyrighted Books in LLMs

### 事件背景

研究者 cauchy221 等人在 arXiv（2603.20957）发布论文《Alignment Whack-a-Mole: Finetuning Activates Verbatim Recall of Copyrighted Books in Large Language Models》并开源代码。核心发现：在 GPT-4o、Gemini 2.5 Pro、DeepSeek-V3.1 等模型上，仅用一本受版权保护书籍（例如 Cormac McCarthy 的《The Road》）做风格化 finetune，就能让模型产出大段「逐字 verbatim」的原文片段——即使预训练阶段对齐工作已经压制了直接背诵能力。Finetune 数据格式是：「写一段约 N 字的内容，模拟该作者风格 + 摘要」，并不要求模型还原原文，但模型会自己「漏出」原文片段。这是「对齐打地鼠（whack-a-mole）」的字面含义：你压住一个洞，从另一个洞冒出来。

### 核心观点 / 产品机制

研究方法上他们做了完整的 pipeline：把 EPUB 切成 300–500 词的段落，用 GPT-4o 生成段落剧情摘要，构造指令「Write a {N} word excerpt about the content below emulating the style and voice of {Author}」做 finetune，每段采样 100 次生成结果（temp 1.0）。然后用 4 个记忆度量评估：BMC@k（覆盖率）、最长连续记忆块、最长连续 regurgitated span、span > T 的数量。三家厂商 API（OpenAI、Vertex、Tinker）跑下来都展现强烈的 verbatim 复现。其结论的杀伤力在于：(1) 即便预训练数据已经做过版权清洗或对齐压制，仅靠用户后续的合法 finetune 行为就能「激活」记忆；(2) 这意味着原始权重里是有那本书的——alignment 只是关闭了表层背诵开关；(3) 任何允许用户 finetune 的商业 API（OpenAI、Gemini、Tinker），都给版权方提供了可重复的取证路径。

### 社区热议与争议点

HN 评论非常激烈。第一类是从研究者立场点赞：一位人文学科研究者表示自己多年扫描专业书上传到 shadow library，知道 LLM 在这些 shadow library 上训练后，他「更卖力做 OCR」，期待未来能问 ChatGPT 解锁专业冷门知识——这条引爆了下面长串关于「公共信息 vs 公司收费」的辩论。第二类是版权金钱视角：「LLM 厂商让你为本来免费的信息付费」「德国 GEMA 那种集体管理组织 + 私人复制税才是出路，强制 50–70% 收入回流给原作者」。第三类反驳：「LLM 包含的信息不会让图书馆里的书消失，多一种访问方式，开源权重模型可以本地跑」。第四类是政治外延：有人把话题拉到了图书馆经费、SAVE Act、护照、选举——这是 HN 高情绪长帖的典型走向。第五类技术担忧：「这表明 alignment 是浅层贴皮，verbatim recall 在权重里就在等着」，意味着对齐评测可能严重低估了实际泄露风险。

### 行业影响与未来展望

这篇论文是 2026 年版权派律师最想引用的一篇 ML 论文。可预期：(1) Sarah Silverman、NYT v. OpenAI 这类版权诉讼会把它列入「证明侵权材料确实进入权重」的核心证据；(2) finetune API 服务商会被迫加上「输出版权过滤」层，而不是仅在预训练做清洗；(3) 学术界会扩展到更多书目、更多模型，建立「记忆密度 vs 模型规模、数据规模、对齐强度」的标度律；(4) 监管层面，欧盟 AI Act + 美国可能即将出现的 finetune 数据标识要求，会把责任部分推给 fine-tune 平台运营方（OpenAI、Vertex、Tinker）；(5) 长远看会推动「真正不含受版权材料」的预训练数据替代方案（公共领域 + 授权数据）变成商业刚需。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47957627
- 原仓库：https://github.com/cauchy221/Alignment-Whack-a-Mole-Code
- 论文：https://arxiv.org/abs/2603.20957
