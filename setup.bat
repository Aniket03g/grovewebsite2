@echo off
echo ================================
echo Grove Technologies Website Setup
echo ================================
echo.

echo Checking Go installation...
go version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Go is not installed. Please install from https://golang.org/dl/
    exit /b 1
)
echo [OK] Go is installed

echo.
echo Installing templ CLI...
go install github.com/a-h/templ/cmd/templ@latest
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install templ
    exit /b 1
)
echo [OK] templ installed

echo.
echo Downloading dependencies...
go mod download
if %errorlevel% neq 0 (
    echo [ERROR] Failed to download dependencies
    exit /b 1
)
echo [OK] Dependencies downloaded

echo.
echo Generating templates...
templ generate
if %errorlevel% neq 0 (
    echo [ERROR] Failed to generate templates
    exit /b 1
)
echo [OK] Templates generated

echo.
echo ================================
echo Setup complete!
echo ================================
echo.
echo To start the server, run:
echo   go run main.go
echo.
echo Then open your browser to:
echo   http://localhost:8080
echo.
pause
