@ECHO OFF
Title alt:V Server Monitoring 
SET ServerPath="C:\Example"

:Start
SET restartCount=1
if %ServerPath%==C:\Example (
    ECHO Someone didn't pay attention, now did they?
    goto:Kill
)
cd %ServerPath%

:RunServer
altv-server.exe

:CrashReport
ECHO Server has crashed... Crash count is %restartCount%.

:BackupOnCrash
ECHO Beginning backup...
ECHO D|xcopy world LIVEWORLDBACKUPS\world-backup-%restartCount% /S 

:Add
SET /a restartCount=%restartCount%+1
ECHO %restartCount%

goto:RunServer

:Kill
ECHO "     (> ^ o^)> <(^o ^ <)     "
ECHO The program got killed!
ECHO Fuck The Police. :)
pause
