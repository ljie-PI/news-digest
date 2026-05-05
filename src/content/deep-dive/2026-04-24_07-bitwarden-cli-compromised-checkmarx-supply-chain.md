---
title: "Bitwarden CLI 遭供应链攻击：Checkmarx 恶意活动再升级"
date: "2026-04-24"
generated: "2026-04-24 07:00"
source: "HN"
slug: "2026-04-24_07-bitwarden-cli-compromised-checkmarx-supply-chain"
summary: "**来源**: Hacker News (Socket.dev) | **热度**: 581 points, 270 comments | **日期**: 2026-04-24"
---

# Bitwarden CLI 遭供应链攻击：Checkmarx 恶意活动再升级

**来源**: Hacker News (Socket.dev) | **热度**: 581 points, 270 comments | **日期**: 2026-04-24

---

## 事件背景

Socket 安全研究团队发现，广受欢迎的开源密码管理器 Bitwarden 的 CLI 工具（npm 包 @bitwarden/cli 2026.4.0）遭到供应链攻击。攻击者利用 Bitwarden CI/CD 管线中的一个 GitHub Action 漏洞注入恶意代码，属于更大规模的 Checkmarx 供应链攻击活动的一部分。Bitwarden 服务超过 1000 万用户和 5 万家企业，是企业采用率前三的密码管理器。

恶意载荷嵌入在 `bw1.js` 文件中，与此前 Checkmarx 攻击共享核心基础设施——相同的 C2 端点（`audit.checkmarx[.]cx/v1/telemetry`）、相同的 gzip+base64 嵌入结构。攻击范围极广，涵盖：GitHub token（通过 Runner.Worker 内存抓取）、AWS/Azure/GCP 凭证、npm 配置、SSH 密钥、甚至 Claude/MCP 配置文件。恶意代码还会向 `~/.bashrc` 和 `~/.zshrc` 注入持久化载荷，并具有俄语环境免杀开关。值得注意的是，该载荷使用了《沙丘》主题的命名（"Shai-Hulud: The Third Coming"）和"Butlerian Jihad"宣言，暗示与原 Checkmarx 攻击团队可能存在分支关系。目前仅 npm CLI 包受影响，Chrome 扩展和 MCP 服务器未被波及。

## 核心观点

- **GitHub Actions 成为新型攻击面**：攻击者不直接攻破源码，而是通过 CI/CD 管线中的第三方 Action 注入恶意代码，绕过代码审查。
- **供应链安全的结构性缺陷**：npm 生态缺乏发布前的自动扫描隔离机制，新版本一旦发布即可被安装。
- **波及面广**：密码管理器 CLI 被攻破意味着企业自动化流程中的所有密钥、token 都可能暴露。

## 社区热议

HN 讨论主要围绕"如何防御供应链攻击"展开，实用性极高：

1. 一位用户详细介绍了 cooldown 机制：*"Setting min-release-age=7 in .npmrc (needs npm 11.10+) would have protected the 334 unlucky people who downloaded the malicious @bitwarden/cli 2026.4.0, published ~19+ hours ago."* 并列出了 npm、pnpm、bun、uv 等工具的配置方法，同时推介了自己的开源工具 depsguard.com。

2. 有人反驳 cooldown 是"把责任推给用户"：*"Cooldowns are passing the buck. These are all caught with security scanning tools... just turn on the cooldowns server-side. Package updates go into a 'quarantine' queue until they are scanned."* 认为 npm 注册表应承担服务端扫描责任。

3. 另一位来自 Chainguard 的工程师指出：*"Most of these attacks don't make it into the upstream source, so solutions that build from source get you ~98% of the way there."* 主张从源码构建是更根本的防御手段。

4. 关于 pnpm 的信任策略，有用户补充：*"With pnpm, you can also use trustPolicy: no-downgrade, which prevents installing packages whose trust level has decreased since older releases."* 认为不执行 post-install 脚本也是关键防线。

## 行业影响

这是继 event-stream、ua-parser-js、node-ipc 之后又一起重大 npm 供应链攻击，但目标首次直接打击密码管理器——安全工具本身成为攻击载体，讽刺意味强烈。事件将加速以下趋势：1）npm/GitHub 等平台引入发布前隔离扫描机制；2）企业强制启用 lockfile 和版本冷却期；3）从源码构建（reproducible builds）成为高安全需求场景的标配。JavaScript 生态缺乏标准库、过度依赖第三方包的结构性问题再次被放大。

## 相关链接

- 原文：https://socket.dev/blog/bitwarden-cli-compromised
- HN 讨论：https://news.ycombinator.com/item?id=47876043
- Checkmarx 供应链攻击全貌：https://socket.dev/blog/checkmarx-supply-chain-compromise
