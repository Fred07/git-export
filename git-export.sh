#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ];then
    #echo "No  argument supplied!"
    echo "MISSING PARAMETER: git-export [commit ID1] [command ID2] [export path]"
    exit 1
fi

e="export"
t="/tmp"

if [ -n "$3" ];then
    t="$3"
fi

for i in `git diff-tree --no-commit-id --name-only -r "$1" "$2"`
    do d=`dirname "$i"`
    f=`basename "$i"`
    echo "$d/$f"
    mkdir -p "$t/$e/$d"
    cp "$d/$f" "$t/$e/$d/$f"
    done

find "$t/$e/" -name '.DS_Store' -delete
