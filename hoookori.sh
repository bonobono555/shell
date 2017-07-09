#!/bin/bash

# リリース開始
echo "release start!"

# stashのファイル名(年月日-時分秒)を作成
STASH_FILE=`date +%y%m%d-%H%M%S`
echo ${STASH_FILE}

# 該当ディレクトリまで移動
cd /var/www/html/0620_test

# もしサーバー上で変更があった場合は退避させる
git stash save "${STASH_FILE}"

# リモートリポジトリを更新する
git fetch origin master

# 本番サイトに反映させる
git pull origin master

# リリース完了
echo "release complete!"