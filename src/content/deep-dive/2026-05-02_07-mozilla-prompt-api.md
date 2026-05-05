---
title: "mozilla-prompt-api"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-mozilla-prompt-api"
---

## Mozilla's opposition to Chrome's Prompt API

### 事件背景

Mozilla 在 standards-positions 仓库正式发表反对意见，针对 Google Chrome 推出的 Prompt API（一个允许网页直接调用浏览器内置 AI 模型的 JavaScript API）。发声者是 Jake Archibald——前 Google Chrome 团队成员、现 Mozilla 标准工程师，HN 用户 swyx 在评论区点出："难怪批评写得这么有说服力，他终于不用为公司路线辩护了。"HN 评分 642。

### 核心观点

Mozilla 的核心论点是：Chrome Prompt API 没有标准化模型行为，其结果由 Google 的 Gemini Nano（或 Edge 的 Phi-4 mini）决定。这意味着如果 web 开发者基于 prompt API 写应用，**Mozilla 和 Apple 要么 license 谷歌模型，要么自己 ship 一个"quirks 兼容"的模型**才能保证互操作性——结果就是 Google 不只是事实标准，连"参考实现"都把持。同时 Chrome 自己也会被锁死，难以更新 Gemini Nano。这是浏览器战争 2.0：Google 把"模型"变成了不可标准化的私有依赖。

### 社区热议与争议点

评论区共识度罕见地高，几乎一边倒支持 Mozilla。**反垄断派（croes）**："欧盟下一个反垄断案——Chrome 已经主导浏览器市场，现在又试图滥用这个地位。"**标准派（varun_ch）**给出建设性方案："浏览器厂商可以约定共同 ship 几个'标准模型'——权重公开、命名无聊（像 CSS 颜色一样），跨浏览器一致。如果用户想用更多模型可以自行安装。"**冷静派（fg137）**梳理历史脉络："如果只有 Chrome 支持这个 API，且只用 Google 自家模型，性质就清楚了——Google 滥用市场地位。我们见过太多次，FLoC、Privacy Sandbox、Topics API、Web Environment Integrity……Google 一贯如此。"**怀疑派（benterix）**则质疑前提："文档说浏览器和操作系统'越来越被期待获得 AI 模型访问'——真的是这样吗？"——挑战 prompt API 是否回应了真实需求。

### 行业影响与未来展望

这件事的影响超过技术细节。**短期**：Mozilla 立场会让 prompt API 在 W3C/WhatWG 标准化通道受阻；Chrome 仍可单边 ship，但失去标准合法性。**中期**：欧盟 DMA 极可能介入——这正好踩在"看门人封锁竞争"红线上。**长期**：浏览器内 AI 走向决定下一代 web 应用形态——是开放标准（类似 WebGPU 路径）还是平台锁定（类似 Privacy Sandbox 路径）。如果 Mozilla 阵营 + EU 监管能阻止 Chrome 单边推进，未来一年可能催生标准化的 web AI runtime（兼容 ONNX/GGUF 的中性接口）。

### 链接

- HN 讨论：https://news.ycombinator.com/item?id=47959463
- Mozilla 立场原文：https://github.com/mozilla/standards-positions/issues/1213#issuecomment-4347988313
- Chrome Prompt API 文档：https://developer.chrome.com/docs/ai/prompt-api
