@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

::::::::::::::::::::::::::::::::::::: COLOUR CONSOLE :::::::::::::::::::::::::::::::::::::

rem keep two lines under NL
FOR /F %%a in ('ECHO PROMPT $E^| CMD') do SET "ESC=%%a"

SET "PB=%ESC%["
SET "AF=38;5;"
SET "AB=48;5;"

SET "CLR=%PB%0m"

SET "BOLD=%PB%1m"
SET "UNDL=%PB%4m"
SET "INVT=%PB%7m"

SET "_RED_=%PB%31m"
SET "GREEN=%PB%32m"
SET "YELOW=%PB%33m"
SET "REGAL=%PB%35m"
SET "BROWN=%PB%%AF%88m"

SET "BARSEN=%PB%%AB%234m"

:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::

SET "ACLR=%CLR%%BARSEN%"

rem PROJECT VARS
SET "bau=bau_std"
SET "options="
SET "program=main"
SET "arguments="

:REBOOT
CALL "baum_cfg.cmd"
:PLAQUE

ECHO %ACLR%
CLS
ECHO Welcome to %BROWN%%UNDL%Baumeister%ACLR%!
ECHO.
ECHO Choose Your action:%GREEN%
ECHO.	[r] run
ECHO.	[f] fused (comp ^& run)
ECHO.	[c] compile%YELOW%
ECHO.	[e] edit configuration%REGAL%
ECHO.	[h] help
ECHO.	[z] reboot
ECHO.	[q] quit
ECHO %ACLR%
ECHO Configuration:%YELOW%
ECHO.	   bau    = [%ACLR%%bau%%YELOW%];
ECHO.	 options  = [%ACLR%%options%%YELOW%];
ECHO.	 program  = [%ACLR%%program%%YELOW%];
ECHO.	arguments = [%ACLR%%arguments%%YELOW%];
ECHO.

ECHO|SET /p="%_RED_%"
CHOICE /c rfcehzq /n /m "Your choice:"
SET "ans=%errorlevel%"

ECHO %CLR%
CLS

       IF "%ans%"=="1" ( CALL :run 
) ELSE IF "%ans%"=="2" ( CALL :compile && CLS && CALL :run
) ELSE IF "%ans%"=="3" ( CALL :compile 
) ELSE IF "%ans%"=="4" ( CALL :edit
) ELSE IF "%ans%"=="5" ( rem help
) ELSE IF "%ans%"=="6" ( GOTO :REBOOT 
) ELSE IF "%ans%"=="7" ( GOTO :QUIT 
)

GOTO :PLAQUE

:::::::::::::::::::::::::::::::::::::::::: FUNC ::::::::::::::::::::::::::::::::::::::::::

:run

	%program% %arguments%
	SET "run_ans=%errorlevel%"
	
	ECHO.
	ECHO Execution ended, program returned %run_ans%.
	PAUSE

goto:eof

:compile

	CALL %bau% %options%
	SET "compile_ans=%errorlevel%"

	ECHO.
	IF "%compile_ans%"=="1" (
		ECHO Compilation failed; aborting any further scheduled tasks.
	) ELSE (
		ECHO Compilation ended.
	)
	PAUSE

	exit /b %compile_ans%

goto:eof

:edit

	SET "ed_neoval="
	
	ECHO %ACLR%
	CLS
	ECHO Configuration:%YELOW%
	ECHO.	[b]    bau    = [%ACLR%%bau%%YELOW%];
	ECHO.	[o]  options  = [%ACLR%%options%%YELOW%];
	ECHO.	[p]  program  = [%ACLR%%program%%YELOW%];
	ECHO.	[a] arguments = [%ACLR%%arguments%%YELOW%];
	ECHO %GREEN%
	ECHO [c] copy %REGAL%[q] quit
	ECHO %ACLR%

	ECHO|SET /p="%_RED_%"
	CHOICE /c bopacq /n /m "Your choice:"
	SET "ed_ans=%errorlevel%"

	ECHO %ACLR%
	CLS

	       IF "%ed_ans%"=="1" ( SET "ed_ans=bau"
	) ELSE IF "%ed_ans%"=="2" ( SET "ed_ans=options"
	) ELSE IF "%ed_ans%"=="3" ( SET "ed_ans=program"
	) ELSE IF "%ed_ans%"=="4" ( SET "ed_ans=arguments"
	) ELSE IF "%ed_ans%"=="5" ( CALL :edclip & GOTO :edit
	) ELSE IF "%ed_ans%"=="6" ( exit /b
	)

	ECHO %YELOW%Editing %GREEN%"%ed_ans%"%YELOW% = [%ACLR%!%ed_ans%!%YELOW%];
	ECHO.
	SET /p "ed_neoval=New value: %ACLR%"
	SET "%ed_ans%=%ed_neoval%"
	ECHO SET "%ed_ans%=%ed_neoval%"
	
	GOTO :edit

goto:eof

:edclip

	IF ["%RVBATCHUTILS-INSTALL-DIR%"]==[""] (
		SET "edc_clipfile=%temp%\rvbatchutils_baumeister_temp_clip.tmp"
	) ELSE (
		SET "edc_clipfile=%RVBATCHUTILS-INSTALL-DIR%baumeisterclip.tmp"
	)

	ECHO SET "bau=%bau%" > %edc_clipfile%
	ECHO SET "options=%options%" >> %edc_clipfile%
	ECHO SET "program=%program%" >> %edc_clipfile%
	ECHO SET "arguments=%arguments%" >> %edc_clipfile%

	CLIP < %edc_clipfile%

	DEL %edc_clipfile%

goto:eof

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:QUIT
CLS
