# 図解と実機で学ぶLinuxサーバーの基本 サンプルコード

書籍『図解と実機で学ぶLinuxサーバーの基本 権限・systemd・ログ・ネットワークから障害対応・バックアップまで』（早瀬 透）のサンプルコードです。

本では、練習用のサーバー（Multipass の Ubuntu 26.04 LTS）に、架空の会社「みどり文具株式会社」の社内お知らせサイトを1冊を通して作ります。
このリポジトリには、**各章を終えた時点の設定ファイル・プログラム・スクリプト**が、サーバーの中と同じパスで入っています。
本文のコードの枠と、その章のサンプルコードは同じ内容です。

- 設定ファイルを書き間違えて動かないとき、本のとおりのファイルと見比べる
- 長いファイル（API の `notice_api.py` など）を、手で打たずにコピーして貼り付ける
- 第12章の総合演習で使うスクリプト `break.sh` を入手する

といった使い方をしてください。

## 本

- 出版後に、Kindle 版と紙の本の URL をここに載せます

## ファイルを入手する方法

入手する方法は3つあります。やりたいことに合わせて選んでください。

| やりたいこと | 方法 |
|---|---|
| 1つのファイルだけ見比べたい・コピーしたい | 下の表の［ファイルを見る］から、ブラウザでファイルを開く。右上のコピーのボタンで中身をコピーできます |
| ある章の終わりのファイルを全部ダウンロードしたい（第12章の `break.sh` など） | 下の表の［ZIP］を押してダウンロードし、展開する |
| 全部の章をダウンロードして、章を切り替えたい | `git clone` でクローンし、`git checkout ch05` のように切り替える（下の「git でクローンする方法」） |

ZIP を展開すると、`linux-jissen-samples-ch12` のような名前のフォルダーができます。

