#!/bin/bash
# Revanced build
source ./src/tools.sh

# Check patch
check_new_patch "revanced" "revanced"

#Download Revanced patches
dl_gh "revanced" "revanced-patches revanced-cli revanced-integrations" "latest"

# Use v$version to take apk with version
# Example: patch "reddit" "reddit-revanced-v$version"

# Twitter
get_patches_key "twitter"
get_ver "twitter"
get_apkmirror "twitter"
patch "twitter" "twitter-revanced-v$version"

# Reddit
get_patches_key "reddit"
get_apkmirror "reddit"
#get_uptodown "reddit"
patch "reddit" "reddit-revanced-v$version"

# Messenger
get_patches_key "messenger"
#get_apkmirror "messenger" "arm64-v8a"
get_uptodown "messenger"
patch "messenger" "messenger-revanced-v$version"

# Patch Twitch 
get_patches_key "twitch"
get_ver "twitch"
get_apkmirror "twitch"
#get_uptodown "twitch"
patch "twitch" "twitch-revanced-v$version"

# Patch Tiktok Asia or Global. Keyword patch is the same get Apk
get_patches_key "tiktok"
get_apkmirror "tiktok"
#get_uptodown "tiktok-asia"
#get_uptodown "tiktok-global
patch "tiktok" "tiktok-revanced-v$version"

# Patch YouTube 
get_patches_key "youtube-revanced"
get_ver "youtube-rv"
get_apkmirror "youtube"
#get_uptodown "youtube"
patch "youtube" "youtube-revanced-v$version"

# Patch YouTube Music 
get_patches_key "youtube-music-revanced"
#get_apkmirror "youtube-music" "arm64-v8a"
get_uptodown "youtube-music"
patch "youtube-music" "youtube-music-revanced-v$version"

# Finish patch
finish_patch "revanced"

# Split APK
#dl_gh "inotia00" "revanced-cli" "latest"
#dl_gh "revanced" "revanced-patches" "latest"
#split_apk "youtube-revanced"
