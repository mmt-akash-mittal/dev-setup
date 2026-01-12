
<#
===================================================================================
Purpose:
    Idempotent developer workstation setup using Scoop on Windows.
    Each install is guarded with a check so you can re-run safely without duplicates.

Prereqs:
    - Windows PowerShell (Run as Current User)
    - Internet connectivity
    - Scoop should be installed (see bootstrap below if not)

Notes:
    - We use Scoop buckets to access broader app manifests (main/extras/versions/java).
    - For each tool, we check presence via `scoop list | Select-String` against
      the manifest name (as it appears in Scoop) before installing.
    - This script is intentionally verbose to explain *what* and *why*.
===================================================================================
#>

# ----------------------------------------
# Bootstrap: Ensure Scoop is installed
# ----------------------------------------
# If Scoop is not installed, uncomment the two lines below and run them once.
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser    # Allows running local scripts
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression  # Installs Scoop

# ----------------------------------------
# Configure Scoop buckets (repositories of app manifests)
# - 'main'     : Core packages maintained by Scoop
# - 'extras'   : Popular desktop apps and utilities
# - 'versions' : Alternate/older/newer versions of packages
# - 'java'     : Java distributions and related tooling
# ----------------------------------------
scoop bucket add versions
scoop bucket add extras
scoop bucket add main
scoop bucket add java

# ----------------------------------------
# Install Git
# Why: Git is the de-facto VCS; required by many build tools and IDE integrations.
# Check: Look for an exact match to the 'git' manifest in the installed list.
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^git$")) {
    scoop install git
} else {
    Write-Host "Git is already installed. Skipping installation."
}

# ----------------------------------------
# Install Java 21 (OpenJDK 21)
# Why: Modern Java LTS for server-side apps and tooling (Maven/Gradle).
# Check: We verify 'openjdk21' specifically (that's the Scoop manifest name).
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^openjdk21$")) {
    scoop install openjdk21
} else {
    Write-Host "OpenJDK 21 is already installed. Skipping installation."
}

# ----------------------------------------
# Install Maven
# Why: Java build and dependency management; often used in CI/CD pipelines.
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^maven$")) {
    scoop install maven
} else {
    Write-Host "Maven is already installed. Skipping installation."
}

# ----------------------------------------
# Install Node.js (LTS)
# Why: Stable Node runtime for front-end tooling, CLIs, and services.
# Note: We guard against a typo by checking 'nodejs-lts' (correct manifest name).
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^nodejs-lts$")) {
    scoop install nodejs-lts
    # Alternatives:
    # scoop install nodejs                 # Latest current release
    # scoop install nodejs --version "22.20.0"  # Specific version
} else {
    Write-Host "Node.js LTS is already installed. Skipping installation."
}

# ----------------------------------------
# Install Node Version Manager (NVM)
# Why: Switch between multiple Node versions per project needs.
# Tip: After install, `nvm list`, `nvm install <ver>`, `nvm use <ver>`.
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^nvm$")) {
    scoop install nvm
} else {
    Write-Host "Node Version Manager (NVM) is already installed. Skipping installation."
}

# ----------------------------------------
# Install IntelliJ IDEA Ultimate (Trial)
# Why: Full-featured Java/Kotlin IDE with rich enterprise plugins.
# Check: Manifest name is 'idea-ultimate'.
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^idea-ultimate$")) {
    scoop install idea-ultimate
} else {
    Write-Host "IntelliJ IDEA Ultimate is already installed. Skipping installation."
}

# ----------------------------------------
# Install Google Cloud SDK (gcloud)
# Why: CLI to manage GCP resources, auth, and deployments.
# ----------------------------------------
if (-not (scoop list | Select-String -Pattern "^gcloud$")) {
    scoop install gcloud
} else {
    Write-Host "Google Cloud SDK is already installed. Skipping installation."
}

# ----------------------------------------
# Additional developer tools (each guarded for idempotency)
# ----------------------------------------

# Yarn: Alternative Node package manager focused on speed and determinism
if (-not (scoop list | Select-String -Pattern "^yarn$")) {
    scoop install yarn
} else {
    Write-Host "Yarn is already installed. Skipping installation."
}

# MongoDB Database Tools: Dump/restore, import/export, and other admin tools
if (-not (scoop list | Select-String -Pattern "^mongodb-database-tools$")) {
    scoop install mongodb-database-tools
} else {
    Write-Host "MongoDB Database Tools are already installed. Skipping installation."
}

# mongosh: Modern MongoDB shell for interactive operations
if (-not (scoop list | Select-String -Pattern "^mongosh$")) {
    scoop install mongosh
} else {
    Write-Host "mongosh is already installed. Skipping installation."
}

# Postman: API exploration, testing, and collaboration
if (-not (scoop list | Select-String -Pattern "^postman$")) {
    scoop install postman
} else {
    Write-Host "Postman is already installed. Skipping installation."
}

# JMeter: Load testing and performance benchmarking for web/services
if (-not (scoop list | Select-String -Pattern "^jmeter$")) {
    scoop install jmeter
} else {
    Write-Host "JMeter is already installed. Skipping installation."
}

# Insomnia: REST/GraphQL client for API debugging
if (-not (scoop list | Select-String -Pattern "^insomnia$")) {
    scoop install insomnia
} else {
    Write-Host "Insomnia is already installed. Skipping installation."
}

scoop install gh

scoop install filezilla

scoop install cloudflared
# ----------------------------------------
# Insomnia dotenv plugin (manual step)
# Why: Allows loading environment variables from .env files in Insomnia.
# How: Run the following in Insomnia's plugins directory (managed by the app):
# ----------------------------------------
# npm install insomnia-plugin-dotenv

# ----------------------------------------
# Optional: Helper function to keep things DRY (not used above, but handy)
# Usage: Ensure-ScoopPackage -Name "git"
# ----------------------------------------
function Ensure-ScoopPackage {
    param([Parameter(Mandatory=$true)][string]$Name)
    if (-not (scoop list | Select-String -Pattern "^$Name$")) {
        Write-Host "Installing $Name ..."
        scoop install $Name
    } else {
        Write-Host "$Name is already installed. Skipping installation."
    }
}
