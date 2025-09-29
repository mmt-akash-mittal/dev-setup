# Ensure Scoop is installed
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add necessary buckets
scoop bucket add versions
scoop bucket add extras
scoop bucket add main
scoop bucket add java



# -------------------------------
# Install Git (if not installed)
# -------------------------------
if (-not (scoop list | Select-String -Pattern "^git$")) {
    scoop install git
} else {
    Write-Host "Git is already installed. Skipping installation."
}


# -------------------------------
# Install Java 21
# -------------------------------
if (-not (scoop list | Select-String -Pattern "^java$")) {
	scoop install openjdk21
} else {
    Write-Host "Java is already installed. Skipping installation."
}


# -------------------------------
# Install Maven 3.2.2
# -------------------------------
if (-not (scoop list | Select-String -Pattern "^maven$")) {
	scoop install maven
} else {
    Write-Host "Maven is already installed. Skipping installation."
}

# -------------------------------
# Install nodejs default the latest version, lts viz 22 currently or any specific versions
# -------------------------------

if (-not (scoop list | Select-String -Pattern "^nodels$")) {
	scoop install nodejs-lts
	# scoop install nodejs
	# scoop install nodejs --version="22.20.0"
} else {
    Write-Host "Node JS is already installed. Skipping installation."
}
# -------------------------------
# Install node version manager to able to switch between several version
# NVM Commands chear sheat - https://gist.github.com/chranderson/b0a02781c232f170db634b40c97ff455
# -------------------------------

if (-not (scoop list | Select-String -Pattern "^nvm$")) {
	scoop install nvm
} else {
    Write-Host "Node Version Manager (mvn) is already installed. Skipping installation."
}