@echo off

IF ["%~1"]==[""] (
	ECHO As the first argument, I expect the util name to uninstall.
	goto:eof
)

DEL "%RVBATCHUTILS-INSTALL-DIR%utils\%1.cmd"

ECHO.
CALL internal\lib.cmd finish
