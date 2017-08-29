#!/bin/sh

#じゃんけんゲームスクリプト


start_gamen(){
	printf "\nじゃんけんゲーム\n"
	printf "1.グー\n"
	printf "2.チョキ\n"
	printf "3.パー\n"
	printf "q.終了\n"
}

check_read(){
	case "${1}" in 
		[123] ) ;;
		q ) printf "終了します\n"; break; ;;
		* ) printf "正しい入力をしてください\n"; continue; ;;
	esac
}

check_123(){
	case "${1}" in 
		1 ) printf "グー\n" ;;
		2 ) printf "チョキ\n" ;;
		3 ) printf "パー\n" ;;
	esac
}

randam_aite(){
	aite=$( awk 'BEGIN {srand(); print int( 3 * rand())+ 1}' )
}

hantei(){
	case "${1}" in 
		1 ) case "${2}" in 
				1 ) printf "あいこ\n" ;;
				2 ) printf "あなたの勝ち\n" ;;
				3 ) printf "あなたの負け\n" ;;
				*) ;;
			esac
			;;
		2 ) case "${2}" in 
				1 ) printf "あなたの負け\n" ;;
				2 ) printf "あいこ\n" ;;
				3 ) printf "あなたの勝ち\n" ;;
				*) ;;
			esac
			;;
		3 ) case "${2}" in 
				1 ) printf "あなたの勝ち\n" ;;
				2 ) printf "あなたの負け\n" ;;
				3 ) printf "あいこ\n" ;;
				*) ;;
			esac
			;;
	esac
}


while : 
do
	my=""
	aite=""

	start_gamen
	
	read my
	check_read ${my}
	printf "あなたの手:"
	check_123 ${my}

	randam_aite
	printf "あいての手:"
	check_123 ${aite}

	hantei ${my} ${aite}

done

exit 0






