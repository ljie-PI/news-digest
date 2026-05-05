---
title: "假冒 Notepad++ 上架 Mac App Store：一场围绕\"无注册商标却仍受保护\"的小型治理案例"
date: "2026-05-05"
generated: "2026-05-05 12:00"
source: "HN"
slug: "2026-05-05_12-notepad-plus-plus-fake-mac"
summary: "Notepad++ 项目维护者 Don Ho 发布声明：Mac App Store 上一款标榜 \"Notepad++ for Mac\" 的应用与 notepad-plus-plus.org 项目无任何关系，构成商标侵权。官方明确：Notepad"
---

# 假冒 Notepad++ 上架 Mac App Store：一场围绕"无注册商标却仍受保护"的小型治理案例

> 来源: Notepad++ 官方公告  
> HN: https://news.ycombinator.com/item?id=48006445  
> 评分: 591 / 评论: 269  
> 链接: https://notepad-plus-plus.org/news/npp-trademark-infringement/

## 事件本身

Notepad++ 项目维护者 Don Ho 发布声明：Mac App Store 上一款标榜 "Notepad++ for Mac" 的应用与 notepad-plus-plus.org 项目无任何关系，构成商标侵权。官方明确：Notepad++ 仅在 Windows 上发行，未授权任何人在 macOS 上以该名号发布产品；该 Mac 应用（疑似 Electron 包壳或 vibe-coded SwiftUI 工程）仿冒图标与命名，可能存在恶意行为或低质拷贝。声明已要求 Apple 下架并保留法律追究权。开发者在被点名后表态愿"修正"，但未撤架。

## 为什么值得关注

- **"未注册商标"也并非无保护**: 多名律师 / 工程背景评论指出，根据美国 Lanham Act 第 43(a) 条款与多数普通法体系，长期使用、知名度可证的标识即便未注册，也享有 unregistered trademark 的反混淆保护；进入 App Store 这种交易场域更收紧标准。
- **App Store 审核的盲区**: Apple 长期以来对开源项目商标的审查薄弱，社区习惯靠 OSS 维护者公开喊话+外部社交压力倒逼下架。这次再次重演了 2017 年 VLC、2021 年 Wireguard 类似戏码。
- **生成式开发的副作用**: 多条评论提示这是 "vibe-coded" 风潮的副产物——AI 工具让"3 天内复刻一款流行工具"的成本接近零，App Store 假冒与擦边将系统性增加。

## HN 评论区观察

主线分歧在于动机与责任：odie5533 等认为开发者大概率"不知道商标存在、也没想过会引发反弹"，主张善意推定；多条反驳如 tristor、kube-system 强调"是否注册"与"是否伦理"无关，名称足够知名即构成默认商标，且开发者在 LinkedIn 自述包含 Moody's、BNY 等金融科技履历，"知道商标怎么运作"。另一支线由 karel-3d / odie5533 牵出"以后再也看不到非 vibe-coded 的应用了"，借此抨击 AI 加速复刻；debugnik 反驳，把"Notepad"视为 Windows 通用名，提醒 Notepad++ 自身也是借力前作。

## 我的判断

短期看苹果会下架，开发者无后续反击的法律资本。中期信号更重要：随着 LLM 把"复刻成本"压到一杯咖啡的级别，各大商店的商标审核系统正在被压力测试，开源工具品牌将不得不更早注册多平台商标并主动布点 App Store/Play Store 官方账号。社区策略也需要进化——Notepad++ 在 GitHub 仓库与官网放置"我们没有 Mac 版"的官方静态页，能直接被 Apple Trust&Safety 引用，比每次靠舆论推动更可持续。
