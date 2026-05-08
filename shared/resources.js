/**
 * shared/resources.js
 *
 * 共用模組:解析 shared/resources.md → 渲染到頁面。
 *
 * 使用方式 (在頁面 inline 引入):
 *
 *   <div id="resources-block"></div>
 *   <script src="../shared/resources.js"></script>
 *   <script>
 *     // teams 頁面: 顯示「共用 + 該組」
 *     loadResources({
 *       container: '#resources-block',
 *       sections:  ['共用', 'team:a'],
 *       teamsJsonUrl: '../shared/teams.json',
 *       resourcesUrl: '../shared/resources.md'
 *     });
 *
 *     // advisor 頁面: 顯示全部
 *     loadResources({
 *       container: '#resources-block',
 *       sections:  ['共用', 'team:a', 'team:b'],
 *       teamsJsonUrl: '../shared/teams.json',
 *       resourcesUrl: '../shared/resources.md'
 *     });
 *   </script>
 */
(function (global) {
  'use strict';

  // ─────────────────────────────────────────
  // Parser: Markdown → 結構化資料
  // ─────────────────────────────────────────
  // 輸入: resources.md 全文
  // 輸出: { '共用': { '學習': [...], '工具': [...] }, 'team:a': {...}, ... }
  function parseResourcesMd(md) {
    const result = {};
    let currentSection = null;   // ## 共用 / team:a / team:b
    let currentCategory = null;  // ### 學習 / 工具 / 參考

    const lines = md.split('\n');
    for (const rawLine of lines) {
      const line = rawLine.trim();

      // 跳過 blockquote (維護說明區塊)
      if (line.startsWith('>')) continue;

      // 第一層標題 ##
      const h2 = line.match(/^##\s+(.+?)\s*$/);
      if (h2) {
        currentSection = h2[1].trim();
        currentCategory = null;
        if (!result[currentSection]) result[currentSection] = {};
        continue;
      }

      // 第二層標題 ###
      const h3 = line.match(/^###\s+(.+?)\s*$/);
      if (h3 && currentSection) {
        currentCategory = h3[1].trim();
        if (!result[currentSection][currentCategory]) {
          result[currentSection][currentCategory] = [];
        }
        continue;
      }

      // 清單項目: - [標題](URL) — 說明  或  - [標題](URL)
      // 支援 em-dash (—)、hyphen (-)、en-dash (–) 當分隔
      const item = line.match(/^-\s+\[([^\]]+)\]\(([^)]+)\)(?:\s*[—–-]\s*(.+))?$/);
      if (item && currentSection && currentCategory) {
        result[currentSection][currentCategory].push({
          title: item[1].trim(),
          url:   item[2].trim(),
          desc:  item[3] ? item[3].trim() : ''
        });
        continue;
      }

      // 其他行 (空行、純文字說明) 忽略
    }

    return result;
  }

  // ─────────────────────────────────────────
  // Renderer: 結構化資料 → DOM
  // ─────────────────────────────────────────
  function renderResources(parsed, sections, teamsMap) {
    const root = document.createElement('div');
    root.className = 'resources';

    let renderedAny = false;

    for (const sectionId of sections) {
      const sectionData = parsed[sectionId];
      if (!sectionData) continue;

      // 至少有一個分類有內容才渲染
      const hasContent = Object.values(sectionData).some(arr => arr.length > 0);
      if (!hasContent) continue;
      renderedAny = true;

      // 區塊標題: 用顯示名,不用 ID
      const displayName = teamsMap[sectionId] || sectionId;
      const sectionEl = document.createElement('section');
      sectionEl.className = 'res-section';
      sectionEl.dataset.sectionId = sectionId;

      const h = document.createElement('h3');
      h.className = 'res-section-title';
      h.textContent = displayName;
      sectionEl.appendChild(h);

      // 各分類
      for (const [category, items] of Object.entries(sectionData)) {
        if (!items.length) continue;

        const catEl = document.createElement('div');
        catEl.className = 'res-category';

        const catTitle = document.createElement('h4');
        catTitle.className = 'res-category-title';
        catTitle.textContent = category;
        catEl.appendChild(catTitle);

        const ul = document.createElement('ul');
        ul.className = 'res-list';
        for (const it of items) {
          const li = document.createElement('li');
          li.className = 'res-item';

          const a = document.createElement('a');
          a.href = it.url;
          a.textContent = it.title;
          a.target = '_blank';
          a.rel = 'noopener noreferrer';
          li.appendChild(a);

          if (it.desc) {
            const span = document.createElement('span');
            span.className = 'res-desc';
            span.textContent = ' — ' + it.desc;
            li.appendChild(span);
          }
          ul.appendChild(li);
        }
        catEl.appendChild(ul);
        sectionEl.appendChild(catEl);
      }

      root.appendChild(sectionEl);
    }

    if (!renderedAny) {
      const empty = document.createElement('p');
      empty.className = 'res-empty';
      empty.textContent = '目前沒有資源。';
      root.appendChild(empty);
    }

    return root;
  }

  // ─────────────────────────────────────────
  // Main: 載入 + 解析 + 渲染
  // ─────────────────────────────────────────
  async function loadResources(opts) {
    const {
      container,
      sections,
      teamsJsonUrl,
      resourcesUrl
    } = opts;

    const containerEl = typeof container === 'string'
      ? document.querySelector(container)
      : container;
    if (!containerEl) {
      console.warn('[resources] container not found:', container);
      return;
    }

    try {
      // 並行 fetch 兩個檔
      const [teamsRes, mdRes] = await Promise.all([
        fetch(teamsJsonUrl),
        fetch(resourcesUrl)
      ]);

      if (!mdRes.ok) throw new Error(`resources.md fetch failed: ${mdRes.status}`);

      // teams.json 取顯示名映射,失敗也不致命 (用 ID 顯示)
      const teamsMap = { '共用': '共用' };
      if (teamsRes.ok) {
        try {
          const teamsData = await teamsRes.json();
          const teamsObj = teamsData.teams || {};
          for (const [id, info] of Object.entries(teamsObj)) {
            teamsMap[id] = info.display_name || id;
          }
        } catch (e) {
          console.warn('[resources] teams.json parse failed, using IDs:', e);
        }
      }

      const md = await mdRes.text();
      const parsed = parseResourcesMd(md);
      const dom = renderResources(parsed, sections, teamsMap);

      containerEl.innerHTML = '';
      containerEl.appendChild(dom);
    } catch (err) {
      console.error('[resources] load failed:', err);
      containerEl.innerHTML =
        '<p class="res-empty">資源列表載入失敗 — 請稍後重試或檢查 console。</p>';
    }
  }

  // 對外公開
  global.loadResources = loadResources;
  global.parseResourcesMd = parseResourcesMd; // 暴露給可能的測試使用
})(window);
