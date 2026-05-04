---
filename: manual-grad-system-day-one-setup.md
title: 畢製管理系統 - 學生第一天設定 SOP
aliases:
  - 第一天設定
  - GitHub App 推播設定
  - Day One Setup
date: 2026-05-04
created: 2026-05-04
updated: 2026-05-04
tags:
  - manual
  - grad-project
  - github
  - onboarding
  - student
status: ready
type: manual
project: 2026-04-grad-project-system
audience: student
description: 畢製組員第一天的設定 SOP。完成後手機就會收到任務指派和留言的推播,取代 Line 群組。預計 10 分鐘完成。
related:
  - "[[000-project-grad-system]]"
  - "[[manual-grad-system-student-handbook]]"
  - "[[template-grad-system-issue-template]]"
---

# 畢製管理系統 - 學生第一天設定 SOP

> [!important] 為什麼要做這個設定?
> 我們不再用 Line 追進度。原因:訊息會被洗掉、找不到歷史、誰要做什麼一團亂。
>
> 改用 GitHub Issues 之後,**每個任務都會有人被 @ 指派**,只要你做完這份 SOP,**手機就會像 Line 一樣跳通知**,但訊息永遠不會消失,而且老師可以直接在任務裡留言給你。

---

## ✅ 完成後你會有的能力

- 被指派任務時,**手機推播立刻跳出來**(跟 Line 一樣)
- 點推播 → 直接看到任務內容 → 可以留言回覆
- Email 同步收到備份,不怕漏接
- 在儀表板看到自己被指派的所有任務

---

## 預計時間

**10 分鐘**(註冊 GitHub 已含)。如果你已經有 GitHub 帳號,只要 5 分鐘。

---

## Step 1:確認你有 GitHub 帳號(2 分鐘)

### 1.1 還沒有帳號?

