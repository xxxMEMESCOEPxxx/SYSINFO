@echo off
color 04
net session >nul
if %ERRORLEVEL% NEQ 0 goto adminerr
if %ERRORLEVEL% == 0 echo Admin rights confirmed!
rem del %TEMP%\config.nmcfg
color 0a
if not exist %TEMP%\config.nmcfg echo SYSINFO.exe created by Andrew Maney! >> %TEMP%\config.nmcfg
findstr /rc:"SYSINFO.exe created by Andrew Maney!" %TEMP%\config.nmcfg
if %ERRORLEVEL% NEQ 0 goto cpwterr
echo Icon from https://dryicons.com/free-icons/server
pause
echo Deleting Existing TEMP Files...
del %TEMP%\SYSINFO.txt >NUL
del %TEMP%\SYSNET.txt >NUL
del %TEMP%\PingConnTest.txt >NUL

if exist %TEMP%\SYSINFO.txt goto cleanerr
if exist %TEMP%\system.cfg goto notusable
if not exist %TEMP%\SYSINFO.txt echo deleted file or file does not exist!
if exist %TEMP%\SYSNET.txt goto cleanerr
if not exist %TEMP%\SYSNET.txt echo deleted file or file does not exist!
if exist %TEMP%\PingConnTest.txt goto cleanerr
if not exist %TEMP%\PingConnTest.txt echo deleted file or file does not exist!
cls

:start
echo Getting System Information using command "systeminfo" and getting NETWORK CONNECTION STATUS using command "ipconfig"...
echo Initializing Test...
ping localhost >NUL
REM PowerShell gwmi win32_LogicalDisk -filter DriveType=4
wmic logicaldisk get caption,providername,drivetype,volumename,FreeSpace
echo Done!
systeminfo
echo Got System Information!
echo Getting Network Connection Information...
ping localhost >NUL
ipconfig
echo Got System Network Connection Info!
ping localhost >NUL
cls
echo copying to text file "SYSINFO.txt" in directory %TEMP%...
echo SYSTEM INFORMATION: >> %TEMP%\SYSINFO.txt
systeminfo >> %TEMP%\SYSINFO.txt
ipconfig >> %TEMP%\SYSNET.txt
echo --------------------------------------------------------------------------- >> %TEMP%\SYSINFO.txt
echo NETWORK INFORMATION: >> %TEMP%\SYSINFO.txt
ipconfig >> %TEMP%\SYSINFO.txt
echo Attempting to ping multiple servers and copy results to text document... (THIS MIGHT TAKE A WHILE!)
echo --------------------------------------------------------------------------- >> %TEMP%\SYSINFO.txt
echo. >> %TEMP%\SYSINFO.txt
echo. >> %TEMP%\SYSINFO.txt
echo PING CONNECTION TEST RESULTS: >> %TEMP%\SYSINFO.txt
ping google.com >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 1!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 1
REM echo Pinged Server 1
ping speedtest.net >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 2!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 2
rem echo Pinged Server 2
ping youtube.com >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 3!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 3
rem echo Pinged Server 3
ping apple.com >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 4!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 4
rem echo Pinged Server 4
ping code.org >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 5!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 5
rem echo Pinged Server 5
ping ebay.com >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 6!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 6
rem echo Pinged Server 6
ping amazon.com >> %TEMP%\PingConnTest.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 7!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 7
rem echo Pinged Server 7


ping google.com >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 8!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 8
rem echo Pinged Server 8
ping speedtest.net >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 9!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 9
rem echo Pinged Server 9
ping youtube.com >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 10!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 10
rem echo Pinged Server 10
ping apple.com >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 11!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 11
rem echo Pinged Server 11
ping code.org >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 12!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 12
rem echo Pinged Server 12
ping ebay.com >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 13!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 13
rem echo Pinged Server 13
ping amazon.com >> %TEMP%\SYSINFO.txt
echo.
if %errorlevel% NEQ 0 echo Failed! && echo Could not ping server 14!
if %errorlevel% NEQ 1 echo Success! && echo Pinged Server 14
rem echo Pinged Server 14
cls

rem echo Copying PingTest results to "%TEMP%\SYSINFO.txt"...

echo Copying Disk Information to text document "SYSINFO.txt" in directory %TEMP%...
echo --------------------------------------------------------------------------- >> %TEMP%\SYSINFO.txt
echo LOGICAL DISKS: >> %TEMP%\SYSINFO.txt
wmic logicaldisk get caption,providername,drivetype,volumename,FreeSpace >> %TEMP%\SYSINFO.txt

echo. >> %TEMP%\SYSINFO.txt && echo Finished All Tests! >> %TEMP%\SYSINFO.txt
echo --------------------------------------------------------------------------- >> %TEMP%\SYSINFO.txt
echo Copying MSINFO32 results to txt... (THIS WILL TAKE A MINUTE!)
rem echo MSINFO32 SYSTEM INFO: >> %temp%\SYSINFO.txt

