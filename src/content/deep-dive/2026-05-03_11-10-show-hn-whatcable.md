---
title: "Show HN: WhatCable — a tiny menu bar app for inspecting USB-C cables"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-10-show-hn-whatcable"
summary: "- HN: 530 points"
---

# Show HN: WhatCable — a tiny menu bar app for inspecting USB-C cables

- HN: 530 points
- 链接: https://github.com/darrylmorley/whatcable

## 定位与痛点剖析
USB-C 表面上是统一接口，实际上每根线缆能力差异巨大：USB 2.0 / 3.2 Gen1 / Gen2 / 4 / Thunderbolt 3 / 4 / 5；E-Marker 与否；3A vs 5A vs EPR 28V/240W；DP Alt Mode 是否支持；视频带宽……普通用户看着一条 USB-C 完全无法判断。`whatcable` 是一个 macOS 菜单栏小工具，插上线缆后立即弹出它的 E-Marker 信息——速率、功率、所支持的 Alt Mode、厂商、批次。

## 核心架构与技术细节
- 使用 macOS IOKit 监听 USB 设备插入；当检测到 USB-C cable 携带 E-Marker 芯片，调用 `IOUSBLib` 读取标识；
- 通过 USB Power Delivery (PD) 协议中的 *Discover Identity* / *Discover SVIDs* / *Discover Modes* 命令获取线缆描述符；
- 解析返回的 VDOs（Vendor Defined Objects）字段，得到速率（USB 4 Gen3x2）、最高电流（5 A）、Active vs Passive、长度等；
- 用 SwiftUI 写菜单栏；持久缓存最近 10 根线缆的 fingerprint；
- 仓库 ~600 行代码，MIT 协议。

## 竞品对比与生态站位
- TotalPhase Cable Tester：硬件方案，专业但贵（$1500+）；
- USB-C Cable Checker（巴掌大硬件）：人民币 100 元左右，看屏；
- macOS System Information → USB：能看到部分 PD 信息但不直观；
- `whatcable` 的差异化在于：纯软件、零成本、菜单栏即时展示，目标群体是开发者与电子爱好者；缺点是只有 macOS、依赖宿主芯片组支持读 PD VDO。

## 开发者反馈与局限性
- 顶赞评论：「拯救了我桌上 12 条神秘 USB-C 线」，并请求 Windows / Linux 端口；
- 技术 issue：部分 Apple Silicon 机型在 Thunderbolt 控制器层屏蔽了 VDO；
- 建议：增加导出 JSON、批量 fingerprint 数据库（社区共享线缆信息）、识别假冒 E-Marker 芯片；
- 局限：对于完全没有 E-Marker 的廉价 USB 2.0 线，仍无法识别速率上限。

## 附带链接
- GitHub: https://github.com/darrylmorley/whatcable
- HN 讨论: https://news.ycombinator.com/item?id=47930000
