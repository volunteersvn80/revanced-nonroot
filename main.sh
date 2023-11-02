#!/bin/bash
source utils.sh

repo1="$GITHUB_REPOSITORY"
repo2="revanced/revanced-patches"
time_threshold=24

current_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

response1=$(curl -s -o /dev/null -w "%{http_code}" "https://api.github.com/repos/$repo1/releases/latest")
if [[ $response1 -eq 404 ]]; then
    dl_gh
    get_version
    dl_yt $version youtube-v$version.apk
    patch_ytrv
else
    response2=$(curl -s -o /dev/null -w "%{http_code}" "https://api.github.com/repos/$repo2/releases/latest")
    if [[ $response2 -eq 200 ]]; then
        assets=$(curl -s "https://api.github.com/repos/$repo2/releases/latest" | jq -r '.assets')

        if [[ $assets ]]; then
            asset=$(echo "$assets" | jq -r '.[0]')
            published_at=$(echo "$asset" | jq -r '.updated_at')
            published_time=$(date -u -d "$published_at" +"%Y-%m-%dT%H:%M:%SZ")
            difference=$(( ($(date -u -d "$current_time" +"%s") - $(date -u -d "$published_time" +"%s")) / 3600 ))
            if [[ $difference -le $time_threshold ]]; then
                dl_gh
                get_version
                dl_yt $version youtube-v$version.apk
                patch_ytrv
            else
                echo "Skipping patch"
            fi
        else
            echo "Skipping patch"
        fi
    else
        echo "Skipping patch "
    fi
fi
