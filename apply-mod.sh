#!/bin/bash

#   1)  COMPLETELY WIPE THE TARGET GAME DIRECTORY
#   2)  COPY THE BASEFILES INTO THE TARGET GAME
#   3)  COPY THE BINARIES INTO THE TARGET GAME
#   4)  COPY THE MOD FILES INTO THE TAGRET GAME (WIPING BASE FILES/FOLDERS IF NECESSARY)
#           (NO WARNING IF FILE/FOLDER DOES NOT EXIST)


target_game_dir="../game-linux"
basefiles_dir="../game-basefiles"
mod_binaries_dir="release"
mod_files_dir="mod-files"


#*****************************************************
#   1)  COMPLETELY WIPE THE TARGET GAME DIRECTORY
#*****************************************************
