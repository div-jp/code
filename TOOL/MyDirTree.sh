#! /bin/sh

#http://blog.h13i32maru.jp/entry/20100710/1278733178
#から勝手にとったもの

MyDirTree()
{
  DirTree()
  {
    local dir=$1
    local indent="$2  "
    local head
    local next
    local list="$(find $dir -maxdepth 1 | sed 1d)"
    local num=$(echo "$list" | wc -w)
    local count=0
    local name

    for file in $list
    do
      count=$(( count + 1 ))
      if [ $count -eq $num ]
      then
        head="$indent└─"
        next="$indent   "
      else
        head="$indent├─"
        next="$indent│"
      fi

      name=$(basename $file)
      echo "$head $name"

      #これを書き直してみた
      #[ -d "$dir/$name" -a ! -L "$dir/$name" ] && DirTree $dir/$name "$next"
      if [ -d "$dir/$name" ]
      then
        if [ ! -L "$dir/$name" ]
        then
          #再帰
          DirTree $dir/$name "$next"
        fi
      fi

    done

  }

  top=$1
  echo $(basename $top)

  DirTree $top

}

#MyDirTree





