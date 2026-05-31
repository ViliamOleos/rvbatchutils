@echo off

SET "curdirstuff=C:\Program Files\rvbatchutils\"

NET SESSION >NUL 2>NUL
IF ERRORLEVEL 1 (
	ECHO run me with admin pls im tired of trying to to make automatic elevation ;-;
	goto:eof
)

IF ["%~1"]==[""] (
	ECHO As the first argument, I expect the util name to install
	ECHO And the second is the optional installation path ^(has to have a '\' at the end!^).
	ECHO If not specified, I will use "%curdirstuff%" instead.
	goto:eof
)
IF NOT ["%~2"]==[""] ( SET "curdirstuff=%2" )

XCOPY "..\%1" "%curdirstuff%" /E /I

ECHO.
ECHO "%1" should be now installed!
ECHO If You haven't already, add %curdirstuff% to the PATH environment variable.
ECHO (batch scripts cannot do that themselves, not very well)
ECHO.

PAUSE
