#! /bin/sh
#
#文字列をutf-16に変換して返すスクリプト
#ここを参考にした
#http://qiita.com/nyango/items/16aa776a58fe3e26f56f
#http://qiita.com/richmikan@github/items/6b763519a28b4ce40031
#
#例
# convert_hex.sh "兆円欲しい"
#
# &#x5146;&#x5186;&#x6B32;&#x3057;&#x3044;
#
#問題
# 半角の変換に失敗するので改良の余地あり
#
#
#################################################################

convert_hex(){

	local str="$1"
	LF=$(printf '\\\n_'); LF=${LF%_}    # 0) 準備

	printf $str                       |
	od -A n -t x1 -v                  | # 16進ダンプ(アドレス無し)
	tr -Cd '0123456789abcdefABCDEF\n' | # 空白はトル(でも改行コードは残すべし)
	sed "y/abcdef/ABCDEF/"            | # 小文字を大文字に
	sed "s/../&$LF/g"                 | # 1バイト1行に(しなくてもよいけど)
	grep -v '^$'                      | # sedで出来た空行をトル

	#16進数を2進数に
	while read i ;
	do
		printf "obase=2; ibase=16; $i\n" | bc
	done                                |

	#変換
	awk '{
		match($1, "^1*0")
		if( RLENGTH != 2 ) 
			print "";
		printf substr($1,RLENGTH + 1)
	} END {
		printf "\n"
	}'                                  |

	#2進数を16進数に
	while read i ;
	do
		printf "obase=16; ibase=2; $i\n" | bc
	done

}

convert_hex "$1" |
xargs -I ZZ printf "&#x"ZZ";"
printf "\n"


#convert_hex "$1" |
#sed 's/\(.*\)/\\unicode[STIXGeneral]{x\1}/'





