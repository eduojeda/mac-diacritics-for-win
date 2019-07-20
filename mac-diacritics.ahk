; Heavily based on a script by Aaron Gustafson and "Veil"
; https://www.aaron-gustafson.com/notebook/mac-like-special-characters-in-windows/

#UseHook

; Emulate basic media player keys
^!Left::Send {Media_Prev}
^!Down::Send {Media_Play_Pause}
^!Right::Send {Media_Next}

; Emulate Mac-like input for some diacritics
primed := false

!e::primed := true
!i::primed := true
!n::primed := true
!u::primed := true

#If isDiacriticPrimed()

a::
+a::
diacritic("à,À,á,Á,â,Â,ã,Ã,ä,Ä")
return

e::
+e:: 
diacritic("è,È,é,É,ê,Ê,e,E,ë,Ë")
return

i::
+i::
diacritic("ì,Ì,í,Í,î,Î,i,I,ï,Ï")
return

o::
+o::
diacritic("ò,Ò,ó,Ó,ô,Ô,õ,Õ,ö,Ö")
return

u::
+u::
diacritic("ù,Ù,ú,Ú,û,Û,u,U,ü,Ü")
return

n::
+n::
diacritic("n,N,n,N,n,N,ñ,Ñ,n,N")
return

y::
+y::
diacritic("y,Y,y,Y,y,Y,y,Y,ÿ,Ÿ")
return

isDiacriticPrimed() {
	global primed
	if (primed) {
		primed := false
		return true
	}

	return false
}

diacritic(accentedCharacters) {
    StringSplit, char, accentedCharacters, `,
    graveOption            := char1
    graveShiftOption       := char2
    acuteOption            := char3
    acuteShiftOption       := char4
    circumflexOption       := char5
    circumflexShiftOption  := char6
    tildeOption            := char7
    tildeShiftOption       := char8
    umlautOption           := char9
    umlautShiftOption      := char10

    if (A_PriorHotKey = "!e") {
        if (GetKeyState("Shift")) {
            SendInput % acuteShiftOption
        } else {
            SendInput % acuteOption
        }
    } else if (A_PriorHotKey = "!i") {
        if (GetKeyState("Shift")) {
            SendInput % circumflexShiftOption
        } else {
            SendInput % circumflexOption
        }    
    } else if (A_PriorHotKey = "!n") {
        if (GetKeyState("Shift")) {
            SendInput % tildeShiftOption
        } else {
            SendInput % tildeOption
        }
    } else if (A_PriorHotKey = "!u") {
        if (GetKeyState("Shift")) {
            SendInput % umlautShiftOption
        } else {
            SendInput % umlautOption
        }
    }
}