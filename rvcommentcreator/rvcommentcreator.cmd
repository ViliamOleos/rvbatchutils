@echo off

::::::::::::::::::::::::::::::::::::::::: CONFIG :::::::::::::::::::::::::::::::::::::::::

SET "PREFIX=/*"
SET "BAR=~"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=80"

:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::

ECHO.
ECHO.  This script shall create a header-style comment for this codebase.
ECHO Input a comment label which will be in the middle of the comment.
ECHO Ensure Your label isn't too big and its length has the same parity as comment width.
ECHO Example comment: %PREFIX%%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%%MIDPREFIX% MAIN %MIDPOSTFIX%%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%%POSTFIX%
ECHO.
SET /p label="Comment Label: "
ECHO.

::: === var count === :::
rem Count characters in config variables by putting them in a temp file and counting bytes

	SETLOCAL enabledelayedexpansion

CALL:varlenfunc PREFIX
	SET PREFIX_siz=%return%
CALL:varlenfunc MIDPREFIX
	SET MIDPREFIX_siz=%return%
CALL:varlenfunc label
	SET label_siz=%return%

::: === print === :::
SET /a wingc=(%COUNT%-%label_siz%)/2 - %PREFIX_siz% - %MIDPREFIX_siz%

SET "comment=%PREFIX%"
	FOR /L %%i in (1,1,%wingc%) do SET "comment=!comment!!BAR!"
SET "comment=%comment%%MIDPREFIX%%label%%MIDPOSTFIX%"
	FOR /L %%i in (1,1,%wingc%) do SET "comment=!comment!!BAR!"
SET "comment=%comment%%POSTFIX%"

ECHO %comment%

ECHO.
ECHO|SET /p="Generation done^! "
IF "%1"=="-c" (
	ECHO|SET /p="%comment%"|CLIP
	ECHO|SET /p="Automatically pasted into Your clipboard."
) ELSE (
	ECHO|SET /p="Copy the comment above and paste it in Your code^!"
)
ECHO.

goto:eof

:::::::::::::::::::::::::::::::::::::::::: FUNC ::::::::::::::::::::::::::::::::::::::::::

rem %1 - inspected variable
rem uses "vl_tempfile" variable, temp.tmp file, returns "return"
:varlenfunc

	SET vl_tempfile=temp.tmp
	ECHO !%1!>%vl_tempfile%

	FOR /f "usebackq" %%i in ('%vl_tempfile%') do SET /a return=%%~zi-2

	DEL %vl_tempfile%

goto:eof

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: passable stuff; bar flip flop
