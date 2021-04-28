

if minetest.get_modpath("doors") then

minetest.override_item("doors:door_wood_a", {
	on_timer = function(pos)
		minetest.swap_node(pos, {name = "air"})
		minetest.add_item(pos, "default:wood 5")
		minetest.sound_play("rangedweapons_woodbreak",{pos})
	end,
})

minetest.override_item("doors:door_wood_b", {
	on_timer = function(pos)
		minetest.swap_node(pos, {name = "air"})
		minetest.add_item(pos, "default:wood 5")
		minetest.sound_play("rangedweapons_woodbreak",{pos})
	end,
})

end
