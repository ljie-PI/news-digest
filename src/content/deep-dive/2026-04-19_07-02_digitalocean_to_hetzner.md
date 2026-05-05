---
title: "从 DigitalOcean 迁移至 Hetzner：月费从 $1,432 降至 $233，零停机"
date: "2026-04-19"
generated: "2026-04-19 07:00"
source: "HN"
slug: "2026-04-19_07-02_digitalocean_to_hetzner"
summary: "**615 points | 324 comments**"
---

# 从 DigitalOcean 迁移至 Hetzner：月费从 $1,432 降至 $233，零停机

**615 points | 324 comments**

## 事件背景

土耳其软件公司 Isa Yeter 团队发布了一篇详细的生产环境迁移实战记录：将运行了近 8 年的 DigitalOcean 服务器迁移至 Hetzner 专用服务器，月费从 $1,432 降至 $233，年省 $14,388。这个话题击中了许多开发者的痛点——云服务价格虚高，尤其对于非美元收入的团队。

## 核心观点/产品机制

迁移前后的硬件对比令人咋舌：DigitalOcean 的 32 vCPU / 192GB RAM / 600GB SSD 月付 $1,432，而 Hetzner AX162-R 提供 AMD EPYC 9454P（48 核 / 96 线程）/ 256GB DDR5 / 1.92TB NVMe RAID1 仅需 $233。

这不是玩具项目——包含 30 个 MySQL 数据库（248GB 数据）、34 个 Nginx 虚拟主机、GitLab EE（42GB）、Neo4J（30GB）、服务数十万用户的移动应用。

迁移策略分为六个阶段，实现了真正的零停机：
1. 新服务器完整环境搭建
2. rsync 克隆 65GB / 150 万文件
3. MySQL 主从复制（用 mydumper 32 线程并行导出代替传统 mysqldump，速度从"数天"缩短至"数小时"）
4. DNS TTL 降至 300 秒
5. 旧服务器 Nginx 改为反向代理（Python 脚本自动改写 34 个站点配置）
6. API 一键切换 DNS，旧服务器保留一周后下线

同时完成了 CentOS 7→AlmaLinux 9.7 和 MySQL 5.7→8.0 的升级。

## 社区热议与争议点

**1. AWS 锁定更为严重**：一位用户表示正计划从 AWS 迁移至 Hetzner，指出"Amazon 通过高定价和长期承诺锁定用户，又通过高昂的出口费用阻止迁移——这是非常敌对客户的做法"。另一位用户揭露 AWS 的免费数据迁出（DTO）是"彻头彻尾的谎言"——他的申请花了 31 天才收到回复，然后被告知需等待 60 天审批，最终累计的 S3 存储费已与直接付出口费持平。

**2. AI 编码代理降低迁移门槛**：一位评论者分享："我用 Claude Code 把两台服务器从 Linode 和 DO 迁移到了 Hetzner。其中一台运行着十几个不同语言实现的站点、过时的库、MySQL 和 Redis——一团糟。Claude Code 全部搞定了，甚至在库不可用时重写了部分代码。"有人回应："没人在为魔法计算付费——他们在付费不去碰十年的胶水代码。如果 AI 代理吃掉了那些胶水，护城河就变薄了。"

**3. AI 营销水军问题**：讨论中出现了关于 Anthropic 在社交媒体上"水军营销"的激烈辩论。有人声称亲眼看到 Claude 在游戏开发子版上用机器人账号发帖，还有人指出 Reddit 上"最新模型太强了我要失业了"的帖子模式非常可疑。

## 行业影响与未来展望

这篇文章折射出云计算行业正在经历的结构性转变。随着 Hetzner、OVH 等欧洲专用服务器提供商提供极具竞争力的价格，加上 AI 编码代理大幅降低了迁移的技术门槛，过去依靠技术复杂性和供应商锁定维持的云服务溢价正在被侵蚀。对于运行稳态工作负载、不依赖云供应商生态功能的团队，从 VPS/云主机迁移至专用服务器可能是一个 5-10 倍的成本优化机会。

## 附带链接

- 原文：https://isayeter.com/posts/digitalocean-to-hetzner-migration/
- HN 讨论：https://news.ycombinator.com/item?id=47815774
