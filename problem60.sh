#!/bin/bash

bad_words_file="$1"
dir="$2"

while read -r bad_word; do
    find $dir -type f -name "*.txt" -not -name "bad_words.txt" | while read -r file; do
        bad_word_length=$(echo -n $bad_word | wc -c)
        censored="\x2A"
        for ((i = 1; i < $bad_word_length; i++)); do
            censored="$censored"\*
        done
        sed -i "s/$bad_word/$censored/g" "$file"
    done
done < "$bad_words_file"
