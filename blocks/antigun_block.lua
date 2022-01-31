minetest.register_node("rangedweapons:antigun_block", {
	description = "" ..core.colorize("#35cdff","Anti-gun block\n")..core.colorize("#FFFFFF", "Prevents people from using guns, in 10 node radius to each side from this block"),
	tiles = {"textures/blocks/antigun_block.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_wood_defaults(),
})
