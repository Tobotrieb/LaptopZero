@echo off
set /p action="Enter action (vs2019, gmake, ...): "
call .\premake\premake5.exe %action%