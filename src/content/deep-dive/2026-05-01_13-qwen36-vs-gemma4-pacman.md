---
title: "Qwen 3.6 27B vs Gemma 4 31B - making Packman game!"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "Reddit"
slug: "2026-05-01_13-qwen36-vs-gemma4-pacman"
summary: "- **来源**: r/LocalLLaMA"
---

# Qwen 3.6 27B vs Gemma 4 31B - making Packman game!

- **来源**: r/LocalLLaMA
- **原帖**: https://www.reddit.com/r/LocalLLaMA/comments/1t0epei/qwen_36_27b_vs_gemma_4_31b_making_packman_game/

## 事件背景

用户 *gladkos* 在 MacBook Pro M5 Max（64GB）上同台对比 Qwen 3.6 27B 和 Gemma 4 31B，让两个本地模型用同一段 prompt 写一个 Pac-Man 游戏，并附上视频对比效果。这是 LocalLLaMA 社区最经典的"中等规模本地模型 head-to-head"场景，能直接看到一次实测里两个 SOTA 中型开源模型的工程产出能力。

## 核心观点

测试结果（楼主结论）：Gemma 4 31B 完胜——它生成的 Pac-Man 直接可玩、四方向幽灵 AI 行为像、地图碰撞正确；Qwen 3.6 27B 则在第一次输出时缺幽灵 AI、按键响应只对一半方向，需要二次提示修复。在 token 速度上 Qwen 27B 略快（M5 Max ~28t/s vs Gemma 31B ~22t/s），但 Gemma 4 个 token 完成的代码胜过 Qwen 8 次 retry 的代码。

## 社区热议

热议焦点：(1) Gemma 4 31B 相比 Gemma 3 在 codegen 上的进步幅度被多人确认，特别是 game logic 与 canvas 渲染；(2) Qwen 3.6 27B 评论里被怀疑"是不是没用 thinking 模式"——有人复现表示开启 `/think` 模式后 Qwen 能拉平甚至反超；(3) 一名 LocalLLaMA 老用户提到这种单 prompt 测试方差极大，建议跑 *bigcodebench* 或 *aider polyglot* 一类标准 bench 才有结论；(4) 也有人指出 Gemma 4 prompt template 默认就在 instruct 模式，可能给 Qwen 带来 unfair 起点。

## 行业影响

对 LocalLLM 选型：M-Series Mac 上目前 24-32B sweet spot 的两强已经从年初的 Qwen2.5-32B / Llama-3.1-70B-quant 变成 Qwen 3.6 27B / Gemma 4 31B。建议把"`/think` mode + 同 prompt 模板"作为单测对比的最低基线。Gemma 4 的优势侧重 *single-shot codegen*；Qwen 3.6 的优势在 long-context reasoning 与中英多任务，不能简单一句"谁更强"了事。对 vibe-coding 工作流，把两者一起挂在 LM Studio / Ollama 路由层面切换是可行做法。
