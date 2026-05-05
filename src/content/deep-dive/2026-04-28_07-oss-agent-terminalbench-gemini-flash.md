---
title: "开源编程代理 Dirac 在 TerminalBench 上登顶 Gemini-3-flash-preview 排行榜"
date: "2026-04-28"
generated: "2026-04-28 07:00"
source: "HN"
slug: "2026-04-28_07-oss-agent-terminalbench-gemini-flash"
summary: "开发者 GodelNumbering 在 Hacker News 上发布了其开源编程代理 Dirac，该项目在 Terminal-Bench-2 排行榜上以 65.2% 的得分登顶 gemini-3-flash-preview 模型类别。Dirac 是 C"
---

# 开源编程代理 Dirac 在 TerminalBench 上登顶 Gemini-3-flash-preview 排行榜

> **来源**: Hacker News (282 points, 110 comments)
> **日期**: 2026-04-27

## 事件背景

开发者 GodelNumbering 在 Hacker News 上发布了其开源编程代理 Dirac，该项目在 Terminal-Bench-2 排行榜上以 65.2% 的得分登顶 gemini-3-flash-preview 模型类别。Dirac 是 Cline 的深度修改分支（fork），其核心设计理念是：**LLM 的推理能力会随着上下文长度增加而退化**，因此通过严格的上下文管理来同时提升准确性和降低成本。

Dirac 采用了多项技术创新：哈希锚定并行编辑（Hash-Anchored Parallel Edits）、AST（抽象语法树）操作、以及一系列高级优化手段。在与 Cline、Kilo、OhMyPi、OpenCode、Pimono、Roo 等主流开源代理的对比评测中，Dirac 在 transformers、vscode、django 等大型开源项目的复杂重构任务上，以平均 64.8% 的成本节省率实现了 100% 的准确率。其 65.2% 的 TerminalBench 得分不仅超过了 Google 官方基线（47.6%），还击败了排名第一的闭源代理 Junie CLI（64.3%）。

## 核心观点

1. **上下文即效率**：Dirac 的核心哲学是"精简上下文 = 更好结果 + 更低成本"。在大型代码库重构任务中，该代理能将 API 调用成本降低 50-80%。
2. **AST 操作优于纯文本编辑**：通过解析代码的抽象语法树进行结构化编辑，而非简单的搜索替换，能大幅减少错误率。
3. **不依赖 MCP**：Dirac 明确表示不使用 MCP（Model Context Protocol），而是通过自身优化实现高效交互。
4. **开源透明**：所有评测基于公开 GitHub 仓库运行，任何人均可复现结果。

## 社区热议

1. **aetherspawn** 提问该项目究竟是一个框架（harness）还是微调模型，GodelNumbering 回应："模型使用的是默认的 gemini-3-flash-preview...由于 Dirac 是 Cline 的深度修改 fork，它支持 Cline 所支持的所有模型，包括 Qwen 和所有主流开源/闭源模型。"他还透露正在尝试用开源模型运行 TerminalBench 2.0，但推理速度过慢导致任务超时。

2. **deskamess** 表达了对 AST 在代码编辑和变更作用域中应用的兴趣："我一直好奇为什么 AST 没有在编辑和变更解析中得到更多应用。"GodelNumbering 回应称 grep 在大多数情况下很有效，但在超大代码库中当目标符号被大量引用时就会力不从心。

3. **miki123211** 提出了一个深刻的观点："我认为我们应该更多使用 AST，不是为了性能，而是为了更容易的代码审查...如果能将这些变更表达为简单的 AST 操作脚本...就能大大降低审查负担。"他认为在 AI 代理开发时代，最重要的约束是人类的审查时间。

4. **spullara** 提到 JetBrains 的"结构化搜索与替换"（structural search-and-replace）功能在实际使用中效果很好，支持"重写所有匹配模式的子树"操作。

## 行业影响

Dirac 的成功标志着开源编程代理领域正在从"盲目最小化"转向"智能优化"。其核心理念——通过上下文管理而非单纯增大模型来提升性能——对整个 AI 编程工具生态有重要启示：

- **成本效率成为关键竞争力**：在 API 调用日益昂贵的当下，能将成本降低 50-80% 同时保持甚至提升质量的工具将获得巨大优势
- **AST 操作的复兴**：传统编译器技术与 LLM 的结合正在成为新趋势，可能推动更多编程工具引入结构化编辑能力
- **开源 vs 闭源**：Dirac 击败闭源 Junie CLI 再次证明，开源项目在技术创新上完全能与商业方案竞争
- **基准测试生态**：TerminalBench 2.0 正在成为编程代理领域的重要评测标准

## 相关链接

- GitHub 仓库：https://github.com/dirac-run/dirac
- NPM 包：https://www.npmjs.com/package/dirac-cli
- TerminalBench 2.0 排行榜：https://huggingface.co/datasets/harborframework/terminal-bench-2-leaderboard/discussions/145
- HN 讨论：https://news.ycombinator.com/item?id=47920787
