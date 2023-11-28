#!/bin/bash

# THIS SCRIPT IS OBSOLETE!
# I had copied it from my earlier setup that didn't use Ansible.
# It will have to be translated to a playbook.

set -o nounset
set -o errexit

# Copy data from backup.
# First argument should point to directory with my data.

RED="\e[31m"; GREEN="\e[32m"; RESET="\e[0m"

copy_data() {
    SRC="$1"
    DEST="$2"

    echo -e "\nTransferring personal data from $SRC to $DEST..."

    PATHS_TO_COPY=(
        "janek"
        "media"
        "src"
        "zasoby"
        ".fonts"
        ".mozilla"
        ".ssh"
        ".bash_history"
        ".config/dotfiles-git-dir"
        ".config/monitors.xml"
        #".kde/share/apps/kate"
        #".kde/share/config/katerc"
        ".vagrant.d"
        #.chrome
        #virtualbox vms
    )

    SRC_PARTITION=$(df -P "$SRC" | tail -1 | cut -d' ' -f1)
    DEST_PARTITION=$(df -P "$DEST" | tail -1 | cut -d' ' -f1)

    if [ $SRC_PARTITION = $DEST_PARTITION ]; then
        command="mv"
        verb="Moving"
    else
        command="cp --recursive"
        verb="Copying"
    fi

    for path in ${PATHS_TO_COPY[*]}; do
        if [ -e "$SRC"/"$path" ]; then
            if [ -e "$DEST"/"$path" ]; then
                echo -e ${RED}"$DEST"/"$path" already exists, renaming...${RESET}
                echo "$path" >> ~/conflicting-paths.txt
                mv "./$path" "./$path.old" --backup=numbered
            fi
            echo -n $verb "$path"...
            mkdir --parents "$DEST"/$(dirname "$path")/
            $command "$SRC"/"$path" "$DEST"/$(dirname "$path")/
            echo -e ${GREEN} done.${RESET}
        fi
        sleep 0.1
    done

    mkdir --parents "$DEST"/media
    echo -e "${GREEN}Data transferred.\n${RESET}"
    sleep 3
}

copy_data "$1" "$HOME"
