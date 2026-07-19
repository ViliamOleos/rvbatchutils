@echo off

NET SESSION >NUL 2>NUL
IF ERRORLEVEL 1 (
	ECHO run me with admin pls im tired of trying to to make automatic elevation ;-;
	goto:eof
)

IF ["%~1"]==[""] (
	ECHO As the first argument, I expect the util name to uninstall.
	goto:eof
)

DEL "%RVBATCHUTILS-INSTALL-DIR%%1.cmd"

ECHO.
ECHO "%1" should now (ideally) be uninstalled!
