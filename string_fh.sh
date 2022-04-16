#!/bin/bash

dir_path=$(realpath "$1");
tab_count=$2;
tab="  "

PURPLE='\033[1;35m'
NC='\033[0m' # No Color
echo -e "${PURPLE} $dir_path:${NC} "

# print all files
for file in "$dir_path"/*;
    do
    if [[ ! -d $file ]]; then
        for (( i=1; i<=$((tab_count)); i++ ))
            do
                printf "%s" "$tab"
            done
        echo "$file"
    fi
done

# next dir gets another tab
tab_count=$((tab_count+1));

# print next dirctory
for dir in "$dir_path"/*;
    do
    if [[ -d $dir ]]; then
        for (( i=1; i<=$((tab_count)); i++ )) do
            printf "%s" "$tab"
        done
        $"$0" "$dir" "$tab_count"
    fi
done

# It is just prettier with this.
echo ""

