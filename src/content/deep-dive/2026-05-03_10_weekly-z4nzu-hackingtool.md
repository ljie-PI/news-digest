---
title: "Z4nzu/hackingtool — All-in-One Hacking Tool"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-z4nzu-hackingtool"
summary: "⭐ 本周高增 · Python 3.10+"
---

# Z4nzu/hackingtool — All-in-One Hacking Tool

⭐ 本周高增 · Python 3.10+

## 1. 定位与痛点剖析
hackingtool 是面向渗透测试入门者和 CTF 玩家的"一站式工具菜单"，把分散的 185+ 个开源安全工具按 20 个分类（信息收集、Web 攻击、SQL 注入、钓鱼、无线、AD 域、云安全、移动安全等）聚合到同一个交互式 CLI 中。痛点很直接：刚学渗透的人卡在"工具太多、安装麻烦、不知道该用哪个"，本仓库给一个开箱即用的 menu。

## 2. 核心架构与技术细节
本周大版本完全转向 Python 3.10+，去除了所有 Py2 残留；OS 感知菜单（Linux-only 工具在 macOS 自动隐藏）；交互式 `/` 全局搜索、`t` 标签过滤（osint/web/c2/cloud/mobile…19 个 tag）、`r` 推荐（"我想扫网络"→直接给候选）；每个工具显式标注 ✔/✘ 安装状态；Option 97 一键批量安装；Smart Update 自动判断 git pull / pip upgrade / go install；Docker 改为本地构建避免外部不可信镜像；新增 Active Directory、Cloud Security、Mobile Security 三个分类。

## 3. 竞品对比与生态站位
对比 Kali 自带的 metapackage、BlackArch 仓库、ParrotOS，hackingtool 是"工具发现 + 用户体验"层，不替代发行版。和 PimpMyKali、katoolin 这类老脚本相比，它的现代化 UI（搜索/标签/推荐）和 OS 适配更友好，所以本周上 GitHub 周榜——这背后是 OSINT、AD 渗透话题在 r/netsec 等社区持续走热。

## 4. 开发者反馈与局限性
issues 区主要争议是"工具集合 ≠ 安全教育"，新手容易不读文档就 copy-paste 命令，用错场景；部分老旧工具（被打包进来的第三方仓库）已年久失修；Cloud Security 模块覆盖度仍偏窄（只有 4 个工具），相对成熟的 Pacu/ScoutSuite 没收录。

## 5. 链接
- GitHub Repo: https://github.com/Z4nzu/hackingtool
