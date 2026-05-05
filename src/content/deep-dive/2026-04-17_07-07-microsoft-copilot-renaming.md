---
title: "微软没有移除Copilot，只是改了名字"
date: "2026-04-17"
generated: "2026-04-17 07:00"
source: "HN"
slug: "2026-04-17_07-07-microsoft-copilot-renaming"
summary: "近期多家媒体报道微软开始从Windows 11应用中\"移除Copilot\"，包括记事本和截图工具中的Copilot品牌标识被清理。Neowin的一篇评论文章指出这更像是品牌重命"
---

# 微软没有移除Copilot，只是改了名字

## 1. 事件背景

近期多家媒体报道微软开始从Windows 11应用中"移除Copilot"，包括记事本和截图工具中的Copilot品牌标识被清理。Neowin的一篇评论文章指出这更像是品牌重命名而非功能移除——AI功能依然保留，只是不再叫"Copilot"。此前微软曾承诺清理Windows 11中"无用的Copilot引用"，CNET也报道了微软正在"从Copilot品牌名称中撤退，但AI功能依然保留"。这条新闻获得296点赞和204条评论，HN社区借此机会全面宣泄了对Windows 11用户体验的不满。

## 2. 核心观点/产品机制

微软的操作本质上是品牌策略调整：

- **表面动作**：从Windows 11的记事本、截图工具等内置应用中移除"Copilot"品牌标识
- **实际变化**：AI功能本身并未移除，只是不再以"Copilot"命名呈现
- **背景**：此前用户大量投诉Windows 11中无处不在的Copilot推广——从搜索栏到任务栏、从设置到内置应用，Copilot的存在感过于强烈
- **用户反馈促成变化**：MSN报道称微软在"用户反弹后从AI过载中撤退"，给予用户对侵入性功能更多控制权

这与微软更广泛的产品策略一致：频繁将OneDrive、Teams等产品强制重新安装到用户系统中，隐私设置在更新后被重置，Candy Crush等预装软件不断回归。

## 3. 社区热议与争议点

**讨论一：Windows作为"游戏主机"的使用模式。** 评论区最大的话题不是Copilot本身，而是Linux vs Windows的全面对比。大量用户分享了将Windows降格为"游戏专用系统"的实践——一位用户描述了双硬盘方案：一个Windows一个Linux，Windows那个被当作Xbox对待，连密码管理器和邮件都不登录，仅用于启动游戏。另一位用户通过Proxmox虚拟化+GPU直通实现快速切换。

**争议二：双启动的安全风险。** 一位安全意识强的用户指出双启动的信任边界问题：Windows内核仍然对另一个磁盘有完全块级访问权限，如果遭到管理员级别的恶意软件感染，可以自由感染另一个系统。有人建议结合Secure Boot、全盘加密和稳健备份来缓解风险，但也有人指出传统全盘加密只保护机密性不保护完整性。

**争议三：Linux游戏体验的实际水平。** 根据ProtonDB数据，Top 100游戏中约75%在Linux上可以开箱即用或简单调整后良好运行。Valve的Proton兼容层工作"改变了游戏规则"。一位用户运行Bazzite（基于SteamOS的发行版），体验非常无缝。但核心痛点仍在于内核级反作弊——这意味着多数竞技PvP游戏无法在Linux上运行。

**讨论四：Windows的QA去哪了？** 一位评论者指出微软多年前就裁撤了QA团队——如果双启动被破坏是有意为之的破坏，他们每个Patch Tuesday都能这么做。实际上更可能是对用户的不尊重——就像Copilot和Candy Crush不断在更新后被重新安装、隐私设置被重置一样。

## 4. 行业影响与未来展望

微软将Copilot品牌从Windows内置应用中撤退，标志着"AI everywhere"策略的首次实质性退缩。这表明用户对强制性AI集成的抵制已经达到了微软不能忽视的程度。然而，这只是品牌调整而非功能移除，AI功能仍在持续深化。更深层的趋势是：Linux桌面作为日常使用操作系统的可行性已经从"折腾爱好者"阶段进入了"普通用户可以接受"的阶段，尤其是在Valve的游戏兼容性努力和Framework等Linux友好硬件的推动下。Windows 11的用户体验恶化正在加速这一迁移。

## 5. 附带链接

- 原文：https://www.neowin.net/opinions/microsoft-isnt-removing-copilot-from-windows-11-its-just-renaming-it/
- HN讨论：https://news.ycombinator.com/item?id=47751936
