@ECHO OFF

SET pc_or_lap=1
SET /p pc_or_lap=Chose your compiling machine [1=pc / 2=laptop] (default - 1=pc): 

IF "%pc_or_lap%" == "2" (
    start "Kompilowanie instalatora by Automatyk" "d:\Programy\Inno Setup 5\ISCC.exe" main.iss
) ELSE IF "%pc_or_lap%" == "1" (
    start "Kompilowanie instalatora by Automatyk" "c:\Program Files (x86)\Inno Setup 5\ISCC.exe" main.iss
) ELSE (
    ECHO "Chose own option - 'pc' or 'laptop'"
)