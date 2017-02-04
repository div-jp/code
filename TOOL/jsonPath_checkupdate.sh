#! /bin/sh

######################################################################
#
# jsonPath_checkupdate
# JsonPath方式で保存されている状態で、
# UPDATEされない行を表示するスクリプト。
#
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################

#demo
#cat ../DATA/data1.txt | sh jsonPath_checkupdate.sh ../DATA/data2.txt
#sh jsonPath_checkupdate.sh ../DATA/data1.txt ../DATA/data2.txt


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
cat "$master" | sh jsonPath_sort.sh >$tmpfile1
cat "$tran" | sh jsonPath_sort.sh >$tmpfile2

# タブ区切りの状態でjoin
join -v 1 "$tmpfile2" "$tmpfile1"
printf "がUPDATEされません。\n"




