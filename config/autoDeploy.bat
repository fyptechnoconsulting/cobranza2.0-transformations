@echo off

REM *******************************************************************************************
REM ********************************** cobranza 2.0 *******************************************
REM Deploy JOBS / TRANSFORMATIONS routines on premise
REM
REM Copyleft 2020 -  All rights reserved.
REM ************************************************** FYPTECHNOCONSULTING ENERO 2020. ********
REM *******************************************************************************************

REM ********* Wait for carte service start **********
timeout 120
setlocal
call config.bat
cd /D %SOURCE_CODE_PATH%

setlocal EnableDelayedExpansion

for %%x in (*) do ( echo %SOURCE_CODE_PATH%\%%x >> %WORK_PATH%\tmpRoutes.txt )
call %REPLACE_PATH%\replace "\" "/" %WORK_PATH%\tmpRoutes.txt
for /f %%x in (%WORK_PATH%\tmpRoutes.txt) do (
   echo %%~xx
   if "%%~xx" == ".kjb" ( 
       curl -X GET -H "Content-Type: application/json"  -u %USER%:%PASS% http://%DEPLOY_ADDRESS%:%DEPLOY_PORT%/kettle/executeJob/?job=%%x  >> %LOG_PATH%\autoDeployJobs.log  
   )
   if "%%~xx" == ".ktr" (        
       curl -X GET -H "Content-Type: application/json"  -u %USER%:%PASS% http://%DEPLOY_ADDRESS%:%DEPLOY_PORT%/kettle/executeTrans/?trans=%%x >> %LOG_PATH%\autoDeployTrans.log  
    )        
)

del %WORK_PATH%\tmpRoutes.txt