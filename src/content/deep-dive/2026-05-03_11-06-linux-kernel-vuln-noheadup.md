---
title: "For Linux kernel vulnerabilities, there is no heads-up to distributions"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "HN"
slug: "2026-05-03_11-06-linux-kernel-vuln-noheadup"
summary: "- HN: 596 points"
---

# For Linux kernel vulnerabilities, there is no heads-up to distributions

- HN: 596 points
- 链接: https://www.openwall.com/lists/oss-security/2026/04/30/10

## 事件背景
oss-security 邮件列表上的一则发文揭露：Linux 内核的安全补丁在主线 git 中提交后，发行版（Debian、Ubuntu、SUSE、RHEL 等）并没有任何「embargo」窗口，没有 CVE 编号同步，没有提前告知。结果是攻击者能够在补丁公开几小时内逆向出 PoC，而发行版还在排队打包。这次披露引来 Greg KH 和发行版安全团队之间的公开争论。

## 核心观点 / 产品机制
当前流程：
- 安全报告 → 通过 `security@kernel.org` 私下处理；
- Linus / 子系统维护者将修复 commit 推到 mainline；
- 一段时间后才申请 CVE，并由 OSS-Security / linux-cve-announce 公布；
- 发行版根据 mainline commit message + 自家补丁回移工作量决定优先级。

问题在于「commit 到 mainline」即视为公开，window 实质为 0。而专业攻击者的自动化扫描会在 mainline 提交后几分钟内识别出可疑安全补丁（基于 commit message + 修复模式 + 谁提的 PR），快速反推 PoC。

## 社区热议与争议点
- 发行版工程师（Debian、SUSE）：呼吁回归到 90 天 embargo + CVE 提前分配的「负责任披露」模式；
- 内核派：Greg KH 立场是「内核安全等同 bug，越快公开修复越好；商业用户应自己跟踪 stable tree」；
- 中立派：Tavis Ormandy 出来调和，建议至少给发行版 7 天的沉默期，让稳定分支同步到面向最终用户的更新通道；
- 攻击侧观察者：白帽公开了若干案例——例如近期 io_uring 漏洞从 mainline 修复到野外利用只用 36 小时。

## 行业影响与未来展望
这次讨论可能推动 kernel.org 与 distros 列表之间正式建立 *short-fuse embargo*（48-72h）流程，CVE 与 mainline commit 同时发布，stable tree 同时提供编译过的更新。云厂商（AWS / Azure / GCP）原本就有自己的 patch 通道，影响最大的是物理服务器与桌面 Linux 发行版用户。对企业运维而言，建议立刻订阅 `oss-security`、`linux-distros`、`vendor-sec` 三条邮件列表，并把 CI 上的 kernel CVE 监测纳入 SOC 流程。

## 附带链接
- oss-security 原帖: https://www.openwall.com/lists/oss-security/2026/04/30/10
- HN 讨论: https://news.ycombinator.com/item?id=47960000
