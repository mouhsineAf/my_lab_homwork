#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 <directory> <encrypt|decrypt>"
  exit 1
fi

DIR=$1
MODE=$2

if [ ! -d "$DIR" ]; then
  echo "Error: Directory $DIR does not exist."
  exit 1
fi

case $MODE in
  encrypt)
    for file in "$DIR"/*; do
      if [ -f "$file" ]; then
        gpg --output "${file}.gpg" --symmetric "$file"
        echo "Encrypted $file"
      fi
    done
    ;;
  decrypt)
    for file in "$DIR"/*.gpg; do
      if [ -f "$file" ]; then
        gpg --output "${file%.gpg}" --decrypt "$file"
        echo "Decrypted $file"
      fi
    done
    ;;
  *)
    echo "Error: Invalid mode. Use 'encrypt' or 'decrypt'."
    exit 1
    ;;
esac

