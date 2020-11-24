@echo off
:a
set /p project="Enter Project Name: "
set /p filepath="Enter path (without last "\"): "

if not %filepath%==. (
	set realfilepath=\%filepath%
	set filepath=/%filepath%
) else (
	set realfilepath=
	set filepath=
)

set /p filename="Enter filename without postfix: "

if not x%filename:.=%==x%filename% (
	echo Filename must NOT have a postfix!
	goto a
)

set cpptext=#include "%project%%filepath%/%filename%.h"
set cpplocation=src\%project%%realfilepath%
set htext=#pragma once
set hlocation=include\%project%%realfilepath%

echo Create Header: %hlocation%\%filename%.h
echo Create CppFile:    %cpplocation%\%filename%.cpp
set /p doit="Do it? (y/n): "
if %doit%==n goto a

if not exist .\%hlocation%\ mkdir .\%hlocation%\
if not exist .\%cpplocation%\ mkdir .\%cpplocation%\

echo %htext%>".\%hlocation%\%filename%.h"
echo %cpptext%>".\%cpplocation%\%filename%.cpp"

call premake