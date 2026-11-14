@echo off
echo ============================================
echo   Bank Management System - Build & Run
echo ============================================
echo.

set SRC_DIR=src
set OUT_DIR=out
set LIB_DIR=lib
set MAIN_CLASS=com.bank.Main

if not exist %OUT_DIR% mkdir %OUT_DIR%

echo [1/2] Compiling Java source files...
javac -cp "%LIB_DIR%\*" -d %OUT_DIR% -sourcepath %SRC_DIR% %SRC_DIR%\com\bank\Main.java

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Compilation failed! Check errors above.
    pause
    exit /b 1
)

echo Copying config.properties to output directory...
if exist config.properties copy config.properties %OUT_DIR%\config.properties >nul

echo [2/2] Running Bank Management System...
echo.
java -cp "%OUT_DIR%;%LIB_DIR%\*" %MAIN_CLASS%

pause