---
title: "硬件认证如何成为垄断工具：GrapheneOS 对苹果与谷歌的深度批判"
date: "2026-05-11"
generated: "2026-05-11 07:00"
source: "HN"
slug: "2026-05-11_07-hardware-attestation-as-monopoly-enabler"
summary: "2026 年 5 月，以隐私与安全著称的 Android 发行版 **GrapheneOS** 在其官方 Mastodon 账号发布长文，直指 **Apple** 与 **Google** 正通过「硬件认证（Hardware Attestation"
---

# 硬件认证如何成为垄断工具：GrapheneOS 对苹果与谷歌的深度批判

## 1. 事件背景

2026 年 5 月，以隐私与安全著称的 Android 发行版 **GrapheneOS** 在其官方 Mastodon 账号发布长文，直指 **Apple** 与 **Google** 正通过「硬件认证（Hardware Attestation）」机制，将原本用于安全验证的技术武器化，变成排斥竞争对手、锁定用户生态的垄断工具。该帖在 HackerNews 上获得 676 分、252 条评论，成为当日最热话题。

硬件认证本身并非新概念：它通过设备内置的安全芯片（如 TEE/SE）验证系统完整性，防止篡改。然而，GrapheneOS 指出，苹果与谷歌正在将该技术从「可选安全增强」推向「强制准入门槛」，并说服越来越多的第三方服务（包括政府服务）采纳。这一趋势引发了关于数字市场开放性与用户自由的激烈争论。

---

## 2. 核心观点 / 产品机制

### 两套并行的硬件认证体系

| | Apple | Google |
|:---|:---|:---|
| **移动端 API** | App Attest API | Play Integrity API |
| **Web 扩展** | Privacy Pass | reCAPTCHA Mobile Verification + Privacy Pass |
| **硬件要求** | 已强制 | 正逐步强制；「强完整性」已要求 |

GrapheneOS 认为，两套 API「非常相似」，本质上是同一策略的两个分身：利用对移动操作系统的垄断地位，将硬件认证变成「不装我的系统就别用服务」的霸王条款。

### reCAPTCHA Mobile Verification：向桌面系统蔓延

Google 计划将硬件认证要求扩展到 Web 端，其方案堪称激进：
- **Apple 设备**：通过 Privacy Pass
- **GMS Android 设备**：Google 自有方案
- **Windows / Linux / OpenBSD 等**：**要求用手机扫描二维码完成验证**

这意味着，如果你使用的是 Linux 桌面或自组装的 Windows 机器，未来可能需要一部「受认证」的 iOS 或 Android 手机才能通过某些网站的 reCAPTCHA。GrapheneOS 尖锐地指出：「控制 reCAPTCHA 让 Google 处于可以要求拥有 iOS 或受认证 Android 设备才能使用海量互联网的位置。」

### Play Integrity API：安全借口下的排斥

Google 声称 Play Integrity API 用于安全验证，但 GrapheneOS 用数据反驳：
- 该 API **允许 10 年未打补丁的设备通过**
- 却 **明确禁止 GrapheneOS**——一个安全性远高于普通 Android 的系统
- 硬件认证本身可被绕过（泄露的 TEE/SE 密钥、 spoofing 框架），只是 Google 在规模检测后才封禁

GrapheneOS 强调：「Google 的安全借口显然是假的，当他们允许 10 年未打补丁的设备却不允许一个安全得多的操作系统时。这完全是为了通过 GMS 许可执行他们的垄断。」

### 政府竟在助纣为虐

更令人担忧的是，欧盟等政府不仅未阻止这一反竞争行为，反而主动将其纳入法规：
- 数字支付
- 数字身份认证
- 年龄验证

GrapheneOS 指出：「政府越来越多地强制要求使用苹果的 App Attest 和谷歌的 Play Integrity，不仅用于他们自己的服务，也用于商业服务。欧盟在带头推动这些要求。」

---

## 3. 社区热议与争议点

HackerNews 上的 252 条评论呈现出鲜明的两极分化：

**支持 GrapheneOS 的声音：**
- 大量开发者认为硬件认证被滥用，成为「反竞争的市场锁定，伪装成安全」
- 对「Unified Attestation」（欧洲公司提出的统一认证方案）同样警惕，认为它是「比 Android 更封闭、更反竞争的集中化权威系统」
- 有用户分享在 GrapheneOS 上无法使用银行 App、支付服务的实际困扰

**质疑与反驳的声音：**
- 部分开发者认为，对于金融、医疗等高安全场景，硬件认证确实能降低欺诈与篡改风险
- 有人指出，Android 的硬件认证 API 至少「允许任意根证书和操作系统」，比苹果的封闭生态更开放
- 关于「如何平衡安全与开放」的讨论持续发酵：如果完全放弃硬件认证，恶意软件与 root 后的设备如何管控？

**关键争议焦点：**
1. **安全的定义权在谁手中？** Google/Apple 自封为仲裁者是否合理？
2. **替代系统的生存空间：** GrapheneOS 能够硬件认证，却被刻意禁止，这是技术问题还是商业策略？
3. **政府的角色：** 应该是反垄断的监管者，还是垄断的参与者？

---

## 4. 行业影响与未来展望

### 短期影响
- **替代操作系统受挤压：** GrapheneOS、CalyxOS 等隐私导向系统面临「能用但不好用」的困境，关键服务（银行、支付、政务）逐步将其拒之门外
- **开发者合规成本上升：** 应用开发者被迫接入 App Attest / Play Integrity，增加了跨平台兼容的复杂度
- **用户选择权收窄：** 购买设备时，「能否通过硬件认证」可能成为比性能、价格更重要的决策因素

### 中长期展望
- **监管博弈：** 韩国已认定 Google 的 GMS 许可规则违反反垄断法，欧盟 DMA（数字市场法）也可能将硬件认证纳入调查范围
- **技术对抗升级：** 绕过与反绕过的军备竞赛将持续，spoofing 框架与密钥泄露事件可能增多
- **去中心化替代方案：** GrapheneOS 提出的「兼容指南」、Android 硬件认证 API 的开放根证书机制，可能成为抵抗封闭化的技术路径
- **桌面端蔓延：** 如果 reCAPTCHA Mobile Verification 落地，Linux 桌面用户、隐私倡导者、开发者群体将首当其冲

GrapheneOS 的呼吁是：硬件认证应当用于「验证设备安全状态」，而非「强制特定硬件与操作系统」。如果这一界限无法守住，数字世界的「围墙花园」将从 App 商店扩展到整个互联网基础设施。

---

## 5. 附带链接

- **原文讨论：** [HackerNews 帖子](https://news.ycombinator.com/item?id=48086190)
- **GrapheneOS 长文：** [Mastodon 帖子](https://grapheneos.social/@GrapheneOS/116550899908879585)
- **GrapheneOS 兼容指南：** [Attestation Compatibility Guide](https://grapheneos.org/articles/attestation-compatibility-guide)
- **Google reCAPTCHA 移动验证帮助：** [官方文档](https://support.google.com/recaptcha/answer/16609652)
- **Play Integrity API 官方页面：** [developers.google.com](https://developer.android.com/google/play/integrity)

---

*文章生成时间：2026-05-11*
