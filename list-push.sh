#!/bin/sh	
for dir in $(ls -d */)	
do	
  cd $dir	
  echo "into $dir"	
  if [ -d ".git" ]; then	
 git add . ;git commit -m "normal";git push	
  elif [ -d ".svn" ]; then	
     svn update	
  fi	
  cd ..	
done	
