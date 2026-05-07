---
title: "Google Chrome 静默安装 4GB AI 模型引发隐私与合规风暴"
date: "2026-05-08"
generated: "2026-05-08 07:00"
source: "HN"
slug: "2026-05-08_07-google-chrome-silent-ai-install"
summary: "**来源**: Hacker News | **评分**: 1711 | **评论**: 1119  "
---

# Google Chrome 静默安装 4GB AI 模型引发隐私与合规风暴

**来源**: Hacker News | **评分**: 1711 | **评论**: 1119  
**原文**: [Google Chrome silently installs a 4 GB AI model on your device without consent](https://www.thatprivacyguy.com/blog/chrome-silent-nano-install/)

---

## 事件核心

2026年5月初，隐私研究员 Alexander Hanff 通过严格的取证分析证实：**Google Chrome 会在用户不知情、未同意、无通知的情况下，自动向设备下载约 4GB 的 Gemini Nano 大语言模型权重文件**。该文件安装路径为 `OptGuideOnDeviceModel/2025.8.8.1141/weights.bin`，即使用户手动删除，Chrome 也会在后台自动重新下载。

## 取证过程

研究者创建了一个**零人工干预**的 Chrome 配置文件，利用 macOS 内核级文件系统日志（`.fseventsd`，具备防篡改且独立于应用程序的特性），完整记录了安装全过程：

- **16:38:54**：Chrome 创建 `OptGuideOnDeviceModel` 目录
- **16:47:22**：三个并发解压进程写入 `weights.bin`、`manifest.json`、验证元数据等文件
- **16:53:22**：文件移至最终位置，额外四个小型模型注册到优化指南模型存储区

**全程耗时 14 分 28 秒，零用户操作。**临时目录命名 `com.google.Chrome.chrome_chrome_Unpacker_BeginUnzipping...` 直接证明是 Chrome 自身（而非 GoogleUpdater）发起写入。

## 四层证据链

1. **macOS 内核文件系统事件**（`.fseventsd`）
2. **Chrome `Local State` JSON**：记录模型验证结果、硬件画像（性能等级、显存大小）
3. **ChromeFeatureState**：`OnDeviceModelBackgroundDownload`（静默下载触发器）与 `ShowOnDeviceAiSettings`（设置界面显示）由**同一功能开关控制**，意味着下载在用户拥有拒绝设置之前就已开始
4. **GoogleUpdater 日志**：7MB 控制文件在配置文件创建前 3 天已下载，通过 HTTP（非 TLS）指向多 GB 权重，仅靠 CRX-3 签名保障完整性

## "AI 模式"的误导性

Chrome 147 在地址栏中醒目的 **"AI Mode"** 药丸按钮实为**云端 Google Search Generative Experience**，并不使用本地 Nano 模型。真正调用本地模型的功能——如 `<textarea>` 的 Help-Me-Write、标签页 AI 建议、智能粘贴、页面摘要——均 buried 在普通用户几乎不会发现的深层菜单中。

这构成欧洲数据保护委员会（EDPB）2022 年指南中界定的三类欺骗性设计模式：**误导性信息**（AI Mode 标签暗示本地处理）、**跳过机制**（无逐功能同意）、**阻碍机制**（AI Mode 与本地安装的控制入口分离且不直观）。

## 法律违规分析

| 法规 | 违规点 |
|------|--------|
| **ePrivacy 指令第 5(3) 条** | 未经"事先、自由、具体、知情且明确同意"在用户终端设备存储信息；预装 4GB 模型并非用户明确请求的服务"严格必要" |
| **GDPR 第 5(1) 条** | 非法、不公平、不透明处理；为模型推送资格进行硬件画像 |
| **GDPR 第 25 条** | 违反设计/默认数据保护——为"可能的未来用途"预置 4GB 与数据最小化原则背道而驰 |
| **CCPA** | 未就预置软件提供收集时通知 |

## 环境影响（ESG）

按每设备单次交付计算：带宽 4GB、能耗 0.24 kWh、碳排放 0.06 kg CO₂e。若覆盖 10 亿 Chrome 用户（约 30%），总数据量达 4 EB，能耗 240 GWh，碳排放 **60,000 吨**，相当于约 72,000 个英国家庭年用电量。此外，SSD  embodied carbon 约 **640,000 吨 CO₂e**（10 亿设备 × 4GB NAND）。

## 结论

此次事件不仅是隐私问题，更是**平台权力与用户自主权之间的根本冲突**。Google 将用户设备视为其 AI 生态的延伸节点，而非用户控制的个人终端。在缺乏有效监管干预前，用户只能通过企业策略工具、`chrome://flags` 或彻底卸载 Chrome 来避免被"征用"。
