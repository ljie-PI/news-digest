---
title: "LinkedIn is scanning browser extensions"
date: "2026-05-01"
generated: "2026-05-01 13:00"
source: "HN"
slug: "2026-05-01_13-linkedin-scanning-extensions"
summary: "- **来源**: Hacker News (front, 416 points, 187 comments)"
---

# LinkedIn is scanning browser extensions

- **来源**: Hacker News (front, 416 points, 187 comments)
- **原帖**: https://news.ycombinator.com/item?id=47967262
- **外链**: https://404privacy.com/blog/linkedin-is-scanning-your-browser-extensions-this-is-how-they-use-the-data/

## 事件背景

隐私研究站 404privacy 公布了 LinkedIn 网页端在浏览器中**主动探测已安装扩展**的证据：通过逐个尝试加载扩展独有的 `web_accessible_resources` URL，再监听加载成功/失败来确定用户是否安装了某个扩展。配合 GitHub 仓库 *dandrews/nefarious-linkedin* 与 browsergate.eu 的长期记录，可以确认 LinkedIn 至迟从 2017 年开始做此扫描，到 2026 年 4 月已扩张到 **6,278 个扩展**条目。

## 核心机制

每次加载 LinkedIn，浏览器发出数千次针对扩展 ID 的 fetch 请求；DevTools Console 会被错误日志填满，每条 404 等同于一次"该扩展不存在"的负向断言。404privacy 指出，这套基础设施需要爬 Chrome Web Store、解析 manifest、自动化更新名单——是一支专门团队维护多年的产物。

## 社区热议

正方（认为合理）观点稀少：仅有少量评论提到反爬/反假账号场景下扩展指纹的合法用途，但难以解释为何要 6000+ 条目。反方主流观点：(1) LinkedIn 已有用户姓名、雇主、职位、薪资带，再叠加"扩展软件清单"可推断求职意图（大量 job-hunt 扩展在列）、政治/宗教/残障辅助偏好；(2) 这等于"在已实名档案上拼装侵入式行为画像"。多个评论提到 EU GDPR 第 22 条与浏览器指纹的 cookie 同意问题，预计将引发欧盟数据保护机构（如 CNIL）调查。

## 行业影响

短期社区对策：扩展开发者会更倾向用随机 token 化的 `web_accessible_resources`、Chrome MV3 的 Declarative Net Request 防止简单探测；用户层会有人启用"封锁扩展指纹"的 uBlock Origin 自定义规则。中期：浏览器厂商（Mozilla、Brave）可能给 `web_accessible_resources` 加 site-specific gating。对从业者：建议把"扩展指纹保护"作为新一代隐私指标加入合规清单，并在企业 BYOD 设备上提醒员工 LinkedIn = 行为追踪面。
