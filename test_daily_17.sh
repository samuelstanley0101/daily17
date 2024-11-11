#!/usr/bin/bash

templates="daily_17_templates"
target="grader"

initialize_numbers() {
    if [[ $# == 0 || $@ =~ -*basic || $@ =~ -*normal ]]; then
        cp $templates/numbers1_template.txt numbers1.txt
        cp $templates/numbers2_template.txt numbers2.txt
    elif [[ $@ =~ -*1empty || $@ =~ -*singleempty ]]; then
        cp $templates/numbers1_template.txt numbers1.txt
        cp $templates/empty_template.txt numbers2.txt
    elif [[ $@ =~ -*empty || $@ =~ -*bothempty ]]; then
        cp $templates/empty_template.txt numbers1.txt
        cp $templates/empty_template.txt numbers2.txt
    else
        printf "Invalid parameter. These are the valid parameter options:\n"
        printf -- "-basic or -normal: Test with normal number values in numbers1.txt and numbers2.txt.\n"
        printf -- "-1empty or -singleempty: Test with normal number values in numbers1.txt and nothing in numbers2.txt.\n"
        printf -- "-empty or -bothempty: Test with numbers1.txt and numbers2.txt as empty files.\n"
        printf -- "-all: Test all of the above options in sequence.\n"
        printf -- "-clean: Remove numbers1.txt, numbers2.txt, and output.txt.\n".
        exit 1
    fi
}

if [[ $@ =~ -*clean ]]; then
    rm -f numbers1.txt numbers2.txt output.txt
elif [[ $@ =~ -*all ]]; then
    printf "NORMAL TEST:\n"
    ./test_daily_17.sh -normal
    printf "\n1EMPTY TEST:\n"
    ./test_daily_17.sh -1empty
    printf "\nBOTHEMPTY TEST:\n"
    ./test_daily_17.sh -bothempty
else
    initialize_numbers $@
    cp $templates/empty_template.txt output.txt
    make $target
    ./$target
    printf "NUMBERS1.TXT:\n"
    cat numbers1.txt
    printf "NUMBERS2.TXT:\n"
    cat numbers2.txt
    printf "OUTPUT.TXT:\n"
    cat output.txt
fi
