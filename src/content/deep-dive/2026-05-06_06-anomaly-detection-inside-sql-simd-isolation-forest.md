---
title: "Anomaly detection inside SQL: SIMD isolation forests in Stratum"
date: "2026-05-06"
generated: "2026-05-06 06:00"
source: "Reddit"
slug: "2026-05-06_06-anomaly-detection-inside-sql-simd-isolation-forest"
summary: "Stratum（JVM 端的列式分析引擎）作者在 r/MachineLearning 宣布将 isolation-forest 异常检测原生嵌入 SQL，用户可直接 `SELECT * FROM transactions WHERE ANOMALY_SCORE('fraud_mo"
---

# Anomaly detection inside SQL: SIMD isolation forests in Stratum

## 事件背景

Stratum（JVM 端的列式分析引擎）作者在 r/MachineLearning 宣布将 isolation-forest 异常检测原生嵌入 SQL，用户可直接 `SELECT * FROM transactions WHERE ANOMALY_SCORE('fraud_model') > 0.7`。这条产品化帖把"DB 内训练 + DB 内推理"做到了 6 微秒/笔，无需 Python 导出管线，与近年来 DuckDB+ML、Postgres+pgvector 的"In-DB ML"潮流一脉相承。

## 核心机制

技术亮点：(1) 用 SIMD（AVX-512 / NEON）把 isolation forest 的 path-length 计算向量化，每条样本的 256 棵树并行评估降到 6μs；(2) 训练阶段直接消费列式存储，跳过中间序列化；(3) 模型作为列式资产存储，支持版本化、ACL，可被多个查询并发使用；(4) 与 PyOD / sklearn 同样数据集对比基准 throughput 高 50–200×，质量在 AUROC 上持平。文档号称单机可处理百万级 TPS 反欺诈打分。

## 社区热议与争议点

正面：业界长年抱怨 fraud / monitoring 团队在 Python ↔ DB 之间来回搬数据，这种 In-DB 路线被多名评论认为"是 2026 年最务实的 MLOps"。质疑点：(1) isolation forest 对漂移敏感，DB 内推理虽快但需要自动化重训；(2) JVM 引擎的市场占比相对小，不少人希望看到 Postgres / DuckDB 扩展；(3) 6μs 是 micro-bench，真实场景含 row-fetch 后通常会到几十微秒；(4) license 与企业版边界不够清晰。也有人提议加入 PCA / autoencoder 的同类 SIMD 实现。

## 行业影响与未来展望

它把"In-DB ML"从向量检索（pgvector）和 GBDT（DuckDB / ClickHouse）扩展到了无监督异常检测——这是金融、运维、IoT 的高频刚需。如果 Postgres / DuckDB 跟进，开源生态有望诞生第一个真正"开箱即用"的 SQL 异常检测函数族。

## 链接

- 原帖：https://www.reddit.com/r/MachineLearning/comments/1t4riem/
- 技术文章：https://datahike.io/notes/anomaly-detection-in-your-database