1. 手機或電腦打開 [github.com](https://github.com)
2. 點右上角 `Sign up`
3. 填:
   - Email(用你最常看的那個)
   - Password
   - Username(這就是你的 `@handle`,**會顯示給組員和老師看**)
4. 完成註冊,**到信箱點驗證連結**

> [!tip] Username 怎麼取?
> 建議用「英文名字+姓」或「中文拼音+數字」,例如 `alice-wang`、`linxm-2026`。
> **不要用太怪的暱稱**,因為老師和組員會 @ 你。

### 1.2 已經有帳號了?

直接到 Step 2。

---

## Step 2:把 GitHub Username 告訴組長(1 分鐘)

組長會把你加進畢製的 repo,你才會收到通知。

**回報格式**(直接貼到組內訊息):

```
我的 GitHub username:@你的username
我的中文姓名:王小美
我的組別:A 組
```

> [!note] 等待組長加入
> 組長加完後,你會在 Email 收到一封 **「You've been invited to collaborate」** 信件。**一定要點裡面的綠色按鈕「View invitation」→「Accept invitation」**,不然你不會收到通知。

---

## Step 3:下載 GitHub Mobile App(2 分鐘)

這是**最重要的一步**。沒有 App = 收不到推播 = 跟 Line 一樣會漏訊息。

### iPhone

1. App Store 搜尋 `GitHub`
2. 找官方那個(深色貓咪 logo,作者是 GitHub, Inc.)
3. 下載 → 打開 → 用 Step 1 的帳號登入

### Android

1. Google Play 搜尋 `GitHub`
2. 找官方那個(深色貓咪 logo,作者是 GitHub, Inc.)
3. 下載 → 打開 → 用 Step 1 的帳號登入

> [!warning] 認明官方 App
> App Store / Play Store 上有很多 GitHub 第三方 App,**只下載 GitHub, Inc. 出的那個**(圖示是黑底白色貓咪)。

---

## Step 4:開啟推播通知(2 分鐘)

App 第一次打開會問「要不要允許通知」,**一定要按「允許」**。

如果不小心按了「不允許」,跟著下面步驟救回來:

### 4.1 在 App 裡開啟通知

1. 打開 GitHub App
2. 右下角點你的頭像 → `Notifications`
3. 確認以下三項都打開:
   - ✅ **Mentions**(被 @ 時通知)
   - ✅ **Assignments**(被指派任務時通知)
   - ✅ **Reviews**(被要求 review 時通知,目前用不到但先開著)

### 4.2 在手機系統設定確認

**iPhone**:設定 → 通知 → GitHub → 允許通知 ✅

**Android**:設定 → 應用程式 → GitHub → 通知 → 開啟 ✅

> [!tip] 推播樣式建議
> 把 GitHub 設成「橫幅 + 聲音 + 鎖屏顯示」,跟你 Line 設定一樣,這樣才不會漏。

---

## Step 5:測試一次(2 分鐘)

跟組長說「我設定好了,幫我測試推播」。

組長會做這件事:

1. 打開 repo → `Issues` → `New issue`
2. 標題寫:`測試推播 - @你的username`
3. 內容隨便打,然後在 Assignees 選你
4. 點 `Submit new issue`

**30 秒內你的手機應該要收到推播**,長相大概是:

```
GitHub
your-team/grad-project-2026
testteacher mentioned you in 測試推播 - @你的username
```

點開推播 → 看到 issue 內容 → 在最下面留言回「收到!」→ 完成測試。

> [!warning] 如果沒收到推播
> 1. 確認你接受了 collaborator 邀請(回 Email 看)
> 2. 確認 App 通知有開(Step 4)
> 3. 重開一次 App,下拉刷新通知頁
> 4. 還是沒有?問組長或老師

---

## Step 6:加入 Repo Bookmark(1 分鐘)

讓你之後找得到任務:

### 手機

1. 在 GitHub App 點右下角頭像 → `Stars` 旁邊的 ⭐ 圖示
2. 點進 repo `grad-project-2026`
3. 點右上角 ⭐ Star

### 電腦瀏覽器

1. 進入 repo 頁面
2. 加到瀏覽器書籤(`Cmd+D` / `Ctrl+D`)
3. 命名為「畢製進度」

---

## 你會用到的三個地方

設定完成後,你日常會在這三個地方互動:

| 地方 | 用途 | 怎麼到 |
|:---|:---|:---|
| **GitHub App 通知** | 看自己被 @ / 被指派的事 | App 右下角鈴鐺 |
| **Issues 頁面** | 看自己組所有任務 | repo → Issues → 點 `Assignee: 你` 篩選 |
| **儀表板網頁** | 看月曆、進度條、整體狀況 | 老師會給連結,加到書籤 |

---

## 日常使用範例

### 情境 A:你被指派新任務

1. 📱 手機跳推播:`teacher assigned you to 「需求訪談 (3 位 stakeholder)」`
2. 點推播 → 看到任務描述、截止日、要做什麼
3. 看完點 `Comment` → 回「收到,W1 結束前完成」
4. 開始做事

### 情境 B:你做完任務了

1. 進到那個 Issue
2. 在留言區寫:「已完成,訪談筆記在 [連結]」
3. **不要自己關閉 Issue**(老師會檢查後關閉)
4. 完成

### 情境 C:你卡關需要組員幫忙

1. 進到那個 Issue
2. 留言:「@組員username 我這邊卡在 X,可以幫我看一下嗎?」
3. 組員手機會跳推播 → 他點進來看 → 回你

> [!quote] 重點
> **任何溝通都在 Issue 留言裡,不要再回去 Line。**
> Line 訊息會洗掉,Issue 留言永遠存在,而且老師看得到完整脈絡。

---

## FAQ

**Q1:我沒看到 Email 邀請信?**
A:看垃圾信件夾。寄件人是 `noreply@github.com`,標題含 `invited to collaborate`。

**Q2:推播會不會太吵?**
A:正常情況一週 5-10 個推播。如果嫌吵,可以在 App 裡把通知聲音關掉,但**請保留橫幅顯示**,不然會漏。

**Q3:我不小心關掉一個 Issue 怎麼辦?**
A:右下角有 `Reopen issue` 按鈕,直接點就好。

**Q4:可以匿名留言嗎?**
A:不行。所有留言都會帶你的 username,這也是為什麼 username 不要太怪。

**Q5:電腦版可以用嗎?**
A:可以,瀏覽器打開 [github.com](https://github.com) 登入即可,功能跟 App 一樣。但**手機 App 是必須的**,因為推播只能透過 App 發送。

**Q6:可以用 LINE Notify 串接嗎?**
A:技術上可以,但會增加維護成本。先用 GitHub App 跑一個月,如果真的不夠再說。

---

## 完成檢查表

設定完之後,跟組長確認以下都打勾:

- [ ] 我有 GitHub 帳號,username 是 _______________
- [ ] 我已接受組長的 collaborator 邀請
- [ ] 我手機裝了 GitHub 官方 App 並登入
- [ ] App 通知開啟,系統設定也允許 GitHub 推播
- [ ] 測試推播成功收到並回覆
- [ ] 我把 repo 加到書籤/Star

全部打勾 = 你已經是這個系統的合格使用者 ✅

---

## 下一步

請去看 `[[manual-grad-system-student-handbook]]`,了解如何認領任務、回報進度、開新 Issue 的格式。
