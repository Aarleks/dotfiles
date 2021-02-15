import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run -- for spawnPipe
import XMonad.Util.EZConfig
import System.IO -- for hPutStrLn for xmobar
import qualified XMonad.StackSet as W


-- MY DEFAULTS --
-----------------
myModMask = mod4Mask       -- Sets modkey to super/windows key
myTerminal = "alacritty"   -- Sets default terminal
myBorderWidth = 1          -- Sets border width for windows
myNormColor   = "#282C34"  -- Border color of normal windows
myFocusColor  = "#B48EAD"  -- Border color of focused windows

myKeys =
    [("M-C-q", spawn "xmonad --recompile; xmonad --restart")
    , ("M-b", spawn "dbus-send --session --dest=org.Xmobar.Control --type=method_call --print-reply '/org/Xmobar/Control' org.Xmobar.Control.SendSignal 'string:Toggle 0'" >> sendMessage ToggleStruts)
    ]

myWorkspaces = ["tty","2","3","4","5","6","7","8","9"]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaultConfig
        { manageHook = manageHook defaultConfig -- make sure to include myManageHook definition from above
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#8FBCBB" "" . shorten 50
                        }
        , modMask = myModMask
	, borderWidth = myBorderWidth
	, normalBorderColor = myNormColor
	, focusedBorderColor = myFocusColor
	, workspaces = myWorkspaces
        }
	`additionalKeysP` myKeys

