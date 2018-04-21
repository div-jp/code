#! /bin/sh


MyDu()
{
	#ディレクトリから「容量・パス・ファイル名」をリスト表示する関数
	#duコマンドが少し物足りなかったので作成した

	local DirPath='/mnt/c/'

	#引数判定
	if [ -t 0 ] ; then
		DirPath=$1
	fi

	find ${DirPath} -type f | xargs -I{} du -mh {}    |

	#パス最後のファイル名を抜き出しするための処理
	awk 'BEGIN {FS="/";OFS="/";}
	{
		FileName = $NF;
		$NF = "";
		print $0"\t"FileName
	}' #>hoge.csv

}


#MyDu .







