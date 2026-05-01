---
title: "Mozilla 公开反对 Chrome Prompt API：浏览器厂商间的 AI 标准之争"
date: "2026-05-01"
generated: "2026-05-01 07:00"
source: "HN"
slug: "2026-05-01_07-mozilla-opposition-chrome-prompt-api"
summary: "2026年4月30日，Mozilla 工程师 Jake Archibald（前 Chrome 团队成员）在 GitHub 上发布了一份详尽的立场文件，明确反对 Google 正在推进的 Chrome Prompt API 提案。该 "
---

# Mozilla 公开反对 Chrome Prompt API：浏览器厂商间的 AI 标准之争

## 事件背景

2026年4月30日，Mozilla 工程师 Jake Archibald（前 Chrome 团队成员）在 GitHub 上发布了一份详尽的立场文件，明确反对 Google 正在推进的 Chrome Prompt API 提案。该 API 旨在让网页开发者能够直接调用浏览器内置的 AI 模型（如 Gemini）来生成文本内容。Mozilla 的反对意见获得了 Hacker News 社区的高度关注，帖子在数小时内获得 563 分、206 条评论，成为当日最热技术话题之一。

值得注意的是，Archibald 此前在 Google Chrome 团队工作多年，他的反对立场被 swyx 等评论者解读为"终于不用再说违心话了"——一位前内部人士对老东家的技术路线投下不信任票。

## 核心观点：四大反对理由

Mozilla 的反对意见集中在四个核心问题上：

**1. 提示词与模型强耦合**

Mozilla 指出，系统提示词（system prompt）是为特定模型量身定制的。Archibald 举了一个生动的例子：他为智能家居系统编写了一个生成语音播报提示词，最初使用的 Gemini 模型输出带有浓重的美式英语腔调，与英式语音合成器完全不匹配。他不得不在提示词中反复迭代调整，最终得到适合 Gemini 的版本——但这个提示词换到另一个模型上可能就会产生"过校正"或输出怪异的结果。

**2. 浏览器指纹的新维度**

codedokode 等多位评论者指出，Prompt API 将成为新的浏览器指纹识别参数。网站可以通过发送小型 LLM 请求来探测用户使用的是哪种模型，从而进一步锁定用户身份。虽然理论上可以关闭该功能，但 codedokode 警告说："一旦关闭，你立刻就变得与众不同，网站会开始崩溃——就像现在某些不做 3D 图形的网站却要求 WebGL 一样。"

**3. 模型中立性与使用条款**

Prompt API 要求用户接受特定 AI 模型的使用条款。Mozilla 质疑：如果浏览器内置的是 Gemini，用户是否被迫接受 Google 的 Prohibited Use Policy？codedokode 尖锐地反问："如果数据真的在本地处理、Google 永远看不到，那他们为什么要关心本地 prompts 和 responses 的内容？"

**4. 性能与资源消耗**

本地 LLM 需要大量内存和 CPU。在当前 RAM 价格高企的情况下，许多用户的设备根本无法流畅运行。如果网站开始依赖本地模型，廉价设备上的浏览体验将显著恶化。

## 社区热议与争议点

### 争议 1：Google 的动机——"逐利细菌"还是"也有好人"？

这是评论区最激烈的对立。

**反方（MisterTea、eocjeockoefj）**：MisterTea 直言"Google 就像细菌一样只朝钱的方向游动"，将 Google 比作"撒旦"，认为任何期待 Google 为 web 或人类做善事的人都是天真的。eocjeockoefj 进一步补充："高层控制现金流，而高层正是把事情搞砸的人。"b00ty4breakfast 用了一个形象的比喻："泥石流中的几棵树向左偏，不代表你的房子不会被冲下山坡。"

**正方（john_strinlai、dismalaf）**：john_strinlai 为 Google 员工辩护："Google 里也有想改善世界的人，Project Zero 就是一个例子。"dismalaf 则列举了 Google 开源贡献的庞大清单：Go、V8、Chromium、Android、TensorFlow 等，"我想不出哪家公司贡献了这么多开源代码。"

anthonyrstevens 试图把讨论拉回正题："每次提到 Google/Microsoft/OpenAI/Meta 就复制粘贴同样的评论，能不能谈谈 Prompt API 本身？"

### 争议 2：浏览器验证——必要之恶还是滑坡起点？

dabockster 提出了一个反直觉的观点："AI 行业已经摧毁了反爬虫的社会契约，robots.txt 形同虚设。开放网络已经变成了黑暗森林。让浏览器会话可被验证为'未篡改'可能是未来的趋势。"

lxgr 立即反驳："HTTP 和 HTML 本来就是为机器阅读设计的。你发布到互联网上，然后不高兴机器真的来读了？"realusername 补充："浏览器验证阻止不了机器人，只会让点击农场赚更多钱。"

### 争议 3：Prompt API 本身是否有价值？

**支持者（827a）**："我认为我在这件事上站 Google。如果解决方案是让 API 支持用户浏览器中的模型与提示词之间更紧密的耦合，你不可避免地会进入'你需要用 Chrome 才能用这个网站'的领域。"

**反对者（stingraycharles）**："我不想让我的 OS 或浏览器访问 LLM，但我想让我的 LLM 访问浏览器或 OS。应该提供一个 LLM 接口，默认关闭，用户想开再开。"

cosmic_cheese 则提出了一个更根本的质疑："为什么 Google 执着于把浏览器变成'荷马移动'（Simpsons 中那辆塞满各种无用配件的车），而不是修复现有浏览器的结构性弱点？"

## 行业影响与未来展望

这场争论折射出浏览器行业正在经历的深层变革：

1. **浏览器即操作系统**：zamadatix 一针见血地指出，"Google 不是在打造更好的浏览器，而是在用 Chrome 取代用户的 OS。"Prompt API 是这一战略的又一棋子。

2. **AI 标准化的分裂**：如果 Chrome 强推 Prompt API 而其他浏览器拒绝跟进，web 平台将面临新的碎片化危机。历史已经证明，"Chrome 独有功能"最终往往成为事实标准。

3. **隐私与安全的重新谈判**：Prompt API 迫使行业重新思考"开放 web"的定义。当浏览器开始内置 AI 模型，用户数据处理的边界在哪里？

4. **前内部人士的警示信号**：Archibald 从 Chrome 团队跳槽到 Mozilla 后立刻反对老东家的提案，这种"叛逃者效应"本身就说明了问题。jaffathecake 在评论中坦言："我在 Google 时就经常不按公司路线说话，这给我带来了越来越多的内部麻烦，直到我离开。"

## 附带链接

- **原帖（HN）**：https://news.ycombinator.com/item?id=47959463
- **Mozilla 立场文件**：https://github.com/mozilla/standards-positions/issues/1213#issuecomment-4347988313
- **Prompt API 提案**：https://github.com/webmachinelearning/prompt-api/blob/main/README.md
- **Jake Archibald 个人博客**：https://jakearchibald.com
