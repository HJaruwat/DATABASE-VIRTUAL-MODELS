﻿#Include MouseMove_Ellipse.ahk

;	CONFIG
Sleep 5000
WinMove, ahk_class ConsoleWindowClass ahk_exe py.exe,, 65, -20, 800, 125
WinSet, Transparent, 150, ahk_class ConsoleWindowClass ahk_exe py.exe
WinSet, AlwaysOnTop, Off, ahk_class ConsoleWindowClass ahk_exe py.exe
WinSet, AlwaysOnTop, On, ahk_class MozillaWindowClass ahk_exe firefox.exe
WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefix.exe
WinActivate, ahk_class ConsoleWindowClass ahk_exe py.exe
WinActivate, ahk_class MozillaWindowClass ahk_exe firefox.exe
WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
ControlFocus, , ahk_class MozillaWindowClass ahk_exe firefix.exe
CoordMode, Pixel, Relative
COUNTROUND := 0.0
COUNTFOUND := 0	
COUNTWAITS := 0	
CHECKTITLE := 0
COMPLETERC := 0
PO := 0
ER := 0
EE := 0
NO := 0
OK := 0
TABNUMLOCK := 0
KEYSDELAY := 75
PRESSDULA := 75
SetFormat, float, 0.1
; SET TOOLTIP
font := CreateFont("bold s12", "Matisse ITC")
Tooltip, STARTUP, -800, 600
WinWait ahk_class tooltips_class32
SetFont("", WinExist(), font)
;	CONFIG

