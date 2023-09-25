#NoEnv
#SingleInstance force
#UseHook
#InstallKeybdHook

SendMode Input

SetCapslockState, AlwaysOff  ;; deactivate normal capslock 

~Capslock::
    
    ;; Sending down as many modifiers as possible, so that the likelyhood
    ;;   of a subsequently pressed Key doing something is minimized
    ;; [!notice] We cant include the Win key, since Win 11 can appearently ignore other 
    ;;           modifiers when one of its internal Shortcuts are activated

    Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}

    ;; When Capslook is released => Release the Modifiers too
    KeyWait, Capslock
    Send {Ctrl Up}{Shift Up}{Alt Up}

    ;; When Capslock was pressed and released on its own, send ESC instead
    ;; ( For all our VIM friends out their ;-) )
    if (A_PriorKey = "Capslock") {
	  ;; Send (Space) if Capslock was pressed by itself
        Send {Esc}
    }
return

;;=============================================================================
;; Mappings go here (Prefix them with ~Capslock & 
;; popular hotkeys with hyper
;;
;; example:
;;-----------------------------------------------------------------------------
;;  ~Capslock & c:: Send ^{c}
;;  ~Capslock & v:: Send ^{v}
;;=============================================================================

~Capslock & h:: SendRaw {
~Capslock & j:: SendRaw }
~Capslock & -:: Send \

~Capslock & z:: Send [
~Capslock & u:: Send ]

~Capslock & n:: Send <
~Capslock & m:: Send >     
~Capslock & i:: Send |

~Capslock & +:: Send {^}{space}
~Capslock & #:: Send ``{space}

~Capslock & Enter:: Send {=}>
~Capslock & ä:: Send ->