# ----------------------------------------
# Ensure Scoop is installed
# ----------------------------------------
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# ----------------------------------------
# Add necessary Scoop buckets
# ----------------------------------------
scoop bucket add versions
scoop bucket add extras
scoop bucket add main
scoop bucket add java

# ----------------------------------------
# Install Git (if not installed)
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^git$")) {
    scoop install git
} else {
    Write-Host "Git is already installed. Skipping installation."
}

# ----------------------------------------
# Install Java 21 (OpenJDK)
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^java$")) {
    scoop install openjdk21
} else {
    Write-Host "Java is already installed. Skipping installation."
}

# ----------------------------------------
# Install Maven
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^maven$")) {
    scoop install maven
} else {
    Write-Host "Maven is already installed. Skipping installation."
}

# ----------------------------------------
# Install Node.js (LTS version)
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^nodels$")) {
    scoop install nodejs-lts
    # scoop install nodejs
    # scoop install nodejs --version="22.20.0"
} else {
    Write-Host "Node.js is already installed. Skipping installation."
}

# ----------------------------------------
# Install Node Version Manager (NVM)
# ----------------------------------------
# NVM Commands cheat sheet: https://gist.github.com/chranderson/b0a02781c232f170db634b40c97ff455
if (-not (scoop list | Select-String -Pattern "^nvm$")) {
    scoop install nvm
} else {
    Write-Host "Node Version Manager (NVM) is already installed. Skipping installation."
}

# ----------------------------------------
# Install IntelliJ IDEA Ultimate (Trial)
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^idea$")) {
    scoop install idea-ultimate
} else {
    Write-Host "IntelliJ IDEA is already installed. Skipping installation."
}

# ----------------------------------------
# Install Google Cloud SDK (gcloud)
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^gcloud$")) {
    scoop install gcloud
} else {
    Write-Host "Google Cloud SDK is already installed. Skipping installation."
}

# Cloud CTL -sudo access to the cloud - https://github.com/MediaMarktSaturn/cp-tool-cloudctl
# Installing Docker manually
# Terraform checckout what needs to be done



scoop install yarn
