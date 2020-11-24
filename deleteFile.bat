@echo off
:a
set /p project="Enter Project Name: "
set /p filepath="Enter file path: "

if not %filepath%==. (
	set filepath=\%filepath%
) else (
	set filepath=
)

set /p filename="Enter file name with postfix: "

if %filename:~-3%==cpp (
	set location=src
) else if %filename:~-1%==h (
	set location=include
) else (
	echo Can not find file: %filename%
	goto a
)

set /p doit="Delete %location%\%project%%filepath%\%filename%? (y/n): "
if %doit%==y (
	del /f /q %location%\%project%%filepath%\%filename%
) else (
	goto a
)

premake