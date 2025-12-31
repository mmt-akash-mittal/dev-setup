# Windows Development Environment Setup Using Scoop (PowerShell Script)

## Description
This PowerShell script sets up a complete development environment on Windows using **Scoop**. It adds required Scoop buckets and installs commonly used development tools such as Git, Java (OpenJDK 21), Maven, Node.js (LTS), NVM, IntelliJ IDEA Ultimate, Google Cloud SDK, Yarn, and MongoDB database tools, while safely skipping tools that are already installed.

## Features
- Adds required Scoop buckets (`versions`, `extras`, `main`, `java`)
- Installs Git if not already present
- Installs OpenJDK 21 for Java development
- Installs Maven for Java project builds
- Installs Node.js LTS and Node Version Manager (NVM)
- Installs IntelliJ IDEA Ultimate (trial)
- Installs Google Cloud SDK (gcloud)
- Installs Yarn package manager
- Installs MongoDB database tools
- Skips installations gracefully if tools are already installed

## Prerequisites
- Windows OS
- PowerShell 5.1 or later
- Scoop installed (installation commands are included as comments)
- Internet connection
- Permission to install user-level tools

## How to Use
1. Open **Notepad** or any text editor.
2. Copy the script from the **Full Script** section below.
3. Save the file with a `.ps1` extension, for example: `setup-dev-environment.ps1`
4. Open **PowerShell** as your normal user.
5. (Optional, if required) Allow script execution for the current user:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
6. Navigate to the directory where the script is saved.
7. Run the script:
   ```powershell
   .\setup-dev-environment.ps1
   ```
8. The script will install missing tools and skip those already installed.

## Full Script
```powershell
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

# ----------- and it goes on

```
The complete script is available in the bin folder

## Notes / Warnings
- The script installs tools at the **user level** via Scoop, not system-wide.
- IntelliJ IDEA Ultimate is installed as a **trial** version.
- Docker and Terraform are referenced but **not installed** by this script.
- Ensure Scoop buckets are reachable and not already added to avoid warnings.
