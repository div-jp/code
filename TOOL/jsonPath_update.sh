#! /bin/sh

######################################################################
#
# jsonPath_update
# JsonPath方式で保存されている状態で、
# トランザクションから来たデータを置き換えるスクリプト
# SQLのUPDATEのような動き
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################

#cat ../DATA/data1.txt | sh jsonPath_update.sh ../DATA/data2.txt
#sh jsonPath_update.sh ../DATA/data1.txt ../DATA/data2.txt


# === 初期化 =========================================================
set -eu
umask 0022
export LC_ALL='C'; PATH="$(command -p getconf PATH):$PATH"

master=""
tran=""

# === 判定 =========================================================
if [ -t 0 ]; then
	if [ -n "$2" ]; then
		master=$1
		tran=$2
	else
		printf "エラー\n"
		exit 1
	fi
else
	if [ -n "$1" ]; then
		master='-'
		tran=$1
	else
		printf "エラー\n"
		exit 1
	fi
fi


# === 処理 =========================================================
trap 'rm -f "$tmpfile1"' EXIT
tmpfile1=$(mktemp /tmp/tmp.XXXXXXXXXX)

trap 'rm -f "$tmpfile2"' EXIT
tmpfile2=$(mktemp /tmp/tmp.XXXXXXXXXX)


# ソートとタブ区切りをして一時ファイルに出力
# 引数だと受け付けない、catでパイプからだと受け付ける、謎
cat "$master" | sh jsonPath_sort.sh | sh jsonPath_tab.sh >$tmpfile1
cat "$tran" | sh jsonPath_sort.sh | sh jsonPath_tab.sh >$tmpfile2


# タブ区切りの状態でjoin
join -t "$(printf '\011')" -a 2 "$tmpfile2" "$tmpfile1" |
awk 'BEGIN {FS="\t";OFS=" ";}{	print $1,$2 }'





