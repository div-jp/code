#! bin/sh


Make4digits()
{
	#0から9までの重複しない4桁のランダムな数字を作成する関数

	#ランダム関数を取り込む
	. ./random.sh

	local num=0      #メインの数字
	local next=0     #候補の数字
	local col=4      #桁
	local statas

	#1桁目を呼び出し
	num=$(random2 0 9)

	while :
	do
		#次の桁の候補を呼び出す
		next=$(random2 0 9)
		#重複チェックをする準備
		statas=$(printf "${num}${next}" | sed "s/\(.\)/\1\n/g" | sort | uniq -d)
		#重複だったら何もしない
		if [ "" = "${statas}" ] ; then
			num=$(printf "${num}${next}")
		fi
		#echo ${num}

	#4桁目でループを抜け終了する
	if [ "${col}" -eq $(printf "${num}" | sed "s/\(.\)/\1\n/g" | wc -l) ] ; then
		break;
	fi
	done

	printf "${num}"
}

#d=$(Make4digits)
#echo ${d}















