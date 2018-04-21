#! /bin/sh

######################################################################
#
# kinsyu
# 金種計算するスクリプト
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################

# === 初期化 =========================================================
set -eu
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"


kinsyu(){
	# === 変数 ===========================================================

	local kinsyu='10000 5000 1000 500 100 50 10 5 1'
	local kinsyu_=0
	local kingaku=""

	# === 判定 ===========================================================
	if [ -t 0 ] ; then
		kingaku=$1
	else
		kingaku='-'
		kingaku=$( cat $kingaku )
	fi

	expr "$kingaku" + 1 >/dev/null 2>&1
	if [ ! $? -lt 2 ]; then
		printf "数値を入力してください\n"
		exit 1
	fi

	if [ $kingaku -le 0 ]; then
		printf "金額を入力してください\n"
		exit 1
	fi

	# === 金種計算 =========================================================

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 1)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 2)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 3)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 4)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 5)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 6)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 7)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 8)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	kinsyu_=$(printf "%s" "$kinsyu" | cut -d' ' -f 9)
	printf "%d " "$(( $kingaku / $kinsyu_ ))"
	kingaku=$(( $kingaku % $kinsyu_ ))

	printf "\n"

}

#kinsyu 25343






