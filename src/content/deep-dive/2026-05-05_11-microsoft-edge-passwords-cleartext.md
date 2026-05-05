---
title: "Microsoft Edge 把所有保存的密码都明文驻留进程内存"
date: "2026-05-05"
generated: "2026-05-05 11:00"
source: "HN"
slug: "2026-05-05_11-microsoft-edge-passwords-cleartext"
summary: "- HN：https://news.ycombinator.com/item?id=48012735（446 points · 157 comments）"
---

# Microsoft Edge 把所有保存的密码都明文驻留进程内存

- HN：https://news.ycombinator.com/item?id=48012735（446 points · 157 comments）
- 原文：https://twitter.com/L1v1ng0ffTh3L4N/status/2051308329880719730

## 1. 事件背景

安全研究者 L1v1ng0ffTh3L4N 在 X (Twitter) 上发布发现：Microsoft Edge 浏览器即便用户**完全没有触发自动填充**，也会把所有用密码管理器保存的凭证以**明文 (plaintext)** 形式持续驻留在进程虚拟内存中。研究者展示在普通 Windows 用户态 dump Edge 进程内存即可读取整张密码表，结合企业里"远程桌面/终端服务器多用户共用主机"的场景，攻击影响显著放大——一名拿到管理员权限的攻击者可以一次性收割所有登录用户的浏览器密码。事件再度把"浏览器密码管理器到底安全吗"这个老命题推上 HN 首页。

## 2. 技术机制与 Chromium 威胁模型

Edge 基于 Chromium，密码默认通过 Windows DPAPI 加密在磁盘上，但**解密后的明文需要驻留在内存中**才能用于自动填充。问题是：用户即使没用自动填充，浏览器在某些路径（启动时初始化、与服务同步、生物识别预热）会一次性把整库解密缓存进内存。结合 Chromium 官方"physically-local attacker 不在威胁模型内"的立场，Microsoft 与 Google 都默认：**只要攻击者拿到了用户级权限，浏览器就放弃防御**——因为操作系统层面已被攻破，再加密也无意义。这是 HN 讨论的核心争点。

## 3. 社区热议与争议点

- **"airtight hatchway" 派**（gruez、maxloh）：引用 Raymond Chen 经典文章，认为这其实**不算漏洞**——只要攻击者能读任意进程内存，就能附加调试器假冒用户解密密码，"明文 vs 加密"差别不大；Chromium 上游官方 threat model 也明确不防本机攻击。
- **不同意派**（formerly_proven、Lorkki 等）：明文驻留的风险来自冷启动 dump、内存泄漏漏洞、跨用户终端服务器，"标准做法"应该是 guard page + 按需解密，把窗口期压到最小，OpenSSL/Windows 内核都用过这种**defense-in-depth**；用一个绝对论 "本机失守即结束" 否定一切纵深防御不严谨。
- **企业现实派**：Windows Server / Citrix / RDS 多租户场景下，管理员可以读所有用户进程，但用户彼此不能；Edge 把密码全明文驻留意味着任何**特权服务账号一旦被横向移动**就能批量收割租户密码，比 Chrome 在域控环境下更危险，"标准 Chromium 行为"不能搪塞。
- **替代方案派**：评论一致推荐 Bitwarden / 1Password / KeePassXC 等独立 password manager，至少有"会话超时锁库"语义，不会全程解密驻留。

## 4. 行业影响与展望

这次披露不会立刻改 Edge 行为，但会推动几件事：(1) 企业 SOC 把"浏览器进程内存 dump"重新放回威胁建模——尤其是 RDS / VDI 环境；(2) 推动 Chromium 上游讨论 in-memory secret guard page、按需解密 API；(3) 个人用户从"浏览器内置密码"迁移到独立密码管理器；(4) 随着 Windows 11 把 Edge 与系统更深耦合（Webview2、Edge for Business 加入 Entra），"凭证驻留范围"将再次成为合规审计点。整体看是一次教科书级的"Chromium 威胁模型 vs 现实企业风险"碰撞。

## 5. 链接

- HN 讨论：https://news.ycombinator.com/item?id=48012735
- 原帖（X）：https://twitter.com/L1v1ng0ffTh3L4N/status/2051308329880719730
