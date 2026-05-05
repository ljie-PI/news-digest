---
title: "[RELEASE] Flare-TTS 28M"
date: "2026-05-03"
generated: "2026-05-03 11:00"
source: "Reddit"
slug: "2026-05-03_11-10-flare-tts-28m-release"
summary: "- Subreddit: r/LocalLLaMA"
---

# [RELEASE] Flare-TTS 28M

- Subreddit: r/LocalLLaMA
- 讨论: https://www.reddit.com/r/LocalLLaMA/comments/1t1mmnd/

## 事件背景
独立开发者发布 Flare-TTS 28M——一款仅 28M 参数的轻量 TTS 模型，目标是「在 Raspberry Pi / 旧手机 / Edge MCU」上做实时语音合成。开源 MIT 协议，权重 + 推理代码 + 一键 demo。

## 定位与痛点剖析
- 痛点：当前主流 TTS（XTTS, F5-TTS, CosyVoice 2）都在 200M-1B 参数；本地实时合成对低端设备仍有压力；
- Flare-TTS 28M 的目标是「足够好 + 足够小」——支持 50+ 语种、表情中性，不追求极致音色克隆。

## 核心架构与技术细节
- 采用「latent diffusion + flow matching」混合策略（受 F5-TTS 启发）；
- text → phoneme → flow matching latent → mel-spec → vocoder（HiFiGAN-tiny 6M）；
- 训练数据：开源 VoxLingua107 + LibriSpeech + 多语种 podcast；
- 量化：INT8 + ggml backend，可在 Pi 5 上 RTF ≈ 0.4（实时 2.5x）；
- 推理 API：兼容 OpenAI TTS schema。

## 竞品对比与生态站位
- vs XTTS-v2 (1B)：质量略逊，但快 30x，体积小 35x；
- vs Piper (15M)：质量更好，多语种覆盖更全；
- 适用场景：智能音箱、本地阅读器、机器人语音、edge 助理。

## 开发者反馈与局限性
- 顶赞：「Pi 上终于有比 espeak-ng 自然得多的选择」；
- 局限：不支持声音克隆；情感表达弱；
- 建议：发布配套的 streaming 接口，让 latency 低到 100 ms 以内；与 LocalLLM 接成一条本地语音助手 pipeline。

## 附带链接
- Reddit: https://www.reddit.com/r/LocalLLaMA/comments/1t1mmnd/
