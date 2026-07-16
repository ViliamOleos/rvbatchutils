@echo off

NET SESSION >NUL 2>NUL
IF ERRORLEVEL 1 (
	ECHO run me with admin pls im tired of trying to make automatic elevation ;-;
	goto:eof
)

IF ["%1"]==[""] (
	ECHO As the first argument, I expect the util's name for installation.
	ECHO Optionally, argument 2 can be used to insert additional arguments to XCOPY.
	ECHO Tip: Second argument = "/Y" skips confirmation prompt for updating.
	goto:eof
)

XCOPY "..\%1" "%RVBATCHUTILS-INSTALL-DIR%" /E /I %~2

ECHO.
ECHO "%1" should now (ideally) be installed! Watch out for any errors or weird messages.
