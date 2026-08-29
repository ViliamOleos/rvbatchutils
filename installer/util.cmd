@echo off

IF ["%1"]==[""] (
	ECHO As the first argument, I expect the util's name for installation.
	ECHO Optionally, argument 2 can be used to insert additional arguments to XCOPY.
	ECHO Tip: Second argument = "/Y" skips confirmation prompt for updating utils.
	goto:eof
)

ECHO.

XCOPY "..\%1.cmd" "%RVBATCHUTILS-INSTALL-DIR%utils\" %~2

ECHO.
CALL internal\lib.cmd finish