| 章 | この章の終わりで増えたもの | ファイルを見る | ダウンロード |
|---|---|---|---|
| 第1章 | まだファイルはありません（練習用のサーバーを作る章） | [ch01](https://github.com/fairview2311/linux-jissen-samples/tree/ch01) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch01.zip) |
| 第2章 | お知らせのページ `srv/notice/index.html` | [ch02](https://github.com/fairview2311/linux-jissen-samples/tree/ch02/srv/notice) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch02.zip) |
| 第3章 | 権限を整えたお知らせのページ（ファイルは第2章と同じ） | [ch03](https://github.com/fairview2311/linux-jissen-samples/tree/ch03/srv/notice) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch03.zip) |
| 第4章 | nginx の設定 `etc/nginx/sites-available/notice` | [ch04](https://github.com/fairview2311/linux-jissen-samples/tree/ch04/etc/nginx/sites-available) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch04.zip) |
| 第5章 | お知らせの API `srv/notice-api/notice_api.py` | [ch05](https://github.com/fairview2311/linux-jissen-samples/tree/ch05/srv/notice-api) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch05.zip) |
| 第6章 | API のサービス `etc/systemd/system/notice-api.service` | [ch06](https://github.com/fairview2311/linux-jissen-samples/tree/ch06/etc/systemd/system) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch06.zip) |
| 第7章 | ログで原因を追った後の API と nginx の設定 | [ch07](https://github.com/fairview2311/linux-jissen-samples/tree/ch07/srv/notice-api) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch07.zip) |
| 第8章 | ファイアウォールを整えた状態（ファイルは第7章と同じ） | [ch08](https://github.com/fairview2311/linux-jissen-samples/tree/ch08) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch08.zip) |
| 第9章 | パソコンの SSH の設定 `pc/ssh-config` | [ch09](https://github.com/fairview2311/linux-jissen-samples/tree/ch09/pc) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch09.zip) |
| 第10章 | ディスクとログを整えた状態（ファイルは第9章と同じ） | [ch10](https://github.com/fairview2311/linux-jissen-samples/tree/ch10) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch10.zip) |
| 第11章 | バックアップのスクリプト `usr/local/sbin/notice-backup.sh` と、service・timer | [ch11](https://github.com/fairview2311/linux-jissen-samples/tree/ch11/usr/local/sbin) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch11.zip) |
| 第12章 | 総合演習のスクリプト `practice/break.sh`（完成形。このページの中身と同じ） | [ch12](https://github.com/fairview2311/linux-jissen-samples/tree/ch12/practice) | [ZIP](https://github.com/fairview2311/linux-jissen-samples/archive/refs/tags/ch12.zip) |

### git でクローンする方法

Git をインストールしている人は、パソコンのターミナルで次のように打ちます。

```text
git clone https://github.com/fairview2311/linux-jissen-samples.git
cd linux-jissen-samples
git checkout ch05
```

`ch01`〜`ch12` は Git のタグ（ある時点のファイルに付けた名前）です。`git checkout ch05` で第5章の終わりの状態に、`git checkout main` で完成形に戻ります。

## 動かし方

このリポジトリのファイルは、練習用のサーバー（本の第1章で作る `linux-book`）の中に置いて使います。フォルダーの並びは、サーバーの中のパスと同じです。

```text
このリポジトリ                                サーバー（linux-book）の中
etc/nginx/sites-available/notice     →     /etc/nginx/sites-available/notice
etc/systemd/system/notice-api.service →    /etc/systemd/system/notice-api.service
srv/notice/index.html                →     /srv/notice/index.html
srv/notice-api/notice_api.py         →     /srv/notice-api/notice_api.py
usr/local/sbin/notice-backup.sh      →     /usr/local/sbin/notice-backup.sh
pc/ssh-config                        →     （サーバーではなく、パソコンの ~/.ssh/config）
practice/break.sh                    →     （第12章で /tmp に送って実行する）
```

| ファイル | 使う章 | 置いた後に打つコマンド |
|---|---|---|
| `srv/notice/index.html` | 第2〜4章 | （ブラウザで開き直す） |
| `etc/nginx/sites-available/notice` | 第4・5章 | `sudo nginx -t` → `sudo systemctl reload nginx` |
| `srv/notice-api/notice_api.py` | 第5〜7章 | `sudo systemctl restart notice-api`（第6章から） |
| `etc/systemd/system/notice-api.service` | 第6章 | `sudo systemctl daemon-reload` → `sudo systemctl restart notice-api` |
| `pc/ssh-config` | 第9章 | `ssh linux-book`（`HostName` を自分のサーバーの IP アドレスに書き換えてから） |
| `usr/local/sbin/notice-backup.sh` と `notice-backup.{service,timer}` | 第11章 | `sudo chmod 755 /usr/local/sbin/notice-backup.sh` → `sudo systemctl daemon-reload` → `sudo systemctl enable --now notice-backup.timer` |
| `practice/break.sh` | 第12章 | `sudo bash /tmp/break.sh` |

### 方法1　中身をコピーして貼り付ける（いちばん簡単）

1. 上の表の［ファイルを見る］から、ブラウザでファイルを開き、右上のコピーのボタンで中身をコピーする
2. サーバーの中で `sudo nano /srv/notice-api/notice_api.py` のように、置き場所のパスで nano を開く
3. 貼り付ける（Windows のターミナルは右クリック、Mac は <kbd>⌘</kbd>＋<kbd>V</kbd>）。nano の <kbd>Ctrl</kbd>＋<kbd>V</kbd> は貼り付けではありません
4. <kbd>Ctrl</kbd>＋<kbd>O</kbd>、<kbd>Enter</kbd>、<kbd>Ctrl</kbd>＋<kbd>X</kbd> で保存して終了する（Mac は <kbd>control</kbd>）
5. 上の表の「置いた後に打つコマンド」を打つ

### 方法2　ファイルを送る（ZIP を展開した場合）

パソコンのターミナルで、展開したフォルダーに移り、`multipass transfer` でサーバーの `/tmp` に送ってから、サーバーの中で置き場所にコピーします。

Windows（PowerShell）:

```text
cd $HOME\Downloads\linux-jissen-samples-ch12
multipass transfer srv/notice-api/notice_api.py linux-book:/tmp/notice_api.py
```

Mac（ターミナル）:

```text
cd ~/Downloads/linux-jissen-samples-ch12
multipass transfer srv/notice-api/notice_api.py linux-book:/tmp/notice_api.py
```

サーバーの中（`multipass shell linux-book` で入る）:

```text
sudo cp /tmp/notice_api.py /srv/notice-api/notice_api.py
ls -l /srv/notice-api/notice_api.py
```

コピーした後は、本の章の手順どおりのオーナーと権限になっているかを `ls -l` で確かめます（本の第3章・第6章）。

### 第12章の総合演習のスクリプト

`practice/break.sh` は、第12章でサーバーに故障を起こすスクリプトです。中身を読むと演習の答えが分かるので、読まずに使ってください。必ず練習用のサーバーで、本の第12章の手順で状態を保存（`multipass snapshot`）してから実行します。

```text
multipass transfer break.sh linux-book:/tmp/break.sh
```

## 完成形のフォルダーの中身（第12章）

```text
linux-jissen-samples/
├── etc/nginx/sites-available/notice   nginx の設定（ページと /api/ の中継）
├── etc/systemd/system/                API のサービスと、バックアップの service・timer
├── srv/notice/index.html              お知らせのページ
├── srv/notice-api/notice_api.py       お知らせの API（Python の標準ライブラリだけ）
├── usr/local/sbin/notice-backup.sh    毎日のバックアップのスクリプト
├── pc/ssh-config                      パソコンの ~/.ssh/config に書く設定
└── practice/break.sh                  第12章の総合演習のスクリプト
```

`pc/ssh-config` の `HostName` は、自分の練習用のサーバーの IP アドレス（`multipass list` で表示されるもの）に書き換えて使います。

## うまくいかないとき

- 貼り付けた設定で `nginx -t` が失敗する … 先頭や末尾の行が欠けていないか、本の枠と見比べます（本の第4章・第12章）
- `multipass transfer` が `No such file or directory` と表示する … `cd` で `break.sh` のあるフォルダーに移ったかを、Windows は `dir`、Mac は `ls` で確かめます
- 貼り付けた後の行の頭がずれる … nano に貼り付けたときに字下げが増えることがあります。本の枠と見比べて直します
- `sudo systemctl restart notice-api` の後も古い動きのまま … unit ファイルを書き換えたときは、先に `sudo systemctl daemon-reload` を打ちます（本の第6章）
- ブラウザで開くと 403 になる … コピーしたファイルを nginx が読めません。`ls -l` で権限を確かめます（本の第4章 section 07）
- 第12章で何をしても直らなくなった … パソコンのターミナルで `multipass stop linux-book` を打ってから、`multipass restore --destructive linux-book.ch12-start` で章の始めに戻せます（本の第12章）

## 確かめたバージョン

- Ubuntu 26.04.1 LTS（Multipass 1.17.1）
- nginx 1.28.3・systemd 259・Python 3.14.4・ufw 0.36.2
- Windows 11・macOS（2026 年 11 月）

## ライセンス

MIT License（[LICENSE](LICENSE) を見てください）。設定ファイルやスクリプトは、自分のサーバーに自由に使ってかまいません。
