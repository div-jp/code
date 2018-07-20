#! /bin/sh


MyCreateMoveList()
{

	#キーワードを与え、そのキーワードと同じフォルダへの
	#mvコマンドを作成するスクリプト

	local FileName='test'

	#引数判定
	if [ -t 0 ] ; then
		FileName=$1
	fi

	find . -maxdepth 1 -type f -name "*${FileName}*"    |

	awk -v FileName=${FileName} '{

		print "mv -b \047"$0"\047 \047./"FileName"\047"

	}'
}


#MyCreateMoveList














