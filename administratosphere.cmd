@echo off

SET "dummyscript=%RVBATCHUTILS-INSTALL-DIR%administratosphere_script.cmd"

ECHO @echo off > %dummyscript%
ECHO. >> %dummyscript%
ECHO CD %CD% >> %dummyscript%
ECHO. >> %dummyscript%
ECHO %* >> %dummyscript%
ECHO Start-Process 'CMD' -Verb RunAs -ArgumentList '/C %dummyscript%' | POWERSHELL -Command "-"