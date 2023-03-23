#!/usr/bin/env bash

find challenges -name challenge.yml -print0 | while IFS= read -r -d '' file
do
    if ! cat $file | grep -q "extra:"
    then

        cat >> $file <<EOF

extra:
    initial: 500
    decay: 100
    minimum: 50
EOF

    fi

    output="$(python3 -m ctfcli challenge install $file)"
    if [[ "$output" =~ "Already found existing challenge" ]]
    then
        python3 -m ctfcli challenge sync $file
    else
        echo $output
    fi
done
