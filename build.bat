@echo off
echo ================================
echo Grove Technologies Static Build
echo ================================
echo.

echo [1/3] Generating templ files...
templ generate
if %errorlevel% neq 0 (
    echo [ERROR] Failed to generate templ files
    exit /b 1
)
echo [OK] Templ files generated

echo.
echo [2/3] Building static site...
go run generate-static.go
if %errorlevel% neq 0 (
    echo [ERROR] Failed to build static site
    exit /b 1
)
echo [OK] Static site built

echo.
echo [3/3] Build complete!
echo.
echo ================================
echo To serve the static site:
echo   go run serve.go
echo   or
echo   cd dist
echo   python -m http.server 8000
echo ================================
