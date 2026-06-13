@echo off

SET "myCD=%CD%"

IF "%1"=="-A" (
	NET >NUL 2>NUL
	IF ERRORLEVEL 1 (
		SETX RVBATCHUTILS-COOLCMD-ADMINPATH "%CD%"
		POWERSHELL -Command "Start-Process '%~f0' -Verb RunAs -ArgumentList '-R'"
		goto:eof
	)
) ELSE IF "%1"=="-R" (
	SET "myCD=%RVBATCHUTILS-COOLCMD-ADMINPATH%"
)

REG DELETE HKCU\Environment /V RVBATCHUTILS-COOLCMD-ADMINPATH /F
PROMPT $E[35m[$P\]$S$E[95m$B$S$E[0m
CMD /K "cd %myCD%"