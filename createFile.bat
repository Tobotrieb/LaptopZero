@echo off
:a
set /p project="Enter Project Name: "
set /p filepath="Enter path (without last "\"): "

if not "%filepath%"=="." (
	set realfilepath=\%filepath%
	set filepath=/%filepath%
) else (
	set realfilepath=
	set filepath=
)

set /p filename="Enter filename and postfix: "

set text=#include "%project%%filepath%/%filename:~0,-4%.h"
set location=src\%project%%realfilepath%

if not %filename:~-2%==.h (
	if not %filename:~-4%==.cpp (
		echo postfix must be ".h" or ".cpp"
		goto a
	)
) else (
	set text=#pragma once
	set location=include\%project%%realfilepath%
)

set /p doit="Create File: .\%location%\%filename% (y/n): "
if %doit%==n goto a

if not exist .\%location%\ mkdir .\%location%\
echo %text%>".\%location%\%filename%"

call premake