-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({
	match = { namespace = "rofi" },
	no_anim = true,
})

hl.layer_rule({
	match = { namespace = "noctalia-panel" },
	no_anim = true,
})
