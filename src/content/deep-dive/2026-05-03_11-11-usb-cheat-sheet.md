---
title: "USB Cheat Sheet (2022)"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-11-usb-cheat-sheet"
summary: "- HN: 513 points"
---

# USB Cheat Sheet (2022)

- HN: 513 points
- 链接: https://fabiensanglard.net/usbcheat/index.html

## 事件背景
Fabien Sanglard（《Game Engine Black Book》作者）2022 年写的 USB 速率/接口/功率速查表，最近因 USB4 V2.0、80 Gbps、Thunderbolt 5 上市而再次被 HN 翻红。文章用一张紧凑的表格，把 USB 1.1 → USB4 V2.0 全谱速率、命名混乱、形状、识别方法一次摊开。

## 核心观点 / 产品机制
- USB 标准命名经历了多次「改名」：USB 3.0 → 3.1 Gen1 → 3.2 Gen1 → SuperSpeed USB 5Gbps；
- 形状层面，Type-A / Type-B / Mini / Micro / Type-C 已混用 20 年，仅 Type-C 是双向；
- USB-C 上跑的协议数量：USB Data + USB PD + DisplayPort Alt + Thunderbolt + USB4 + Audio Accessory，且对线缆有不同要求；
- 功率：5W → 100W (PD 3.0) → 240W (EPR 28V) → 即将到来的 480W（USB-PD 3.2）；
- 文章把所有易混淆的别名做对照表，例如 *SuperSpeed USB 10Gbps* = *USB 3.2 Gen2*。

## 社区热议与争议点
- 顶赞：「这张表救了我每次买线 5 分钟」；
- 反 USB-IF 派：USB Implementers Forum 多次更名是「marketing 与 engineering 的拉锯」，已经让消费者不再相信 logo；
- 实践派：呼吁手机 / 笔记本厂商必须在端口旁标注「USB 3.2 Gen2 (10Gbps) + DP1.4 + PD 100W」一类的真实能力，而不是只贴一个 SuperSpeed 字样；
- 产业派：USB4 V2.0 终于强制要求线缆带数字 E-Marker 描述能力，未来命名混乱将逐步好转。

## 行业影响与未来展望
随着 Thunderbolt 5 / USB4 V2.0 在 2026 普及，主板与外设的接口将出现 *单口万用* 现象。但「形状一样、能力不同」的问题仍会持续，建议：① 厂商必须公开 cable-side 的 PD/USB IDs；② 操作系统应当在状态栏明示当前连接的速率与功率档位；③ 像 WhatCable 这样的工具普及。Fabien 的速查表预计每两年要更新一次，已经是 2010 年代以来 USB 命名混乱的「精神图腾」。

## 附带链接
- 速查表: https://fabiensanglard.net/usbcheat/index.html
- HN 讨论: https://news.ycombinator.com/item?id=47910000
