-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
	input = {
		kb_layout = "us, ua",
		kb_options = "grp:alt_shift_toggle",

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
