---
title: "OpenAI 宣布放弃 SWE-bench Verified：一个标志性 AI 编程基准的\"死亡\"与行业反思"
date: "2026-04-27"
generated: "2026-04-27 07:00"
source: "HN"
slug: "2026-04-27_07-swe-bench-verified-no-longer-measures-frontier"
summary: "---"
---

# OpenAI 宣布放弃 SWE-bench Verified：一个标志性 AI 编程基准的"死亡"与行业反思

> 深度调研 | HN: SWE-bench Verified no longer measures frontier coding capabilities (226 points, 133 comments)
> 原始文章: https://openai.com/index/why-we-no-longer-evaluate-swe-bench-verified/
> HN 讨论: https://news.ycombinator.com/item?id=47910388

---

## 一、事件背景：SWE-bench 是什么？OpenAI 为什么不再用它？

**SWE-bench** 是2023年发布的一个标志性基准测试（benchmark），旨在衡量 AI 模型解决真实开源软件工程问题的能力。每个问题都来自 GitHub 上12个知名 Python 仓库（如 Django、Scikit-learn、SymPy 等）的真实 issue，模型需要根据 issue 描述和代码仓库的原始状态生成修复代码，最终通过自动化测试来判断是否正确。

2024年8月，OpenAI 联合发布了 **SWE-bench Verified**，对原版进行了大幅改进：三位专家独立审核了1,699个问题，筛选出500个质量最高的题目，过滤掉了测试过度具体、任务描述不明确、环境依赖导致误判等问题。一经推出，SWE-bench Verified 迅速成为行业"金标准"，各大模型发布会都会公布这一分数。

然而，OpenAI 在最新博文中宣布：**停止报告 SWE-bench Verified 分数，并建议其他模型开发者也这样做**。原因有二：

**第一，测试用例本身存在严重缺陷**。OpenAI 对模型反复失败的138个问题（占数据集27.6%）进行了人工审计，发现其中 **59.4% 存在实质性问题**：35.5% 的测试过于"狭窄"，强制要求特定的实现细节（如函数名必须叫 `get_annotation`），导致功能正确但写法不同的方案被判定为失败；18.8% 的测试又过于"宽泛"，覆盖了问题描述中未提及的额外功能需求。也就是说，**将近六成的"模型失败"，实际上是 benchmark 在冤枉模型**。

**第二，训练数据污染**。SWE-bench 的题目全部来自公开的开源代码库，而这些代码库正是各大模型训练语料的核心来源。OpenAI 设计了一套自动化"红队测试"流程：用 GPT-5 去"盘问" GPT-5.2、Claude Opus 4.5 和 Gemini 3 Flash，让它们复述 SWE-bench 任务。结果令人震惊——**所有前沿模型都能在提示下逐字复现原始的人工 bug 修复代码（gold patch），甚至精确到行号和内联注释**。这意味着，这些模型并非真正"解决"了问题，而是在"回忆"训练时见过的答案。

正如 OpenAI 所言："这就像在考试前把题目和答案发给学生——他们未必背下了答案，但看过答案的学生肯定比没看过的考得好。"

---

## 二、核心分析：Benchmark 失效的根本原因与 AI 评估的新挑战

OpenAI 的这番声明，实质上揭示了整个 AI 评估领域面临的**结构性困境**。

**首先是"基准饱和"（benchmark saturation）问题**。SWE-bench Verified 的分数在近6个月仅从74.9%提升到80.9%，而 Anthropic 的 Claude 据称已达93.9%。当一个基准接近满分时，它不再是能力的"望远镜"，而成了"显微镜"——测量的不再是模型能否解决真实问题，而是它能否猜中出题人的心思。

**其次是自动化评分的固有缺陷**。完美测试的设计极其困难：既要足够开放以接受多种正确实现，又要足够严格以防止作弊捷径。OpenAI 的审计动用了至少六名资深工程师反复核查138个问题，才揪出59.4%的缺陷。这表明，**构建一个真正可靠的自动化编程评估体系，成本可能不亚于直接雇人来评审**。

**最核心的挑战是"数据污染"与"训练递归"的悖论**。模型训练依赖于全网公开数据，而公开基准的数据又必然散落在互联网上。更微妙的是，OpenAI 自己也指出了"隐式训练污染"：即使没有直接把 benchmark 题目加入训练集，**只要在模型选择（model selection）阶段用某个基准来筛选模型，就等于在间接地用该基准训练模型**（后验选择偏差）。这形成了一个令人窒息的循环——任何公开的、被广泛使用的基准，都在加速自己的"死亡"。

这也解释了为什么 OpenAI 转而推荐 **SWE-bench Pro**（公开版本），同时正在大力投入 **GDPVal** 这类由领域专家私密撰写、由训练有素的评审员整体打分的评估方式——虽然成本高昂，但"日益必要"。

---

## 三、HN 社区热议：支持与质疑的激烈交锋

这篇博文在 Hacker News 上引发了226赞、133条评论的热烈讨论。社区的观点呈现明显的两极分化。

### 🔴 正方：OpenAI 说得对，基准危机是真实且紧迫的

**Jcampuzano2** 直言不讳："任何公开的基准在发布后的3-6个月内就会进入训练数据。在模型发布之前创建的任何基准，都不应该被视为有效的性能代表。"他进一步指出，巨大的商业利益使得厂商有动机在训练中偷偷塞入 benchmark 数据以获得营销优势，"他们应该干脆停止在营销材料中包含基准分数，让模型自己说话。"

