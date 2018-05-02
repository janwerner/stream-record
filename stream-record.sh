#!/usr/bin/env bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

docker run --rm -v /opt/stream-record/rec:/rec jrottenberg/ffmpeg:scratch \
  -y \
  -t $time \
  -i $url \
  /rec/$output
