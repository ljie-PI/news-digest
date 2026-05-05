---
title: "An open-source stethoscope that costs between $2.5 and $5 to produce"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "HN"
slug: "2026-04-30_22-open-source-stethoscope"
summary: "**链接**：[GitHub – GliaX/Stethoscope](https://github.com/GliaX/Stethoscope) · [HN 讨论](https://news.ycombinator.com/item?id=47949204) · 165 points · 71 comments"
---

# An open-source stethoscope that costs between $2.5 and $5 to produce

**链接**：[GitHub – GliaX/Stethoscope](https://github.com/GliaX/Stethoscope) · [HN 讨论](https://news.ycombinator.com/item?id=47949204) · 165 points · 71 comments

## 定位与痛点剖析

Glia 的 Stethoscope 项目是开源医疗硬件的标杆。痛点直接：发达国家一支临床级听诊器约 200 美元，在中低收入地区与冲突地区，整套医院都装备不起。Glia（一个加拿大非营利组织）以约 2.5–5 美元的物料成本、3D 打印 + 标准管材的方式做出了已发表临床等效性研究的开源听诊器。

## 核心架构与技术细节

仓库提供：(1) 完整 OpenSCAD / FreeCAD 设计文件（chestpiece + diaphragm holder + ear tubes adapter）；(2) BOM（Tygon 软管、橡胶 O 圈、PLA/ABS 打印件、低成本振膜）；(3) 装配说明与质量检验程序；(4) 已发表的同行评议研究（Glia 2018, 2020 等）证明在心音/肺音听辨上与 Littmann Classic II 临床等效。社区 fork 已涵盖儿童听诊器变体、电子声学拾音模块。

## 竞品对比与生态站位

- 闭源量产：3M Littmann（>200 USD）—声学旗舰，难以普惠。
- 同类开源：Open Source Pulse Oximeter、Open Insulin、OScope 等共属"开源医疗硬件"运动；Glia 的差异化是有发表的临床等效性数据。
- 数字听诊：Eko、Thinklabs One 主打 AI 心音分析，售价数百美元；Glia 暂未走数字化路线，但可作为前端硬件。

## 开发者反馈与局限性

- **赞**：HN 评论指出 Glia 对加沙、叙利亚野战医疗机构的实际供应是一线证据，3D 打印 + 本地组装大幅缩短供应链。
- **限制**：(1) 振膜薄膜和耳塞的舒适度仍弱于商用产品；(2) PLA 打印件不耐高温灭菌，需要 PETG/医用 ABS 替代；(3) 监管路径复杂，许多国家把听诊器视作 Class I 医疗器械，需要本地 CE/FDA-equivalent 认证；(4) 长期耐久性数据有限。

## 链接

- GitHub：https://github.com/GliaX/Stethoscope
- 项目主页：https://glia.org
- HN 讨论：https://news.ycombinator.com/item?id=47949204
