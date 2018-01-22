@REM @Date:   2016-07-22 11:18:43
@REM Modified time: 2016-08-26 10:01:28
@echo off
cd %~dp1
echo Compiling %~nx1......
if exist %~n1.class (
    del %~n1.class
    )
javac -encoding utf-8 %~nx1
if exist %~n1.class (
    echo ------Output------
    java %~n1
    )