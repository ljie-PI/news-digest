---
title: "For Linux kernel vulnerabilities, there is no heads-up to distributions"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-linux-kernel-vuln-no-headsup"
summary: "- **来源**: Hacker News (front, 424 points, 327 comments)"
---

# For Linux kernel vulnerabilities, there is no heads-up to distributions

- **来源**: Hacker News (front, 424 points, 327 comments)
- **原帖**: https://news.ycombinator.com/item?id=47965108
- **外链**: https://www.openwall.com/lists/oss-security/2026/04/30/10

## 事件背景

Gentoo 安全维护者 Sam James 在 oss-security 邮件列表回应 CVE-2026-31431（"CopyFail"，本地权限提升）的讨论时强调：现行 Linux kernel 安全流程已**不再向各发行版安全团队提前同步**严重漏洞，发行版只能在 stable 分支 commit 公开后跟着打补丁。这条邮件触发了 HN 上对 kernel 安全治理的大范围讨论，许多社区维护者把这件事视为多年累积矛盾的爆发点。

## 核心机制

CopyFail 漏洞：Linux 4.14 引入 commit `72548b09…`，在 6.18.22、6.19.12、7.0 才修复。属于"经典 make-me-root"。问题在于：Greg KH 主导的 stable 修复流程已默认采取 *full disclosure first*，distros 安全列表（vendor-sec / linux-distros）不再提前几天获得 embargo。后果是 longterm 6.12、6.6、6.1、5.15、5.10 这些大量企业仍在跑的内核线，截至发帖仍未拿到回港 patch。

## 社区争议

赞成全公开派认为：embargo 本质上保护的是"懒得跟 mainline 的发行版"，反而让攻击者从 mainline diff 里拿到 N-day。反对派（多为发行版维护者）则指出：openSUSE、Debian、RHEL 的 backport 复杂，没有几天 lead time 根本来不及；以前 distros@ 列表的 embargo 让 6.1 LTS 在公开当天就能拿到 patched kernel。中立观点：CNA 流程过载（Linux 现在自己当 CNA、CVE 量爆炸式增长）才是根本问题。

## 行业影响

短期：企业内核团队需要重新评估 patch 窗口，redhat、suse 可能要把 LTS 内核维护资源加倍。中期：可能推动一个独立于 KernelOrg 的"distros-only"漏洞披露层，或像 OpenSSF 推进 *security-tier* 内核分支。对 SRE/平台团队的实操建议：盯紧 6.18.22 / 6.19.12 / 7.0 之前的版本，以及供应商有没有在 5.15 LTS backport CopyFail。
