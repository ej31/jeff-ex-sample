#!/usr/bin/env bash
##

# 기본값: 5개의 이슈 생성
COUNT=${1:-5}

# 리포지토리를 명시적으로 지정하고 싶다면 다음 변수를 사용하세요.
REPO="ej31/jeff-ex-sample"


# 라벨 생성
gh label create dummy

for i in $(seq 1 $COUNT); do
  TITLE="Dummy issue #$i"
BODY="더미 이슈입니다. $i, 테스트를 위해 만들었습니다."
  
  # gh issue create 명령어를 활용하여 이슈 생성
  # REPO를 명시하려면: gh issue create -R "$REPO" ...
  gh issue create \
    --title "$TITLE" \
    --body "$BODY" \
    --label "dummy" \
    --assignee "@me" \

  echo "Created issue: $TITLE"
done

