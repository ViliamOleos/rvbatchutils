@echo off

NET SESSION >NUL 2>NUL
IF ERRORLEVEL 1 (
	ECHO run me with admin pls im tired of trying to to make automatic elevation ;-;
	goto:eof
)

SET "curInstallDir=C:\Program Files\rvbatchutils\"
IF NOT ["%~1"]==[""] (
	SET "curInstallDir=%~1"
)

SETX RVBATCHUTILS-INSTALL-DIR "%curInstallDir%\"

ECHO.
ECHO Finished executing. If You haven't already, add "%curInstallDir%" to the PATH environment variable.
