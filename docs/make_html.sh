#! /bin/sh

cat << "EOS" > ./temp.html
<!DOCTYPE html>
<html lang="ja">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="mystyle.css">
</head>
<body>
EOS

pandoc +RTS -V0 -RTS index.md -f markdown_phpextra -t html5 >>./temp.html

cat << "EOS" >> ./temp.html

</body>
</html>
EOS














