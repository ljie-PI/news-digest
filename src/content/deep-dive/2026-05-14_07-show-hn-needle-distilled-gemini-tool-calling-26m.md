---
title: "Needle:把 Gemini 的工具调用蒸馏进 26M 模型 — 深度解读"
date: "2026-05-14"
generated: "2026-05-14 07:00"
source: "HN"
slug: "2026-05-14_07-show-hn-needle-distilled-gemini-tool-calling-26m"
summary: "Cactus Compute 团队发布的 **Needle** 是一个 **26M 参数**的微型语言模型,目标极其垂直:**专门做 function/tool calling**。作者把 Gemini 系列在 tool-call 上的输出当作"
---

---
title: "Needle:把 Gemini 的工具调用蒸馏进 26M 模型 — 深度解读"
date: "2026-05-14"
generated: "2026-05-14 07:00"
source: "HackerNews"
slug: "show-hn-needle-distilled-gemini-tool-calling-26m"
score: 627
comments: 180
url: "https://github.com/cactus-compute/needle"
---

# Needle:把 Gemini 的工具调用蒸馏进 26M 模型 — 深度解读

## 项目定位

Cactus Compute 团队发布的 **Needle** 是一个 **26M 参数**的微型语言模型,目标极其垂直:**专门做 function/tool calling**。作者把 Gemini 系列在 tool-call 上的输出当作教师信号,用蒸馏 + 强化对齐的方式压进一个能在手机/边缘 NPU 上跑到亚秒级延迟的小模型。Show HN 627 分、180 评论,在端侧 Agent 与"小而专"路线日益升温的 2026 年,引发了"是不是该让大模型只做规划、把执行交给 SLM"的广泛讨论。

## 技术亮点

- **任务窄但完整**:输入用户意图 + 可用工具 schema,输出 JSON 风格的结构化 tool call(支持单步与多步)。不试图取代通用对话模型。
- **训练管线**:从公开 + 合成的多源任务收集自然语言意图,调用 Gemini 2.5 Pro 生成"理想的 tool-call 序列"作为软标签;再用 GRPO 风格的偏好优化让小模型在 schema 严格性、参数完整性上对齐。
- **尺寸与吞吐**:26M 参数的 dense transformer,可量化到 INT4 后约 15 MB,Pixel 8 / iPhone 15 上 NPU 推理 < 50 ms 首 token。
- **基准**:在内部的 BFCL 子集与作者新建的 ToolGym 上,准确率接近 Llama-3-8B-Instruct,远超同尺寸的通用 SLM(TinyLlama、SmolLM 系列)。
- **集成**:提供 ONNX、CoreML、TFLite 三套权重 + Rust/Swift/Kotlin 推理 SDK,定位很清晰是"嵌进你 App 的 Agent 路由层"。

## 设计哲学

作者在 README 与 HN 评论里反复强调一个观点:**通用 LLM 之所以贵,很大程度是被 tool-call 这种"窄任务"分走了大量低价值 token 输出**。如果能把这一层下沉到端侧的 SLM,用大模型只做"思考与规划",可以同时降低延迟、成本、隐私风险。这个思路与 Apple Intelligence 的"on-device + cloud private compute"分层、以及近期 Ollama/MLX 阵营的"specialist SLM"思潮高度一致。

## HN 讨论焦点

- **质疑**:26M 是否真的能稳定 schema 严格性?评论里有人测试嵌套深度 >3 的 schema 表现明显下滑,作者承认是当前主要短板。
- **法律**:用 Gemini 输出做训练标签是否违反 Google ToS?这是 HN 经典争论,作者用"输出不属于版权保护范围"+ 加入合成数据混淆来源回应。
- **生态**:多位评论者提议把 Needle 接成 LangGraph/LlamaIndex 的本地 router,大模型只在 Needle "举手"时介入。

## 价值与风险

Needle 代表了 2026 年端侧 Agent 的一个明确趋势:**"用 SLM 做胶水,用 LLM 做大脑"**。对国内做端侧 Agent / 智能终端的团队,这是一个低成本可复现的范式;但需要警惕的是,工具集合一旦变化就需要重新蒸馏,迁移成本可能抵消推理成本优势——动态 schema 泛化将是这条路线下一阶段的关键命题。
