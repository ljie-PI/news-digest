---
title: "Windows 9x Subsystem for Linux：在 Win95 里跑 Linux 内核的疯狂实验"
date: "2026-04-23"
generated: "2026-04-23 07:00"
source: "HN"
slug: "2026-04-23_07-windows-9x-subsystem-for-linux"
summary: "开发者 Hailey（GitHub ID: haileys）在 Mastodon 上发布了她的最新项目——**Windows 9x Subsystem for Linux（WSL9x）**。这个项目的名字显然是对微软 WSL（Windows Subsystem"
---

# Windows 9x Subsystem for Linux：在 Win95 里跑 Linux 内核的疯狂实验

> 来源：Hacker News 热帖 | 2026-04-22

## 事件背景

开发者 Hailey（GitHub ID: haileys）在 Mastodon 上发布了她的最新项目——**Windows 9x Subsystem for Linux（WSL9x）**。这个项目的名字显然是对微软 WSL（Windows Subsystem for Linux）的致敬与戏仿，但方向完全相反：它让一个**现代 Linux 内核以协作方式运行在 Windows 9x（Windows 95/98）内核之中**。

Hailey 并非无名之辈。她此前的作品 **doslinux**（在 DOS 中运行 Linux）就曾在 HN 引发关注，而这次的 WSL9x 被她本人称为"doslinux 的精神续作"——只不过花了 6 年才完成跟进。

## 核心机制

WSL9x 的技术实现堪称硬核。根据作者在 HN 评论区的亲自解释：

- **doslinux** 是一个"障眼法"——表面看是 Linux 运行在 DOS 里，实际上 DOS 启动后权限就被 Linux 接管了。
- **WSL9x** 则不同：Windows 9x 先启动，随后 Linux 内核也进入 ring 0（最高权限层），**两个内核在 ring 0 中并行运行、协作调度**。如果任一内核崩溃，整个系统都会挂掉。

这意味着它不是虚拟化，不是模拟器，而是两个真实内核在同一台裸机上共享特权级的共存方案。项目使用了 **VxD（Virtual Device Driver）** 技术和 **Watcom C** 编译器——这些都是 Windows 9x 时代的底层工具，在 2026 年听起来几乎像考古发现。

## 社区热议与争议点

该帖在 HN 上迅速升温，评论区出现了多条值得关注的讨论线：

### 1. "这玩意儿居然有实际用途？"

用户 **ErroneousBosh** 表示这个项目"直接解决了我本周遇到的问题"——他在 2026 年仍然需要维护运行 Windows 95 的**专业无线电发射设备**，其制造商至今仍在生产基于 Win95 的交钥匙系统。其他用户也举出了工业 SCADA 系统（VAXStation 3100）、银行 ATM（HSBC 的 Win95 蓝屏）、以及 OS/2 Warp 4 上运行的 999 紧急服务录音设备等真实案例。**旧系统在关键基础设施中的顽强存活远超多数人想象。**

### 2. 命名争议："到底谁在谁里面？"

用户 **vrganj** 和 **win2k** 指出，"Windows 9x Subsystem for Linux"这个名字极易造成误解——听起来像是在 Win9x 上运行 Linux，但也可以理解为"给 Linux 用的 Win9x 子系统"。用户 **adzm** 做了一个精辟的括号拆解：`(Windows 9x) (Subsystem for Linux)`，而 **hagbard_c** 则拿微软当年把 OpenOffice XML 改名为 Office Open XML 的旧事做类比，嘲讽微软式命名的混乱传统。

### 3. 协作式调度 vs. 抢占式：技术可行性质疑

用户 **fc417fc802** 提出了严肃的技术质疑：Windows 9x 的协作式多任务模型意味着信号处理只能是"伪协作式模拟"，**无法实现真正的抢占式调度**。这会导致 GC（垃圾回收）暂停世界算法、协程实现等现代运行时特性工作异常或完全失效。他引用了 Go 语言 GitHub issues 中的相关讨论作为佐证。

### 4. 怀旧与敬畏并存

不少评论充满了怀旧情绪。**jhallenworld** 感叹"VxD 和 Watcom C……好久没听到这些名字了"。**firefax** 则用一句经典梗总结："We did it fellas — Linux on the desktop"（终于实现了 Linux 桌面化——只不过是 Win95 的桌面）。**arcwhite** 对作者的评价简洁有力："She is indeed some sort of wizard"。

## 行业影响与未来展望

WSL9x 本身不太可能成为生产工具，但它的价值在于：

1. **逆向工程与系统考古**：深入揭示了 Windows 9x 内核的内部架构（VM Monitor、VxD 机制），这些知识正在随时间流逝。
2. **遗留系统生命线**：工业控制、医疗设备、金融终端等领域仍有大量 Win9x 系统在运行，任何能延长其兼容性的工具都有潜在价值。
3. **操作系统教育**：两个内核在 ring 0 共存的方案是一个绝佳的教学案例，展示了保护模式、特权级和协作调度的真实运作。
4. **Hacker 精神的延续**：在 AI 和云计算主导技术叙事的 2026 年，有人花 6 年在 Win95 内核里塞进一个 Linux——这本身就是对纯粹技术热情的最好注脚。

## 链接

- **HN 讨论帖**: https://news.ycombinator.com/item?id=47861270
- **原始 Mastodon 帖文**: https://social.hails.org/@hailey/116446826733136456
- **作者的前作 doslinux**: https://github.com/haileys/doslinux
- **Windows 9x 架构参考**: https://en.wikipedia.org/wiki/Architecture_of_Windows_9x
- **历史先例 BSD on Windows**: https://archive.org/details/bsd-on-windows
