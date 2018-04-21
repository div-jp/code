#! /bin/sh
#回文を作成するスクリプト


kaibun(){

	if [ "" = "$1" ] ; then
		printf "エラー！\n"
		exit 2
	fi

	#printf "あaいbうcえdお123;@\-"
	printf "$1"                |
	sed 's/\(.\)/\1\n/g'       |
	cat -n | sort -r           |
	cut -f2                    |
	tr -d '\n'

}


#kaibun 'あaいbうcえdお123;@\-'











