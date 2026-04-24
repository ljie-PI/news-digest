---
title: "Kelp DAO 2.92亿美元黑客攻击与\"时间信任间隙\"漏洞类——AI安全研究的惊人预言"
date: "2026-04-25"
generated: "2026-04-25 07:00"
source: "Reddit"
slug: "2026-04-25_07-kelp-dao-292m-hack-temporal-trust-gaps"
summary: "---"
---

# Kelp DAO 2.92亿美元黑客攻击与"时间信任间隙"漏洞类——AI安全研究的惊人预言

> 原帖: [Reddit r/artificial](https://www.reddit.com/r/artificial/comments/1sus96g/)
> 相关前帖: [Anthropic's Claude Mythos Finds Zero-Days](https://www.reddit.com/r/artificial/comments/1slsr4e/)
> 日期: 2026-04-25

---

## 一、事件背景

2026年4月19日，DeFi流动性再质押协议Kelp DAO遭遇史上最大规模攻击之一：攻击者通过伪造LayerZero跨链消息，从Kelp的跨链桥中提取了116,500枚rsETH（约2.92亿美元），占rsETH流通总量的18%。攻击窗口仅46分钟，紧急暂停多签在18:21 UTC才冻结合约，但资金已被转移。

令人震惊的是，就在攻击发生的4天前，Reddit用户在r/artificial发帖介绍了一种名为**"时间信任间隙"（Temporal Trust Gaps）**的漏洞类别——该类别恰好精确描述了Kelp DAO被利用的核心机制。

## 二、核心观点：什么是"时间信任间隙"？

"时间信任间隙"的定义来自此前一篇关于Anthropic Claude Mythos模型在FFmpeg中发现零日漏洞的分析帖：**验证逻辑存在且正确，但验证与实际操作之间存在时间分离——在某一时刻建立的信任被假定在之后仍然有效。**

在FFmpeg中，这表现为MOV解析器的校验与后续内存操作之间的时序脱节。而在Kelp DAO案例中，完全相同的结构性模式出现在跨链桥层面：

- **桥的验证逻辑本身没有"错误"**——它按设计运行，信任LayerZero消息层传来的认证结果
- **关键缺陷**：Kelp采用了1-of-1的DVN（去中心化验证网络）配置，意味着仅需一个验证节点确认即可放行
- 攻击者操纵了输入该验证节点的数据，使其认证了一条伪造的跨链指令
- 桥"如实执行"了这条被信任的消息——**信任在建立时是合理的，但在执行时已不再有效**

正如Espresso Systems CEO Ben Fisch所言："桥按设计运行，它只是相信了错误的信息。"

## 三、社区热议与争议点

由于Reddit原帖评论区无法直接抓取，以下综合搜索结果中r/artificial与r/ethereum社区的主要争论：

1. **"AI发现漏洞类 vs 人类忽视警告"之争**：原帖作者指出，Claude Mythos在FFmpeg中发现的零日漏洞与Kelp DAO被黑使用的是同一结构性漏洞类。社区对此分为两派——一方认为这证明AI安全研究已超前于行业实践；另一方则质疑事后归因的可靠性，认为"时间信任间隙"过于宽泛，几乎所有TOCTOU（Time-of-Check to Time-of-Use）漏洞都可纳入其中。

2. **15个月前的预警被无视**：r/ethereum的一条热帖揭示，有研究者在15个月前就向Kelp DAO报告了此类漏洞，协议方回复"已知晓"却未采取行动。评论者愤怒指出："这是每次DeFi重大黑客事件的剧本——研究者披露、协议方说'我们知道了'、什么都没改、漏洞被利用。"

3. **LayerZero与Kelp的责任推诿**：Kelp声称1-of-1 DVN是LayerZero的默认配置，LayerZero未公开确认。社区评论尖锐批评双方"都不干净"——选择默认安全配置的是协议方，但提供不安全默认值的是基础设施提供商。

4. **Aave的连带损失引发系统性风险讨论**：攻击者将被盗rsETH存入Aave借出约1.9亿美元真实资产，制造了潜在1.24-2.3亿美元坏账。Aave DAO总储备仅约1.81亿美元。社区围绕"DeFi可组合性是否本质上是系统性风险放大器"展开激辩。

## 四、行业影响与未来展望

此事件的意义远超单一协议的安全事故：

- **跨链桥仍是DeFi最薄弱环节**：从2022年的Ronin（6.25亿）、Wormhole（3.2亿）到2026年的Kelp DAO（2.92亿），桥接攻击的累计损失已达数十亿美元
- **AI辅助安全研究的价值被验证**：Claude Mythos在传统软件（FFmpeg）中识别出的漏洞模式，同样适用于DeFi智能合约和跨链基础设施，暗示AI驱动的漏洞类分类体系可能成为预防性安全工具
- **"信任最小化"成为必修课**：行业正加速推进硬件保护验证环境、密码学证明系统（允许链间无需信任中间方即可验证状态）、以及验证者多样性要求
- **Arbitrum安全委员会冻结7100万美元**创下了L2治理紧急响应的先例，但仍有约2.21亿美元资金在洗钱流转中

"时间信任间隙"这一概念的提出者在4天内得到了最残酷的验证——这既是AI安全能力的展示，也是行业对已知漏洞类视而不见的又一次警示。

## 五、相关链接

- [原帖 (r/artificial)](https://www.reddit.com/r/artificial/comments/1sus96g/)
- [前置帖：Claude Mythos发现FFmpeg零日漏洞](https://www.reddit.com/r/artificial/comments/1slsr4e/)
- [CoinDesk: Kelp DAO漏洞暴露跨链桥弱点](https://www.coindesk.com/tech/2026/04/21/the-usd292-million-kelp-dao-exploit-shows-why-crypto-bridges-are-still-one-of-the-industry-s-weakest-links)
- [CoinDesk: Aave领导DeFi救助行动](https://www.coindesk.com/business/2026/04/23/aave-rallies-defi-partners-to-contain-fallout-from-usd292-million-kelpdao-hack)
- [NFT Plazas: 2.92亿美元攻击技术分析](https://nftplazas.com/kelp-dao-bridge-exploit-292-million-layerzero/)
- [r/ethereum: 15个月前的预警](https://www.reddit.com/r/ethereum/comments/1spoe1h/)
