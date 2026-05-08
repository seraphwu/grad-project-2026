# 資源列表整合說明

## 新增的檔案

兩個新檔放到 repo:

```
shared/resources.md   ← 你維護的資源清單(編輯這個來增刪資源)
shared/resources.js   ← 解析 + 渲染邏輯(三頁共用,不用改)
```

## 三個頁面要加的內容

### 通用 CSS

把這段 CSS 加進三個頁面既有的 `<style>` 區塊裡(任意位置都可以):

```css
/* === Resources Block === */
#resources-block { margin: 1.5rem 0; }
.res-section {
  margin: 1rem 0;
  padding: 1rem 1.25rem;
  background: #fafafa;
  border: 1px solid #e5e5e5;
  border-radius: 8px;
}
.res-section-title {
  margin: 0 0 .5rem;
  font-size: 15px;
  font-weight: 600;
  color: #1a1a1a;
}
.res-category { margin: .5rem 0; }
.res-category-title {
  margin: .75rem 0 .25rem;
  font-size: 12px;
  font-weight: 600;
  color: #666;
  text-transform: uppercase;
  letter-spacing: .05em;
}
.res-list { margin: 0; padding-left: 1.25rem; }
.res-item { margin: .25rem 0; font-size: 14px; line-height: 1.6; }
.res-item a { color: #0969da; text-decoration: none; }
.res-item a:hover { text-decoration: underline; }
.res-desc { color: #666; font-size: 13px; }
.res-empty { color: #999; font-size: 14px; font-style: italic; }
```

> 配色我用了你 spec §6 的中性灰階基調(灰底、深灰文字、配藍色連結)。
> 想跟你既有區塊更一致的話,直接把 `background: #fafafa` 改成跟其他卡片一樣的色。

### advisor/index.html

**位置**:選一個你覺得適合的 section 之後(例如倒數計時模組下方、組別卡片區之後都可)。

```html
<!-- 資源列表(全部三組) -->
<section>
  <h2>📚 資源列表</h2>
  <div id="resources-block">載入中…</div>
</section>

<script src="../shared/resources.js"></script>
<script>
  loadResources({
    container: '#resources-block',
    sections:  ['共用', 'team:a', 'team:b'],
    teamsJsonUrl: '../shared/teams.json',
    resourcesUrl: '../shared/resources.md'
  });
</script>
```

### teams/team-a/index.html

```html
<section>
  <h2>📚 資源列表</h2>
  <div id="resources-block">載入中…</div>
</section>

<script src="../../shared/resources.js"></script>
<script>
  loadResources({
    container: '#resources-block',
    sections:  ['共用', 'team:a'],
    teamsJsonUrl: '../../shared/teams.json',
    resourcesUrl: '../../shared/resources.md'
  });
</script>
```

> 注意路徑是 `../../shared/`(兩層 `../`),因為 team 頁在 `teams/team-a/` 兩層下面。

### teams/team-b/index.html

跟 team-a 一樣,只把 `team:a` 換成 `team:b`:

```html
<section>
  <h2>📚 資源列表</h2>
  <div id="resources-block">載入中…</div>
</section>

<script src="../../shared/resources.js"></script>
<script>
  loadResources({
    container: '#resources-block',
    sections:  ['共用', 'team:b'],
    teamsJsonUrl: '../../shared/teams.json',
    resourcesUrl: '../../shared/resources.md'
  });
</script>
```

---

## 維護方式(給你日後)

加一筆新資源 → 編輯 `shared/resources.md`:

```markdown
## team:a

### 工具
- [新工具名稱](https://example.com) — 簡短說明
```

push 後三個頁面自動載入新內容,不用改 HTML、不用改 JS。

## 設計細節

| 決策 | 為什麼 |
|---|---|
| 用 .md 而不是 .json | 你日後要手動維護,Markdown 寫起來比 JSON 順、不用擔心逗號跳脫 |
| 區塊用 ID(`team:a`) | 沿用你的 §7 ID/顯示名分離原則。改名只動 `teams.json`,`resources.md` 不用動 |
| 用 `<h3>` 不是 `<h2>` | 整個區塊由頁面用 `<h2>` 包起來,內部標題降一級保持階層正確 |
| 空分類自動跳過 | `.md` 裡有寫 `### 學習` 但項目都還沒填(像 team:b),不會渲染空白標題出來 |
| 連結 target="_blank" + rel | 點外部資源開新分頁,且符合資安最佳實踐(noopener noreferrer) |
| teams.json fetch 失敗仍可運作 | 退回顯示原始 ID(`team:a`),不會整個壞掉 |
