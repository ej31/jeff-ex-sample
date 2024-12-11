#!/bin/bash

# 특정 라벨이 있는 모든 이슈를 closed로 변경
gh issue list -l "dummy" --json number --jq '.[].number' | while read issue_number; do
    gh issue close $issue_number
    echo "Closed issue #$issue_number"
done