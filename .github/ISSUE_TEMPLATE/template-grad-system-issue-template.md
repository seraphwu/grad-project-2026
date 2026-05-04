---
filename: template-grad-system-issue-template.md
title: 畢製管理系統 - Issue Template 與組員對照表
aliases:
  - Issue Template
  - 任務開單模板
  - 組員 @ 對照表
date: 2026-05-04
created: 2026-05-04
updated: 2026-05-04
tags:
  - template
  - grad-project
  - github
  - issue
status: ready
type: template
project: 2026-04-grad-project-system
description: GitHub Issue Template 設定檔。學生開新任務時自動帶入結構,並預填組員 @ 對照表,降低指派錯誤。
related:
  - "[[000-project-grad-system]]"
  - "[[manual-grad-system-day-one-setup.md]]"
  - "[[spec-grad-system-architecture]]"
---

# 畢製管理系統 - Issue Template 與組員對照表

> [!info] 這份文件包含什麼
> 1. **三個 Issue Template**(任務、回報、求助) — 放到 repo 的 `.github/ISSUE_TEMPLATE/` 資料夾
> 2. **組員對照表** — 每次開 Issue 都會看到,不用再問「誰是 alice」
> 3. **設定步驟** — 老師如何把這些 template 裝到 repo

---

## Part 1:組員對照表(老師需要客製)

> [!warning] 老師請填這張表
> 這張表會嵌入到所有 Issue Template 裡,學生開單時直接看到。**請依實際組員填寫並更新**。

```markdown
## 📋 組員 @ 對照表

### A 組(主題:_______________)
| 角色 | 姓名 | GitHub Handle |
|:---|:---|:---|
| 組長 | 王小美 | `@alice-wang` |
| 組員 | 林小明 | `@bob-lin` |
| 組員 | 陳小宇 | `@chen-y` |

### B 組(主題:_______________)
| 角色 | 姓名 | GitHub Handle |
|:---|:---|:---|
| 組長 | 林大華 | `@dora-lin` |
| 組員 | 黃小強 | `@evan-h` |
| 組員 | 周小芳 | `@frank-c` |

### C 組(主題:_______________)
| 角色 | 姓名 | GitHub Handle |
|:---|:---|:---|
| 組長 | 吳大寶 | `@gina-w` |
| 組員 | 鄭小威 | `@henry-c` |
| 組員 | 楊小婷 | `@ian-y` |

### 老師
- 指導老師:`@teacher-handle`
```

---

## Part 2:Issue Template 檔案

GitHub 的 Issue Template 格式有兩種:**舊版 Markdown**(`.md`)和**新版 Form**(`.yml`)。新版 Form 對學生更友善 — 它會把欄位變成下拉選單和輸入框,**降低出錯機率**。我們用新版。

### Template 1:📌 新任務(指派給人)

**檔案路徑**:`.github/ISSUE_TEMPLATE/01-new-task.yml`

```yaml
name: 📌 新任務
description: 開立新任務並指派給組員
title: "[任務] "
labels: ["task"]
body:
  - type: markdown
    attributes:
      value: |
        ## 📋 組員 @ 對照表
        
        > 在「指派對象」欄輸入 `@` 後會自動跳出選單,不用記完整 username。
        
        **A 組**:`@alice-wang`(組長)、`@bob-lin`、`@chen-y`
        **B 組**:`@dora-lin`(組長)、`@evan-h`、`@frank-c`
        **C 組**:`@gina-w`(組長)、`@henry-c`、`@ian-y`
        **老師**:`@teacher-handle`

  - type: dropdown
    id: team
    attributes:
      label: 哪一組?
      options:
        - A 組
        - B 組
        - C 組
        - 跨組任務
    validations:
      required: true

  - type: dropdown
    id: week
    attributes:
      label: 預計完成週次
      options:
        - W1 (5/04 - 5/10)
        - W2 (5/11 - 5/17)
        - W3 (5/18 - 5/24)
        - W4 (5/25 - 5/31)
        - W5 (6/01 - 6/07)
        - W6 (6/08 - 6/14)
        - W7 (6/15 - 6/21)
        - W8 (6/22 - 6/28)
        - W9 (6/29 - 7/05)
        - W10 (7/06 - 7/12)
        - W11 (7/13 - 7/19)
        - W12 (7/20 - 7/26)
    validations:
      required: true

  - type: textarea
    id: assignees
    attributes:
      label: 指派對象(輸入 @ 會跳出選單)
      description: |
        例如:`@alice-wang 負責主導,@bob-lin 協助測試`
      placeholder: "@..."
    validations:
      required: true

  - type: textarea
    id: description
    attributes:
      label: 任務內容
      description: 要做什麼?產出什麼?
      placeholder: |
        - 訪談 3 位使用者
        - 整理逐字稿
        - 產出 1 頁訪談摘要
    validations:
      required: true

  - type: input
    id: deadline
    attributes:
      label: 截止日期
      placeholder: "例如:5/10 (W1 週日)"
    validations:
      required: true

  - type: textarea
    id: notes
    attributes:
      label: 備註(可選)
      placeholder: 參考連結、相依任務、注意事項...
```

