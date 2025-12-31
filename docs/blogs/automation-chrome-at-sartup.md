# Automate Google Chrome Startup with Multiple Profiles and Default Tabs (Windows Batch Script)

## Description
This Windows batch script force-closes any running Google Chrome instances, then launches Chrome using specific profile directories and opens a predefined set of URLs as startup tabs. It runs the process for two separate Chrome profiles, enabling a repeatable, one-command browser workspace setup.

## Features
- Force-closes any existing Chrome processes before launching (all profiles)
- Opens a predefined set of productivity URLs using **Profile 2**
- Opens a predefined set of work-related URLs using **Profile 5**
- Uses brief pauses (`timeout`) to help ensure Chrome processes exit cleanly before relaunching
- Launches each URL in its own `start` command using the specified profile directory

## Prerequisites
- Windows OS with Command Prompt (CMD) support
- Google Chrome installed at: `%ProgramFiles%\Google\Chrome\Application\chrome.exe`
- Existing Chrome profiles matching:
    - `Profile 2`
    - `Profile 5`
- Permissions to run `taskkill` (may require appropriate access depending on system policies)

## How to Use
1. Open **Notepad** (or any text editor).
2. Copy the script from the **Full Script** section below.
3. Save the file with a `.bat` extension, for example: `launch_chrome_profiles.bat`
    - In Notepad, choose **File → Save As**
    - Set **Save as type** to **All Files (*.*)**
    - Name the file with `.bat` at the end
4. Double-click the saved `.bat` file to run it, or run it from Command Prompt:
    - Open CMD
    - Navigate to the folder where the file is saved
    - Run: `launch_chrome_profiles.bat`
5. Chrome will be closed (if running), then reopened with the configured profiles and URLs.

## Full Script
```batch
rem Automote Chrome startup in windows with different profile with default bages 

rem Close any existing Chrome (all profiles)
taskkill /IM chrome.exe /F >nul 2>&1

rem Brief pause to ensure processes exit cleanly
timeout /t 2 /nobreak >nul

@echo off
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
set "PROFILE=Profile 2"

start "" "%CHROME%" --profile-directory="%PROFILE%" "https://calendar.google.com/calendar/u/0/r"

start "" "%CHROME%" --profile-directory="%PROFILE%" "https://mail.google.com/mail/u/0/#inbox"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://mail.google.com/mail/u/1/#inbox"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://translate.google.com/?sl=es&tl=en&op=translate"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://www.google.com/maps"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://www.idealista.com/en/usuario/tus-alertas"


rem Brief pause to ensure processes exit cleanly
timeout /t 2 /nobreak >nul

@echo off
set "PROFILE=Profile 5"
"

start "" "%CHROME%" --profile-directory="%PROFILE%" "https://confluence.media-saturn.com/spaces/~mittala/pages/620909573/Mittal+Akash%E2%80%99s+Home"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://jira.media-saturn.com/secure/RapidBoard.jspa?rapidView=4538#"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://console.cloud.google.com/run/overview?project=mms-xcp-xcp-p"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://github.com/MediaMarktSaturn/xcp-posting"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://cloud.mongodb.com/v2/632db29faf84ef7bf684e4ab#/clusters"
start "" "%CHROME%" --profile-directory="%PROFILE%" "https://xcp-prod-frontend-swzlilrgcq-ez.a.run.app/"
```

## Notes / Warnings
- This script uses `taskkill /IM chrome.exe /F`, which **forcefully terminates** all Chrome processes and may close tabs without saving state.
- Ensure the profile directory names (`Profile 2`, `Profile 5`) match your local Chrome profile folders exactly.
- The script contains a standalone double-quote (`"`) line before launching Profile 5 URLs; it is preserved as-is and may affect execution depending on CMD parsing.
