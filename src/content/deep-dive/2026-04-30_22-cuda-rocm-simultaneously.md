---
title: "Cuda + ROCm simultaneously with -DGGML_BACKEND_DL=ON"
date: "2026-04-30"
generated: "2026-04-30 22:00"
source: "Reddit"
slug: "2026-04-30_22-cuda-rocm-simultaneously"
summary: "**链接**：[r/LocalLLaMA 帖子](https://www.reddit.com/r/LocalLLaMA/comments/1t0bkaf/cuda_rocm_simultaneously_with_dggml_backend_dlon/) · subreddit: LocalLLaMA"
---

# Cuda + ROCm simultaneously with -DGGML_BACKEND_DL=ON

**链接**：[r/LocalLLaMA 帖子](https://www.reddit.com/r/LocalLLaMA/comments/1t0bkaf/cuda_rocm_simultaneously_with_dggml_backend_dlon/) · subreddit: LocalLLaMA

## 事件背景

发帖人花了大量时间在 llama.cpp 上把 CUDA 和 ROCm 后端**同时**启用——通过编译标志 `-DGGML_BACKEND_DL=ON`（动态库后端），他成功让 N 张 NVIDIA GPU 与 M 张 AMD GPU 在同一进程内协作运行 Minimax 2.7 Q4，63 层全部 offload 到 GPU。这跳过了传统通过 Vulkan 跨厂商的妥协方案，是异构 GPU 池化的一次社区里程碑。

## 核心观点

技术细节：(1) llama.cpp 的 `GGML_BACKEND_DL` 让每个后端编译为独立 .so，运行时按 device 分配；(2) CUDA0 加载 83GB+ 模型缓冲，CUDA_Host 与 ROCm 设备共同承担其余层；(3) 用户实际跑通了 Minimax 2.7（约 200B+ 量化）的全 GPU offload。意义在于：废旧的 7900 XTX、Mi50、3090、5090 可以**混搭**填满显存池，二手 GPU 利用率拉满。

## 社区热议与争议点

- **赞美派**：评论惊叹"这是 llama.cpp 的最高级用法"，把社区从 Vulkan 通用路径解放出来——后者性能有损失且对长上下文不稳定。
- **怀疑派**：(1) 跨厂商带宽差异巨大，ROCm 设备实际成为瓶颈拖慢整体；(2) 长期维护成本高——CUDA 和 ROCm 任何一边版本升级都可能破坏构建；(3) 调试环境复杂，stack trace 跨两个驱动栈。
- **延伸讨论**：有人主张把 Vulkan 后端继续优化才是"普惠路线"，因为多数家庭用户没有混搭硬件。

## 行业影响与未来展望

这个 hack 直接打击了 Nvidia 对 LLM 本地推理的事实垄断——只要 llama.cpp 把 CUDA/ROCm 共存做成稳定特性，二手 AMD GPU 的价值会显著提升。短期看，影响 LocalLLaMA 社区的硬件采购建议；中期看，会推动 ggml 走向"backend-as-plugin"架构，Intel Arc、华为昇腾、Apple Metal 都更易接入，最终撬动消费级混合 GPU 集群标准化。

## 链接

- 原帖：https://www.reddit.com/r/LocalLLaMA/comments/1t0bkaf/cuda_rocm_simultaneously_with_dggml_backend_dlon/
