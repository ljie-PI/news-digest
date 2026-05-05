---
title: "微软发布 TRELLIS.2：开源 4B 参数图像转 3D 模型"
date: "2026-04-28"
generated: "2026-04-28 07:00"
source: "Reddit"
slug: "2026-04-28_07-microsoft-trellis2-image-to-3d"
summary: "微软正式发布了 TRELLIS.2，一个拥有 40 亿参数的开源大型 3D 生成模型，专为高保真图像到 3D 资产生成而设计。该项目已在 GitHub 上开源，并在 Hugging Face "
---

# 微软发布 TRELLIS.2：开源 4B 参数图像转 3D 模型

> **来源**: Reddit r/LocalLLaMA
> **日期**: 2026-04-27

## 事件背景

微软正式发布了 TRELLIS.2，一个拥有 40 亿参数的开源大型 3D 生成模型，专为高保真图像到 3D 资产生成而设计。该项目已在 GitHub 上开源，并在 Hugging Face 上提供预训练模型权重和在线 Demo。

TRELLIS.2 的核心创新在于引入了名为 **O-Voxel**（Oriented Voxel）的新型"无场"稀疏体素结构，突破了传统等值面场（iso-surface field）方法的局限。传统方法在处理开放曲面（如衣物、树叶）、非流形几何体和内部封闭结构时往往失败，而 O-Voxel 能稳健地处理这些复杂拓扑结构。

性能方面，TRELLIS.2 在 NVIDIA H100 GPU 上的表现令人印象深刻：512³ 分辨率约 3 秒生成（形状 2 秒 + 材质 1 秒）、1024³ 约 17 秒、1536³ 约 60 秒。模型使用了空间下采样率为 16× 的稀疏 3D VAE 将资产编码到紧凑的潜在空间，并基于 vanilla DiT（Diffusion Transformer）架构进行生成。

## 核心观点

1. **全 PBR 材质支持**：TRELLIS.2 不仅生成基本颜色，还建模了基础色、粗糙度、金属度和不透明度等完整 PBR（基于物理的渲染）属性，支持光真实渲染和透明效果。
2. **O-Voxel 突破拓扑限制**：传统 3D 生成模型受限于封闭流形表面，O-Voxel 的引入使得开放曲面、非流形和内部结构等复杂几何都能正确处理，这是 3D 生成领域的重要技术突破。
3. **免渲染数据处理**：数据处理流程完全不需要渲染和优化步骤，实现了即时转换，大幅降低了 3D 资产生产的计算成本。
4. **硬件要求合理**：最低 24GB GPU 显存即可运行，A100 和 H100 已验证，使其在研究和专业场景中具有较好的可达性。

## 社区热议

> **注意**：由于 Reddit API 访问限制，以下基于项目技术文档和社区背景分析。

该帖子在 r/LocalLLaMA 社区发布后引起了热烈讨论。作为微软在 3D AI 领域的最新开源力作，社区关注焦点主要包括：

- **与前代 TRELLIS 的对比**：社区成员对比了 TRELLIS.2 与初代的改进幅度，特别是在质量和速度方面
- **本地运行可行性**：24GB 显存要求意味着 RTX 3090/4090 即可运行，引发了本地部署的讨论
- **与竞品的比较**：与 TripoSR、InstantMesh、OpenLRM 等其他开源图像转 3D 方案的质量和速度对比
- **实际应用场景**：游戏资产制作、电商 3D 展示、VR/AR 内容创建等下游应用的可能性

## 行业影响

TRELLIS.2 的发布对 3D 内容创作行业具有重大意义：

- **3D 内容生产民主化**：开源的高质量图像转 3D 工具将大幅降低 3D 资产创建的门槛，不再需要专业建模师和昂贵软件
- **游戏与影视制作**：全 PBR 材质支持使生成的 3D 资产可直接用于游戏引擎和渲染管线，极大加速原型设计和资产生产
- **电商与零售**：商品的 3D 展示有望从手动建模转向 AI 自动生成，降低 3D 电商的部署成本
- **微软开源战略**：继 Phi 系列小模型后，微软在 3D AI 领域的开源布局进一步巩固了其在 AI 研究社区的影响力
- **技术路线影响**：O-Voxel 的"无场"方法可能引领 3D 生成技术从传统 NeRF/SDF 范式向体素化方向演进

## 相关链接

- GitHub 代码：https://github.com/microsoft/TRELLIS.2
- 论文：https://arxiv.org/abs/2512.14692
- Hugging Face 模型：https://huggingface.co/microsoft/TRELLIS.2-4B
- Hugging Face Demo：https://huggingface.co/spaces/microsoft/TRELLIS.2
- 项目主页：https://microsoft.github.io/TRELLIS.2
- Reddit 讨论：https://www.reddit.com/r/LocalLLaMA/comments/1sxf2u0/microsoft_presents_trellis2_an_opensource/
