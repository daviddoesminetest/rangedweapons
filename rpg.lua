minetest.register_craft({
	output = 'rangedweapons:rpg_uld',
	recipe = {
		{'default:diamond', 'default:steel_ingot', ''},
		{'default:steelblock', 'default:tree', 'default:diamondblock'},
		{'default:diamond', 'default:tree', ''},
	}
})

minetest.register_craftitem("rangedweapons:rpg_uld", {
	stack_max= 1,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	range = 0,
		description = "" ..core.colorize("#35cdff","rpg\n") ..core.colorize("#FFFFFF", "Explosion radius: 3\n")  ..core.colorize("#FFFFFF", "Ammunition: rockets\n") ..core.colorize("#FFFFFF", "Reload time: 1.0\n") ..core.colorize("#be0d00", "The gun is NOT loaded! (Right-click to load)\n")..core.colorize("#FFFFFF", "Gun type:Rocket launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 15"),
	inventory_image = "rangedweapons_rpg.png",
	on_use = function(user)
		minetest.sound_play("rangedweapons_empty", {user})
	end,
})

	local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.001 then
	for _, player in pairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		local controls = player:get_player_control()
		if player:get_wielded_item():get_name() == "rangedweapons:rpg_uld" 
		and inv:contains_item("main", "rangedweapons:rocket")then
		if controls.RMB then
		inv:remove_item("main", "rangedweapons:rocket")
		player:set_wielded_item("rangedweapons:rpg_rld")
				end
		timer = 0
				minetest.sound_play("", {player})



	end

	if timer >= 1.25 and
		 player:get_wielded_item():get_name() == "rangedweapons:rpg_rld" then
		player:set_wielded_item("rangedweapons:rpg")
		timer = 0
				minetest.sound_play("rangedweapons_reload_b", {player})



		end
			end
				end
				end)


minetest.register_craftitem("rangedweapons:rpg_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	description = "**RELOADING rpg**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_rpg.png",
})


minetest.register_tool("rangedweapons:rpg", {
		description = "" ..core.colorize("#35cdff","rpg\n") ..core.colorize("#FFFFFF", "Explosion radius: 3\n") ..core.colorize("#FFFFFF", "Ammunition: rockets\n") ..core.colorize("#FFFFFF", "Reload time: 1.0\n") ..core.colorize("#27a600", "The gun is loaded!\n")..core.colorize("#FFFFFF", "Gun type:Rocket launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 15"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=2.5,y=2.5,z=3.75},
	inventory_image = "rangedweapons_rpg_rld.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:rocket")
			if obj then
				minetest.sound_play("rangedweapons_rocket", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:setyaw(yaw + math.pi)
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 1.5,
		size = 10,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:rpg_uld"
				end
			end
		end
		return itemstack
	end,
})




