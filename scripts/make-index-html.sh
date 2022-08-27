#!/bin/bash

function generate_html_index() {
  INDEX_FILE=$1/index.md
  CONTENT='---\n---\n\n'
  CONTENT+='# [releases](/releases/) / '

  PSTRING=""
  parent=$(dirname "$1")
  until [[ $1 == *releases || $parent == *releases ]]; do
     PSTRING='['`basename $parent`'](/releases/'${parent#/*releases/}'/) / '${PSTRING}''
     parent=$(dirname "$parent")
  done

  CONTENT+=${PSTRING}
  [[ $1 != *releases ]] && CONTENT+=''`basename $1`'\n'

  CONTENT+='\n\n'
  CONTENT+='| Name  | Size  | Date  |\n'
  CONTENT+='|:---|---:|---|\n'
  [[ $1 != *releases ]] && CONTENT+='| 📁 [..](../) | | |\n'
  for filepath in `find "$1" -maxdepth 1 -mindepth 1  -type d \( ! -iname ".*" \) | sort`; do
    base_path=`basename "$filepath"`
    CONTENT+='| 📁 ['$base_path']('$base_path') | | |\n'
  done

  for i in `find "$1" -mindepth 1 -maxdepth 1 \
      -type f \( ! -iname ".*" ! -iname "index.md" \) | sort`; do

      file=`basename "$i"`
      file_size=`du -h "$i" | cut -f1`
      file_modify_time=`git log -1 --format=%ci -- $i`

      CONTENT+='| 🗄️ ['$file'](./'$file') | '$file_size' | '$file_modify_time' |\n'
  done

  echo -e $CONTENT > $INDEX_FILE
  echo $INDEX_FILE
}

find $1 -type f -name 'index.md' -delete
find $1 -type f -name 'index.html' -delete

for directory in `find "$1"  -type d| sort`; do
  echo $directory
  generate_html_index $directory
done
