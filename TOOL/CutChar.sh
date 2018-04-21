#! /bin/sh


CutChar(){

	#文字列のn文字目からm文字抜き出す関数
	#通常はcut -cコマンドでできるが日本語が混じると失敗するので考えた

	#local string='0123456789abcdefghijklmnopqrstuvwxyz'
	local string='hoge0あ1い2う3え4お'

	#何文字目から何文字目までか
	local StartNum=1
	local EndNum=1

	if [ "" = "$1" ] ; then
		printf "エラー！\n"
		exit 2
	else
		StartNum=$1
	fi
	if [ "" = "$2" ] ; then
		printf "エラー！\n"
		exit 2
	else
		EndNum=$2
	fi
	if [ "" = "$3" ] ; then
		printf "エラー！\n"
		exit 2
	else
		string=$3
	fi

	printf "${string}"                        |
	#1文字づつ改行
	sed 's/\(.\)/\1\n/g'                      |
	#n行目からm行目まで抜き出す
	sed -n ${StartNum},${EndNum}p             |
	#改行を取り除く
	tr -d "\n"

	printf "\n"
	
}

#str="0あ1い2う3え4お"
#CutChar 2 3 "$str"








