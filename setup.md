# GitHub Repo Setup Files

> 此資料夾包含可直接 push 到你的 GitHub repo 的設定檔。

## 📁 檔案清單

```
grad-project-2026-github-setup/
├── .github/
│   ├── CODEOWNERS                    # 權限控制 (需手動填入帳號)
│   └── ISSUE_TEMPLATE/
│       ├── task.yml                  # 任務範本
│       ├── progress.yml              # 進度回報範本
│       └── config.yml                # 範本設定
├── labels.json                       # 30 個 labels 定義
├── setup-labels.sh                   # 批次建立 labels
└── setup-milestones.sh               # 批次建立 W1-W12 milestones
```

## 🚀 快速上手 (4 步驟)

### 前置作業

安裝 GitHub CLI:
- **Mac**: `brew install gh`
- **Windows**: `winget install GitHub.cli`

登入:
```bash
gh auth login
```

### Step 1: 建立 repo 並 push 設定檔

```bash
# 建立 repo (Public,因為 GitHub Pages 免費版需要)
gh repo create grad-project-2026 --public --clone

cd grad-project-2026

# 把這整個 setup 資料夾的內容複製過去 (除了 README、scripts)
cp -r ../grad-project-2026-github-setup/.github .
cp ../grad-project-2026-github-setup/labels.json .
cp ../grad-project-2026-github-setup/setup-*.sh .

# 編輯 .github/CODEOWNERS,把 @advisor-username 換成你的帳號
# 把 @alice-github 等換成實際學生帳號
nano .github/CODEOWNERS  # 或用 VS Code

# Commit & push
git add .
git commit -m "chore: initial repo setup"
git push
```

### Step 2: 批次建立 Labels

```bash
bash setup-labels.sh YOUR-USERNAME/grad-project-2026
```

執行後會看到 30 個 labels 被建立的訊息。

### Step 3: 批次建立 Milestones (W1-W12)

```bash
bash setup-milestones.sh YOUR-USERNAME/grad-project-2026
```

### Step 4: 啟用 Branch Protection

到 GitHub 網頁:`Settings` → `Branches` → `Add rule`

- Branch name pattern: `main`
- ✅ Require a pull request before merging
- ✅ Require review from Code Owners
- 點 `Create`

---

## 🎓 邀請學生

```bash
# 用 CLI 一行一行加 collaborator
gh api repos/YOUR-USERNAME/grad-project-2026/collaborators/STUDENT-USERNAME -X PUT
```

或在網頁:`Settings` → `Collaborators` → `Add people`

---

## ✅ 驗證清單

設定完成後,到 repo 確認:

- [ ] Issues 頁面點 `New issue`,看到「📋 新增任務」「📝 進度回報」兩個範本
- [ ] Issues → Labels 頁面,有 30 個 labels (team:a/b/c, W1-W12, type:*, priority:*, status:*)
- [ ] Issues → Milestones 頁面,有 W1-W12 共 12 個
- [ ] 學生收到 collaborator 邀請信
- [ ] CODEOWNERS 啟用,試圖在 PR 中改別組檔案會被擋

---

## 🔄 重複使用 (下一屆畢製)

下一屆只要:
1. 改 `labels.json` 裡的 W1-W12 描述 (新的日期)
2. 改 `setup-milestones.sh` 裡的日期陣列
3. 改 `CODEOWNERS` 裡的學生帳號
4. 跑一次以上 4 步驟

---

## 📚 相關文件

完整的系統規格與決策歷程,請見 Obsidian vault 的:
- 主控台: `10_Projects/2026-04-grad-project-system/000-project-grad-system.md`
- 老師建置 SOP: `guide-grad-system-github-setup.md`
- 學生手冊: `manual-grad-system-student-handbook.md`
- 決策紀錄: `90_Meta/context/context-grad-system-design-decisions.md`
