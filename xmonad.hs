import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Loggers
import XMonad.Hooks.ManageDocks 
import XMonad.Util.WorkspaceCompare
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.LayoutHints
import XMonad.Layout.ResizableTile 
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import System.IO
import qualified Data.Map as M

main = do 
    h <- spawnPipe myBarCmd
    xmonad $ defaultConfig {
        terminal = myTerminal
        , logHook = myLogHook h
        , layoutHook = myLayout
        , manageHook = manageHook defaultConfig <+> manageDocks
        , focusFollowsMouse = myFocusFollowsMouse
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , keys = myKeys
        , workspaces = myWorkspaces
    }

myBarCmd = "xmobar"
myTerminal = "urxvtc"
myFocusFollowsMouse = False
myNormalBorderColor = "#212121"
myFocusedBorderColor = "#696969"
myWorkspaces = ["www", "term", "mail", "im"] ++ map show [5..9]

-- Layouts
myLayout = avoidStruts $ onWorkspace "im" imLayout $ standardLayouts
    where
        standardLayouts = smartBorders $ Full ||| Mirror tiled ||| tiled
        tiled = ResizableTall 1 (1/100) golden []
        golden = toRational $ 2/(1 + sqrt 5 :: Double)
        imLayout = withIM (0.15) (Role "roster") standardLayouts

-- LogHook
myLogHook h = do 

dynamicLogWithPP $ defaultPP {
                        ppCurrent = xmobarColor "#a488d9" "" . wrap "[" "]"
                        , ppHidden = xmobarColor "#8d8d8d" ""
                        , ppHiddenNoWindows = namedOnly
                        , ppSep = " : " -- PP field value separator
                        , ppTitle = xmobarColor "#d74b73" "" . shorten 80 
                        --, ppWsSep = " // " Workspace separator
                        --, ppLayout = xmobarColor "#82b414" ""
                        , ppOrder = \(ws:_:t:_) -> [ws,t]
                        , ppOutput = hPutStrLn h
                    }

    -- show only named workspaces - thanks to pbrisbin
    where
    namedOnly    ws = if any (`elem` ws) ['a'..'z'] then ws else ""

-- define key sets to change
defKeys = keys defaultConfig
delKeys x = foldr M.delete (defKeys x) (toRemove x)
myKeys x = foldr (uncurry M.insert) (delKeys x) (toAdd x)

-- remove default dmenu binding to use dmenu-xft
toRemove x = [ (modMask x, xK_p) ]

-- rebind mod+p to dmenu-xft and add xmobar-toggle
toAdd x =   [ 
            ((modMask x, xK_p), spawn myDmenu)
            ,((modMask x, xK_b     ), sendMessage ToggleStruts)
            ]
myDmenu = "dmenu_run -fn 'Consolas:size=9' -nb '#1c1c1c' -nf '#8d8d8d' -sb '#8d8d8d' -sf '#1c1c1c'"