另一位用户 **kator** 则从计算机硬件 benchmark 的历史中汲取教训："不吸取历史教训的人注定要重蹈覆辙。SPECint 和 SPECfp 经历了完全相同的剧本：基准发布→分数饱和→基准淘汰→替换新基准→重复。**这个跑步机本身就是产品。**" 这条评论获得了大量赞同，因为它将当前的 AI 基准危机置于更广阔的科技发展史中审视。

### 🟢 反方：OpenAI 的动机可疑，benchmark 仍有价值

SWE-bench 的联合创始人 **ofirpress** 亲自下场回应："SWE-bench Verified 确实已饱和至93.9%（恭喜 Anthropic），但尚未达到这一数字的厂商仍有增长空间。而且 SWE-bench 多语言和多模态版本即将开源，它们远未饱和。所有基准和范式最终都会饱和，这就是为什么 SWE-bench 团队一直在努力构建下一代基准。" 他的态度很明确：饱和是自然规律，不应因此全盘否定，而应迭代升级。

用户 **energy123** 则提出了一个尖锐的数学质疑：OpenAI 声称19.1%的问题有测试缺陷，如果0.191 × 0.594 ≈ 0.113（即约11.3%的整体缺陷率），但 Anthropic 声称得分93.9%（仅6.1%的失败率），"这是否意味着审计的样本不具代表性？还是说 Anthropic 通过某些 shady 手段获得了高分？" 这个质问直指 OpenAI 声明中的潜在矛盾。

更有用户 **cjsaltlake** 援引 Mythos 报告的研究，认为"可以调整污染因素后仍然信任 SWE-bench 数字"，并指出像 codeclash.ai 这类需要模型之间对抗竞争的 benchmark "很难被无意污染"。

### ⚡ 深层焦虑：当基准不可信时，我们还能相信什么？

许多评论超越了 SWE-bench 本身，触及了 AI 时代的信任危机。

**cbg0** 的追问振聋发聩："让社区决定？哪个社区？有10年以上 LLM 使用经验的专业人士，还是完全不懂代码的 vibe coders？" **InsideOutSanta** 附和道：Reddit 上关于 DeepSeek 4 的评价两极分化到荒谬——"无用"和"惊人"的评论并排出现，"我不知道这是水军营销、有人用了量化版、还是工作负载差异。这一切都太不透明了。"

**WarmWash** 提供了一个惊人的数据点：开放模型在 ARC-AGI 2 半私有测试集上表现"绝对糟糕"（<10%），而 SOTA 模型约为80%。这说明，**只有在可操纵的公开 benchmark 上，开放模型才能与顶级模型"一较高下"**。

---

## 四、行业影响与未来展望

OpenAI 放弃 SWE-bench Verified 的影响，远不止一个 benchmark 的兴衰。它标志着 AI 评估进入了 **"后基准时代"（Post-Benchmark Era）**。

**1. 私有/盲测基准将成为刚需**
社区中提出的方案包括：
- **gdpval 模式**：由专家私密出题、人工整体评审（资源密集但可靠）
- **盲测基准**：多组研究者各自维护不公开共享的测试集，聚合通过率
- **动态基准**：持续生成新问题（如每月更新），让训练永远追不上评估
- **对抗性基准**：如 codeclash.ai 这类模型需要相互对抗的评估方式

**2. "基准营销"（Benchmarketing）将遭遇反噬**
用户 **cpard** 援引了数据库系统40年基准营销战的历史教训，指出"当行业有巨大激励去操纵基准时，评估会变得异常困难"。随着社区对公开 benchmark 的信任崩塌，过度依赖单一数字进行市场营销的模型厂商，可能面临信誉危机。

**3. 评估的去中心化与社区参与**
尽管存在水军和 astroturfing 的担忧（**adamandsteve** 直言 Anthropic "付钱给网红推广 Claude Code，很可能还刷了大量机器人"），但一个趋势已不可逆转：随着官方 benchmark 的可信度下降，**第三方独立评估、用户自建测试套件、以及跨领域真实工作负载验证** 的重要性将急剧上升。

**4. 终极悖论：当 AI 超越人类，谁来评判？**
用户 **fnordpiglet** 抛出了一个哲学层面的问题："我有过实践经验——构建分类器时，因为分类器的表现始终优于人类，已经无法用精度来衡量。它们自己就成了新的基准。**可能有一天，不再存在独立于被测模型的校准基准。**" 这或许才是 AI 评估最深远的挑战。

---

## 五、参考链接

- **OpenAI 原始文章**: https://openai.com/index/why-we-no-longer-evaluate-swe-bench-verified/
- **HN 讨论**: https://news.ycombinator.com/item?id=47910388
- **SWE-bench 论文**: https://arxiv.org/abs/2310.06770
- **SWE-bench Verified 介绍**: https://openai.com/index/introducing-swe-bench-verified/
- **OpenAI GDPVal**: https://openai.com/index/gdpval/
- **SWE-bench 分数趋势**: https://llm-stats.com/benchmarks/swe-bench-verified
- **下一代基准 codeclash.ai**: https://codeclash.ai/
- **下一代基准 algotune.io**: https://algotune.io/
- **SWE-rebench**: https://SWE-rebench.com
- **Mythos 报告反驳文章**: https://www.philosophicalhacker.com/post/anthropic-error/
- **数据库基准营销战历史**: https://www.typedef.ai/blog/from-benchmarketing-to-benchmaxxing-what-40-years-of-database-evals-can-teach-data-leaders-about
- **ARC-AGI 排行榜**: https://arcprize.org/leaderboard
- **ELT-Bench 审计论文**: https://arxiv.org/abs/2603.29399

---

*本文基于 OpenAI 官方博客与 Hacker News 社区讨论深度调研撰写，发表于 2026-04-27。*
