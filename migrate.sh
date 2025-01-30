#!/bin/bash

# 입력 체크
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_repo_url> <destination_repo_url>"
    exit 1
fi

SOURCE_REPO="$1"
DEST_REPO="$2"

# 레포지토리 이름 추출
REPO_NAME=$(basename "$SOURCE_REPO" .git)

# 미러 클론
echo "Cloning repository: $SOURCE_REPO"
git clone --mirror "$SOURCE_REPO"

# 디렉터리 이동
cd "$REPO_NAME.git" || exit 1

# 원격 저장소 변경
echo "Updating remote repository URL"
git remote set-url --push origin "$DEST_REPO"

# 미러 푸시
echo "Pushing to new repository: $DEST_REPO"
git push --mirror

# 상위 디렉터리로 이동
cd ..

# 클론한 레포지토리 삭제
echo "Cleaning up"
rm -rf "$REPO_NAME.git"

echo "Repository migration completed successfully!"
