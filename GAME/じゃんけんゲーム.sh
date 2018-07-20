#!/bin/sh

#じゃんけんゲームスクリプト


DispStart(){
	printf "\nじゃんけんゲーム\n"
	printf "1.グー\n"
	printf "2.チョキ\n"
	printf "3.パー\n"
	printf "q.終了\n"
}

CheckRead(){
	case "${1}" in 
		[123] ) ;;
		q ) printf "終了します\n"; break; ;;
		* ) printf "正しい入力をしてください\n"; continue; ;;
	esac
}

Check123(){
	case "${1}" in 
		1 ) printf "グー\n" ;;
		2 ) printf "チョキ\n" ;;
		3 ) printf "パー\n" ;;
	esac
}

RandomAite(){
	awk 'BEGIN { srand(); print int( 3 * rand())+ 1 }'
}

Hantei(){
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
	Human=""
	Comp=""

	DispStart
	
	read Human
	CheckRead ${Human}
	printf "あなたの手:"
	Check123 ${Human}

	Comp=$(RandomAite)
	printf "あいての手:"
	Check123 ${Comp}

	Hantei ${Human} ${Comp}

done

exit 0






