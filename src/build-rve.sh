#!/bin/bash
# Revanced Extended build
source ./src/tools.sh

# Check patch
check_new_patch "inotia00" "revanced-extended"

#Download Revanced Extended patches 
dl_gh "inotia00" "revanced-patches revanced-cli revanced-integrations" "latest"

# Patch YouTube Extended
get_patches_key "youtube-revanced-extended"
get_ver "youtube-rve"
get_apkmirror "youtube"
#get_uptodown "youtube"
patch "youtube" "youtube-revanced-extended" 

# Patch YouTube Music Extended 
get_patches_key "youtube-music-revanced-extended"
version="6.04.53"
#get_apkmirror "youtube-music" "arm64-v8a"
get_uptodown "youtube-music" 
patch "youtube-music" "youtube-music-revanced-extended"

# Patch microG
get_patches_key "mMicroG"
dl_gh "inotia00" "mMicroG" "latest"
patch "microg" "mMicroG"

# Finish patch
finish_patch "revanced-extended"
