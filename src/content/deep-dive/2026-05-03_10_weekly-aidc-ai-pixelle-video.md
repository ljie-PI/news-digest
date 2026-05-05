---
title: "AIDC-AI/Pixelle-Video — AI 全自动短视频引擎"
date: "2026-05-03"
generated: "2026-05-03 weekly:00"
source: "GitHub"
slug: "2026-05-03_10_weekly-aidc-ai-pixelle-video"
summary: "⭐ 本周高增 · Python + Streamlit"
---

# AIDC-AI/Pixelle-Video — AI 全自动短视频引擎

⭐ 本周高增 · Python + Streamlit

## 1. 定位与痛点剖析
Pixelle-Video 由阿里 AIDC 团队开源，定位是"主题→脚本→配图→TTS→模板合成→成片"的端到端短视频自动生成工作站。痛点是当前 AI 视频工具链碎片化严重——文案要 GPT、配图要 ComfyUI、配音要 Edge-TTS、剪辑要 CapCut，做一条片需要 4-5 个工具来回切。Pixelle 把这些环节用 Streamlit Web UI 统一调度，目标用户是自媒体创作者、营销团队、教育内容生产者。

## 2. 核心架构与技术细节
顶层是 Streamlit 三栏 Web UI；LLM 层支持通义千问/GPT/DeepSeek 多家 API；图像生成走 ComfyUI（本地）或 RunningHub（云端）工作流，可拖入自定义 workflow.json；TTS 用 ComfyUI 工作流接 Edge-TTS / Index-TTS 等，并支持声音克隆参考音频；视频画面用 HTML 模板渲染，分 static_*（纯文字）、image_*（AI 配图）、video_*（AI 视频）三类，按竖屏/横屏/方形分组。Windows 提供"一键整合包"，零依赖双击 start.bat 即可启动。

## 3. 竞品对比与生态站位
对照 MoneyPrinterTurbo（更早，简单 TTS+图）、StoryFire、剪映 AI、Higgsfield，Pixelle-Video 把 ComfyUI 这种"工作流可编程图像/TTS 引擎"作为底座，可定制度比闭源 SaaS 高一个数量级，但也意味着用户需要熟悉 ComfyUI 才能改风格。这与本周 Product Hunt 周榜上的 Hera Launch、VideoOS 形成有趣对照：闭源走极致 UX，开源走极致可控。

## 4. 开发者反馈与局限性
仍在快速迭代，issue 区集中在：(1) Windows 整合包对低显存 GPU 不友好；(2) 自定义模板需要懂 HTML + 参数变量约定；(3) 默认 image_flux 模板在中文长文本上排版会溢出；(4) ComfyUI 本地部署对新手仍是高门槛——尽管整合包已经压缩了大量工作。

## 5. 链接
- GitHub Repo: https://github.com/AIDC-AI/Pixelle-Video
- Windows 整合包: https://github.com/AIDC-AI/Pixelle-Video/releases/latest
