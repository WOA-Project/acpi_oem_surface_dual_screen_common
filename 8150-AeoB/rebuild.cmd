@echo off
rmdir /Q /S builtin
mkdir builtin
for /f %%f in ('dir /b /s src\*.aeobsl') do AeoBUtils.exe aeobsl2aeob -p %%f -o builtin\%%~nf.aeob
for /f %%f in ('dir /b /s src\*.axbsl') do AeoBUtils.exe axbsl2axb -p %%f -o builtin\%%~nf.axb