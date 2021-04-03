minetest.register_craft({
	output = 'rangedweapons:generator',
	recipe = {
{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'rangedweapons:gunsteel_ingot', 'rangedweapons:gun_power_core', 'rangedweapons:gunsteel_ingot'},
		{'rangedweapons:gunsteel_ingot', 'rangedweapons:gunsteel_ingot', 'rangedweapons:gunsteel_ingot'},
	}
})

minetest.register_node("rangedweapons:generator", {
		description = "" ..core.colorize("#35cdff","Power particle generator\n")..core.colorize("#FFFFFF", "generates 6 power particles on top of itself, every 15 seconds"),
	tiles = {
		"rangedweapons_generator_top.png",
		"rangedweapons_generator_bottom.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png"
	},
	paramtype = "light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	on_timer = function(pos, elapsed)
		minetest.get_node_timer(pos):start(15)
		pos.y = pos.y+1
	minetest.add_item(pos, "rangedweapons:power_particle 6")
	end,
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(15)
	end,
	sounds = default.node_sound_wood_defaults(),
})




