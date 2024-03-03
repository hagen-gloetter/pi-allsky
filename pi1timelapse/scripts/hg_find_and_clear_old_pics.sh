#! /bin/bash

function mytest {
  "$@"
  local status=$?
  if [ $status -ne 0 ]; then
      echo "error with $1" >&2
  else
      echo "Alles OK $1" >&2  
  fi
  return $status
}
function myREMOVE {
  "$@"
  local status=$?
  if [ $status -ne 0 ]; then
      echo "error with $1" >&2
  else
      echo "Alles OK $1" >&2
      rm -rvf /srv/zeitraffer/
  fi
  return $status
}


mytest rsync -ave ssh /srv/zeitraffer/  sternwarte@192.168.4.1:/lager2/WebCams/timelapse/
mytest find /srv/zeitraffer/  -mindepth 1 -mtime +1 -delete
mytest find /srv/zeitraffer/  -mindepth 1 -mtime +0 -delete
myREMOVE rsync -ave ssh /srv/zeitraffer/  sternwarte@192.168.4.1:/lager2/WebCams/timelapse/

