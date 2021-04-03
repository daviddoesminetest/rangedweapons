minetest.register_craft({
	output = "rangedweapons:spas12_uld",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese", "default:diamond"},
		{"rangedweapons:plastic_sheet", "default:diamond", "default:steel_ingot"},
	}
})

minetest.register_craftitem("rangedweapons:spas12_uld", {
	stack_max= 1,
	wield_scale = {x=2.1,y=2.1,z=1.25},
	range = 0,
		description = "" ..core.colorize("#35cdff","Franchi SPAS-12\n") ..core.colorize("#FFFFFF", "Ranged damage: 4-10 X 12\n") ..core.colorize("#FFFFFF", "Accuracy: 67%\n") ..core.colorize("#FFFFFF", "Mob knockback: 7\n") ..core.colorize("#FFFFFF", "Critical chance: 5%\n") ..core.colorize("#FFFFFF", "Critical damage: 10-22 X 12\n") ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shells\n") ..core.colorize("#FFFFFF", "Reload time: 0.45\n") ..core.colorize("#be0d00", "The gun is NOT loaded! (Right-click to load)\n")..core.colorize("#FFFFFF", "Gun type: shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	inventory_image = "rangedweapons_spas12.png",
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
		if player:get_wielded_item():get_name() == "rangedweapons:spas12_uld" 
		and inv:contains_item("main", "rangedweapons:shell")then
		if controls.RMB then
		inv:remove_item("main", "rangedweapons:shell")
		player:set_wielded_item("rangedweapons:spas12_rld")
		local pos = player:getpos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell_shotgun")
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
				minetest.sound_play("rangedweapons_shotgun_reload_a", {player})

end
	end

	if timer >= 0.45 and
		 player:get_wielded_item():get_name() == "rangedweapons:spas12_rld" then
		player:set_wielded_item("rangedweapons:spas12")
		timer = 0
				minetest.sound_play("rangedweapons_shotgun_reload_b", {player})



		end
			end
				end
				end)


minetest.register_craftitem("rangedweapons:spas12_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=2.1,y=2.1,z=1.25},
	description = "**RELOADING FRANCHI SPAS-12**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_spas12_rld.png",
})


minetest.register_tool("rangedweapons:spas12", {
		description = "" ..core.colorize("#35cdff","Franchi SPAS-12\n") ..core.colorize("#FFFFFF", "Ranged damage: 4-10 X 12\n") ..core.colorize("#FFFFFF", "Accuracy: 67%\n")..core.colorize("#FFFFFF", "Mob knockback: 7\n") ..core.colorize("#FFFFFF", "Critical chance: 5%\n") ..core.colorize("#FFFFFF", "Critical damage: 10-22 X 12\n") ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shells\n") ..core.colorize("#FFFFFF", "Reload time: 0.45\n") ..core.colorize("#27a600", "The gun is loaded!\n")..core.colorize("#FFFFFF", "Gun type: shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=2.1,y=2.1,z=1.25},
	inventory_image = "rangedweapons_spas12.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
			if obj then
				minetest.sound_play("rangedweapons_shotgun_shot", {object=obj})
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:spas12shot")
				obj:setvelocity({x=dir.x * math.random(18,22), y=dir.y * math.random(18,22), z=dir.z * math.random(18,22)})
				obj:setacceleration({x=dir.x * math.random(-3.3,3.3), y=math.random(-3.3,3.3), z=dir.z * math.random(-3.3,3.3)})
-----------------------------------------------------
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 1.25,
		size = 10,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:spas12_uld"
				end
			end
		end
		return itemstack
	end,
})

local rangedweapons_spas12shot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"rangedweapons_buckball.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_spas12shot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.225 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.25)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:spas12shot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 5 then
					local damage = math.random(10,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 14},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(4,10)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 7},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 5 then
				local damage = math.random(10,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(4,10)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
				end
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
		node.name == "doors:door_wood_a" or
		node.name == "doors:door_wood_b" or
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



minetest.register_entity("rangedweapons:spas12shot", rangedweapons_spas12shot )


