---
title: "claude-code-openclaw-commits"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-claude-code-openclaw-commits"
---

## Claude Code refuses requests or charges extra if your commits mention "OpenClaw"

### 事件背景

开发者 Theo（@theo）在 X 上爆料：当用户在 git 仓库的 commit messages、CLAUDE.md 或源码中出现 "OpenClaw" 或 "Hermes" 等竞品 agent harness 关键词时，Anthropic 的 Claude Code 会出现拒绝执行、降级响应，甚至额外收费的情况。OpenClaw 是开源的 LLM agent 运行时，Hermes 则是另一个开源 harness。事件迅速登上 HN 头版（1305 分），成为 2026 年 4 月底社区焦点。

### 核心机制

根据社区逆向分析，Claude Code 端在请求上下文中扫描特定字符串（疑似简单 regex 匹配），命中后触发降级路径：要么直接拒绝，要么从 Pro/Max 订阅切换为按量计费的 API 调用。这被普遍解读为 Anthropic 试图阻止用户用便宜的 Claude 订阅去给自家或第三方 agent 框架"喂食"，但实现方式异常粗糙。

### 社区热议与争议点

HN 评论区的核心争议集中在三点。**反方一（stingraycharles）**承认自己常为 Anthropic 辩护，但批评实现方式："看起来就是个简单 regex，他们竟然没有想过先扫描确保 Claude Code 自己永远不会被误伤？应该先白名单化 Claude Code 的特征再做大扫荡。"**反方二（data-ottawa）**举出受害场景：自己用 NixOS QEMU VM 跑 OpenClaw 做沙箱实验，仓库里只是有相关说明文档就被降级，"Claude Code 拥有这么多机器访问权限，还做这种粗糙指纹识别简直离谱。"**正方（speedgoose）**冷嘲："至少证明 Anthropic 在吃自己的狗粮——他们用 Claude 开发软件。"**经济学派（zb3）**则认为这暴露了根本问题："非用量计费模式根本不可持续，Anthropic 应该坦率承认订阅制要被淘汰。"另有评论（mcast）质疑 Anthropic 算力告急，才会把 OKR 摆在这种封堵上。

### 行业影响与未来展望

事件再次暴露了 LLM 大厂的"平台 vs 工具"两难：当 Claude Code 既是 IDE 又是底层模型供应商，封堵竞品 harness 等同于把开发者锁在自家工具链。短期看，开源 agent 框架（OpenClaw、Hermes、Aider 等）会获得更多反向流量；长期看，订阅制 + 行为识别封禁会推动企业转向 Bedrock、Vertex 等中性渠道。这与 Uber 烧光 AI 预算（同期 HN 头条）相呼应——经济不可持续 + 反竞争行为正在合流。

### 链接

- HN 讨论：https://news.ycombinator.com/item?id=47963204
- 原始爆料：https://twitter.com/theo/status/2049645973350363168
