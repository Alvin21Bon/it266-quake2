#!/bin/bash

#   1)  COMPLETELY WIPE THE TARGET MOD DIRECTORY
#   2)  COPY THE BINARIES INTO THE TARGET GAME AND MOD FOLDER
#   3)  COPY THE MOD FILES INTO THE TAGRET MOD

mod_binaries_dir="release"
mod_files_dir="mod-files"
OSTYPE=$1

case $OSTYPE in
    [Ll]inux)
        target_mod_dir="../game-linux/my-mod"
        ;;
    [Ww]indows)
        target_mod_dir="../game-windows/my-mod"
        ;;
    *)
        echo "INVALID OS TYPE. CAN NOT DETECT EITHER *WINDOWS* OR *LINUX*"
        exit 1
        ;;
esac


#TODO
#MAKE SURE THIS IS WINDOWS COMPATIBLE

