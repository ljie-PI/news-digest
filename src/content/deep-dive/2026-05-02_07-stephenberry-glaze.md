---
title: "stephenberry/glaze"
date: "2026-05-02"
generated: "2026-05-02 07:00"
source: "GitHub"
slug: "2026-05-02_07-stephenberry-glaze"
summary: "- ⭐ Stars: 2728 (今日 +23)"
---

# stephenberry/glaze

> Extremely fast, in memory, serialization, reflection, and RPC library for C++. JSON, BEVE, BSON, CBOR, CSV, JSONB, MessagePack, TOML, YAML, EETF

- ⭐ Stars: 2728 (今日 +23)
- 💻 Language: C++
- 🔗 https://github.com/stephenberry/glaze

## 定位与痛点

Glaze 是面向**现代 C++ (C++23)** 的极致性能序列化、反射与 RPC 库。它瞄准的痛点是 C++ 生态长期没有"既快又易用"的序列化方案：nlohmann/json 易用但慢且非流式；RapidJSON/simdjson 快但 API 不友好；Cereal/Boost.Serialization 灵活但臃肿；Protobuf/FlatBuffers 跨语言强但需要 IDL 与代码生成。Glaze 的卖点是 **header-only、无 IDL、编译期反射、零拷贝**，对结构体打 tag 即可同时支持 10+ 种格式，并跑出与 simdjson 同级甚至更快的吞吐。

## 架构与技术

核心是基于 **C++20/23 的非侵入式编译期反射 (compile-time meta)**：用户用 `glz::meta<T>` 声明字段或直接利用聚合反射，库在编译期生成解析器/编码器，所有路径展开为分支预测友好的 SIMD 友好代码。除 JSON 外原生支持 **BEVE**（作者自创二进制格式）、BSON、CBOR、CSV、JSONB、MessagePack、TOML、YAML、EETF（Erlang 外部项格式）。还内含 RPC 子模块（基于 BEVE+REPE 协议），可一键暴露结构体方法为远程调用。许多金融/HFT 团队把它当 nlohmann 的高性能替代来用。

## 竞品对比

JSON 性能赛道：simdjson（解析最快，但写入弱）、yyjson（C 写的，超快且小巧）、RapidJSON（成熟但不再活跃）。综合序列化：Boost.PFR + Boost.Serialization、Apache Thrift、Cap'n Proto。Glaze 的差异化在"**全格式 + RPC + 反射 + header-only**"四合一，开发体验最像 Rust 的 serde；劣势是 C++23 编译器要求高、错误信息复杂，且二进制 BEVE 仅自家生态使用。

## 反馈与局限

社区评价正面：Reddit /r/cpp、cppcon 多次推荐，HFT/游戏行业反馈好。局限：1) 编译时间显著（重模板）；2) 错误信息对新手不友好；3) BEVE 跨语言生态薄；4) 反射依赖编译器最新支持。今日 +23 stars 是稳定增长曲线，与近期发布或 Reddit 帖子讨论 yyjson/glaze 性能对比相关。

## 链接

- Repo: https://github.com/stephenberry/glaze
- Docs: https://github.com/stephenberry/glaze/tree/main/docs
- BEVE 规格: https://github.com/beve-org/beve
