#! /bin/sh

######################################################################
#
# substitution_indent
# インデントを置換するスクリプト
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################


# === 初期化 =========================================================
set -eu
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"


# === 判定 =========================================================
if [ -t 0 ] ; then
	file=$1
else
	file='-'
fi



trap 'rm -f "$tmpfile"' EXIT
tmpfile=$(mktemp /tmp/tmp.XXXXXXXXXX)

N=15                #N個分置き換える、回数もN回
before=" "          #置き換える対象の文字
after="\t"          #置き換える文字

#流し込み
cat "$file" >$tmpfile

for i in $(yes "" | cat -n | head -$N | sort -r); do

	#N個分のafter生成
	str=$(yes "$after" | head -$i | tr -d "\n")

	#一時ファイルをsedで置き換えて一時ファイルに上書き
	(rm "$tmpfile" && sed "s/^[$before]\{$i\}/${str}/" >"$tmpfile") <"$tmpfile"

done

cat $tmpfile



