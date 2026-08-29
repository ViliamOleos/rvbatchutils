@echo off
CALL :%*
goto:eof

:finish
	ECHO Finished executing. Watch out for any weird messages: they could indicate failure.
goto:eof

:elevate
	NET SESSION >NUL 2>NUL
	IF ERRORLEVEL 1 (
		ECHO I need administrator privileges for some installer actions ;(
		exit /b 1
	)
goto:eof