---

### Template 2:✅ 進度回報

**檔案路徑**:`.github/ISSUE_TEMPLATE/02-progress-report.yml`

```yaml
name: ✅ 進度回報
description: 回報週進度(每週一次)
title: "[週報] W_ - "
labels: ["weekly-report"]
body:
  - type: markdown
    attributes:
      value: |
        ## 📅 週報規則
        
        每週日晚上 22:00 前回報。**不用通知老師**,老師會自動收到推播。
        如果有需要老師回應的問題,在「需要老師協助」欄填寫,老師會在 Issue 留言回覆。

  - type: dropdown
    id: team
    attributes:
      label: 組別
      options:
        - A 組
        - B 組
        - C 組
    validations:
      required: true

  - type: input
    id: week-number
    attributes:
      label: 週次
      placeholder: "例如:W3"
    validations:
      required: true

  - type: textarea
    id: done
    attributes:
      label: 本週完成
      placeholder: |
        - [x] 完成需求訪談 3 場
        - [x] 整理訪談摘要
    validations:
      required: true

  - type: textarea
    id: ongoing
    attributes:
      label: 進行中
      placeholder: |
        - 設計系統雛形(預計 W4 完成)
    validations:
      required: false

  - type: textarea
    id: blockers
    attributes:
      label: 卡關 / 需要老師協助
      placeholder: |
        - 訪談對象 C 一直約不到,是否可換人?
        - 技術選型 A 還是 B,需要老師建議
    validations:
      required: false

  - type: textarea
    id: next-week
    attributes:
      label: 下週計畫
      placeholder: |
        - 完成系統雛形
        - 開始前端切版
    validations:
      required: true
```

---

### Template 3:🆘 求助 / 卡關

**檔案路徑**:`.github/ISSUE_TEMPLATE/03-help-needed.yml`

```yaml
name: 🆘 求助 / 卡關
description: 卡關超過 1 天,需要組員或老師協助
title: "[求助] "
labels: ["help-needed"]
body:
  - type: markdown
    attributes:
      value: |
        ## 🆘 求助原則
        
        **卡關 1 天 = 開單**,不要硬撐三天才講。
        
        - 求助組員:在「求助對象」@ 組員,他手機會收到推播
        - 求助老師:在「求助對象」@ 老師,但**先試著自己解決或問組員**

  - type: textarea
    id: assignees
    attributes:
      label: 求助對象
      description: 輸入 `@` 會跳出選單。優先求助組員,真的不行再 @ 老師。
      placeholder: "@..."
    validations:
      required: true

  - type: textarea
    id: problem
    attributes:
      label: 我卡在哪?
      placeholder: |
        我在做 X,目標是 Y,但遇到 Z 問題。
    validations:
      required: true

  - type: textarea
    id: tried
    attributes:
      label: 我已經嘗試過...
      description: 老師看到「我什麼都試過了」這種空話會直接退件,請具體寫出嘗試的方法
      placeholder: |
        1. 我 google 過「關鍵字 X」,看了前 3 個結果但都不適用
        2. 我問過 ChatGPT,他建議 A 但我試了沒用
        3. 我問過組員 @bob,他也不確定
    validations:
      required: true

  - type: input
    id: urgency
    attributes:
      label: 緊急程度
      placeholder: "例如:今天內需要回覆 / 本週內回覆即可"
    validations:
      required: true
```

---

### 設定檔(關閉空白 Issue)

**檔案路徑**:`.github/ISSUE_TEMPLATE/config.yml`

```yaml
blank_issues_enabled: false
contact_links:
  - name: 💬 一般問題討論
    url: https://github.com/your-org/grad-project-2026/discussions
    about: 不是任務、不是求助,只是想討論的事情(可選)
```

