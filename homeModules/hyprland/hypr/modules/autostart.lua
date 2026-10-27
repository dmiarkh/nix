-- https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("modules.common.globals").programs
local exec_prefix = require("modules.common.globals").exec_prefix
local launch = require("modules.common.utils").terminalLaunch

hl.on("hyprland.start", function()
	-- hl.exec_cmd("hyprctl setcursor 'Bibata-Modern-Classic' 24")
	-- hl.exec_cmd(exec_prefix .. "/usr/lib/polkit-kde-authentication-agent-1")
	-- hl.exec_cmd(exec_prefix .. "noctalia")
	-- hl.exec_cmd(exec_prefix .. "clipse -listen")
	-- hl.exec_cmd(exec_prefix .. "awww-daemon")
	-- hl.exec_cmd(exec_prefix .. "swayosd-server")
	-- hl.exec_cmd(exec_prefix .. "mailspring --password-store='gnome-libsecret'", { workspace = "5 silent" })
	hl.exec_cmd(exec_prefix .. programs.terminal .. launch("tmux new -s terminal"), { workspace = "2 silent" })
	hl.exec_cmd(exec_prefix .. "mailspring", { workspace = "5 silent" })
	hl.exec_cmd(exec_prefix .. "Telegram", { workspace = "10 silent" })
end)
