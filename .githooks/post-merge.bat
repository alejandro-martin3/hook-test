@echo off
setlocal enabledelayedexpansion

REM Only warn...
for /f "delims=" %%F in ('git diff --name-only HEAD@{1} HEAD') do (
  echo %%F | findstr /R /C:"\\package\.json$" /C:"\\package-lock\.json$" >nul
  if not errorlevel 1 (
    echo.
    echo ⚠️  Dependency files changed (package.json / package-lock.json).
    echo 👉  Run: npm ci.
    echo.
    exit /b 0
  )
)

REM otro
echo
echo ✅  No dependency file changes detected.


endlocal
