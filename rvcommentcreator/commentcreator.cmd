@echo off

::::::::::::::::::::::::::::::::::::::::: CONFIG :::::::::::::::::::::::::::::::::::::::::

SET "PREFIX=/*"
SET "BAR=~"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=90"

:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::

ECHO.
ECHO.  This script shall create a header-style comment for this codebase.
ECHO Input a comment label which will be in the middle of the comment.
ECHO Make sure Your label isn't ludicrously big and has an even number of characters.
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

ECHO|SET /p="%PREFIX%"
	FOR /L %%i in (1,1,%wingc%) do ECHO|SET /p="!BAR!"
ECHO|SET /p="%MIDPREFIX%%label%%MIDPOSTFIX%"
	FOR /L %%i in (1,1,%wingc%) do ECHO|SET /p="!BAR!"
ECHO %POSTFIX%

ECHO.
ECHO.
ECHO Generation done! Copy the comment above to use it!

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
