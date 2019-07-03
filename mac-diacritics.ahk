; Heavily based on a script by Aaron Gustafson and "Veil"
; https://www.aaron-gustafson.com/notebook/mac-like-special-characters-in-windows/

; Disable script when running a fullscreen app to avoid capturing keystrokes in games
#If ActiveWidth() != A_ScreenWidth and ActiveHeight() != A_ScreenHeight

#UseHook

; Emulate basic media player keys
^!Left::Send {Media_Prev}
^!Down::Send {Media_Play_Pause}
^!Right::Send {Media_Next}

; Emulate Mac-like input for some diacritics
!e::Return          ; acute
!i::Return          ; circumflex
!n::Return          ; tilde
!u::Return          ; umlaut

a::
+a::
diacritic("a","à,À,á,Á,â,Â,ã,Ã,ä,Ä")
return

e::
+e:: 
diacritic("e","è,È,é,É,ê,Ê,e,E,ë,Ë")
return

i::
+i::
diacritic("i","ì,Ì,í,Í,î,Î,i,I,ï,Ï")
return

o::
+o::
diacritic("o","ò,Ò,ó,Ó,ô,Ô,õ,Õ,ö,Ö")
return

u::
+u::
diacritic("u","ù,Ù,ú,Ú,û,Û,u,U,ü,Ü")
return

n::
+n::
diacritic("n","n,N,n,N,n,N,ñ,Ñ,n,N")
return

y::
+y::
diacritic("y","y,Y,y,Y,y,Y,y,Y,ÿ,Ÿ")
return

diacritic(regular,accentedCharacters) {
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
    
    if (A_PriorHotKey = "!e" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % acuteShiftOption
        } else {
            SendInput % acuteOption
        }
    } else if (A_PriorHotKey = "!i" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % circumflexShiftOption
        } else {
            SendInput % circumflexOption
        }    
    } else if (A_PriorHotKey = "!n" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % tildeShiftOption
        } else {
            SendInput % tildeOption
        }
    } else if (A_PriorHotKey = "!u" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % umlautShiftOption
        } else {
            SendInput % umlautOption
        }
    } else {
        if (GetKeyState("Shift") or GetKeyState("Capslock","T")) {
            SendInput % "+" regular
        } else {
            SendInput % regular
        }
    }
}

ActiveWidth() {
  WinGetPos, , , w, , A
  return w
}

ActiveHeight() {
  WinGetPos, , , , h, A
  return h
}