rem msinfo32 /report %TEMP%\MSINFO.txt
rem copy %TEMP%\MSINFO.txt %TEMP%\SYSINFO.txt
sfc /scannow >> %TEMP%\SYSINFO.txt
rem (type "%TEMP%\MSINFO.txt" | find "" 2>nul) >"%TEMP%\SYSINFO.txt
echo.
echo.
echo.
set /p benchmark="Do you have Unigine's Heaven Benchmark installed on your computer?(Y/N): "
IF /i %benchmark%==Y goto benchmark
IF /i %benchmark%==N echo Not running benchmark!


echo Done!
:testend
echo.
echo.
echo.
set /p opensysinfo="Would you like to view the results in SYSINFO.txt?(Y/N): "
IF /i %opensysinfo%==Y start %TEMP%\SYSINFO.txt
IF /i %opensysinfo%==N echo Not opening file! 

set /p copyfile="Do you want to copy "SYSINFO.txt" to another location?(Y/N): "
IF /i %copyfile%==Y goto COPYFILE
IF /i %copyfile%==N echo Not Copying File!

:copymsinfo
set /p copyfile="Do you want to copy "MSINFO.txt" to another location?(Y/N): "
IF /i %copyfile%==Y goto COPYMSFILE
IF /i %copyfile%==N goto done

:COPYFILE
set /p copylocation="Path to copy file to: "
echo Copying File...
copy %TEMP%\SYSINFO.txt %copylocation%
echo [This Text Document was Generated by SYSINFO.exe, which was created by Andrew Maney!] >> %copylocation%\SYSINFO.txt
echo [Icon from https://dryicons.com/free-icons/server.] >> %copylocation%\SYSINFO.txt
IF %ERRORLEVEL% NEQ 0 echo. && echo Failed to copy file! Make sure you have used a valid path! && echo. && goto COPYFILE
echo Done!
goto copymsinfo
pause

:COPYMSFILE
set /p copymslocation="Path to copy file to: "
echo Copying File...
copy %TEMP%\MSINFO.txt %copymslocation%
echo [This Text Document was Generated by SYSINFO.exe, which was created by Andrew Maney!] >> %copymslocation%\MSINFO.txt
echo [Icon from https://dryicons.com/free-icons/server.] >> %copymslocation%\MSINFO.txt
IF %ERRORLEVEL% NEQ 0 echo. && echo Failed to copy file! Make sure you have used a valid path! && echo. && goto COPYMSFILE
echo Done!
pause
:done

echo cleaning up...
ping localhost >NUL
ping localhost >NUL


del %TEMP%\SYSINFO.txt
del %TEMP%\SYSNET.txt
del %TEMP%\PingConnTest.txt
rem del %TEMP%\config.nmcfg
if exist %TEMP%\SYSINFO.txt goto cleanerr
if not exist %TEMP%\SYSINFO.txt  echo Deleted "SYSINFO.txt" && ping localhost >NUL
if exist %TEMP%\SYSNET.txt goto cleanerr
if not exist %TEMP%\SYSNET.txt  echo Deleted "SYSNET.txt" && ping localhost >NUL
if exist %TEMP%\PingConnTest.txt goto cleanerr
if not exist %TEMP%\PingConnTest.txt  echo Deleted "PingConnTest.txt"
echo Finished cleaning up!
echo exitting...
ping localhost >NUL
exit

:cleanerr
echo An error occured while verifying deletion of temporary files! Cannot Continue!
pause
exit

:adminerr
echo Please run this program as administrator to allow for proper execution!
pause
exit

:benchmark
set /p BPath="Where is it located?(eg. C:\Program Files\Heaven Benchmark 4.0): "
set /p BatFile="Program To Start: "
set /p benchmarkstart="Are you sure you want to start the benchmark by executing this file?(Y/N): "
IF /i %benchmarkstart%==Y start "Benchmark - Please close this window!" "%BPath%\%BatFile%" 
IF /i %benchmarkstart%==N goto testend
REM PowerShell $TitleToKill = "Benchmark - Please close this window!"
rem PowerShell get-process | where-object {$_.MainWindowTitle -eq $TitleToKill} | stop-process
if %errorlevel% == 0 echo Done! && goto testend
if %ERRORLEVEL% NEQ 0 echo. && echo Failed to start Benchmark! Please make sure you put the right path in, and with no quotations. && goto benchmark

goto testend

:cpwterr
if not exist %windir%\system.cfg echo Please do not change the Copyright information unless given written permission! && echo creating copyright protection and ususability file...
echo do not delete! > %windir%\system.cfg




:notusable
echo You can no longer access this file because you have previously changed the copyright information, which is not allowed.
pause 
echo fricc u!
exit