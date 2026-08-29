@echo off

SET "libact=CALL internal\lib.cmd"

%libact% elevate || goto:eof

ECHO.

RMDIR /S /Q "%RVBATCHUTILS-INSTALL-DIR%"
SET "tempinstalldir=%RVBATCHUTILS-INSTALL-DIR%"
REG DELETE HKCU\Environment /V RVBATCHUTILS-INSTALL-DIR /F && SET "RVBATCHUTILS-INSTALL-DIR="

ECHO.
%libact% finish
ECHO "%tempinstalldir%" can now go from the PATH environment variable.