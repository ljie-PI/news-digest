---
title: "soxoj/maigret — 用户名 → 3000+ 站点档案聚合 OSINT 工具"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-soxoj-maigret"
summary: "⭐ 本周高增 · Python 3.10+"
---

# soxoj/maigret — 用户名 → 3000+ 站点档案聚合 OSINT 工具

⭐ 本周高增 · Python 3.10+

## 1. 定位与痛点剖析
Maigret 解决的是经典 OSINT 痛点：**只知道一个用户名，怎么把这个人在全网的足迹拼成一份 dossier？** 它会在 3000+ 个站点上批量探测同名账号，从 profile 页和站点 API 里抓出可见信息（昵称、邮箱、位置、关联账号），再递归对发现的新用户名继续深挖。目标用户是安全研究员、记者、调查员、合规团队，无需任何 API key。

## 2. 核心架构与技术细节
默认 run 检查流量排名前 500 的高权重站点，`-a` 全量扫描，`--tags` 按类别/国家窄化。底层依赖 socid_extractor 从页面提取结构化身份字段；自带反屏蔽/CAPTCHA 部分绕过；24h 自动从 GitHub 拉新版站点库，离线时回退到内置库；支持 Tor / I2P 域名。提供 Telegram bot、Cloud Shell、Web UI 多入口；输出含 PDF / HTML 报告 + 图谱可视化。可作为 Python 库 import 进自己的项目做编程式查询。

## 3. 竞品对比与生态站位
对照 Sherlock（最早期单语义、覆盖站点少）、WhatsMyName（基于 YAML 站点库）、OnlyFans-style 商业平台（社链、CrimeWall、UserSearch.ai），Maigret 走中间路线：站点最多 + 提取最深 + 完全 free + 报告最完整。商业方 SocialLinks-IO、UserSearch 已经构建在它之上。

## 4. 开发者反馈与局限性
站点检测会随对方页面改版而失效，需要靠社区不断维护 `sites.md`；3000 个站点全量扫一次很慢，被对方 WAF/CDN 限速是常态；部分平台（Instagram、TikTok 等）反爬强，命中率低；隐私伦理争议也存在：工具本身合法，但用法很容易越线，作者只能在 README 上反复强调用途。

## 5. 链接
- GitHub Repo: https://github.com/soxoj/maigret
- 文档: https://maigret.readthedocs.io/
- Telegram Bot: https://t.me/maigret_search_bot
