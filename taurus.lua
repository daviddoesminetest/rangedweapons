minetest.register_craft({
	output = 'rangedweapons:taurus_uld',
	recipe = {
{'rangedweapons:gunsteel_ingot', 'default:mese_crystal', 'default:mese_crystal_fragment'},
{'rangedweapons:gunsteel_ingot', 'default:diamondblock', 'rangedweapons:gunsteel_ingot'},
		{'', 'rangedweapons:gunsteel_ingot', 'rangedweapons:plastic_sheet'},
	}
})

minetest.register_craft({
	output = 'rangedweapons:taurus_uld',
	recipe = {
{'moreores:silver_ingot', 'default:mese_crystal', 'default:mese_crystal_fragment'},
{'moreores:silver_ingot', 'default:diamondblock', 'moreores:silver_ingot'},
		{'', 'moreores:silver_ingot', 'rangedweapons:plastic_sheet'},
	}
})

minetest.register_craftitem("rangedweapons:taurus_uld", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	range = 0,
		description = "" ..core.colorize("#35cdff","Taurus\n") ..core.colorize("#FFFFFF", "Ranged damage: 14-24\n") ..core.colorize("#FFFFFF", "Accuracy: 95%\n") ..core.colorize("#FFFFFF", "Mob knockback: 10\n") ..core.colorize("#FFFFFF", "Critical chance: 36%\n") ..core.colorize("#FFFFFF", "Critical damage: 30-50\n") ..core.colorize("#FFFFFF", "Ammunition: .357 Magnum rounds\n") ..core.colorize("#FFFFFF", "Reload time: 0.35\n") ..core.colorize("#be0d00", "The gun is NOT loaded! (Right-click to load)\n")..core.colorize("#FFFFFF", "Gun type: Revolver\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55"),
	inventory_image = "rangedweapons_taurus.png",
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
		if player:get_wielded_item():get_name() == "rangedweapons:taurus_uld" 
		and inv:contains_item("main", "rangedweapons:357")then
		if controls.RMB then
		inv:remove_item("main", "rangedweapons:357")
		player:set_wielded_item("rangedweapons:taurus_rld")
		local pos = player:getpos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell")
				minetest.sound_play("", {object=obj})
				obj:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or player
				end
			end
		timer = 0
				minetest.sound_play("rangedweapons_reload_b", {player})

end
	end

	if timer >= 0.35 and
		 player:get_wielded_item():get_name() == "rangedweapons:taurus_rld" then
		player:set_wielded_item("rangedweapons:taurus")
		timer = 0
				minetest.sound_play("rangedweapons_reload_a", {player})



		end
			end
				end
				end)


minetest.register_craftitem("rangedweapons:taurus_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	description = "**RELOADING COLT taurus**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_taurus_rld.png",
})


minetest.register_tool("rangedweapons:taurus", {
		description = "" ..core.colorize("#35cdff","Taurus \n") ..core.colorize("#FFFFFF", "Ranged damage: 14-24\n")..core.colorize("#FFFFFF", "Accuracy: 95%\n") ..core.colorize("#FFFFFF", "Mob knockback: 10\n") ..core.colorize("#FFFFFF", "Critical chance: 36%\n") ..core.colorize("#FFFFFF", "Critical damage: 30-50\n") ..core.colorize("#FFFFFF", "Ammunition: .357 Magnum rounds\n") ..core.colorize("#FFFFFF", "Reload time: 0.35\n") ..core.colorize("#27a600", "The gun is loaded!\n")..core.colorize("#FFFFFF", "Gun type: Revolver\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=1.25,y=1.25,z=1.1},
	inventory_image = "rangedweapons_taurus.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:taurusshot")
			if obj then
				minetest.sound_play("rangedweapons_revolver", {object=obj})
				obj:setvelocity({x=dir.x * 55, y=dir.y * 55, z=dir.z * 55})
				obj:setacceleration({x=dir.x * math.random(-0.5,0.5), y=math.random(-0.5,0.5), z=dir.z * math.random(-0.5,0.5)})
				obj:setyaw(yaw + math.pi)
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 1.5,
		size = 8,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:taurus_uld"
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_taurusshot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons_invisible.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_taurusshot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.06 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:taurusshot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 36 then
					local damage = math.random(30,50)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 20},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(14,24)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 10},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 36 then
				local damage = math.random(30,50)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(14,24)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
				end
			end
		if timer >= 0.002 + tiem then
	minetest.add_particle({
		pos = pos,
		velocity = 0,
          acceleration = {x=0, y=0, z=0},
		expirationtime = 0.06,
		size = 3,
		collisiondetection = false,
		vertical = false,
		texture = "rangedweapons_bullet_fly.png",
		glow = 15,
	})
		tiem = tiem + 0.002 
			end
		if self.timer >= 4.0 then
		self.object:remove()
			end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
			if not minetest.setting_getbool("creative_mode") then
			end
			minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
		if node.name == "rangedweapons:barrel" or
		node.name == "doors:door_glass_a" or
		node.name == "doors:door_glass_b" or
		node.name == "xpanes:pane" or
		node.name == "xpanes:pane_flat" or
		node.name == "vessels:drinking_glass" or
		node.name == "vessels:glass_bottle" or
		   node.name == "default:glass" then
		minetest.get_node_timer(pos):start(0)
		end
		self.object:remove()
	end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end
end
end



minetest.register_entity("rangedweapons:taurusshot", rangedweapons_taurusshot )