> 此設定強制學生只能用上面三種模板開 Issue,**避免有人開「測試」、「test」這種垃圾單**。

---

## Part 3:老師設定步驟(一次性,5 分鐘)

### 方法 A:透過 GitHub 網頁(最簡單)

1. 進入你的 repo → 點 `Add file` → `Create new file`
2. 在檔名欄位輸入:`.github/ISSUE_TEMPLATE/01-new-task.yml`
   - 注意:**輸入斜線 `/` 會自動建立資料夾**
3. 把上面 Template 1 的 yaml 貼進去
4. 拉到底點 `Commit new file`
5. **重複以上步驟**,把 Template 2、3 和 `config.yml` 都建好

完成後 repo 結構會像這樣:

```
your-repo/
├── .github/
│   └── ISSUE_TEMPLATE/
│       ├── 01-new-task.yml
│       ├── 02-progress-report.yml
│       ├── 03-help-needed.yml
│       └── config.yml
├── README.md
└── ...
```

### 方法 B:透過電腦終端機

```bash
cd your-repo
mkdir -p .github/ISSUE_TEMPLATE
# 把四個檔案分別建立並貼上內容
git add .github
git commit -m "Add issue templates"
git push
```

---

## Part 4:驗證 Template 已生效

1. 進入 repo → `Issues` 頁
2. 點綠色按鈕 `New issue`
3. **應該看到三個選項**:
   - 📌 新任務
   - ✅ 進度回報
   - 🆘 求助 / 卡關
4. 點「📌 新任務」,確認:
   - 看到組員對照表
   - 看到「哪一組」下拉選單
   - 看到「預計完成週次」下拉選單
   - 看到「指派對象」輸入框

如果三個 Template 都正常,**老師端設定完成** ✅

---

## Part 5:學生會看到什麼(實際長相預覽)

學生點 `New issue` → 選「📌 新任務」後,會看到:

```
╔═══════════════════════════════════════════╗
║ 📋 組員 @ 對照表                          ║
║                                           ║
║ A 組:@alice-wang(組長)、@bob-lin、@chen ║
║ B 組:@dora-lin(組長)、@evan-h、@frank-c ║
║ C 組:@gina-w(組長)、@henry-c、@ian-y    ║
║ 老師:@teacher-handle                     ║
╚═══════════════════════════════════════════╝

哪一組? *
[A 組 ▼]

預計完成週次 *
[W1 (5/04 - 5/10) ▼]

指派對象(輸入 @ 會跳出選單) *
┌─────────────────────────────────────────┐
│ @                                       │
└─────────────────────────────────────────┘

任務內容 *
┌─────────────────────────────────────────┐
│                                         │
└─────────────────────────────────────────┘

截止日期 *
┌─────────────────────────────────────────┐
│ 例如:5/10 (W1 週日)                    │
└─────────────────────────────────────────┘

[Submit new issue]
```

學生在「指派對象」打 `@a`,GitHub 會跳出 `@alice-wang`、`@arthur-...`(如果有)等選項,直接點選即可。

**送出後**:被 @ 和被選為 Assignee 的人,**手機立刻收到推播**(只要他完成了 Day One Setup)。

---

## Part 6:常見問題

**Q:可以用中文 username 嗎?**
A:不行,GitHub username 只能英數和連字號。但顯示名稱(Display Name)可以中文,而且會顯示在 Issue 上。

**Q:學生可以改 Template 內容嗎?**
A:不能,只有 repo 的 owner 和 admin 可以改。學生只能填表單。這也是設計上的好處 — 格式統一。

**Q:Template 如何更新?**
A:直接編輯 `.github/ISSUE_TEMPLATE/` 下的 yaml 檔案,**新的 Issue 會用新格式,舊的 Issue 不變**。

**Q:組員對照表會自動更新嗎?**
A:不會,要手動改。如果組員有調整,記得回來改這份文件 + 更新 Template 裡的對照表。

**Q:可以加更多欄位嗎(例如:任務優先級、預估工時)?**
A:可以,在 yaml 裡加 `dropdown` 或 `input` 區塊。但**初期建議不要加太多**,欄位越多學生填得越痛苦,反而不開單。先跑兩週看看,真的需要再加。

---

## 版本紀錄

| 版本 | 日期 | 內容 |
|:---|:---|:---|
| v0.1 | 2026-05-04 | 初版,三個 Template + 組員對照表 + 設定 SOP |
