#!/bin/sh
for dir in $(ls -d */)
do
  cd $dir
  echo "into $dir"
  for i in *.htm ;
  do echo "$i" && iconv -f GB18030 -t UTF-8 $i -o $i.html ;
  done
  cd ..
done
