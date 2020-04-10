#!/usr/bin/env sh

curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0"\
-s https://www.iblocklist.com/lists.php \
  | sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
  | xargs wget -O - \
  | gunzip \
  | egrep -v '^#'\
  | gzip
