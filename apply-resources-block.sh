#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────
# apply-resources-block.sh
#
# 自動把「資源列表區塊」注入到三個頁面:
#   advisor/index.html        (顯示全部 - 共用 + MapMo + Diula)
#   teams/team-a/index.html   (顯示 共用 + MapMo)
#   teams/team-b/index.html   (顯示 共用 + Diula)
#
# 用法:
#   1. 把這個腳本放在 repo 根目錄
#   2. cd 到 repo 根目錄
#   3. bash apply-resources-block.sh
#
# 安全保護:
#   - 執行前自動備份成 *.bak
#   - 如果偵測到頁面已含 #resources-block,會跳過(不重複注入)
#   - 用 `</body>` 當錨點,在 body 結束前注入
# ─────────────────────────────────────────────────────────────────────

set -e

# 顏色輸出
G='\033[0;32m'; Y='\033[0;33m'; R='\033[0;31m'; N='\033[0m'

inject() {
  local file="$1"
  local sections_js="$2"      # 例如: "['共用', 'team:a']"
  local rel_prefix="$3"        # ../  或  ../../

  if [ ! -f "$file" ]; then
    echo -e "${R}✗ 找不到 $file${N}"
    return 1
  fi

  if grep -q 'id="resources-block"' "$file"; then
    echo -e "${Y}⊘ $file 已包含 resources-block,跳過${N}"
    return 0
  fi

  if ! grep -q '</body>' "$file"; then
    echo -e "${R}✗ $file 找不到 </body>,無法注入${N}"
    return 1
  fi

  cp "$file" "$file.bak"
  echo -e "${G}✓ 已備份 → $file.bak${N}"

  # 注入內容
  local block
  block=$(cat <<HTML
<!-- ──────────── 資源列表(自動注入) ──────────── -->
<style>
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
    font-size: 15px; font-weight: 600;
    color: #1a1a1a;
  }
  .res-category { margin: .5rem 0; }
  .res-category-title {
    margin: .75rem 0 .25rem;
    font-size: 12px; font-weight: 600;
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
</style>

<section style="max-width: 960px; margin: 1.5rem auto; padding: 0 1rem;">
  <h2 style="margin:0 0 .5rem;">📚 資源列表</h2>
  <div id="resources-block">載入中…</div>
</section>

<script src="${rel_prefix}shared/resources.js"></script>
<script>
  loadResources({
    container:    '#resources-block',
    sections:     ${sections_js},
    teamsJsonUrl: '${rel_prefix}shared/teams.json',
    resourcesUrl: '${rel_prefix}shared/resources.md'
  });
</script>
<!-- ──────────── /資源列表 ──────────── -->
HTML
)

  # 用 awk 在 </body> 之前插入
  awk -v block="$block" '
    /<\/body>/ && !done { print block; done=1 }
    { print }
  ' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"

  echo -e "${G}✓ 已注入 → $file${N}"
}

echo "═══════════════════════════════════════════"
echo "  資源列表注入器"
echo "═══════════════════════════════════════════"
echo ""

# 1. 確認 shared/ 下有需要的檔案
if [ ! -f "shared/resources.md" ] || [ ! -f "shared/resources.js" ]; then
  echo -e "${R}✗ 請先把 resources.md 和 resources.js 放到 shared/ 目錄${N}"
  echo "   shared/resources.md → 你的資源清單"
  echo "   shared/resources.js → 解析渲染邏輯"
  exit 1
fi
echo -e "${G}✓ shared/resources.md 和 shared/resources.js 已存在${N}"
echo ""

# 2. 注入三個頁面
inject "advisor/index.html"         "['共用', 'team:a', 'team:b']"  "../"
inject "teams/team-a/index.html"    "['共用', 'team:a']"            "../../"
inject "teams/team-b/index.html"    "['共用', 'team:b']"            "../../"

echo ""
echo "═══════════════════════════════════════════"
echo -e "${G}完成!${N}"
echo ""
echo "下一步:"
echo "  1. 在本地預覽(別直接 file:// 打開,fetch 會被擋)"
echo "     python3 -m http.server 8000"
echo "     瀏覽器打開 http://localhost:8000/advisor/"
echo "  2. 確認三頁都有出現「📚 資源列表」"
echo "  3. git add . && git commit -m 'feat: add resources block'"
echo "  4. git push"
echo ""
echo "如果結果有問題:每個頁面的 *.bak 都還在,可以還原:"
echo "  for f in advisor/index.html teams/team-a/index.html teams/team-b/index.html; do"
echo "    mv \"\$f.bak\" \"\$f\""
echo "  done"
echo "═══════════════════════════════════════════"