reCaptchaFind:
Loop
{
	;	DELAY
	WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
	SetKeyDelay %KEYSDELAY%,%PRESSDULA%
	Sleep 2000
	;	DELAY
	if (CLIPBOARD == "[RC] UNTECTED")
	{
		continue reCaptchaFind
	}
	if (CLIPBOARD == "[RC] DETECTED") or (CLIPBOARD == "[RC] DETECTED [1]") or  (CLIPBOARD == "[RC] DETECTED [2]") or  (CLIPBOARD == "[RC] DETECTED [3]") or  (CLIPBOARD == "[RC] DETECTED [4]") or  (CLIPBOARD == "[RC] DETECTED [5]") or  (CLIPBOARD == "[RC] DETECTED [6]") or  (CLIPBOARD == "[RC] DETECTED [7]") or  (CLIPBOARD == "[RC] DETECTED [8]")
	{
		WinMove, ahk_class ConsoleWindowClass ahk_exe py.exe,, 65, -20, 800, 125
		WinSet, Transparent, 150, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinSet, AlwaysOnTop, Off, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefox.exe
		WinSet, AlwaysOnTop, On, ahk_class MozillaWindowClass ahk_exe firefix.exe
		WinActivate, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinMinimize, ahk_class MozillaWindowClass ahk_exe firefox.exe
		WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
		WinGetTitle, CheckTitleCur, ahk_class MozillaWindowClass ahk_exe firefix.exe	
		TABNUMLOCK := RegExReplace(CLIPBOARD, "\D")
		CLIPBOARD := 
		if (TABNUMLOCK == 1) or (TABNUMLOCK == 3) or (TABNUMLOCK == 4) or (TABNUMLOCK == 5) or (TABNUMLOCK == 6) or (TABNUMLOCK == 7) or (TABNUMLOCK == 8){
			COUNTROUMX := 5.0
		}
		if (TABNUMLOCK == 2){
			COUNTROUMX := 6.0
		}		
		continue reCaptchaFind
	}
	ImageSearch, iMacro_LiteX, iMacro_LiteY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\iMacro_Lite.png
	if (ErrorLevel != 0)
	{
		ControlSend,, {F8}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		ToolTip, Waiting [%ErrorLevel%] Detected  : 0.1, -800, 600
		;	TrayTip, Waiting [%ErrorLevel%], `n`nWaiting : 0.1, 1
		Sleep 2000
		continue reCaptchaFind
	}
	ImageSearch, ContinueX, ContinueY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\Continue.png
	if (ErrorLevel != 0)
	{
		MouseMove, 400, 300, 10
		ToolTip, Waiting [%ErrorLevel%] Detected  : 0.0, -800, 600
		;	TrayTip, Waiting [%ErrorLevel%], `n`nWaiting : 0.0, 1
		Sleep 2000
		continue reCaptchaFind
	}
	ImageSearch, FF12FFX, FF12FFY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\FF12FF.png
	;	PixelSearch, FF12FFX, FF12FFY, 0, 0, 800, 600, 0xFF12FF, 0, Fast RGB
	if (ErrorLevel == 0) or (TABNUMLOCK == 1)
	{
		WinMove, ahk_class ConsoleWindowClass ahk_exe py.exe,, 65, -20, 800, 125
		WinSet, Transparent, 150, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinSet, AlwaysOnTop, On, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefox.exe
		WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefix.exe
		WinActivate, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinMinimize, ahk_class MozillaWindowClass ahk_exe firefox.exe
		;	WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
		WinGetTitle, CheckTitleCur, ahk_class MozillaWindowClass ahk_exe firefix.exe
		COUNTROUND := 0	
		CHECKTITLE := 0
		COUNTWAITS := 0
		ToolTip, Waiting [%ErrorLevel%] Detected  : 1.0, -800, 600
		;	TrayTip, Waiting [%ErrorLevel%], `nDetected  : 1.0, 1
		continue reCaptchaDeteced
	}
	else
	{
		WinGetTitle, CheckTitleCur, ahk_class MozillaWindowClass ahk_exe firefix.exe	
		if InStr(CheckTitleCur, CheckTitleNew)
		{
			if (CHECKTITLE == 15)
			{
				CheckTitleNew := CheckTitleCur
				CHECKTITLE := CHECKTITLE+1
				ControlSend,, {F5}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 2000
				ControlSend,, {ENTER}, ahk_class MozillaDialogClass ahk_exe firefix.exe
				ToolTip, Check Title : %CHECKTITLE% : 3.1, -800, 600
				;	TrayTip, Check Title, `n`n%CHECKTITLE% : 3.1, 1
				Sleep 20000
				continue reCaptchaFind
			}
			if InStr(CheckTitleCur,"Problem loading page") or (CheckTitleCur == "Problem loading page") or (CheckTitleCur == "Mozilla firefix") or (CheckTitleCur == "About About - Mozilla firefix")
			{
				CheckTitleNew := CheckTitleCur
				CHECKTITLE := 0
				ToolTip, Check Title : %CHECKTITLE% : 3.2, -800, 600
				;	TrayTip, Check Title, `n`n%CHECKTITLE% : 3.2, 1
				continue reCaptchaContinue
			}
			if (CHECKTITLE > 30) or (CHECKTITLE == 30)
			{
				CheckTitleNew := CheckTitleCur
				CHECKTITLE := 0
				ToolTip, Check Title : %CHECKTITLE% : 3.3, -800, 600
				;	TrayTip, Check Title, `n`n%CHECKTITLE% : 3.3, 1
				continue reCaptchaContinue
			}
			else
			{
				CheckTitleNew := CheckTitleCur
				CHECKTITLE := CHECKTITLE+1
				ToolTip, Check Title : %CHECKTITLE% : 3.4, -800, 600
				;	TrayTip, Check Title, `n`n%CHECKTITLE% : 3.4, 1
				continue reCaptchaFind
			}
		}
		else
		{
			CheckTitleNew := CheckTitleCur
			CHECKTITLE := 0
			ToolTip, Check Title : %CHECKTITLE% : 2.0, -800, 600
			;	TrayTip, Check Title, `n`n%CHECKTITLE% : 2.0, 1
			continue reCaptchaFind
		}
	}
}

reCaptchaDeteced:
Loop
{
	; DELAY
	WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
	SetKeyDelay %KEYSDELAY%,%PRESSDULA%
	Sleep 1000
	; DELAY	
	; CLEAR	DIALOG
	ControlSend,, {ENTER}, ahk_class MozillaDialogClass ahk_exe firefix.exe
	; CLEAR	DIALOG	
	if (EE == 2) or (EE > 2) or (TABNUMLOCK == 1)
	{
		continue reCaptchaContinue
	}
	WinGetTitle, CheckTitleNew, ahk_class MozillaWindowClass ahk_exe firefix.exe
	if (CheckTitleNew != CheckTitleCur)
	{
		while (CheckTitleChk == "About About - Mozilla firefix") or (CheckTitleChk == "About About") or (CheckTitleChk == "Mozilla firefix"){
			Sleep 200
			ControlSend,, {LControl Down}{8}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
			Sleep 1000
			ControlSend,, {LControl Down}{PgDn}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
			Sleep 200
			WinGetTitle, CheckTitleChk, ahk_class MozillaWindowClass ahk_exe firefix.exe
		}
		if (CheckTitleChk == "About About - Mozilla firefix") or (CheckTitleChk == "About About") or (CheckTitleChk == "Mozilla firefix"){
			Sleep 200
			ControlSend,, {F9}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
			Sleep 500
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe		
			Sleep 2000
			continue reCaptchaDeteced
		}
	}	
	ImageSearch, FF12FFX, FF12FFY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\FF12FF.png
	;	PixelSearch, FF12FFX, FF12FFY, 0, 0, 800, 600, 0xFF12FF, 0, Fast RGB
	if (ErrorLevel == 0)
	{
		RANDOM, CIRCLE, 2, 18
		MOVECLICKFF12FFX := FF12FFX+CIRCLE
		RANDOM, CIRCLE, 2, 18
		MOVECLICKFF12FFY := FF12FFY+CIRCLE
		MouseClick, left, %MOVECLICKFF12FFX%, %MOVECLICKFF12FFY%, 1, 10
		ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
		;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
		Sleep 1000
		continue reCaptchaDeteced
	}
	ImageSearch, FFFF12X, FFFF12Y, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\FFFF12.png
	;	PixelSearch, FFFF12X, FFFF12Y, 0, 0, 800, 600, 0xFFFF12, 0, Fast RGB
	if (ErrorLevel == 0)
	{
		if (CLIPBOARD == "")
		{
			;	TEMPS = %CLIPBOARD
			;	CLIPBOARD :=
			;	SetKeyDelay 150,150
			MOUSECLICKFFFF12X := FFFF12X+120
			MOUSECLICKFFFF12Y := FFFF12Y+20
			MouseClick, left, %MOUSECLICKFFFF12X%, %MOUSECLICKFFFF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICKFFFF12X%, %MOUSECLICKFFFF12Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			ELLIPSEFFFF12xTRX := FFFF12X
			ELLIPSEFFFF12xTRY := FFFF12Y
			ELLIPSEFFFF12xTLX := FFFF12X+240
			ELLIPSEFFFF12xTLY := FFFF12Y
			ELLIPSEFFFF12xBLX := FFFF12X+240
			ELLIPSEFFFF12xBLY := FFFF12Y+40
			ELLIPSEFFFF12xBRX := FFFF12X
			ELLIPSEFFFF12xBRY := FFFF12Y+40
			Sleep 200
			MouseMove, %ELLIPSEFFFF12xTRX%, %ELLIPSEFFFF12xTRY%, 10
			Sleep 200
			MouseMove, %ELLIPSEFFFF12xTLX%, %ELLIPSEFFFF12xTLY%, 10
			Sleep 200
			MouseMove, %ELLIPSEFFFF12xBLX%, %ELLIPSEFFFF12xBLY%, 10
			Sleep 200
			MouseMove, %ELLIPSEFFFF12xBRX%, %ELLIPSEFFFF12xBRY%, 10
			;	Sleep 400
			;	ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 400
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
			Sleep 250
			continue reCaptchaDeteced
		}
		if (CLIPBOARD != "")
		{
			TEMPS = %CLIPBOARD%
			CLIPBOARD :=
			SetKeyDelay 140,140
			MOUSECLICKFFFF12X := FFFF12X+120
			MOUSECLICKFFFF12Y := FFFF12Y+20
			MouseClick, left, %MOUSECLICKFFFF12X%, %MOUSECLICKFFFF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICKFFFF12X%, %MOUSECLICKFFFF12Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	ELLIPSEFFFF12xTRX := FFFF12X
			;	ELLIPSEFFFF12xTRY := FFFF12Y
			;	ELLIPSEFFFF12xTLX := FFFF12X+240
			;	ELLIPSEFFFF12xTLY := FFFF12Y
			;	ELLIPSEFFFF12xBLX := FFFF12X+240
			;	ELLIPSEFFFF12xBLY := FFFF12Y+40
			;	ELLIPSEFFFF12xBRX := FFFF12X
			;	ELLIPSEFFFF12xBRY := FFFF12Y+40
			;	Sleep 200
			;	MouseMove, %ELLIPSEFFFF12xTRX%, %ELLIPSEFFFF12xTRY%, 10
			;	Sleep 200
			;	MouseMove, %ELLIPSEFFFF12xTLX%, %ELLIPSEFFFF12xTLY%, 10
			;	Sleep 200
			;	MouseMove, %ELLIPSEFFFF12xBLX%, %ELLIPSEFFFF12xBLY%, 10
			;	Sleep 200
			;	MouseMove, %ELLIPSEFFFF12xBRX%, %ELLIPSEFFFF12xBRY%, 10
			Sleep 400
			ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
			Sleep 250
			continue reCaptchaDeteced
		}
	}
;
; EXAC : ERROR
;
	ImageSearch, FF1111X, FF1111Y, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\FF1111.png
	;	PixelSearch, FF1111X, FF1111Y, 0, 0, 800, 600, 0xFF1111, 0, Fast RGB
	if (ErrorLevel == 0)
	{
		POSTS = %CLIPBOARD%
		if (GrantedCapacity := VarSetCapacity(TEMPS, -1) == 20) or (GrantedCapacity := VarSetCapacity(TEMPS, -1) > 20)
		{
			CLIPBOARD :=
			PO := 0.5
			MOVECLICKFF1111X := FF1111X+120
			MOVECLICKFF1111Y := FF1111Y+20
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 600
			if (GrantedCapacity := VarSetCapacity(POSTS, -1) = GrantedCapacity := VarSetCapacity(TEMPS, -1)) or (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
				ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			}
			else
			{
				ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			}
			TEMPS :=
			POSTS :=
			Sleep 400
			COUNTROUND := COUNTROUND+0.3
			Sleep 600
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe		
		}
		else
		{
			CLIPBOARD :=
			PO := 1
			MOVECLICKFF1111X := FF1111X+120
			MOVECLICKFF1111Y := FF1111Y+20
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 400
			;	if (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
			;		ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			;	if (GrantedCapacity := VarSetCapacity(TEMPS, -1) > GrantedCapacity := VarSetCapacity(POSTS, -1)){
			;		ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			TEMPS :=
			POSTS :=
			;	Sleep 400
			COUNTROUND := COUNTROUND+1.0
			Sleep 600
			MouseClick, left, %MOVECLICKFF1111X%, %MOVECLICKFF1111Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		}
		if (COUNTROUND == COUNTROUMX or COUNTROUND > COUNTROUMX) or (ER = 2 or ER > 2)
		{
			continue reCaptchaContinue
		}
		else
		{
			ER := ER+PO
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
			Sleep 5000
			continue reCaptchaDeteced
		}
	}
;
; EXAC : ERROR
;
;
; EXAC : NO
;
	ImageSearch, FF1212X, FF1212Y, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\FF1212.png
	;	PixelSearch, FF1212X, FF1212Y, 0, 0, 800, 600, 0xFF1212, 0, Fast RGB
	if (ErrorLevel == 0)
	{
		POSTS = %CLIPBOARD%
		if (CLIPBOARD != "")
		{			
			if (GrantedCapacity := VarSetCapacity(POSTS, -1) == 20) or (GrantedCapacity := VarSetCapacity(POSTS, -1) > 20)
			{
				CLIPBOARD :=
				PO := 1
				MOVECLICKFF1212X := FF1212X+120
				MOVECLICKFF1212Y := FF1212Y+20
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 600
				if (GrantedCapacity := VarSetCapacity(POSTS, -1) = GrantedCapacity := VarSetCapacity(TEMPS, -1)) or (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
					ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
				}
				else
				{
					ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
				}
				TEMPS :=
				POSTS :=
				Sleep 400
				COUNTROUND := COUNTROUND+0.3
				Sleep 600
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 400
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200	
				ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe		
			}
			else
			{
				CLIPBOARD :=
				PO := 1
				MOVECLICKFF1212X := FF1212X+120
				MOVECLICKFF1212Y := FF1212Y+20
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 600
				;	if (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
				;		ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	}
				;	else
				;	{
				;		ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	}
				TEMPS :=
				POSTS :=
				;	Sleep 400
				COUNTROUND := COUNTROUND+0.7
				Sleep 600
				MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200	
				ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				;	Sleep 200	
				;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 400
				ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
				Sleep 200	
				ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			}
		}
		else
		{
			CLIPBOARD :=
			MOVECLICKFF1212X := FF1212X+120
			MOVECLICKFF1212Y := FF1212Y+20
			MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 600
			;	if (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
			;		ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			;	else
			;	{
			;		ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			TEMPS :=
			POSTS :=
			;	Sleep 400
			COUNTROUND := COUNTROUND+0.7
			Sleep 600
			MouseClick, left, %MOVECLICKFF1212X%, %MOVECLICKFF1212Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400	
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		}
		if (COUNTROUND == COUNTROUMX or COUNTROUND > COUNTROUMX)
		{
			continue reCaptchaContinue
		}
		else
		{
			NO := NO+PO
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
			Sleep 5000
			continue reCaptchaDeteced
		}
	}
;
; EXAC : NO
;
;
; EXAC : OK
;
	ImageSearch, 12FF12X, 12FF12Y, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\12FF12.png
	;	PixelSearch, 12FF12X, 12FF12Y, 0, 0, 800, 600, 0x12FF12, 0, Fast RGB
	if (ErrorLevel == 0)
	{
		POSTS = %CLIPBOARD%
		if (CLIPBOARD != "")
		{
			CLIPBOARD :=
			PO := 1
			MOUSECLICK12FF12X := 12FF12X+120
			MOUSECLICK12FF12Y := 12FF12Y+20
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 600
			if (GrantedCapacity := VarSetCapacity(POSTS, -1) = GrantedCapacity := VarSetCapacity(TEMPS, -1)) or (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
				ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			}
			else
			{
				ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			}
			TEMPS :=
			POSTS :=
			Sleep 400
			COUNTROUND := COUNTROUND+0.3
			Sleep 600
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400	
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		}
		else
		{
			CLIPBOARD :=
			PO := 1
			MOUSECLICK12FF12X := 12FF12X+120
			MOUSECLICK12FF12Y := 12FF12Y+20
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{a}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 400
			;	if (GrantedCapacity := VarSetCapacity(POSTS, -1) > GrantedCapacity := VarSetCapacity(TEMPS, -1)){
			;		ControlSend,, %POSTS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			;	else
			;	{
			;		ControlSend,, %TEMPS%, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	}
			TEMPS :=
			POSTS :=
			;	Sleep 400
			COUNTROUND := COUNTROUND+0.3
			Sleep 600
			MouseClick, left, %MOUSECLICK12FF12X%, %MOUSECLICK12FF12Y%, 1, 10
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			;	Sleep 200	
			;	ControlSend,, {TAB}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 400	
			ControlSend,, {LControl Down}{%TABNUMLOCK%}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		}
		if (COUNTROUND == COUNTROUMX or COUNTROUND > COUNTROUMX)
		{
			continue reCaptchaContinue
		}
		else
		{
			OK := OK+PO
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%], -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% TAB : %TABNUMLOCK% [%OK%%NO%%ER%:%EE%]
			Sleep 5000
			continue reCaptchaDeteced
		}
	}
;
; EXAC : OK
;
;
; FIX WHEN CHECKED MARK IS SHOW BUT NOT FOUND
;
	if (CLIPBOARD == "[RC] COMPLETE") and (COUNTROUND > 0.0)
	{
		COMPLETERC := COMPLETERC+1	
		continue reCaptchaContinue
	}
	if (COUNTROUND == 0.0) or (COUNTROUND > 0.0)
	{
		MouseMove, 400, 200, 10
		MouseMove, 300, 200, 10
		MouseMove, 300, 400, 10
		MouseMove, 500, 400, 10
		MouseMove, 500, 200, 10
		MouseMove, 400, 200, 10
		;	MouseMove_Ellipse( -50 , +50 , "S0.25 I1 R" )
		;	MouseMove_Ellipse( +50 , +50 , "S0.25 I1 R" )
		;	MouseMove_Ellipse( +50 , -50 , "S0.25 I1 R" )
		;	MouseMove_Ellipse( -50 , -50 , "S0.25 I1 R" )
		ToolTip, Count : %COUNTROUND%/%COUNTROUMX% Detected Alert : Wait [%COUNTWAITS%][%COUNTFOUND%] TAB : %TABNUMLOCK%, -800, 600
		;	TrayTip, Count, `n%COUNTROUND%/%COUNTROUMX% `nDetected Alert : Wait [%COUNTWAITS%] `nTAB : %TABNUMLOCK% [%COUNTFOUND%]
		Sleep 2000
		if (COUNTWAITS == 15) or (COUNTFOUND == 3)
		{
			continue reCaptchaContinue		
		}
		ImageSearch, GoogleConnectionAlertX, GoogleConnectionAlertY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\GoogleConnectionAlert.png
		if (ErrorLevel == 0)
		{
			MOVECLICKGoogleConnectionAlertX := GoogleConnectionAlertX+120
			MOVECLICKGoogleConnectionAlertY := GoogleConnectionAlertY+20
			MouseClick, left, %MOVECLICKGoogleConnectionAlertX%, %MOVECLICKGoogleConnectionAlertY%, 1, 10
			Sleep 200	
			ControlSend,, {ENTER}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 2000
			ControlSend,, {F5}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 2000
			ControlSend,, {ENTER}, ahk_class MozillaDialogClass ahk_exe firefix.exe
			ToolTip, Count [%ErrorLevel%] : %COUNTROUND%/%COUNTROUMX% Detected Alert : True [%COUNTWAITS%][%COUNTFOUND%] TAB : %TABNUMLOCK%, -800, 600
			;	TrayTip, Count [%ErrorLevel%], `n%COUNTROUND%/%COUNTROUMX% `nDetected Alert : True [%COUNTWAITS%] `nTAB : %TABNUMLOCK% [%COUNTFOUND%]
			Sleep 20000
			COUNTFOUND := COUNTFOUND+1
			COUNTWAITS := COUNTWAITS+1
			continue reCaptchaDeteced
		}
		if (COUNTWAITS == 5)
		{
			ControlSend,, {F5}, ahk_class MozillaWindowClass ahk_exe firefix.exe
			Sleep 2000
			ControlSend,, {ENTER}, ahk_class MozillaDialogClass ahk_exe firefix.exe
			COUNTWAITS := COUNTWAITS+1
			Sleep 20000
			continue reCaptchaDeteced
		}
		else
		{
			COUNTWAITS := COUNTWAITS+1
			continue reCaptchaDeteced
		}
	}	
	continue reCaptchaDeteced
;
; FIX WHEN CHECKED MARK IS SHOW BUT NOT FOUND
;
}

reCaptchaContinue:
Loop
{
	; DELAY
	WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
	SetKeyDelay %KEYSDELAY%,%PRESSDULA%
	Sleep 2000
	; DELAY	
	ImageSearch, ContinueX, ContinueY, 0, 0, 800, 600, %A_ScriptDir%\Screenshots\Continue.png
	ContinueX := ContinueX+10
	ContinueY := ContinueY+5
	MouseClick, left, %ContinueX%, %ContinueY%, 1, 10
	if (ER == 2 or ER > 2) and (COMPLETERC < 1) and (TABNUMLOCK != 2)
	{
		EE := EE+1
	}
	COUNTROUND := 0.0
	COUNTFOUND := 0	
	COUNTWAITS := 0
	CHECKTITLE := 0
	COMPLETERC := 0
	PO := 0
	ER := 0
	NO := 0
	OK := 0
	ToolTip, Check Title : reCaptchaFind, -800, 600
	;	TrayTip, Check Title, reCaptchaFind
	Sleep 2000
	WinMove, ahk_class ConsoleWindowClass ahk_exe py.exe,, 65, -20, 800, 125
	WinSet, Transparent, 150, ahk_class ConsoleWindowClass ahk_exe py.exe
	WinSet, AlwaysOnTop, Off, ahk_class ConsoleWindowClass ahk_exe py.exe
	WinSet, AlwaysOnTop, On, ahk_class MozillaWindowClass ahk_exe firefox.exe
	WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefix.exe
	WinActivate, ahk_class ConsoleWindowClass ahk_exe py.exe
	WinActivate, ahk_class MozillaWindowClass ahk_exe firefox.exe
	WinActivate, ahk_class MozillaWindowClass ahk_exe firefix.exe
	Sleep 4000
	if (TABNUMLOCK == 8) or (TABNUMLOCK > 8)
	{
		WinSet, AlwaysOnTop, Off, ahk_class ConsoleWindowClass ahk_exe py.exe
		WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefox.exe
		WinSet, AlwaysOnTop, Off, ahk_class MozillaWindowClass ahk_exe firefix.exe
		ControlSend,, {F8}, ahk_class MozillaWindowClass ahk_exe firefix.exe
		Sleep 6000
		WinMove, ahk_class MozillaWindowClass ahk_exe firefix.exe,, 0, 0, 400, 575
		WinMove, ahk_class MozillaWindowClass ahk_exe firefox.exe,, 400, 0, 400, 575
		ExitApp
	}
	continue reCaptchaFind
}


CreateFont(options="", font="") {
Loop 99 {
    g = %a_index%
    Gui %g%: +LastfoundExist
    If ! WinExist()
      break
  }
Gui, %g%: +Lastfound
Gui, %g%: Font, %options%, %font%
Gui, Add, Button
SendMessage, 0x31, 0, 0, Button1  ;WM_GETFONT
Gui, %g%: Destroy
return errorLevel
}
SetFont(ctrl, win, font=0) {
SendMessage, 0x30, %font%, 1, %ctrl%, ahk_id%win% 
return errorLevel
}

Esc::ExitApp
F4::pause, toggle

F7::
Sleep 200
ControlSend,, {LControl Down}{8}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
Sleep 200
ControlSend,, {LControl Down}{PgDn}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
Sleep 2000
ControlSend,, {F9}, ahk_class MozillaWindowClass ahk_exe firefix.exe	
Sleep 500
ControlSend,, {LControl Down}{2}{LControl Up}, ahk_class MozillaWindowClass ahk_exe firefix.exe		
Sleep 2000

;https://autohotkey.com/docs/commands/VarSetCapacity.htm
;https://autohotkey.com/docs/commands/ListVars.htm
;https://www.google.co.th/search?client=firefix-b-ab&biw=1366&bih=683&q=autohotkey+if+var+character+longer+than&oq=autohotkey+if+var+character+longer+than&gs_l=serp.3...61995.63048.0.63230.7.7.0.0.0.0.136.624.0j5.5.0....0...1c.1.64.serp..2.1.131...30i10k1.kfqj1PhwLlE