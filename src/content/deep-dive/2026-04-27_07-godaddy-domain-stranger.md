---
title: "GoDaddy 在无任何文档的情况下将域名转让给陌生人"
date: "2026-04-27"
generated: "2026-04-27 07:00"
source: "HN"
slug: "2026-04-27_07-godaddy-domain-stranger"
summary: "一个使用了 27 年的域名，在没有任何预警的情况下被 GoDaddy 从其合法持有者的账户中移走。受害者是美国宾夕法尼亚州 Lancaster 的 IT 公司 Flagstream Technol"
---

# GoDaddy 在无任何文档的情况下将域名转让给陌生人

> HN 热度：488 点 | 189 条评论

## 事件背景

一个使用了 27 年的域名，在没有任何预警的情况下被 GoDaddy 从其合法持有者的账户中移走。受害者是美国宾夕法尼亚州 Lancaster 的 IT 公司 Flagstream Technologies 的合伙人 Lee Landis，他管理的一个全国性非营利组织的域名在某个周六下午突然消失。该域名启用了双重两因素认证（邮件验证码 + 认证器应用），并开启了域名所有权保护。审计日志仅显示由"Internal User"（内部用户）发起的"Transfer to Another GoDaddy Account"，且"Change Validated: No"。

整个过程极其迅速——GoDaddy 在发出账户恢复请求邮件后 3 分钟发起转移，4 分钟后完成。转移后 DNS 区域被重置为默认值，导致该组织全美 20 个分支的网站和邮件全部中断，持续了整整四天。

## 核心观点

1. **安全措施形同虚设**：域名开启了 GoDaddy 出售的"Full Domain Privacy and Protection"产品，账户有双重两因素认证，但这一切都没能阻止内部用户的操作。

2. **客服系统彻底失灵**：Lee 拨打了 32 通电话、累计通话 9.6 小时、发送了 17 封邮件，零回电。每次通话生成新的工单号，工单之间互不关联，每次升级都从零开始。被告知联系的邮箱地址几乎每天都在变——先是 undo@godaddy.com，然后 transferdisputes@godaddy.com，再是 artreview@godaddy.com。

3. **GoDaddy 的荒唐结论**：四天后 GoDaddy 回复称"域名注册人提供了必要的文档来发起账户变更"，将此事视为已结案，建议走 ICANN 仲裁或法律诉讼。

4. **真相大白**：最终发现是 GoDaddy 员工的操作失误——另一位 GoDaddy 客户（该组织的一个地方分会）申请转移一个相似的域名，GoDaddy 转错了域名。收到域名的人主动联系原所有者归还了域名。

## 社区热议

1. 用户怀疑这是内部人员所为，一位用户分享了类似经历："I had a similar experience with AWS where my account was compromised despite the fact that I had all the proper security features enabled. It was later discovered internal contractors were responsible. A call to the AG office in my state got the ball rolling."

2. 另一位用户指出真正令人震惊的是 GoDaddy 事后的处理方式："And then slow rolled support. And then flat out lied that they received 'the correct' documentation justifying the transfer when they hadn't received any documentation, and denied the appeal. Frankly the whole thing is inexplicable."

3. 关于 GoDaddy 替代方案的讨论也很热烈。有人推荐 Cloudflare，但立即有人反驳："You moved from the worst registrar to the second worst registrar." 关于 Cloudflare 是否可靠引发了激烈辩论，支持者表示"Cloudflare hasn't called anybody demanding huge sums of cash and holding your domains hostage"。

4. 有用户推测这可能是 LLM 自动化客服出错导致："As I read it I couldn't help but envision this being a simple case of LLM-automated support going wrong. The mistakenly transferred domain was in the e-mail that asked for a transfer."

## 行业影响

此事件严重暴露了域名注册商在安全流程和客户服务方面的系统性缺陷。即使用户购买了所有可用的安全产品，也无法防范注册商内部的人为失误。更令人担忧的是事后处理——缺乏统一的事件管理、工单不互通、无专人负责、以及在明显错误面前仍然"结案"的态度。对于依赖域名作为核心业务基础设施的企业而言，这是一个警醒：域名安全不仅仅是技术问题，还涉及选择可靠的注册商和建立灾难恢复预案。此事件也再次引发了行业对域名注册商监管和责任追究机制的讨论。

## 相关链接

- 原文：https://anchor.host/godaddy-gave-a-domain-to-a-stranger-without-any-documentation/
- HN 讨论：https://news.ycombinator.com/item?id=47911780
