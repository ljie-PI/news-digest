---
title: "Using Claude as pair programmer to build a kids generative coloring book app"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-05-claude-pair-coloring-book"
summary: "- Subreddit: r/ClaudeAI"
---

# Using Claude as pair programmer to build a kids generative coloring book app

- Subreddit: r/ClaudeAI
- 讨论: https://www.reddit.com/r/ClaudeAI/comments/1t1wrfs/
- 图片: https://i.redd.it/ex7z1q2siryg1.jpeg

## 事件背景
一位父亲展示用 Claude（很可能 Opus 4.7 + Claude Code）作为 pair programmer，从零搭出给女儿的 *安全* 涂色书生成 app：孩子说一句话 → 后端用 image gen 生成黑白线稿 → 打印或填色。帖子主要讨论「儿童安全过滤」与「家庭场景下 LLM 的实际产能」。

## 核心观点 / 产品机制
- 技术栈：React Native + Expo + Anthropic SDK + Replicate / Stable Diffusion line-art LoRA；
- 安全：① 用 Claude 做语义过滤（reject 含暴力、性、政治等词的请求）；② 输出图像走 NSFW 检测模型再展示；③ 限定调色板与主题（动物、自然、家庭）；
- 工作流：父亲只写数百行代码，剩余 Claude 完成；耗时约 3 周晚上业余；
- 开发者反思：LLM 让小型自用 app 成本降到比买 SaaS 还便宜。

## 社区热议与争议点
- 家长派：羡慕这个项目，也开始为家庭场景写小工具；
- 安全派：强调「不能仅靠模型自我过滤，必须叠加规则」，分享自己实现的 jailbreaking 测试；
- 反对派：「卸载 ChatGPT，让小孩远离屏幕才是真安全」；
- 商业派：建议 OP 把它打包成 GPT Store 应用 + Etsy 印刷服务，月入数百美元不难。

## 行业影响与未来展望
LLM + 图像生成 + 私人家庭场景将爆发一类新「pp app」（personal product app）：父母为孩子写、夫妻为家用写。Claude Code 这种 coding agent 把开发门槛拉到「能描述需求 = 能产出 app」。对 SaaS 创业者：警惕通用 SaaS 被高质量个人化 app 蚕食；对模型平台：儿童 / 家庭安全 SDK 包将是下一个高价值产品。

## 附带链接
- Reddit: https://www.reddit.com/r/ClaudeAI/comments/1t1wrfs/
