@echo off

NET SESSION >NUL 2>NUL
IF ERRORLEVEL 1 (
	ECHO run me with admin pls im tired of trying to to make automatic elevation ;-;
	goto:eof
)

RMDIR /S /Q "%RVBATCHUTILS-INSTALL-DIR%"
SET "tempinstalldir=%RVBATCHUTILS-INSTALL-DIR%"
REG DELETE HKCU\Environment /V RVBATCHUTILS-INSTALL-DIR /F

ECHO.
ECHO "rvbatchutils" should now be uninstalled!
ECHO If You haven't already, remove "%tempinstalldir%" from the PATH environment variable.