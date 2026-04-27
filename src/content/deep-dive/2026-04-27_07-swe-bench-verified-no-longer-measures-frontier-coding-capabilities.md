---
title: "SWE-bench Verified 已死：OpenAI 的弃用宣言与社区的分歧"
date: "2026-04-27"
generated: "2026-04-27 07:00"
source: "HN"
slug: "2026-04-27_07-swe-bench-verified-no-longer-measures-frontier-coding-capabilities"
summary: "OpenAI 的审计发现两个让 SWE-bench Verified 失去测量价值的问题："
---

# SWE-bench Verified 已死：OpenAI 的弃用宣言与社区的分歧

> OpenAI 官方博客发布了一篇措辞严厉的檄文，宣布 SWE-bench Verified 不再适合衡量前沿模型的编程能力，并呼吁整个行业停止引用这项指标。但 Hacker News 上的讨论却呈现出微妙的张力——有人拍手叫好，有人则认为这是"打不过就换规则"的经典操作。

## 核心论点：两个致命缺陷

OpenAI 的审计发现两个让 SWE-bench Verified 失去测量价值的问题：

**第一，测试用例本身有缺陷**。在对 138 道模型反复失败题目的审计中，59.4% 存在严重问题——35.5% 是"过窄测试"（要求特定实现细节而非功能正确），18.8% 是"过宽测试"（检测了题目描述中未提及的额外功能）。这意味着模型可能写出了功能完全正确的修复，却因测试设计不当而被判失败。

**第二，训练数据污染**。OpenAI 用自动化红队测试对 GPT-5.2、Claude Opus 4.5 和 Gemini 3 Flash 进行探测，发现所有前沿模型都能逐字复现原始的人类修复补丁（gold patch），甚至能背出题目的 exact 细节。这说明这些模型在训练时已经"见过答案"。更关键的是，OpenAI 发现见过题目的模型更容易通过那些"定义不清"的测试——因为测试本身依赖了题目之外的信息。

OpenAI 的结论很直接：**SWE-bench Verified 上的进步不再反映真实编程能力的提升，而是反映模型在训练时被"喂"了多少 benchmark 数据。**

## 社区交锋：正方与反方

### 🔴 反方一：SWE-bench 联合创始人的"自然饱和论"

HN 上最高赞的评论来自 **ofirpress**（SWE-bench 联合创始人），他的回应显得从容："所有 benchmark 最终都会饱和。SWE-bench Multilingual 和 Multimodal 仍未饱和，团队已经在推出下一代 benchmark（codeclash.ai、algotune.io）。"

言下之意：这不是 SWE-bench 的溃败，而是技术演进的自然周期。OpenAI 此时"退役" Verified，更像是给自己找台阶——毕竟 Anthropic 已经把这项指标刷到了 93.9%，而 OpenAI 的进展停滞在 80.9%。

### 🔴 反方二：审计样本的统计学质疑

用户 **energy123** 直接对 OpenAI 的审计方法提出了尖锐的数学质疑：

> "文章说他们审计了 27.6% 的数据集（即出版时 19.1% 的题目），发现 59.4% 的审计题目有缺陷。0.191 × 0.594 > 1 - 0.936。这意味着要么审计样本不具代表性，要么 Anthropic 的高分是通过某种 shady means 获得的。"

这个计算点出了一个尴尬：如果 OpenAI 的审计结论成立，那么 Anthropic 的 93.9% 几乎不可能——除非 Anthropic 的模型恰好"记住"了所有能通过测试的修复，而 OpenAI 的模型没记住。这反而暗示了 OpenAI 的分析逻辑不自洽。

### 🔴 反方三：Mythos 报告的"可控污染论"

用户 **cjsaltlake** 引用了 Mythos 报告的观点："你可以对污染进行校正，对于没有 over-optimized 的模型，SWE-bench 的数据仍然可信。"这暗示 OpenAI 的问题可能出在过度优化（overfitting）benchmark，而不是 benchmark 本身失效。

### 🟢 正方：benchmark 跑步机是结构性困境

但也有大量评论支持 OpenAI 的立场。用户 **kator** 将这一现象与计算机硬件史上的 SPECint/SPECfp 对比："benchmark → 饱和 → 退役 → 替换 → 重复。跑步机本身就是产品。"

用户 **Jcampuzano2** 的立场更激进："任何在模型发布前创建的 benchmark 都不应被视为有效。在营销材料中彻底取消 benchmark 吧。"

用户 **cpard** 则从数据库 benchmark 战争的历史中寻找平行："40 年前的数据库行业经历过完全相同的 benchmarketing 战争。ELT-Bench（数据工程 benchmark）前几天刚被审计出结构性偏差。这不是新问题。"

## 更深层的矛盾：谁来制定规则？

这场争论的核心，其实是**谁来定义"公平"的游戏规则**。

OpenAI 的弃用建议有一个隐含前提：只有模型开发商自己才知道训练数据里有没有 benchmark。但正如 **gertlabs** 所言："行业标准 benchmark 不应该由生产模型的实验室来主持或设计。"

更深的问题是，即使创建了全新的 private benchmark（如 OpenAI 提到的 GDPVal，由领域专家私下编写、人工 holistic 评分），仍然存在根本性张力：
- **公开 benchmark** → 不可避免进入训练数据 → 分数通胀
- **私有 benchmark** → 无法验证 → 厂商单方面宣布分数，公众无法复核

用户 **zachdotai** 提出的方向可能是出路：从静态 pass/fail benchmark 转向**动态评估**（dynamic evals），模拟人类实际工作场景——在真实业务中，你不会面对 500 道预先编好的题目，而是在一个 rotted context 中连续处理不断变化的 codebase。

## 结语

OpenAI 弃用 SWE-bench Verified 的动作，表面上是一次技术审计的结论，实质上是一场关于"何为真实能力"的话语权争夺。

SWE-bench 联合创始人把这叫作"自然饱和"，OpenAI 把它叫作"训练污染 + 测试缺陷"，而冷眼旁观的网友看到的是同一部电影的重播：当 benchmark 变成 marketing 工具，它就很难继续作为 measurement 工具。

唯一确定的是，随着模型能力逼近甚至超越人类专家水平，**我们可能需要接受一个事实：再也没有一个独立的、权威的、可公开的 benchmark 来衡量这些系统。** 这不是 SWE-bench 的失败，而是整个行业正在进入"后 benchmark 时代"的阵痛。

---

*来源：OpenAI 博客 + Hacker News 讨论（135 条评论，228 分）*
*HN 原帖：https://news.ycombinator.com/item?id=47910388*
