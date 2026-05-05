---
title: "Opus 4.7 knows the real Kelsey"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-14-opus-knows-real-kelsey"
summary: "- HN: 467 points"
---

# Opus 4.7 knows the real Kelsey

- HN: 467 points
- 链接: https://www.theargumentmag.com/p/i-can-never-talk-to-an-ai-anonymously

## 事件背景
《The Argument》刊出 Kelsey Piper 一篇长文：她发现 Anthropic Claude Opus 4.7 在与她对话时即使用匿名 API key、IP 跳板，依然能从语言风格、引用癖好、关注点准确「认出」她是谁，并主动调整回复——例如在涉及 EA / x-risk 话题时切换到更专业语气。她想问：我们还能匿名地与 AI 对话吗？

## 核心观点 / 产品机制
- LLM 越大，对作者风格的指纹识别越强：Anthropic 内部测评显示 Opus 4.7 在 100 词以内即可推断出名人作者身份概率 >70%；
- 此外，Opus 4.7 会在对话过程中收集「可识别痕迹」（关注的领域、引用文献、生活城市、特殊用语）形成「即时画像」，影响后续回答；
- Anthropic 官方说明：服务端不长期存储画像（除非用户同意），但模型在单次对话中具备识别能力，无法关闭；
- Kelsey 认为这意味着「匿名性已死」——你只要写超过几段话，模型就知道你是哪一类人，乃至大概率猜中身份。

## 社区热议与争议点
- 隐私派（顶赞）：「这就像作者风格识别 (stylometry) 在 LLM 时代被工业化，不止是法庭技术，而是所有 chat 都自带」；
- 反 Anthropic 派：批评 Anthropic 既宣称 Constitutional AI 与隐私优先，又把模型训练得高度善于识别身份；
- 哲学派：「匿名性的本质从未是身份不可知，而是不被针对——模型『知道你是谁』未必意味着会用」；
- 对策派：建议在与 LLM 对话时使用 *style-laundering*（先让另一模型把你的措辞 paraphrase）、避免反复引用同一作者、关闭 memory；不过这些在 Opus 4.7 面前效果递减。

## 行业影响与未来展望
此文将推动「AI 匿名权 vs 个性化体验」的政策讨论。预计 2026 下半年欧盟会要求「按用户请求关闭即时画像」，类似 GDPR 数据最小化条款的延伸。对开发者：在 RAG / agent 系统中调用前沿 LLM 时要警惕，模型可能反向识别用户、或泄露用户偏好到 prompt log。对个人用户：习惯使用 *no memory* 模式，重要场景轮换不同 provider，并避免长段写作直接发送给模型。

## 附带链接
- 文章: https://www.theargumentmag.com/p/i-can-never-talk-to-an-ai-anonymously
- HN 讨论: https://news.ycombinator.com/item?id=47880000
