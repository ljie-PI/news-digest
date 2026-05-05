---
title: "LocalSend：开源跨平台 AirDrop 替代方案再登 HN 热榜"
date: "2026-04-29"
generated: "2026-04-29 07:00"
source: "HN"
slug: "2026-04-29_07-localsend-open-source-airdrop-alternative"
summary: "LocalSend 是一款免费、开源的跨平台文件传输应用，允许用户在同一局域网内安全地分享文件和消息，无需互联网连接。项目基于 Flutter 开发，支持 Androi"
---

# LocalSend：开源跨平台 AirDrop 替代方案再登 HN 热榜

## 事件背景

LocalSend 是一款免费、开源的跨平台文件传输应用，允许用户在同一局域网内安全地分享文件和消息，无需互联网连接。项目基于 Flutter 开发，支持 Android、iOS、macOS、Windows 和 Linux 全平台，使用 REST API 和 HTTPS 加密进行通信，TLS/SSL 证书在每台设备上动态生成。该项目在 GitHub 上已多次登上 HN 热榜，此次由用户 bilsbie 提交再次获得 718 分和 225 条评论。

## 核心观点

LocalSend 的核心价值在于：完全去中心化（不依赖任何第三方服务器）、隐私优先（数据不离开本地网络）、真正跨平台（覆盖所有主流操作系统）。它使用端口 53317 进行 TCP/UDP 通信，支持便携模式和静默启动。与 AirDrop 相比，LocalSend 解决了跨生态系统传输的痛点——尤其是 Apple 和 Android/Windows/Linux 之间的文件传输。

## 社区热议

讨论聚焦于 LocalSend 与 AirDrop 及其他替代方案的对比：

- **Unicironic** 表达了对 LocalSend 的喜爱："切换到 Linux 后，这是我安装的第一个应用之一。它让我真正感受到开源应用有多棒。"（"After switching to Linux, this was one of the very first applications I installed. It really helped cement how great open source apps can be."）
- **viktorcode** 指出 AirDrop 的一个关键优势是能自动选择最快的连接方式且不需要两设备在同一网络。**subscribed** 对此吐槽 Google Quick Share："从来没成功过，三部手机都试了。用 Python 起个 HTTP 服务器都比 Quick Share 好使。"（"Never worked for me, not even once... spinning a local http server works better than quick share."）
- **mikae1** 提到被 KDE Connect 替代了 LocalSend，因为 KDE Connect 还支持更多设备互联功能。**tryptophan** 回应："我喜欢 KDE Connect，但它每个月都会莫名其妙坏掉。"
- **brianwmunz** 分享了实际用例："我用它在笔记本和工作机之间传 SSH 密钥、VPN 配置和 .env 文件。显然不想让这些东西放在 Dropbox 或 Slack 里。LocalSend 在同一网络，两秒搞定，不需要账号也没有历史记录。"（"I use it for moving SSH keys, VPN configs, and .env files... Localsend on the same network, gone in two seconds no account and no history."）

## 行业影响

在 Google 即将收紧 Android 侧载政策的背景下（参见 keepandroidopen.org 事件），LocalSend 这类不依赖应用商店的开源工具的价值更加凸显。它代表了一种理念：基础的设备间通信不应该被平台围墙所限制。LocalSend 的成功也说明，在文件传输这一看似"已被解决"的领域，仍存在大量未被满足的跨平台需求。可通过 F-Droid、Flathub、Homebrew 等多渠道安装。

## 相关链接

- GitHub 项目：https://github.com/localsend/localsend
- 官网：https://localsend.org
- HN 讨论：https://news.ycombinator.com/item?id=47933208
- 协议文档：https://github.com/localsend/protocol
