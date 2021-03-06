## makrj.shがあまりにもよかったのでスクリプトを作りました。

JSONPath-value形式のデータを操作する時の負担を減らす目的のスクリプトを作ってみました。

### jsonPath_tab.sh
[https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_tab.sh](https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_tab.sh)

キー部とデータ部の間の区切り文字をタブにするスクリプト。


demo
- $ cat ../DATA/data1.txt | sh jsonPath_tab.sh


before

~~~~
$.会員名 文具 太郎
$.会員名 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入 文字文字
$.購入 あいうえお
~~~~

after

~~~~
$.会員名	文具 太郎
$.会員名	山田 太郎
$.購入品[0]	はさみ
$.購入品[1]	ノート(A4,無地)
$.購入品[2]	シャープペンシル
$.購入品[3].取寄商品	替え芯
$.購入品[4]	クリアファイル
$.購入品[4]	のり
$.購入品[5].取寄商品	6穴パンチ
$.購入	文字文字
$.購入	あいうえお
~~~~


### jsonPath_sort.sh

[https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_sort.sh](https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_sort.sh)


キー列のソートをするスクリプト。  
通常のsortだと[]内の数字を辞書的なソートをするので新しくつくりました。


demo
- $ cat ../DATA/data1.txt | sh jsonPath_sort.sh

before


~~~~
$.会員名 文具 太郎
$.会員名 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入 文字文字
$.購入 あいうえお
~~~~

after

~~~~
$.会員名 山田 太郎
$.会員名 文具 太郎
$.購入 あいうえお
$.購入 文字文字
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] のり
$.購入品[4] クリアファイル
$.購入品[5].取寄商品 6穴パンチ
~~~~

### jsonPath_bracket.sh

[https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_bracket.sh](https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_bracket.sh)


キー列の重複があるときブラケット"[]"を付加するスクリプト。  
ブラケットの扱いにまだまだ改良の余地ありです。  
取りこぼしもあって中途半端なつくりになってしまった。



demo
- $ cat ../DATA/data1.txt | sh jsonPath_bracket.sh


before

~~~~
$.会員名 文具 太郎
$.会員名 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入 文字文字
$.購入 あいうえお
~~~~

after

~~~~
$.会員名[1] 文具 太郎
$.会員名[2] 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入[1] 文字文字
$.購入[2] あいうえお
~~~~



### jsonPath_update.sh

[https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_update.sh](https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_update.sh)


トランザクションから来たキー部を元に比較してデータ部を置き換える、SQLのUPDATEのような動きをするスクリプト。  
パイプまたは第一引数はmasterのデータを、第二引数はtranのデータを渡してください。


demo
- $ cat ../DATA/data1.txt | sh jsonPath_update.sh ../DATA/data2.txt
- $ sh jsonPath_update.sh ../DATA/data1.txt ../DATA/data2.txt


before

~~~~
master
$.会員名 文具 太郎
$.会員名 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入 文字文字
$.購入 あいうえお

tran
$.購入品[3].取寄商品 置き換え2
$.購入品[5].取寄商品 置き換え3
$.ダミーデータ ダミー1
$.購入品[0] 置き換え1
~~~~

after

~~~~
$.会員名 山田 太郎
$.会員名 文具 太郎
$.購入 あいうえお
$.購入 文字文字
$.購入品[0] 置き換え1
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 置き換え2
$.購入品[4] のり
$.購入品[4] クリアファイル
$.購入品[5].取寄商品 置き換え3
~~~~


### jsonPath_checkupdate.sh

[https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_checkupdate.sh](https://github.com/div-jp/code/blob/master/jsonPath/jsonPath_checkupdate.sh)



UPDATEされない行を表示するスクリプト。


demo
- $ cat ../DATA/data1.txt | sh jsonPath_checkupdate.sh ../DATA/data2.txt
- $ sh jsonPath_checkupdate.sh ../DATA/data1.txt ../DATA/data2.txt



before

~~~~
master
$.会員名 文具 太郎
$.会員名 山田 太郎
$.購入品[0] はさみ
$.購入品[1] ノート(A4,無地)
$.購入品[2] シャープペンシル
$.購入品[3].取寄商品 替え芯
$.購入品[4] クリアファイル
$.購入品[4] のり
$.購入品[5].取寄商品 6穴パンチ
$.購入 文字文字
$.購入 あいうえお

tran
$.購入品[3].取寄商品 置き換え2
$.購入品[5].取寄商品 置き換え3
$.ダミーデータ ダミー1
$.購入品[0] 置き換え1
~~~~

after

~~~~
$.ダミーデータ ダミー1
がUPDATEされません。
~~~~






