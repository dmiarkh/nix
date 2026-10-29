-- https://wiki.hypr.land/Configuring/Basics/Binds/

local mod = "SUPER"

local programs = require("modules.common.globals").programs
local exec = require("modules.common.utils").exec
local joinStrings = require("modules.common.utils").join_strings
local launch = require("modules.common.utils").terminalLaunch
local browserProfile1 = " --profile-directory='Profile 1'"
local browserProfile2 = " --profile-directory='Profile 2'"
local browserProfile3 = " --profile-directory='Profile 3'"
local floatRules = { float = true, size = { "monitor_w*0.9", "monitor_h*0.9" }, center = true }
local mediumFloatRules = { float = true, size = { "monitor_w*0.7", "monitor_h*0.7" }, center = true }
local smallFloatRules = { float = true, size = { 622, 652 }, center = true }

local function webapp(link)
	return " --new window --app=" .. link
end

local function k(keysTable)
	return joinStrings(keysTable, " + ")
end

hl.bind(k({ mod, "RETURN" }), exec(programs.terminal))
hl.bind(k({ mod, "Q" }), hl.dsp.window.close())
hl.bind(k({ mod, "SHIFT", "J" }), hl.dsp.window.cycle_next())
hl.bind(k({ mod, "E" }), exec(programs.terminal .. launch("yazi"), floatRules))
-- hl.bind(k({ mod, "B" }), exec(programs.terminal .. launch("bluetui"), mediumFloatRules))
hl.bind(k({ mod, "SHIFT", "E" }), exec(programs.file_manager, floatRules))
hl.bind(k({ mod, "W" }), exec(programs.browser .. browserProfile2))
hl.bind(k({ mod, "SHIFT", "W" }), exec(programs.browser .. browserProfile1))
hl.bind(k({ mod, "G" }), exec(programs.browser .. browserProfile2 .. webapp("https://chatgpt.com")))
hl.bind(k({ mod, "SHIFT", "G" }), exec(programs.browser .. browserProfile2 .. webapp("https://claude.ai/new")))
hl.bind(k({ mod, "M" }), exec(programs.browser .. browserProfile3 .. webapp("https://music.youtube.com")))
hl.bind(
	k({ mod, "SHIFT", "M" }),
	exec(programs.browser .. browserProfile2 .. webapp("https://www.youtube.com/watch?v=9HeGgJSyVec"))
)
hl.bind(
	k({ mod, "A" }),
	exec(
		"google-chrome-stable --auto-open-devtools-for-tabs --disable-features=CalculateNativeWinOcclusion http://localhost:5173"
	)
)
hl.bind(
	k({ mod, "A" }),
	exec(
		"google-chrome-stable --user-data-dir='/tmp/chrome-dev-profile' --disable-features=CalculateNativeWinOcclusion --no-first-run --no-default-browser-check --disable=metrics http://localhost:5173"
	)
)
hl.bind(
	k({ mod, "U" }),
	exec(programs.terminal .. " --background-opacity=1.0" .. launch("nvim $HOME/Notes/Today.md"), floatRules)
)
hl.bind(k({ mod, "R" }), exec(programs.terminal .. launch("newsraft"), floatRules))
hl.bind(k({ mod, "P" }), exec(programs.terminal .. launch("$HOME/.scripts/tmux.sh"), smallFloatRules))
hl.bind(k({ mod, "O" }), function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(k({ mod, "CTRL", "P" }), hl.dsp.window.pseudo())
hl.bind(k({ mod, "I" }), hl.dsp.layout("togglesplit"))
hl.bind(
	k({ mod, "SHIFT", "SPACE" }),
	hl.dsp.exec_cmd("rofi -modi emoji -show emoji -kb-secondary-copy '' -kb-custom-1 Ctrl+c -matching normal")
)
hl.bind(k({ mod, "F" }), hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(k({ mod, "CTRL", "F" }), hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(k({ mod, "C" }), exec(programs.terminal .. launch("calc"), smallFloatRules))
hl.bind(k({ mod, "SHIFT", "C" }), exec("hyprpicker -a"))
hl.bind(k({ mod, "T" }), exec(programs.terminal .. launch("btm"), floatRules))
-- hl.bind("Print", exec("$HOME/.scripts/screenshot.sh"))
-- hl.bind(k({ mod, "SHIFT", "L" }), exec("hyprlock"))
-- hl.bind(k({ mod, "SPACE" }), hl.dsp.exec_cmd(programs.launcher_menu))
-- hl.bind(k({ mod, "TAB" }), hl.dsp.exec_cmd("rofi -show window"))
-- hl.bind(k({ mod, "N" }), hl.dsp.exec_cmd("swaync-client -t"))
-- hl.bind(k({ mod, "SHIFT", "N" }), hl.dsp.exec_cmd("swaync-client -C"))
-- hl.bind(k({ mod, "D" }), hl.dsp.exec_cmd("~/.scripts/hyprsunset-rofi.sh"))
-- hl.bind(k({ mod, "V" }), exec(programs.terminal .. launch("clipse"), smallFloatRules))

hl.bind(k({ mod, "H" }), hl.dsp.focus({ direction = "left" }))
hl.bind(k({ mod, "J" }), hl.dsp.focus({ direction = "down" }))
hl.bind(k({ mod, "K" }), hl.dsp.focus({ direction = "up" }))
hl.bind(k({ mod, "L" }), hl.dsp.focus({ direction = "right" }))

hl.bind(k({ mod, "CTRL", "H" }), hl.dsp.window.move({ direction = "left" }))
hl.bind(k({ mod, "CTRL", "J" }), hl.dsp.window.move({ direction = "down" }))
hl.bind(k({ mod, "CTRL", "K" }), hl.dsp.window.move({ direction = "up" }))
hl.bind(k({ mod, "CTRL", "L" }), hl.dsp.window.move({ direction = "right" }))

hl.bind(k({ mod, "ALT", "H" }), hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
hl.bind(k({ mod, "ALT", "J" }), hl.dsp.window.resize({ x = 0, y = 30, relative = true }))
hl.bind(k({ mod, "ALT", "K" }), hl.dsp.window.resize({ x = 0, y = -30, relative = true }))
hl.bind(k({ mod, "ALT", "L" }), hl.dsp.window.resize({ x = 30, y = 0, relative = true }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(k({ mod, key }), hl.dsp.focus({ workspace = i }))
	hl.bind(k({ mod, "CTRL", key }), hl.dsp.window.move({ workspace = i }))
end

hl.bind(k({ mod, "S" }), hl.dsp.workspace.toggle_special("magic"))
hl.bind(k({ mod, "CTRL", "S" }), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(k({ mod, "mouse_down" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(k({ mod, "mouse_up" }), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(k({ mod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
hl.bind(k({ mod, "mouse:273" }), hl.dsp.window.resize(), { mouse = true })

-- Noctalia
local ipc = "noctalia msg "

hl.bind(k({ mod, "SPACE" }), hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(k({ mod, "TAB" }), hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind(k({ mod, "N" }), hl.dsp.exec_cmd(ipc .. "panel-toggle control-center notifications"))
hl.bind(k({ mod, "D" }), hl.dsp.exec_cmd(ipc .. "notification-dnd-toggle"))
hl.bind(k({ mod, "SHIFT", "N" }), hl.dsp.exec_cmd(ipc .. "notification-clear-history"))
hl.bind(k({ mod, "CTRL", "N" }), hl.dsp.exec_cmd(ipc .. "media next-player"))
hl.bind(k({ mod, "V" }), exec(ipc .. "panel-toggle clipboard"))
hl.bind(k({ mod, "SHIFT", "L" }), exec(ipc .. "session lock"))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(ipc .. "media stop"), { locked = true })
hl.bind("code:191", hl.dsp.exec_cmd("~/.scripts/swayosd.sh backward"), { repeating = true, locked = true })
hl.bind("code:192", hl.dsp.exec_cmd("~/.scripts/swayosd.sh forward"), { repeating = true, locked = true })

-- Sound
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "mic-mute"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { repeating = true, locked = true })

-- -- Sound
-- hl.bind(
-- 	"XF86AudioRaiseVolume",
-- 	hl.dsp.exec_cmd(programs.swayosd .. " --output-volume raise"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	hl.dsp.exec_cmd(programs.swayosd .. " --output-volume lower"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd(programs.swayosd .. " --output-volume mute-toggle"), { locked = true })
-- hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(programs.swayosd .. " --input-volume mute-toggle"), { locked = true })
--
-- -- Brightness
-- hl.bind(
-- 	"XF86MonBrightnessUp",
-- 	hl.dsp.exec_cmd(programs.swayosd .. " --brightness raise"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86MonBrightnessDown",
-- 	hl.dsp.exec_cmd(programs.swayosd .. " --brightness lower"),
-- 	{ locked = true, repeating = true }
-- )

-- -- # Media
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(programs.swayosd .. " --playerctl play-pause"))
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd(programs.swayosd .. " --playerctl play-pause"))
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("~/.scripts/swayosd.sh next"))
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("~/.scripts/swayosd.sh previous"))
-- hl.bind("code:191", hl.dsp.exec_cmd("~/.scripts/swayosd.sh backward"), { repeating = true })
-- hl.bind("code:192", hl.dsp.exec_cmd("~/.scripts/swayosd.sh forward"), { repeating = true })
