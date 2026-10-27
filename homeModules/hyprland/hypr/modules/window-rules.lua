-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	match = { class = "Bitwarden" },
	float = true,
	size = { "monitor_w*0.6", "monitor_h*0.7" },
})

hl.window_rule({
	match = { initial_title = "chatgpt.com_/" },
	float = true,
	size = { "monitor_w*0.9", "monitor_h*0.9" },
})

hl.window_rule({
	match = { initial_title = "claude.ai_/new" },
	float = true,
	size = { "monitor_w*0.9", "monitor_h*0.9" },
})

hl.window_rule({
	match = { class = "org.telegram.desktop" },
	no_screen_share = true,
	float = true,
	size = { 1309, 927 },
})

hl.window_rule({
	name = "bitwarden-web-plugin",
	match = { initial_title = "Bitwarden - Vivaldi" },
	float = true,
	size = { "monitor_w*0.6", "monitor_h*0.7" },
})

hl.window_rule({
	match = { class = "org.nmrs.ui" },
	float = true,
})

hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
	match = { class = "blueman-manager" },
	float = true,
	size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
	match = { title = "bluetui" },
	float = true,
	size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
	match = { modal = true },
	float = true,
	center = true,
})

hl.window_rule({
	match = { title = "All Files" },
	float = true,
	size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
	match = { title = "Open Files" },
	float = true,
	size = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
	match = { title = "org.kde.polkit-kde-authentication-agent-1" },
	float = true,
})

hl.window_rule({
	match = { class = "Mailspring" },
	no_screen_share = true,
})

hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.window_rule({
	match = { class = "^(steam)" },
	no_anim = true,
	no_blur = true,
	no_shadow = true,
})

hl.window_rule({
	match = { title = "^(.*Steam.*)$" },
	no_anim = true,
})

hl.window_rule({
	match = { initial_title = "DevTools" },
	float = true,
	workspace = "special:magic",
	size = { "monitor_w*0.9", "monitor_h*0.9" },
	center = true,
})

hl.window_rule({
	match = { initial_title = "Picture in picture" },
	float = true,
	size = { 477, 268 },
	move = { 1441, 32 },
	pin = true,
})
