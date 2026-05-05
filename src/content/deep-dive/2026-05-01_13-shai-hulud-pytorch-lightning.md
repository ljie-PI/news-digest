---
title: "Shai-Hulud Themed Malware Found in the PyTorch Lightning AI Training Library"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-shai-hulud-pytorch-lightning"
summary: "- **来源**: Hacker News (front, 351 points, 123 comments)"
---

# Shai-Hulud Themed Malware Found in the PyTorch Lightning AI Training Library

- **来源**: Hacker News (front, 351 points, 123 comments)
- **原帖**: https://news.ycombinator.com/item?id=47964617
- **外链**: https://semgrep.dev/blog/2026/malicious-dependency-in-pytorch-lightning-used-for-ai-training/

## 事件背景

Semgrep 安全研究团队 4 月 30 日披露：PyPI 上的 `lightning`（PyTorch Lightning，深度学习训练框架）2.6.2 与 2.6.3 版本被植入恶意代码。该包是几乎所有 LLM 微调、扩散模型训练、CV 教程的标配依赖之一，影响面巨大。命名风格延续了去年的 *Shai-Hulud* 蠕虫家族，新版本前缀为 `EveryBoiWeBuildIsAWormyBoi`。

## 攻击机制

`pip install lightning` 即触发：恶意版本里隐藏 `_runtime` 目录，包含混淆后的 JavaScript payload，在 import 时通过 Python 调起 Node 执行。Payload 的目标是窃取凭证、env vars、cloud secrets，并在被感染机器上向其拥有 publish 权限的 GitHub 仓库注入恶意 commit。**关键创新**：从 PyPI 入口跳到 npm 蠕虫——一旦在 dev 机器上发现 npm publish token，就给所有可发布的 npm 包注入 `setup.mjs` + `router_runtime.js` dropper，把 `preinstall` script 设成 dropper、bump patch version、自动 republish，实现跨生态自我繁殖。

## 社区热议

Reddit/HN 评论快速分化：(1) AI 工程师阵营震惊于"我每天 pip install 几次的库被武器化"，开始集体审计 `~/.cache/`、`.claude/`、`.vscode/` 三个被 IOC 点名的目录；(2) 安全从业者强调更深层的结构问题——PyPI 缺二次身份验证强制、缺 sigstore 默认签名；(3) 多人指出"PyTorch Lightning 维护方在 8 小时内才 yank 掉版本，且未发推"，认为响应速度不足。lightning 团队随后在 GitHub 上确认是上游账号被盗。

## 行业影响

直接：所有 4 月 30 日之后跑过 `pip install lightning`（无 pin、无 lockfile）的工作站和 CI 都需要视为已 compromise，rotate 所有 GitHub PAT / 云密钥 / npm token。中期推动：(1) PyPI/npm 强制 2FA；(2) HuggingFace、Modal、Replicate 等托管 AI 平台需要给容器层加 egress 监控；(3) 重新点燃"AI 供应链 SBOM"话题——单条 `requirements.txt` 间接拉数千包的现状不可持续。建议团队立刻启用 `pip install --require-hashes` 与 `uv sync --frozen` 等强约束模式。
