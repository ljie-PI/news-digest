---
title: "chrome-prompt-api"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "HN"
slug: "2026-05-02_07-chrome-prompt-api"
---

## The Prompt API (Chrome built-in AI)

### 事件背景

Chrome 在 138 版本起开放了 Prompt API 的 origin trial，将 Gemini Nano 这一端侧小模型直接内置到浏览器。开发者通过简单的 `LanguageModel.create()` / `prompt()` 接口，就能在用户本地浏览器里跑出 AI 推理结果，无需服务器、无需调用云端 API。Chrome 148 又开放了第二轮 origin trial，加入采样参数（topK、temperature）的可配置接口。这是 Web 标准里第一次把「LLM 推理」作为一等公民暴露给前端。

### 核心观点 / 产品机制

Prompt API 的落地方式有四个关键点：(1) 模型与浏览器解耦——Gemini Nano 在首次使用时按需下载，开发者通过 `LanguageModel.availability()` 与 `downloadprogress` 事件感知；(2) 硬件门槛——要求 22GB 可用磁盘、4GB+ VRAM 或 16GB RAM + 4 核 CPU，目前桌面版 Windows/macOS/Linux/Chromebook Plus 支持，移动端尚未支持；(3) 会话模型——`create()` 可注入 system / user / assistant 多轮 initialPrompts 作为上下文，可用 `AbortController` 中断；(4) 适用场景——Google 给出的样例是 AI 搜索、个性化新闻流、自定义内容过滤、日历事件抽取、联系人抽取等纯客户端任务。本质上它是把「轻量级 LLM 调用」当成 `fetch` 一样标准化。

### 社区热议与争议点

HN 评论区第一波热议是「用它做社交媒体 desnarkifier」：让浏览器扩展把推文里的攻击性、阴阳怪气语句翻译成中性事实陈述。原帖作者认为「读者免受陌生人辱骂、写者也没必要互喷」。一名用户附和：「我想要不带戏剧的实质内容」，并把目前的社交媒体比作「想看技术却被卷入陌生人的口水仗」。第二波讨论关于「AI 净化即审查」：有人警告这是复杂发酵过程而非单纯过滤，恶意输入可能 hijack LLM 输出，让无辜评论被「总结」成可被禁号的言论。第三波是实战分享：一位用户已构建私人 AI agent 自动归档「FYI / 邮件列表 / 营销」邮件，留下 action required 的，「改变了人生」。也有人把这种思路类比 DeArrow——通过众包重写 YouTube 标题去除标题党。

### 行业影响与未来展望

Prompt API 的意义在于「把 LLM 从云算力变成浏览器原生能力」。一旦 Web 平台把端侧推理标准化，几个变化会发生：(1) 前端开发者会写出大量「不联网的 AI 微功能」，比如本地翻译、本地分类、隐私敏感的表单辅助；(2) 浏览器扩展会成为社交媒体重塑层，DeArrow 式的众包标题改写会被 AI-内容净化扩展取代；(3) 云端 LLM API 厂商面临首个真正的「端侧免费替代」竞争压力，至少在轻量推理场景里。但同时，prompt injection、模型审查偏见、22GB 模型分发的版本管理都将成为新的 Web 安全议题。

### 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47917026
- 原文：https://developer.chrome.com/docs/ai/prompt-api
