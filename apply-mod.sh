#!/bin/bash

# This certificate check is used so that no one accidentily runs this script when building this repo from source.
# This script was made for my use only

apply_mod_certificate=$(cat ../personal/apply-mod-certificate 2>/dev/null | head -n 1)

if [ "$apply_mod_certificate" != "alvin21bon" ]
then
    rm -rf release/my-mod #just in case :/
    exit 0
fi


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


echo "=================================================================="
echo "APPLYING MOD TO: $target_mod_dir"
echo "=================================================================="

#********************************************************************************
#   1)  COMPLETELY WIPE THE TARGET MOD DIRECTORY
#********************************************************************************
echo "Wiping the target mod directory..."
rm -rf $target_mod_dir
mkdir $target_mod_dir


#********************************************************************************
#   2)  COPY THE BINARIES INTO THE TARGET GAME AND MOD FOLDER
#********************************************************************************
echo "Copying the binaries..."
rm -rf release/my-mod #done so successive make calls do not create duplicate my-mod folders
mv -f release/baseq2 release/my-mod #rename baseq2 to make moving binaries easier
cp -rf "$mod_binaries_dir"/* "$target_mod_dir"/..


#********************************************************************************
#   3)  COPY THE MOD FILES INTO THE TAGRET MOD
#********************************************************************************
#TODO: INSTALL PAKCOMPRESS INTO THE WINDOWS BUILD ENV
echo "Compressing mod files and transferring them into the mod..."
touch "$mod_files_dir"/dummy
case $OSTYPE in
    [Ll]inux)
        pakcompress $mod_files_dir "$target_mod_dir"/MOD_FILES.pak
        ;;
    [Ww]indows)
        echo "Currently can not use pakcompress script on Windows."
        exit 0
        ;;
    *)
        echo "INVALID OS TYPE. CAN NOT DETECT EITHER *WINDOWS* OR *LINUX*"
        exit 1
        ;;
esac


echo "=================================================================="
echo "MOD BUILD COMPLETE"
echo "=================================================================="