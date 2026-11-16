#!/bin/bash
# 第12章の練習: お知らせのサイトに、いくつかの故障を起こす
# 中身を読まずに実行し、症状から原因を探す
if [ "$(id -u)" -ne 0 ]; then
    echo "sudo を付けて実行してください" >&2
    exit 1
fi

ufw delete allow "Nginx HTTP" > /dev/null
sed -i 's|root /srv/notice;|root /srv/notice|' /etc/nginx/sites-available/notice
systemctl restart nginx 2> /dev/null
chmod o-r /srv/notice/index.html
sed -i 's/^User=notice-api$/User=noticeapi/' /etc/systemd/system/notice-api.service
systemctl daemon-reload
systemctl restart notice-api
rm -f /srv/notice/news.html

echo "故障を起こしました。パソコンのブラウザで、お知らせのページを開いてください"
