---
title: "Honker：把队列、Pub/Sub 和 Cron 一起塞进 SQLite 文件"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-honker-sqlite-queue"
summary: "Honker 的卖点非常 Hacker News：不用 Redis，不用 broker，不用额外守护进程，只靠 SQLite 文件和 loadable extension，就提供 durable queue、event stream、pub/sub 以及 cron"
---

# Honker：把队列、Pub/Sub 和 Cron 一起塞进 SQLite 文件

> Hacker News | 2026-05-01

## 事件背景

Honker 的卖点非常 Hacker News：不用 Redis，不用 broker，不用额外守护进程，只靠 SQLite 文件和 loadable extension，就提供 durable queue、event stream、pub/sub 以及 cron scheduler。作者的核心论点是，既然越来越多真实业务已经把 SQLite 当主存储，那么任务队列也应该与业务数据落在同一个事务里。这样 `INSERT INTO orders` 与 `queue.enqueue(...)` 可以原子提交，失败时一起回滚，不再需要双写补偿和独立备份链路。

## 核心观点

Honker 的工程巧思在于，它并没有试图把 SQLite 变成另一个消息中间件，而是尽量利用 SQLite 已有机制：任务本质上就是表里的行，跨进程唤醒则依赖 `PRAGMA data_version` 这种极轻量的提交计数变化，再由后台线程扇出给订阅者。换句话说，它抓住了一个现实：大量中小型系统的复杂度瓶颈从来不是“数据库不够强”，而是“基础设施拆得过早”。如果队列和业务状态天然同库，那么一致性与运维成本都能显著下降。

## 社区热议

HN 对这种项目的反应通常分成两派。支持者认为这是典型的“用更少组件完成更多事情”，尤其适合单机、边缘节点、内嵌应用和轻量 SaaS；怀疑者则会质疑 1ms 轮询、写放大、长事务、公平消费与多租户隔离等问题，担心一旦 workload 上来，SQLite 最终还是会暴露出 broker 与 OLTP 混用的边界。两派其实都说得对——Honker 的关键不是替代 Kafka，而是准确命中“明明不需要 Kafka 却已经开始想装 Kafka”的那段区间。

## 行业影响

Honker 这类工具折射出一个更大的趋势：越来越多开发者在重新审视“单机优先”的系统设计。随着 SQLite、LiteFS、Turso、边缘部署和本地优先应用兴起，围绕单文件数据库构建完整工作流基础设施的尝试只会更多。对很多团队来说，少一层中间件不只是省钱，而是少一整套故障模式和认知负担。

## 相关链接

- 原文：https://honker.dev/
- HN 讨论：https://news.ycombinator.com/item?id=47963316
