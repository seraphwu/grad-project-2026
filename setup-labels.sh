#!/bin/bash
# =============================================================
# 批次建立/更新 GitHub Labels
# =============================================================
# 用法:
#   1. 先安裝 GitHub CLI: https://cli.github.com/
#      Mac:    brew install gh
#      Win:    winget install GitHub.cli
#   2. 登入:   gh auth login
#   3. 在 repo 根目錄執行: bash setup-labels.sh
# =============================================================

set -e

REPO="${1:-}"
if [ -z "$REPO" ]; then
  echo "用法: bash setup-labels.sh OWNER/REPO"
  echo "範例: bash setup-labels.sh advisor-username/grad-project-2026"
  exit 1
fi

LABELS_FILE="$(dirname "$0")/labels.json"
if [ ! -f "$LABELS_FILE" ]; then
  echo "錯誤: 找不到 labels.json"
  exit 1
fi

echo "📋 開始為 $REPO 建立 labels..."
echo ""

# 解析 JSON 並逐一建立
LABEL_COUNT=$(jq '. | length' "$LABELS_FILE")

for i in $(seq 0 $((LABEL_COUNT - 1))); do
  NAME=$(jq -r ".[$i].name" "$LABELS_FILE")
  COLOR=$(jq -r ".[$i].color" "$LABELS_FILE")
  DESC=$(jq -r ".[$i].description" "$LABELS_FILE")

  # 嘗試建立,若已存在則更新
  if gh label create "$NAME" --color "$COLOR" --description "$DESC" --repo "$REPO" 2>/dev/null; then
    echo "✅ 已建立: $NAME"
  else
    gh label edit "$NAME" --color "$COLOR" --description "$DESC" --repo "$REPO"
    echo "🔄 已更新: $NAME"
  fi
done

echo ""
echo "✨ 完成!共處理 $LABEL_COUNT 個 labels"
echo "🔗 https://github.com/$REPO/labels"
