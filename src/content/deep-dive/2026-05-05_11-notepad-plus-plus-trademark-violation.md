---
title: "Notepad++ 商标维权：开源项目第一次\"硬核\"打假 macOS 山寨站"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "HN"
slug: "2026-05-05_11-notepad-plus-plus-trademark-violation"
summary: "- HN：https://news.ycombinator.com/item?id=48006445（588 points · 267 comments）"
---

# Notepad++ 商标维权：开源项目第一次"硬核"打假 macOS 山寨站

- HN：https://news.ycombinator.com/item?id=48006445（588 points · 267 comments）
- 原文：https://notepad-plus-plus.org/news/npp-trademark-infringement/

## 1. 事件背景

5 月 1 日，Notepad++ 项目作者 Don Ho 在官网发布措辞强硬的声明：一个名为 **notepad-plus-plus-mac.org** 的网站冒名兜售"官方 macOS 版 Notepad++"，不仅盗用项目名称，还把 Don Ho 本人的头像和个人简介贴在网站上，营造"官方背书"的假象，甚至已经有科技媒体被骗报道过。问题在于：Notepad++ **从来没有** macOS 版，只有 Windows。Don Ho 直接喊话该站运营者："你网站每多挂一天就多一天侵权，我不接受你说的'再给我一两周改名'"，并表示如果不立即下架将进一步法律升级。

## 2. 核心冲突机制

事件本质是开源软件长期面临的 **"商标 vs 协议"** 灰色地带：Notepad++ 源码以 GPL 协议开放，任何人都可以 fork、移植、商用，但其名称、logo 是**注册商标**（Don Ho 通过法国 INPI 注册，美国仅享有普通法商标），任何人都不能擅自使用品牌词来分发软件——尤其是把"port"包装成"官方 macOS 版"。山寨站的关键失误不在于做 Mac 移植，而在于：(1) 直接用 "Notepad++" 名称做域名和品牌；(2) 盗用作者头像、姓名暗示"由 Don Ho 合作发布"；(3) 抗议时还说成"in collaboration with Don Ho"，激怒了原作者。

## 3. 社区热议与争议点

HN 评论区分裂出两派：
- **支持作者派**（kube-system、nkrisc 等）：商标和源码协议是两件事；不发布 Mac 版不等于"占着茅坑"，要 port 就 port，但**别用这个名字**——评论给出 "Crystal Pepsi" 等类比，强调商标无关产品供给量；很多人为 Don Ho 鼓掌"开源社区终于有人对名字滥用动真格"。
- **同情移植者派**（archy_）："Mac 上明显有需求，原作者不做却又压制移植，等于商标 squatting"——但被多人反驳商标法本身允许"积极使用 + 防御冒用"。
- **AI 时代 port 案例**（jeffnash）：评论中一位开发者透露自己用 Claude Code 做"spec-driven development"克隆 Notepad++ 到 Linux，因看到此事件主动改名为 "nootpad" + 大段 README 致谢，避免步山寨站后尘——折射出 LLM 让"批量 clone 名项目"的成本急剧下降，开源商标维权将变成持续战。
- **法律细节派**（outofpaper）：指出 Notepad++ 美国未在 USPTO 注册，仅享 common-law 商标，但发 cease-and-desist **不需要**注册，C&D 信对域名注册商和广告平台依然有效。

## 4. 行业影响与未来展望

这是开源软件商标维权进入"AI clone 时代"的一个标志性事件：(1) 开源项目以后必须更主动地注册和管理商标，否则随便一家用 LLM 拼出的 SEO 站就能截走品牌流量；(2) 浏览器/包管理器分发渠道（Homebrew、winget、各种"软件大全"站点）需要更严格的"上游溯源"机制，否则会成为冒名传播载体；(3) 对开发者：以后做 port/fork，宁可起新名 + 充分 disclaimer，"trademark-safe naming" 会成为 contributor checklist 的标准项。Don Ho 本次的硬核应对，给整个 OSS 社区做了一次范本演示。

## 5. 链接

- HN 讨论：https://news.ycombinator.com/item?id=48006445
- 官方声明：https://notepad-plus-plus.org/news/npp-trademark-infringement/
