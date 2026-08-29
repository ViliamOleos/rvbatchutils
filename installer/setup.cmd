@echo off

SET "libact=CALL internal\lib.cmd"

%libact% elevate || goto:eof

SET "curInstallDir=C:\RV\COMMONS\rvbatchutils\"
IF NOT ["%~1"]==[""] (
	SET "curInstallDir=%~1"
)

SETX RVBATCHUTILS-INSTALL-DIR "%curInstallDir%\" && SET "RVBATCHUTILS-INSTALL-DIR=%curInstallDir%"

ECHO.
%libact% finish
ECHO "%curInstallDir%utils\" needs to be in the PATH environment variable.
ECHO The directory also ideally shouldn't be protected by administrator privileges.
ECHO.	(otherwise You'll need the same rights to use the utils)
