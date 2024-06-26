if ($null -eq ${env:GIT_PRIVATE_TOKEN}) {
    Write-Host "GIT_PRIVATE_TOKEN unset skipping"
}
else {
    Write-Host "GIT_PRIVATE_TOKEN is set configuring git credentials"
    echo $env:GIT_PRIVATE_TOKEN > ~/.git-credentials
    cat ~/.git-credentials
    git config --global credential.helper "store --file ~/.git-credentials"
    git config --global user.email $env:GIT_USER_EMAIL
    git config --global user.name $env:GIT_USER_NAME
}

Write-Host "---------- git config --list -------------"
git config --list

Write-Host "---------- git config --list --show-origin -------------"
git config --list --show-origin
