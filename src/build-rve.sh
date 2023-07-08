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
patch "youtube" "youtube-revanced-extended-v$version" 

# Patch YouTube Music Extended 
get_patches_key "youtube-music-revanced-extended"
#get_apkmirror "youtube-music" "arm64-v8a"
get_uptodown "youtube-music" 
patch "youtube-music" "youtube-music-revanced-extended-v$version"

#Reddit
get_patches_key "reddit"
get_ver "reddit-revanced-extended"
get_apkmirror "reddit"
#get_uptodown "reddit"
patch "reddit" "reddit-revanced-extended-v$version"

# Patch microG
get_patches_key "mMicroG"
dl_gh "inotia00" "mMicroG" "latest"
patch "microg" "mMicroG"

# Finish patch
finish_patch "revanced-extended"

# Split APK
#dl_gh "inotia00" "revanced-patches revanced-cli" "latest"
#split_apk "youtube-revanced-extended"
