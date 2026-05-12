# 畢業製作專案管理 - 學生操作手冊

[第一步](https://github.com/seraphwu/grad-project-2026/blob/main/docs/manual-grad-system-day-one-setup.md) | [使用手冊](https://github.com/seraphwu/grad-project-2026/blob/main/docs/manual-grad-system-student-handbook.md)

> [!info] 你需要的能力
> ✅ 會用網頁瀏覽器
> ✅ 會打字
> ❌ **不需要**會 Git、命令列、寫程式
>
> 這個系統就是「網頁版的待辦清單」,你會用 Facebook 就會用。

---

## 第一步:接受邀請

1. 老師會在你註冊 GitHub 用的信箱寄出邀請信
2. 點信件裡的 `View invitation` 按鈕
3. 點 `Accept invitation`
4. 完成 ✅

如果沒收到信:檢查垃圾信件夾,或登入後到 https://github.com/notifications 看。

---

## 第二步:打開你的儀表板

老師會給你一個網址,長得像:
```
https://seraphwu.github.io/grad-project-2026/teams/team-[代號]/
```
- **MapMo**: https://seraphwu.github.io/grad-project-2026/teams/team-a/
- **Diula**: https://seraphwu.github.io/grad-project-2026/teams/team-b/

**請把這個網址加入瀏覽器書籤**,以後每次開電腦先打開它,就能看到:
- 距離期中/期末還有幾週
- 本週你被指派的任務
- 你們組的整體進度

---

## 第三步:開一個任務 Issue

當組長分派任務給你,或是你想記錄一個工作,流程如下:

### 3.1 進入 Issues 頁面

到老師建的 repo 網址 (例:`github.com/[老師帳號]/grad-project-2026`),點上方的 `Issues` 分頁。

### 3.2 開新 Issue

點綠色 `New issue` 按鈕,會看到兩個範本:
- **📋 新增任務** — 用這個記錄要做的事
- **📝 進度回報** — 用這個寫週報

選 `Get started` 進入範本。

### 3.3 填寫表單

範本會問你:

| 欄位 | 怎麼填 |
|:---|:---|
| Title (標題) | 簡短描述任務,例:`完成登入畫面 wireframe` |
| 組別 | 選你的組 (team:a / team:b / team:c) |
| 週次 | 這個任務屬於哪一週 (W1-W12) |
| 任務描述 | 寫清楚要做什麼、預期產出 |
| 預計完成日 | 例:`2026-05-08` |

### 3.4 指派負責人

右側欄位:
- **Assignees**:點齒輪圖示,選擇要負責的組員 (可多人)
- **Labels**:範本會自動加一些,你也可以再選 `priority:high` 等
- **Milestone**:選對應的週次 (例如 `W2`)

### 3.5 送出

點最下方 `Submit new issue`。完成。

> [!tip] 小技巧
> 在描述欄位輸入 `@` 加組員 username,會自動 tag 對方,他會收到通知。例:`需要 @bob-lin 提供原始檔`

---

## 第四步:完成任務

任務做完了:

1. 找到那個 Issue (在 Issues 列表點開)
2. 拉到最下面,點 `Close issue` 按鈕
3. 完成 ✅

儀表板會自動把這個任務標為已完成,進度條會更新。

> [!warning] 不要刪除 Issue
> 即使是無效或重複的任務,也請用 close 而不是刪除。close 過的 issue 還能查看歷史紀錄。

---

## 第五步:每週進度回報

每週結束 (建議週日晚上),開一個「進度回報」issue:

1. New issue → 選 `📝 進度回報`
2. 標題會自動填 `[進度] W`,你補上週次,例:`[進度] W2`
3. 填三個欄位:
   - 這週完成了什麼
   - 遇到什麼困難?需要老師協助嗎?
   - 下週打算做什麼
4. 送出

老師會在這個 issue 下面留言給你回饋。

---

## 第六步:在 Issue 留言討論

任何 issue 都可以留言討論。例如組員在做某個任務遇到問題:

1. 點開那個 issue
2. 拉到下面留言區
3. 打字 → `Comment`

留言支援:
- **@提及**:輸入 `@組員` 通知對方
- **圖片**:直接拖進留言框上傳
- **連結**:貼網址會自動變成連結
- **Markdown**:用 `**粗體**`、`- 條列` 等語法

---

## 常見情境

### 情境 1:組長分派任務給你

組長會幫你開 Issue 並指派 (Assignee = 你的帳號)。你會收到 GitHub 通知。

**你要做的事**:
1. 點開 issue 確認內容
2. 開始做
3. 做完點 `Close issue`

### 情境 2:你想記錄一個個人 todo

不一定要分派,你可以自己開 issue 自己指派給自己。這樣儀表板會看到你個人的待辦。

### 情境 3:任務做到一半發現做不完

不要 close。留言說明卡關原因,加上 `status:blocked` label,老師看到會主動聯絡。

### 情境 4:需要修改任務的描述/截止日

直接編輯 issue 的內容 (右上角編輯按鈕)。重要變動建議在留言區寫一下「截止日延到 5/15,因為...」。

---

## 你不需要做的事

| 事項 | 原因 |
|:---|:---|
| 學 Git | 你不會接觸到 repo 的檔案 |
| 寫程式 | 儀表板老師會建好 |
| 改 JSON 檔 | 所有資料都在 Issues |
| 自己部署網頁 | 老師會處理 |

---

## 幫助與支援

| 問題 | 找誰 |
|:---|:---|
| GitHub 操作不會 | 看本手冊,或問組長 |
| 任務內容不清楚 | 在 issue 留言 @ 老師 |
| 卡關需要指導 | 加 `status:blocked` label,老師會看到 |
| 系統壞了 | LINE 老師 |

---

## 一頁速查表

```
開任務:Issues → New issue → 📋 新增任務 → 填表單 → Submit
完成:點開 Issue → 最下面 Close issue
回報:Issues → New issue → 📝 進度回報 → 填三欄 → Submit
討論:任何 Issue 下面留言區
通知人:打 @組員username
```

---

> [!success] 你只要記得這件事
> **所有事情都從 Issues 頁面出發。** 開新事項點 `New issue`,完成事項點 `Close issue`。就這樣。
