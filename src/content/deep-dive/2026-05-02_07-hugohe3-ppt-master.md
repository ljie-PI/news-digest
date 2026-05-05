---
title: "hugohe3/ppt-master"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-hugohe3-ppt-master"
summary: "PPT Master 解决一个被忽视已久的痛点：现在所有「AI 一键 PPT」要么是模板填空（编辑空间受限）、要么把每页渲染成大图塞进 PPTX（点开是张图，根本没"
---

# hugohe3/ppt-master

> AI generates natively editable PPTX from any document — real PowerPoint shapes with native animations, not images · by Hugo He
> ⭐ 10,399 · Today +399 · 🛠 Python

## 1. 定位与痛点剖析

PPT Master 解决一个被忽视已久的痛点：现在所有「AI 一键 PPT」要么是模板填空（编辑空间受限）、要么把每页渲染成大图塞进 PPTX（点开是张图，根本没法改）、要么是 HTML 演示（根本不是 PPT）。对真正用 PowerPoint 干活的人——投行 IPO、咨询、CPA/评估师——交付物必须是「逐元素可点击编辑」的原生 OOXML 文件。作者 Hugo He 本身是金融从业者（CPA·CPV·投资咨询工程师），自己改 deck 改怕了，于是把生成流程做成「可在 Claude Code / Cursor / Copilot / Codebuddy 里运行的 Skill」。

## 2. 核心架构与技术细节

技术栈纯 Python 3.10+，唯一硬依赖 `pip install -r requirements.txt`。流程：输入（PDF/DOCX/Markdown/URL，含微信公众号通过 `curl_cffi` 直抓）→ 解析为结构化 markdown（`web_to_md.py`）→ AI IDE 中代理按 Skill 工作流生成 OOXML DrawingML（真正的 shapes/text boxes/charts，不是图片）→ 输出 `.pptx`。亮点：原生 OOXML 动画——页面切换 + 元素入场动画（默认级联自动播放），PowerPoint/Keynote 原生兼容；旁白与视频——通过 `edge-tts`（90+ 语种）按 speaker notes 合成音频嵌入 PPTX，再由 PowerPoint 直接导出 MP4。Pandoc 仅在 .doc/.odt/.rtf/.tex 等冷门格式时才需要。

## 3. 竞品对比与生态站位

vs Gamma / Tome / Beautiful.ai：在线 SaaS，输出多为 HTML 或图片堆 PPTX，离线编辑能力弱。vs ChatPPT / 美图 AI PPT：模板填空范式。vs 微软 Copilot in PowerPoint：依赖 M365 订阅且能力有限。PPT Master 走「本地 Python + AI IDE Skill + 用户自付模型费」路线，数据不出本地、无平台锁定，对合规敏感行业（金融、法务、医疗）吸引力极强。

## 4. 开发者反馈与局限性

今日 +399 star 是该轮 Trending 增速最快之一，配合作者亲自维护的中英文 README 与 22 个示例项目（309 页）说服力很强。局限：质量强依赖底层模型（Opus 4.7 推荐），换便宜模型版式与文字密度都会下降；Windows 安装链路较复杂，需单独指南；图表丰富度仍不及人工设计；长 deck token 消耗显著。

## 5. 链接

- Repo: https://github.com/hugohe3/ppt-master
- Live demo: https://hugohe3.github.io/ppt-master/
- 作者: https://www.hehugo.com/
