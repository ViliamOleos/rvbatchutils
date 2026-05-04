@echo off

IF "%1"=="-A" (
	NET >NUL 2>NUL
	IF ERRORLEVEL 1 (
		POWERSHELL -Command "Start-Process '%~f0' -Verb RunAs"
		goto:eof
	)
)

PROMPT $E[35m[$P\]$S$E[95m$B$S$E[0m
CMD
