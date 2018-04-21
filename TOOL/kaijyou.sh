#! /bin/sh

######################################################################
#
# kaijyou
# 階乗を求めるスクリプト
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################


# === 初期化 =========================================================
set -eu
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"

# ================================================================

kaijou()
{
	local num=$1
	local y=$num

	#引数チェック
	if echo "${num}" | grep -v "^[0-9]*$" >/dev/null; then
		echo "エラー！引数が数値ではありません。"
		exit 1
	fi

	kaijou_saiki()
	{
		if [ $num -le 1 ]
		then
			echo $y
			return 1
		fi
		num=$(( num - 1 ))
		y=$( echo "$y * $num" | bc )
		kaijou_saiki $num
	}

	kaijou_saiki $num

}

#kaijou 4

















