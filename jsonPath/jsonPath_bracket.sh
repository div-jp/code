#! /bin/sh

######################################################################
#
# jsonPath_bracket
# JsonPath方式で保存されている状態で、
# キー列の重複があるときブラケット"[]"を付加するスクリプト
#
# このソフトウェアは Public Domain (CC0)であることを宣言する。
#
######################################################################


# === 初期化 =========================================================
set -eu
umask 0022
export LC_ALL='C'; PATH="$(command -p getconf PATH):$PATH"

# === 判定 =========================================================
if [ -t 0 ] ; then
	file=$1
else
	file='-'
fi

#流し込み
sh jsonPath_sort.sh "$file"                 |
sh jsonPath_tab.sh                          |
awk ' BEGIN {
	FS="\t";OFS=" ";
	flg = 0;                  #重複フラグ
	num = 0;                  #配列に使う番号
}
{
	#キー部の末尾が"]"で終わっていないかつ同じ
	if( str1 == $1 && substr($1,(length($1)+1)-1,1) != "]" ){
		flg = 1;
		num = num + 1;
		print str1"["num"]",str2;
	}
	else {
		if( flg == 1 ){
			num = num + 1;
			print str1"["num"]",str2;
			flg = 0;
			num = 0;
		}
		else {
			print str1,str2;
		}
	}
	str1 = $1;
	str2 = $2;
}
END {
	if( flg == 1 ){
		num = num + 1;
		print str1"["num"]",str2;
	}
	else {
		print str1,str2;
	}
}
'                                         |
tail -n +2







