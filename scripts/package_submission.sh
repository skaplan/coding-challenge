#!/bin/bash

source "$(dirname $BASH_SOURCE)/shared.sh"

username=$(cat "$ROOT/.username")
dir=$(submission_dir "$username")
file=$(tar_file $id)

if [ -f "$ROOT/.id" ]; then
  id=$(cat "$ROOT/.id")
else
  id=$(uuidgen)
  say "Your Submission ID is $id"
  echo $id > "$ROOT/.id"
fi

rm -f $file $file.enc
tar -zcf $file $dir
encrypt_file $file
