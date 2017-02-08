#! /bin/sh

######################################################################
#
# jsonPath_tab
# JsonPath方式で保存されている状態で、
# キー部とデータ部の間の区切り文字をタブにするスクリプト
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
cat "$file"                                       |
awk '{
	str = "";

	str = $1"\t";

	for(i = 2; i < NF ; i++){
		str = str$i" "; 
	}

	str = str$NF;

	printf("%s\n",str);

}
'











