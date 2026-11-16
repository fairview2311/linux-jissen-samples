#!/bin/bash
# お知らせのサイトのファイルを、1つの tar.gz にまとめて保存する
DEST=/var/backups/notice
STAMP=$(date +%Y%m%d-%H%M%S)
FILE="$DEST/notice-$STAMP.tar.gz"

mkdir -p "$DEST"
if tar -czf "$FILE" -C / \
    srv/notice \
    srv/notice-api/notice_api.py \
    etc/nginx/sites-available/notice \
    etc/systemd/system/notice-api.service; then
    echo "backup: $FILE を作りました"
else
    echo "backup: 失敗しました" >&2
    rm -f "$FILE"
    exit 1
fi

# 7日より古いバックアップを削除する
find "$DEST" -name 'notice-*.tar.gz' -mtime +7 -delete
