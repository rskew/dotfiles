import           System.IO
import           XMonad
import           XMonad.Actions.NoBorders
import           XMonad.Actions.SpawnOn
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Hooks.UrgencyHook
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import qualified XMonad.StackSet                     as W
import           XMonad.Util.EZConfig                (additionalKeys)
import           XMonad.Util.Run                     (spawnPipe)

myExtraWorkspaces = [(xK_0, "0"),(xK_minus, "-"),(xK_equal, "=")]

myWorkspaces = ["1","2","3","4","5","6","7","8","9"] ++ (map snd myExtraWorkspaces)

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/rowan/.xmobarrc"
  xmonad $ withUrgencyHook NoUrgencyHook $ docks defaultConfig
      { borderWidth        = 3
      , terminal           = "/home/rowan/documents/code/scripts/i3-shell/i3-shell.sh"
      , normalBorderColor  = "#cccccc"
      , focusedBorderColor = "#0080b0"
      , workspaces = myWorkspaces
      --, manageHook = manageSpawn <+> manageDocks <+> manageHook defaultConfig
      , manageHook = mWManager
      , layoutHook = mkToggle (single NBFULL) $ avoidStruts  $  layoutHook defaultConfig
      , handleEventHook = fullscreenEventHook
      , startupHook = setWMName "LG3D"
      , logHook = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      --, ppTitle = xmobarColor "green" "" . shorten 0 --50
                      , ppTitle = xmobarColor "green" "" . (\s->"Moon")
                      , ppUrgent = xmobarColor "yellow" "red" . wrap ">" "<" . xmobarStrip
                      }
      } `additionalKeys` (myKeys)

myKeys =
      [ ((mod1Mask .|. shiftMask, xK_z), spawn "/home/rowan/documents/code/scripts/lock.sh")
      , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
      , ((0, xK_Print), spawn "scrot")
      ] ++ [
        ((mod1Mask, key), (windows $ W.greedyView ws))
        | (key,ws) <- myExtraWorkspaces
      ] ++ [
        ((mod1Mask .|. shiftMask, key), (windows $ W.shift ws))
        | (key,ws) <- myExtraWorkspaces
      ] ++ [
        ((mod1Mask .|. shiftMask, xK_i),
         (do
             spawnOn "1" "chromium"
             spawnOn "2" "urxvt -name autofocus --hold -e zsh -c 'vim /home/rowan/autofocus-home.md'"
             spawnOn "3" "urxvt -name mainterm --hold"
             --spawnOn "4" "xournal /home/rowan/documents/ideas/drawings/template.xoj"
             spawnOn "5" "urxvt --hold -e 'alsamixer'"
             spawnOn "-" "freeplane"
         ))
      ] ++ [
        ((mod1Mask, xK_f), (sendMessage $ Toggle NBFULL))
      ]


mWManager :: ManageHook
mWManager = composeAll . concat $
            [ [manageHook defaultConfig]
            , [manageDocks]
            -- windows that should be sent to a workspace
            , [className =? "Chromium"    --> doShift "1"]
            , [resource =? "autofocus"    --> doShift "2"]
            , [resource =? "mainterm"     --> doShift "3"]
            , [className =? "inkscape"     --> doShift "4"]
            , [title =? "alsamixer"       --> doShift "5"]
            , [className =? "Freeplane"   --> doShift "-"]
            -- Below gets chrome_app_list to properly float
            , [(stringProperty "WM_WINDOW_ROLE") =? "bubble"  --> doFloat]
            , [(stringProperty "WM_WINDOW_ROLE") =? "pop-up"  --> doFloat]
            ]
