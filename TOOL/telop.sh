#! /bin/sh


telop()
{
	#テロップを表示するスクリプト

	LANG=C

	#半角文字カウント用
	#printf "${str1}" | sed "s/[\x80-\xFF]//g" | wc -c
	#全角文字カウント用
	#printf "${str1}" | sed "s/[[:alnum:]]//g" | wc -c 

	str1="あいうa123bえ"

	#バイト数を得る
	num1=$( printf "${str1}" | sed "s/[\x80-\xFF]//g" | wc -c )
	num2=$( printf "scale=0;$( printf "${str1}" | sed "s/[[:alnum:]]//g" | wc -c )/3*2\n" | bc )
	num=$( printf "${num1}+${num2}\n" | bc )

	#ループ
	for i in $(seq 1 3); do

		printf "${str1}"

		for i in $(seq 1 ${num}); do

			printf "\b \b"
			sleep 0.2

		done
	done

}

#telop







