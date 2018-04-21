#! bin/sh



random1()
{
	#乱数を作る関数
	#引数無しの場合はサイコロ
	#種を作る動作が遅い

	local RandomMin=1
	local RandomMax=6

	if [ "" != "$1" ] ; then
		RandomMin="$1"
	fi
	if [ "" != "$2" ] ; then
		RandomMax="$2"
	fi

	awk -v RandomMax=${RandomMax} -v RandomMin=${RandomMin} 'BEGIN{ srand(); print int( RandomMax * rand()) + RandomMin }'
}



random2()
{
	#乱数を作る関数
	#引数無しの場合はサイコロ

	local RandomMin=1
	local RandomMax=6

	if [ "" != "$1" ] ; then
		RandomMin="$1"
	fi
	if [ "" != "$2" ] ; then
		RandomMax="$2"
	fi

	od -DA n /dev/urandom          |
	head -n 1                      |
	tr -Cd '0-9'                   |
	cut -c -5                      |
	awk -v RandomMax=${RandomMax} -v RandomMin=${RandomMin} '{
		RandomMax = RandomMax - RandomMin + 1;
		print int($1 % RandomMax) + RandomMin
	}'

}


#for i in $(seq 1 300)
#do
#	random2
#done                 |
#sort | uniq -dc










