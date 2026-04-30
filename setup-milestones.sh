#!/bin/bash
# =============================================================
# 批次建立 GitHub Milestones (W1-W12)
# =============================================================
# 用法:
#   1. 確認已安裝並登入 GitHub CLI
#   2. 在 repo 根目錄執行: bash setup-milestones.sh OWNER/REPO
# =============================================================

set -e

REPO="${1:-}"
if [ -z "$REPO" ]; then
  echo "用法: bash setup-milestones.sh OWNER/REPO"
  echo "範例: bash setup-milestones.sh seraphwu/grad-project-2026"
  exit 1
fi

# Milestones 定義: 名稱|截止日|描述
MILESTONES=(
  "W1|2026-05-10|啟動週,需求訪談、技術選型"
  "W2|2026-05-17|雛形設計、wireframe"
  "W3|2026-05-24|開發起步、架構搭建"
  "W4|2026-05-31|功能開發推進"
  "W5|2026-06-07|期中準備、整合"
  "W6|2026-06-14|🎯 期中報告"
  "W7|2026-06-21|期中後調整"
  "W8|2026-06-28|功能完善"
  "W9|2026-07-05|整合測試"
  "W10|2026-07-12|修正除錯"
  "W11|2026-07-19|成果展準備"
  "W12|2026-07-26|🎯 成果展"
  "|W13  | 2026-08-02 |                 |"
  "|W14  | 2026-08-09 |                 |"
  "|W15  | 2026-08-16 |                 |"
  "|W16  | 2026-08-23 |                 |"
  "|W17  | 2026-08-30 |                 |"
  "|W18  | 2026-09-06 |                 |"
  "|W19  | 2026-09-13 |                 |"
  "|W20  | 2026-09-20 |                 |"
  "|W21  | 2026-09-27 |                 |"
  "|W22  | 2026-10-04 |                 |"
  "|W23  | 2026-10-11 |                 |"
  "|W24  | 2026-10-18 |校內展|"
  "|W25  | 2026-10-25 |                 |"
  "|W26  | 2026-11-01 |                 |"
  "|W27  | 2026-11-08 |                 |"
  "|W28  | 2026-11-15 |                 |"
  "|W29  | 2026-11-22 |                 |"
  "|W30  | 2026-11-29 |                 |"
  "|W31  | 2026-12-06 |校外展|"
)

echo "🎯 開始為 $REPO 建立 milestones..."
echo ""

for milestone in "${MILESTONES[@]}"; do
  IFS='|' read -r TITLE DUE DESC <<< "$milestone"

  # GitHub API 需要 ISO 8601 格式,加上 T23:59:59Z
  DUE_ISO="${DUE}T23:59:59Z"

  # 建立 milestone
  gh api repos/$REPO/milestones \
    -X POST \
    -f title="$TITLE" \
    -f description="$DESC" \
    -f due_on="$DUE_ISO" \
    --silent && echo "✅ 已建立: $TITLE ($DUE) - $DESC" \
    || echo "⚠️  跳過: $TITLE (可能已存在)"
done

echo ""
echo "✨ 完成!"
echo "🔗 https://github.com/$REPO/milestones"
