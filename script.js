const releasesList = document.getElementById('releases-list');

// Fetch releases from GitHub API
fetch('https://api.github.com/repos/luxysiv/revanced-nonroot/releases')
    .then(response => response.json())
    .then(releases => {
        releases.forEach(release => {
            const listItem = document.createElement('li');
            const releaseLink = document.createElement('a');
            releaseLink.href = release.html_url;
            releaseLink.textContent = release.tag_name;
            listItem.appendChild(releaseLink);
            listItem.style.color = ‘blue’; 
            releasesList.appendChild(listItem);
        });
    });
