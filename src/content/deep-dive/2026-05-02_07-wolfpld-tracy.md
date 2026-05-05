---
title: "wolfpld/tracy"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-wolfpld-tracy"
summary: "- **Description:** Frame profiler"
---

# wolfpld/tracy

- **Description:** Frame profiler
- **Stars:** 15,797 ⭐ (今日 +45)
- **Language:** C++

## 定位与痛点

Tracy 是一款面向游戏与高性能应用的**实时、纳秒级、远程遥测、混合帧 + 采样型**性能分析器，作者 Bartosz Taudul（wolfpld）长期独立维护。痛点非常硬核：传统采样式 profiler（perf、VTune）对帧率敏感的实时应用不友好；带 instrumentation 的 profiler 又往往拖慢运行；游戏需要把 CPU、GPU、内存、锁、上下文切换、截图统一关联到具体一帧上做根因分析。Tracy 的方案是把客户端做成轻量埋点宏 + 高效环形缓冲，把数据通过 TCP 推送到独立 GUI viewer，做到对被测程序极小侵入，同时保留极高时间精度。

## 架构与技术

C++ 实现，分为 client（嵌入到被测程序的头文件 + 库）+ server/profiler GUI。一等公民语言 C/C++/Lua/Python/Fortran，社区还有 Rust（`rust_tracy_client`）、Zig（`zig-tracy`）、C#、OCaml、Odin 等绑定。GPU 侧覆盖所有主流图形 API：OpenGL、Vulkan、Direct3D 11/12、Metal、OpenCL、CUDA。能力包括：内存分配追踪、锁竞争分析、上下文切换、用户区 plot/message、自动把游戏截图绑定到捕获的帧上。Releases 同时分发文档 PDF（`tracy.pdf`）与 Windows x64 viewer 7z 包，并提供在线 demo（tracy.nereid.pl）。

## 竞品

商业向：Intel VTune、AMD μProf、NVIDIA Nsight、Superluminal、RAD Telemetry（已并入 Epic）、PIX。开源向：perf、Orbit、Optick、Remotery、Chrome Trace。Tracy 的优势：开源 + 跨平台 + GPU/CPU/锁/内存全栈 + 极低开销 + 独立可视化客户端 + 帧截图回溯，是独立游戏与引擎中事实上的开源标准（被 Bevy、Godot 等项目广泛集成）。

## 反馈与局限

社区口碑长期顶级，CppCon 2023 有专题分享，每个大版本都有官方 YouTube 介绍视频。今日 +45 stars 体现持续热度。局限：埋点风格仍偏 C/C++ 心智，跨语言绑定质量参差；GUI 是原生 imgui 应用，对完全不熟悉游戏 profiler 范式的 Web/后端工程师上手有门槛；分析海量长跑录制时内存占用偏高；商业级别的火焰图/调用关系分析没有 VTune 完善。

## 链接

- 仓库：https://github.com/wolfpld/tracy
- 文档 PDF：https://github.com/wolfpld/tracy/releases/latest/download/tracy.pdf
- 在线 demo：https://tracy.nereid.pl/
