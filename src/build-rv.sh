#!/bin/bash
# Revanced build
source ./src/tools.sh

# Check patch
check_new_patch "revanced" "revanced"

#Download Revanced patches
dl_gh "revanced" "revanced-patches revanced-cli revanced-integrations" "latest"

# Reddit
get_patches_key "reddit"
get_apkmirror "reddit"
#get_uptodown "reddit"
patch "reddit" "reddit-revanced"

# Messenger
get_patches_key "messenger"
#get_apkmirror "messenger" "arm64-v8a"
get_uptodown "messenger"
patch "messenger" "messenger-revanced"

# Patch Twitch 
get_patches_key "twitch"
get_ver "twitch"
get_apkmirror "twitch"
#get_uptodown "twitch"
patch "twitch" "twitch-revanced"

# Patch Tiktok Asia or Global. Keyword patch is the same get Apk
get_patches_key "tiktok"
#get_apkmirror "tiktok"
get_uptodown "tiktok-asia"
#get_uptodown "tiktok-global
patch "tiktok-asia" "tiktok-asia-revanced"

# Patch YouTube 
get_patches_key "youtube-revanced"
get_ver "youtube-rv"
get_apkmirror "youtube"
#get_uptodown "youtube"
patch "youtube" "youtube-revanced"

# Patch YouTube Music 
get_patches_key "youtube-music-revanced"
get_ver "youtube-music-rv"
get_apkmirror "youtube-music" "arm64-v8a"
#get_uptodown "youtube-music"
patch "youtube-music" "youtube-music-revanced"

# Finish patch
finish_patch "revanced"

# Split APK
dl_gh "j-hc" "revanced-cli" "latest"
dl_gh "revanced" "revanced-patches" "latest"
split_apk "youtube-revanced"
