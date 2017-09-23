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
	local x=$1
	local y=$x

	kaijou_saiki()
	{
		if [ $x -le 1 ]
		then
			echo $y
			return 1
		fi
		x=$(( x - 1 ))
		y=$( echo "$y * $x" | bc )
		kaijou_saiki $x
	}

	kaijou_saiki $x

}

kaijou $1

















