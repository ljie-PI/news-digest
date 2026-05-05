---
title: "Ubuntu 26.04 was rooted in 12 hours. An AI did it."
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-18-ubuntu-rooted-by-ai"
summary: "- Subreddit: r/AI_Agents"
---

# Ubuntu 26.04 was rooted in 12 hours. An AI did it.

- Subreddit: r/AI_Agents
- 讨论: https://www.reddit.com/r/AI_Agents/comments/1t1rpzg/

## 事件背景
Ubuntu 26.04 LTS 发布 12 小时内，一支研究团队公开了用 LLM-driven pentest agent（Claude Opus 4.7 + 内置 Metasploit + custom fuzzer）从零开始拿到 root 的过程。研究目标：评估「AI 攻击者」对 *默认安装* 主流发行版的速度。

## 核心观点 / 产品机制
- Agent 工作流：信息收集 → 服务枚举 → 漏洞匹配（CVE 库 + LLM 推理）→ 选择 exploit → 自动化部署 → 提权；
- 入侵路径并非全新 0-day，而是 *组合*：snap apparmor 缺陷 + 一项 CUPS 历史 CVE 在默认包里被回归 + cgroup 越权；
- 研究关键：LLM 让 *exploit chain 拼接* 时间从人类 days 降到 hours；
- 报告强调：这是模型加速「已有公开技术」的速度，而非具备「发现新漏洞」的能力，但前者已经足够撼动行业的 patch SLA。

## 社区热议与争议点
- 安全派：「12 小时是 patch window 的下限，运维 SLA 必须对齐」；
- 怀疑派：标题「rooted」吸睛，但路径未必默认存在，需要看是否 server / desktop / 不同 ISO；
- 行业派：商业 EDR 厂商蹭热点，强调他们的产品能拦下 LLM 编排的攻击；
- 哲学派：「AI 攻防对称性」讨论——防守方也可以同样用 LLM 做实时 IDS。

## 行业影响与未来展望
这一报告将催生几个变化：① 主流发行版加速默认 hardening（SELinux / AppArmor 默认 enforce、最小服务）；② CISA 等机构推动「AI-time」的 patch SLA（24 hour 而非传统 7 day）；③ 防守方加大对 *LLM-augmented blue-team* 的投入。对企业 ops：立即审视 Ubuntu 服务器初始化模板，关闭非必要 daemon，强制 unattended-upgrades。

## 附带链接
- Reddit: https://www.reddit.com/r/AI_Agents/comments/1t1rpzg/
