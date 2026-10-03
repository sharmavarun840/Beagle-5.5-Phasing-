@echo off
setlocal EnableDelayedExpansion

set "BEAGLE=beagle.27Feb25.75f.jar"

if not exist "%BEAGLE%" (
    echo ERROR: %BEAGLE% not found.
    pause
    exit /b 1
)

echo ==========================================
echo Beagle 5.5 automatic VCF phasing
echo ==========================================
echo.

for %%F in (chr*.vcf.gz) do (

    set "FILE=%%F"

    REM Skip already phased VCFs
    echo !FILE! | findstr /I ".phased.vcf.gz" >nul
    if errorlevel 1 (

        set "BASE=!FILE:.vcf.gz=!"

        echo.
        echo ------------------------------------------
        echo Phasing: !FILE!
        echo Output:  !BASE!.phased.vcf.gz
        echo ------------------------------------------

        java -Xmx8g -jar "%BEAGLE%" gt="!FILE!" out="!BASE!.phased" nthreads=4

        if errorlevel 1 (
            echo ERROR: Phasing failed for !FILE!
        ) else (
            echo SUCCESS: !BASE!.phased.vcf.gz
        )

    ) else (
        echo Skipping already phased file: !FILE!
    )
)

echo.
echo ==========================================
echo ALL PHASING JOBS COMPLETED
echo ==========================================
pause