---
title: "英国软件公司实现突破：240亿参数大模型在 iPhone 上完全离线运行"
date: "2026-04-22"
generated: "2026-04-22 23:00"
source: "Reddit"
slug: "2026-04-22_23-24b-llm-iphone-offline"
summary: "2026年4月21日，英国独立软件公司 5N6 宣布其 iPhone 应用 LiberaGPT 完成重大更新，新增对一个240亿参数（24B）大语言模型的支持，该模型可在最新一代 iPhone"
---

# 英国软件公司实现突破：240亿参数大模型在 iPhone 上完全离线运行

> 来源：r/LLM · 2026-04-22 · AI/LLM

## 事件背景

2026年4月21日，英国独立软件公司 5N6 宣布其 iPhone 应用 LiberaGPT 完成重大更新，新增对一个240亿参数（24B）大语言模型的支持，该模型可在最新一代 iPhone（iPhone 16/17 Pro）上完全离线运行，无需云端数据中心或额外硬件。LiberaGPT 是一款以隐私为核心的 AI 助手应用，上线首月已吸引全球数千用户。此次更新被认为打破了移动设备上本地运行大模型的规模纪录。作为对比，2019年 OpenAI 发布的里程碑模型 GPT-2 仅有15亿参数，且需要依赖集中式基础设施。

## 核心观点

该项目的核心主张是：通过精细的内存管理和模型优化，消费级移动硬件已可运行此前仅属于服务器或桌面系统的模型。LiberaGPT 利用 iPhone 的 A19 Neural Engine 进行 GPU 加速，实现完全本地推理。应用提供了独特的"Audition"模式——可同时向设备上安装的所有模型发送同一提示，进行并排对比（发布时支持7个模型）。此外，应用还提供实时 token 生成速率、设备热状态和内存使用等高级信息显示。定价为一次性购买 £9.99，无订阅费。

开发者 Stephen J. Pereira 将其比喻为"AI 模型的卡带播放器"——用户可以像换卡带一样加载不同的优化模型，每个模型各有专长，整个过程完全私密且本地化。

## 社区热议

> ⚠️ 注：由于 Reddit 访问限制（403/IP封锁），本次无法直接抓取帖子评论。

基于帖子主题和移动端 AI 社区的典型关注点，预计讨论方向包括：

1. **实际性能质疑**：社区成员可能对24B模型在手机上的实际推理速度、输出质量和发热控制持怀疑态度，认为参数量大不等于实际可用。

2. **量化损失讨论**：将24B参数模型压缩到手机可运行的规模，必然涉及量化（如 GGUF Q4），社区可能讨论量化对模型质量的实际影响。

3. **隐私价值认可**：部分用户可能认为完全离线运行是真正的隐私保障，优于任何云端隐私承诺。

4. **营销成分考量**：也有用户可能认为这更多是PR新闻稿而非真正的技术突破，类似应用（如 Private LLM、LLMFarm）早已存在。

## 行业影响

此事件反映了端侧 AI 推理的快速演进趋势。随着 Apple Neural Engine 等专用加速硬件的不断进步，以及模型量化、蒸馏等效率优化技术的成熟，在手机上运行十亿级甚至百亿级参数模型正从"不可能"变为"可行"。这对 AI 行业意味着：1）云端 AI 订阅模式可能面临本地化替代的挑战；2）数据隐私的终极解决方案——数据永远不离开设备；3）AI 的使用场景将扩展到无网络环境。当然，端侧模型在能力上仍远落后于 GPT-5 等云端旗舰模型，更适合处理日常简单任务。

## 相关链接

- Reddit 讨论：https://www.reddit.com/r/LLM/comments/1ss0fzq/british_software_house_achieves_milestone_making/
- 原文报道：https://www.financialcontent.com/article/abnewswire-2026-4-21-british-software-company-achieves-pioneering-breakthrough-making-it-possible-to-now-run-a-24-billion-parameter-ai-large-language-model-entirely-offline-on-the-iphone
- LiberaGPT 官网：https://www.liberagpt.com/
- App Store：https://apps.apple.com/app/liberagpt/id6761083160
