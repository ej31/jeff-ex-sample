#!/bin/bash

# 이슈 통계를 생성하고 새 이슈로 보고
echo "## 이슈 현황 리포트 $(date +%Y-%m-%d)" > report.md
echo "### 열린 이슈" >> report.md
gh issue list --state open --json labels,title,number --limit 100 | \
jq -r 'group_by(.labels[].name) | map({label: .[0].labels[0].name, count: length}) | .[] | "- \(.label): \(.count)개"' >> report.md

gh issue create --title "📊 이슈 현황 리포트 $(date +%Y-%m-%d)" --body-file report.md