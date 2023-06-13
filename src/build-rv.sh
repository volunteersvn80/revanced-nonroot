#!/bin/bash
# Revanced build
source ./src/tools.sh

release=$(curl -sL "https://api.github.com/repos/revanced/revanced-patches/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name | test("revanced-patches.*\\.jar$")) | .browser_download_url')
curl -sLO "$asset"

ls revanced-patches*.jar >> new.txt
rm -f revanced-patches*.jar

release=$(curl -s "https://api.github.com/repos/$GITHUB_REPOSITORY/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name == "revanced-version.txt") | .browser_download_url')
curl -sLO "$asset"

if diff -q revanced-version.txt new.txt >/dev/null ; then
rm -f ./*.txt
printf "\033[0;31mOld patch!!! Not build\033[0m\n"
exit 0
else
printf "\033[0;32mBuild...\033[0m\n"
rm -f ./*.txt

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

ls revanced-patches*.jar >> revanced-version.txt
for file in ./*.jar ./*.apk ./*.json
   do rm -f "$file"
done
fi
