local modpath = minetest.get_modpath(minetest.get_current_modname())

minetest.register_node("rangedweapons:antigun_block", {
	description = core.colorize(ranged_weapons.colors.title_color, "Anti-gun block\n") .. core.colorize(ranged_weapons.colors.white, "Prevents people from using guns, in 10 node radius to each side from this block"),
	tiles = {"rangedweapons_antigun_block.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_wood_defaults(),
})
