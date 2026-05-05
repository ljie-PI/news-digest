---
title: "Tell HN: An app is silently installing itself on my iPhone every day"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-07-iphone-silent-app-install"
summary: "- HN: 588 points"
---

# Tell HN: An app is silently installing itself on my iPhone every day

- HN: 588 points
- 链接: https://news.ycombinator.com/item?id=47906253

## 事件背景
一位用户发起 *Tell HN*：发现自己 iPhone 上每天都会自动重装一个特定第三方 app，即使删除几小时后又会出现。日志显示来自 App Store 后端的 *redownload* 推送，但用户从未触发。帖子迅速升到 588 分，是近一个月里 *Tell HN* 类目的最高之一。

## 核心观点 / 产品机制
帖主最终定位到原因是 **Family Sharing + 共享 App 自动重新下载** 与 **Screen Time 跨设备同步** 的组合行为：家庭中另一人设备触发了「Apps Across Devices」（默认开启于「自动下载已购项目」），iCloud 同步推送到所有家庭成员设备。删除并不会从「已购」库移除；而 Family Sharing 把家庭成员的某次下载等同于一次「公共已购」，因此过几小时 iCloud 就再次拉回。
更糟的是相关开关在 iOS 18+ 上被分散在 Settings → App Store → Apps Across Devices、Family → 共享购买、Apple Account → 隐藏已购里。

## 社区热议与争议点
- 隐私派：「这其实是把家庭成员的下载行为跨设备物化推送，一旦家庭关系破裂或共享账号被滥用，等于持续「被强制安装」；
- iOS 工程师：澄清并不是恶意软件，而是 Apple 多年累积的「系统状态对齐」语义；
- 解决方案派（顶赞）：① 取消 Family Sharing 中的 *App* 共享类目；② 关闭 Apps Across Devices；③ 在「已购」页面 *隐藏* 此 app；三者缺一仍可能复发；
- 反 Apple 派：批评 Apple 的设置 UX 已经「可疑到接近 dark pattern」，让普通用户根本无法定位到三个关闭点。

## 行业影响与未来展望
这是一个典型的「平台默认行为反过来变成用户体验灾难」的案例。预计 iOS 19 会把 Apps Across Devices 与 Family 自动同步合并到一个清晰开关。对企业 MDM 管理员来说，建议给员工写一份 onboarding 文档，明确关闭 Family Sharing 的 App 类别，避免企业账号 app 被无意复制到家人设备。对于普通用户，今晚就检查 Settings → Apple ID → Family Sharing → Purchase Sharing 与 Settings → App Store → Apps Across Devices 两处开关。

## 附带链接
- HN 帖子: https://news.ycombinator.com/item?id=47906253
