-- base
import XMonad
import XMonad.Layout

-- toggleStruts
import XMonad.Hooks.ManageDocks

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.ResizableTile

-- for customizing keybinds
import qualified Data.Map as M

-- main --
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

-- configs --
myConfig = defaultConfig {
        terminal = terminal'
        , layoutHook = layoutHook'
        , manageHook = manageHook defaultConfig <+> manageDocks
        --, manageHook = manageHook' <+> manageHook defaultConfig <+> manageDocks
        , startupHook = setWMName "LG3D"
        , focusFollowsMouse = focusFollowsMouse'
        , normalBorderColor = normalBorderColor'
        , focusedBorderColor = focusedBorderColor'
        , keys = \c -> keys' c `M.union` keys defaultConfig c
        , workspaces = workspaces'
    }

-- terminal --
terminal' = "urxvtc"

-- dmenu --
dmenuXFT = "exe=`dmenu_run -b -fn 'Consolas-12'"
         ++ " -nb '#586E75' -nf '#fdf6e3' -sb '#fdf6e3' -sf '#586E75'` &&"
         ++ " eval \"exec $exe\""

-- keys --
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
keys' XConfig {XMonad.modMask = modm} = M.fromList $ [ ((modm, xK_p), spawn dmenuXFT) ]

-- focus --
focusFollowsMouse' = False

-- colors --
normalBorderColor' = "#eee8d5"
focusedBorderColor' = "#cb4b16"

-- workspaces --
workspaces' = ["www", "term", "mail", "im"] ++ map show [5..9]

-- layouts --
layoutHook' = avoidStruts $ onWorkspace "im" imLayout $ standardLayouts
    where
        standardLayouts = smartBorders $ Full ||| Mirror tiled ||| tiled
        tiled = ResizableTall 1 (1/100) golden []
        golden = toRational $ 2/(1 + sqrt 5 :: Double)
        imLayout = withIM (0.15) (Role "roster") standardLayouts

-- manageHook --
--manageHook' = composeAll
--    [ className =? "Gajim.py" --> doShift "im"
--    , (className =? "Gajim.py" <&&> role =? "messages") --> doFloat ]
--    where
--        role = stringProperty "WM_WINDOW_ROLE"

-- bar --
myPP = defaultPP {
        ppCurrent = xmobarColor "#fdf6e3" "#b58900" . pad
        , ppHidden = xmobarColor "#585858" "" . pad
        , ppHiddenNoWindows = xmobarColor "#657b83" "" . namedOnly . pad
        , ppSep = " · " -- PP field value separator
        , ppTitle = xmobarColor "#fdf6e3" "" . shorten 80
        , ppWsSep = "" -- Workspace separator
        , ppOrder = \(ws:_:t:_) -> [ws,t]
    }
    -- display only named workspaces
    where
        namedOnly  ws = if any (`elem` ws) ['a'..'z'] then ws else ""
