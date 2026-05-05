---
title: "zephyrproject-rtos/zephyr"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-zephyrproject-rtos-zephyr"
summary: "- ⭐ Stars: 15128 (今日 +6)"
---

# zephyrproject-rtos/zephyr

> Primary Git Repository for the Zephyr Project. Zephyr is a new generation, scalable, optimized, secure RTOS for multiple hardware architectures.

- ⭐ Stars: 15128 (今日 +6)
- 💻 Language: C
- 🔗 https://github.com/zephyrproject-rtos/zephyr

## 定位与痛点

Zephyr 是 Linux 基金会托管的**跨架构开源 RTOS**，在 Linaro/Intel/NXP/Nordic/Google 等共同推动下，已成为嵌入式 IoT/可穿戴/工业控制领域最重要的开源实时操作系统之一。痛点很清晰：传统 RTOS (FreeRTOS、ThreadX、Mbed OS) 内核能力强但生态分散，每家芯片厂私有 BSP/HAL 接口不一致；商业 RTOS (VxWorks、QNX) 闭源昂贵；裸机开发缺乏现代设备树/构建系统/网络/安全栈。Zephyr 用一个内核 + 设备树 + west 构建系统，统一了 ARM Cortex-M/A、RISC-V、x86、Xtensa、ARC、SPARC 等多架构，让"一份代码上百块板子"成为现实。

## 架构与技术

技术栈：**抢占式多优先级内核**（线程、信号量、消息队列、工作队列）；CMake + Kconfig + **Devicetree** 三件套统一硬件描述；west 元工具管理多仓库；网络栈支持 IPv4/v6、6LoWPAN、Bluetooth LE/Mesh、Thread、Wi-Fi、USB、CAN；安全栈含 MCUboot 安全启动、TF-M PSA、mbedTLS。子系统覆盖 sensor、display、LoRaWAN、Modem、文件系统 (LittleFS, FAT)，以及最近高速发展的 Audio (LE Audio)、AI/ML (TFLite micro 集成)。Long-Term Support (LTS) v3.7/v4.x 节奏稳定，每三个月一次主版本。

## 竞品对比

FreeRTOS（AWS 托管，更轻、网络/安全栈偏弱）、Apache NuttX（POSIX 兼容好但社区小）、RIOT-OS（学术友好）、ThreadX（Microsoft 收购后开源为 Eclipse ThreadX）、Mbed OS（ARM 已 EOL）。Zephyr 的优势是**多架构 + 大厂背书 + 现代构建/设备树**，对 BLE/Matter 生态尤为强；劣势是上手陡峭、二进制体积比 FreeRTOS 大、API 不完全 POSIX。

## 反馈与局限

社区反馈：Nordic、Espressif、TI 新 SDK 大量投入 Zephyr，Matter 协议主推 Zephyr 作为参考实现，开发者评价"工程化最强但学习曲线最陡"。痛点：west + 设备树+ Kconfig 三层叠加配置复杂；编译时间长；调试链路（OpenOCD/Segger）需要手工配置；windows 体验偏弱。今日 +6 stars 属于稳定大型基础设施项目的常态自然增长。

## 链接

- Repo: https://github.com/zephyrproject-rtos/zephyr
- Site: https://www.zephyrproject.org
- Docs: https://docs.zephyrproject.org/latest/
