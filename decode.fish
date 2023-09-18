#!/usr/bin/fish

function decode_base64 
    while true;
        set last_id (find . -name 'result-*' | sort -d | awk 'BEGIN { FS="-" } { print $2 }' | tail -n 1)
        set next_id (math $last_id + 1)
        set last_file "result-$last_id"
        set next_file "result-$next_id"

        echo "--------- $last_id -------------"
        cat $last_file | head -n 5;
        echo
        cat $last_file | tail -n 5;
        echo

        while true;
            read -lP "Ok? [Y/n]: " reply

            switch $reply;
                case '' Y y
                    break;
                case N n
                    return;
            end
        end

        cat $last_file | sed -e 's/^.*base64 -d/base64 -id/' | sed -e 's/)" bash "$@"//' | bash > $next_file
    end
end

function initial_print
    sed -e 's/eval/echo -ne/' | bash > result-1
end

switch $1;
    case '' help --help -h
        set filename (status --current-filename)
        echo "Usage: "
        echo "$filename init    # initial decode"
        echo "$filename base64  # decode the rest of them"
        echo
        exit

    case init
        initial_print;
        exit

    case base64
        decode_base64;
        exit
end

