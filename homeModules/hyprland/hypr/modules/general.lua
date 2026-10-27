-- https://wiki.hypr.land/Configuring/Basics/Variables/#general

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,

		border_size = 2,

		col = {
			active_border = "rgba(b4befeFF)",
			inactive_border = "rgba(b4befe00)",
		},

		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		-- allow_tearing = false,

		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true,
	},

	decoration = {
		rounding = 6,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.95,
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = false,
		key_press_enables_dpms = true,
	},

	cursor = {
		no_warps = true,
		inactive_timeout = 3,
	},

	ecosystem = {
		no_donation_nag = true,
	},
})
