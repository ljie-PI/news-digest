---
title: "NHS England 关闭开源代码仓库：恐慌驱动的政策倒退"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-nhs-england-open-letter-open-source"
summary: "2026年5月初，英国国家医疗服务体系（NHS England）因担忧 Anthropic 的 AI 安全测试模型 **Mythos** 能够大规模扫描并发现软件漏洞，紧急发布内部指导文件 **S"
---

# NHS England 关闭开源代码仓库：恐慌驱动的政策倒退

## 1) 事件背景

2026年5月初，英国国家医疗服务体系（NHS England）因担忧 Anthropic 的 AI 安全测试模型 **Mythos** 能够大规模扫描并发现软件漏洞，紧急发布内部指导文件 **SDLC-8**，要求几乎所有 GitHub 上的代码仓库在 **5月11日前转为私有**。这一决定直接违背了 NHS 服务标准第12条——"用公共资金构建的服务，其代码应向公众开放"——以及英国政府设计原则中"默认开源"的一贯立场。此前，NHS 已悄然删除了开源政策相关网页。技术社区迅速发起反击，在 keepthingsopen.com 发布公开信，呼吁 NHS England 撤回 SDLC-8 "红线"，截至发稿已有 **236人签名**，其中包括多名曾参与英国公共部门软件开发的工程师。

## 2) 核心观点 / 政策机制

公开信的核心论点清晰有力：**"用公共资金编写的代码应该对公众开放。"** 作者们认为，开源虽然需要更多工作——更高的质量标准、主动的漏洞发现与修复流程、风险控制机制——但正因如此，它像人体免疫系统一样，**暴露于威胁反而能硬化攻击面**。闭源则以"模糊性"替代"深度"，而在一个足够积极的攻击者面前，模糊性几乎毫无价值。

NHS England 的决策导火索是 Mythos。该 AI 模型被认为能进行大规模代码摄取、推理并发现漏洞。然而，英国政府背景的 **AI Safety Institute (AISI)** 对 Mythos 的调查结论却截然不同：它仅能攻击"小型、防御薄弱的企业系统"，对真正安全的软件或网络并无威胁。前 NHSX/GDS 工程师 Terence Eden 更指出，NHS GitHub 上的数千个仓库大多是数据集、内部工具、前端设计等，**几乎不可能引发安全事件**。更讽刺的是，疫情期间的 NHS 新冠追踪应用（安装于数百万手机、面临敌对国家审查）同样开源发布，却从未因此产生任何安全问题。

## 3) 社区热议与争议点

HN 讨论区（193 points, 13 comments）呈现出鲜明的正反交锋：

**正方——开源捍卫者：**
- **deaux**（引用 shkspr.mobi 分析）：关闭所有代码是"严重过度反应"。代码早已被爬取完毕，现在隐藏毫无意义；AI 工具对闭源软件同样有效——它们可以分析二进制文件、探测网站。"这一切只是为了 optics（表面功夫），任何站不住脚的借口都被用来立刻收回透明度。"
- **MattSayar**（引用 simonw）："开源库变得更有价值，因为花在保护它们上的资源可以被所有用户共享。"内部 fork 的代码只会增加工程团队的管理负担。

**反方/审慎派——理解闭源立场：**
- **rvz**：闭源后新增的代码变更不会被攻击者或 LLM 读取。团队可以内部使用 LLM 提前发现漏洞，"领先攻击者一步"。他引用近期 **Copy.fail 零日漏洞事件**（由 LLM 发现、无修复方案即公开，引发社区恐慌）作为警示，认为"为开源而开源在医院场景下需要平衡"。
- **alephnerd**（自称与多家 F50 公司 CISO/CTO 交流过）：行业正在暂停 OSS 贡献和使用，直到 AppSec 团队能在**24小时内**完成端到端漏洞修复——传统 8-10 天的响应周期在今天已不可持续。他认为这是"公地悲剧"，开源维护者缺乏资源，需要转向 open-core 模式或获取正式资金。

## 4) 行业影响与未来展望

NHS England 的决定若成行，将对全球公共部门开源政策产生寒蝉效应。公开信发起人已备份了所有 NHS 仓库，若原仓库被关闭，可在许可证允许下重新发布。但更深层的问题在于：**AI 驱动的安全扫描正在重塑开源经济学的基本假设**。如 alephnerd 所述，企业正在冻结第三方依赖、内部 fork 核心项目，这将削弱上游社区的活力。另一方面，这也可能是 AppSec 和 SBOM（软件物料清单）验证领域的黄金机遇。

长期来看，这场争论揭示了公共机构在 AI 时代的深层焦虑——非技术人员因"0.1% 的担责风险"而做出技术倒退决策。正如 Eden 所言："这不过是 NHS England 的某人买进了 Mythos 将终结安全现有秩序的炒作，然后有点恐慌了。"

## 5) 附带链接

- **HN 原帖**: https://news.ycombinator.com/item?id=47975785
- **公开信网站**: https://keepthingsopen.com
- **背景深度分析（shkspr.mobi）**: https://shkspr.mobi/blog/2026/05/nhs-goes-to-war-against-open-source/
- **New Scientist 报道**: https://www.newscientist.com/article/2524962-nhs-england-rushes-to-hide-software-over-ai-hacking-fears/
- **NHS 服务标准第12条**: https://service-manual.nhs.uk/standards-and-technology/service-standard-points/12-make-new-source-code-open
