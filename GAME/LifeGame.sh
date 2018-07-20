#! /bin/sh


awk 'BEGIN {

	x = 80; #横幅
	y = 30; #縦幅
	i;
	j;
	h;
	generation =1000; #何世代回すか

	tbl1[y][x];
	tbl2[y][x];

	#.を埋める初期化
	for ( i = 0; i < y; i++ ) {
		for ( j = 0; j < x; j++ ) {
			tbl1[i][j] = ".";
		}
	}

	#セル　グライダー
	tbl1[13][11] = "*";
	tbl1[11][12] = "*";
	tbl1[13][12] = "*";
	tbl1[12][13] = "*";
	tbl1[13][13] = "*";

	#セル パルサー
	tbl1[15][30] = "*";
	tbl1[15][31] = "*";
	tbl1[15][32] = "*";
	tbl1[15][33] = "*";
	tbl1[15][34] = "*";
	tbl1[14][30] = "*";
	tbl1[14][34] = "*";


	#メインループ
	for ( h = 0; h < generation; h++ ) {
		system("clear");
		disp(tbl1,x,y);
		judg(tbl1,tbl2,x,y);

		#テーブルコピー
		for ( i = 0; i < y; i++ ) {
			for ( j = 0; j < x; j++ ) {
				tbl1[i][j] = tbl2[i][j];
			}
		}
	}
}


function disp(dis,x,y){
	for ( i = 0; i < y; i++ ) {
		for ( j = 0; j < x; j++ ) {
			printf("%s", dis[i][j]);
		}
		printf("\n");
	}
}

function judg(jud1,jud2,x,y){

	for ( i = 0; i < y; i++ ) {
		for ( j = 0; j < x; j++ ) {

			count = 0;
			jud2[i][j] = jud1[i][j];

			if ( "*" == jud1[i][j]) {
				if ( "*" == jud1[i - 1][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i - 1][j] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i - 1][j + 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i][j + 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j + 1] ) {
					count = count + 1;
				}

				#生死判定
				if ( 1 >= count ) {
					jud2[i][j] = ".";
				}
				if ( 4 <= count ) {
					jud2[i][j] = ".";
				}
			}

			if ( "." == jud1[i][j]) {

				if ( "*" == jud1[i - 1][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j - 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i - 1][j] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i - 1][j + 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i][j + 1] ) {
					count = count + 1;
				}
				if ( "*" == jud1[i + 1][j + 1] ) {
					count = count + 1;
				}
				#生死判定
				if ( 3 == count ) {
					jud2[i][j] = "*";
				}
			}
		}
	}
}'

















