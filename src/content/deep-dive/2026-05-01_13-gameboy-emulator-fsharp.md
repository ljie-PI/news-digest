---
title: "I built a Game Boy emulator in F#"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-gameboy-emulator-fsharp"
summary: "- **来源**: Hacker News (front, 242 points, 多评论)"
---

# I built a Game Boy emulator in F#

- **来源**: Hacker News (front, 242 points, 多评论)
- **原帖**: https://news.ycombinator.com/item?id=47967460
- **外链**: https://nickkossolapov.github.io/fame-boy/building-a-game-boy-emulator-in-fsharp/
- **GitHub**: https://github.com/nickkossolapov/fame-boy

## 项目定位

软件工程师 Nick Kossolapov 用 8 年职业生涯之外的业余时间，先做完 Nand2Tetris 课程并用 F# 写了 CHIP-8 模拟器，再花了"无数个 2AM"完成 *Fame Boy*：跑得动音频、可在桌面与 Web 双端运行的完整 Game Boy 模拟器。目标是真正搞明白计算机如何工作——典型的 deep learner 项目。

## 核心架构

作者刻意把 emulator core 与 frontend 解耦：core 暴露两个数组（160×144 framebuffer、32768Hz 环形 audiobuffer）和两个函数（`stepEmulator()` 步进 CPU、`getJoypadState()` 同步手柄），其余完全独立。CPU 模仿真实 Sharp LR35902，"最 F# 的部分"——大量函数式 domain modelling，不可变 record + discriminated union 描述指令；`Memory.fs` 充当 memory map / bus，把 VRAM 与 OAM 引用共享给 PPU 以避免拷贝；`IoController.fs` 把硬件寄存器逻辑从 Memory 中拆出。

## 竞品与生态

F# 在游戏/系统模拟领域属于小众选择。常见对照组：C 写的 *SameBoy*（性能/精度天花板）、Rust 写的 *gambatte-rs*。Fame Boy 的差异点：(1) 函数式 CPU 描述能直接读懂，相对教学价值高；(2) 通过 .NET 8 AOT + Avalonia 提供桌面端，再通过 Fable 或 Bolero 输出 WASM 走 Web，复用同一份核心。社区评价"代码可读性强于多数 C 教程级 emulator"，但精度和准确周期仿真不及 SameBoy。

## 局限性与反馈

GitHub Issues 暴露的局限：(1) 还没通过完整 cycle-accurate 测试集（mooneye-test-suite 部分跑黄）；(2) 音频 APU 的 channel 4 噪声还有 popping；(3) WebAudio 有偶发 underrun。HN 评论的赞点几乎一致：写作风格清晰、把 NAND→Tetris→CHIP-8→Game Boy 的渐进式学习路径展示得很完整，对正在学计算机底层的 ML/web 工程师有很强示范作用。
