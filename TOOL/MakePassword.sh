#! /bin/sh


MakePassword(){
	#パスワードを作成する関数

	. ./random.sh
	. ./CutChar.sh

	#大文字を含めたかったら増やす
	local string='0123456789abcdefghijklmnopqrstuvwxyz'
	#local string='0123456789'
	#最大文字列数
	local WordMax=25

	local Password
	local rand
	local w

	local LenString=$( printf "${string}" | sed 's/\(.\)/\1\n/g' | wc -l )

	for i in $(seq 1 ${WordMax})
	do

		rand=$(random2 1 ${LenString})
		w=$(CutChar ${rand} ${rand} ${string})

		Password=${Password}${w}

	done

	printf "${Password}\n"
}


#MakePassword







