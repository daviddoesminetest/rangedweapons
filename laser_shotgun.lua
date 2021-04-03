minetest.register_craft({
	output = 'rangedweapons:laser_shotgun',
	recipe = {
		{'rangedweapons:ultra_gunsteel_ingot', 'rangedweapons:gun_power_core', 'rangedweapons:ultra_gunsteel_ingot'},
		{'rangedweapons:gun_power_core', 'rangedweapons:gun_power_core', 'rangedweapons:ultra_gunsteel_ingot'},
		{'', 'rangedweapons:ultra_gunsteel_ingot', 'rangedweapons:ultra_gunsteel_ingot'},
	}
})

	minetest.register_craftitem("rangedweapons:laser_shotgun", {
	stack_max= 1,
	wield_scale = {x=2.0,y=2.0,z=1.75},
		description = "" ..core.colorize("#35cdff","Laser shotgun\n") ..core.colorize("#FFFFFF", "Ranged damage: 15-26 X 5\n") ..core.colorize("#FFFFFF", "accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 0\n")  ..core.colorize("#FFFFFF", "Critical chance: 12%\n") ..core.colorize("#FFFFFF", "Critical damage: 31-59 X 5\n")  ..core.colorize("#FFFFFF", "Power usage: 7\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.75\n") ..core.colorize("#FFFFFF", "Gun type: power shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 15"),
	range = 0,
	inventory_image = "rangedweapons_laser_shotgun.png",
})

local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.75 then
	for _, player in pairs(minetest.get_connected_players()) do
			local inv = player:get_inventory()
			local controls = player:get_player_control()
			if controls.LMB then
			timer = 0
	local wielded_item = player:get_wielded_item():get_name()
		if wielded_item == "rangedweapons:laser_shotgun" then
			if not inv:contains_item("main", "rangedweapons:power_particle 7") then
minetest.sound_play("rangedweapons_empty", {object=player})
		else
		if wielded_item == "rangedweapons:laser_shotgun" then
		inv:remove_item("main", "rangedweapons:power_particle 7")
		local pos = player:getpos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:laser_shotgunshot")
			if obj then
				minetest.sound_play("rangedweapons_laser", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:setacceleration({x=dir.x * math.random(0,0), y=math.random(0,0), z=dir.z * math.random(0,0)})
				obj:setyaw(yaw + math.pi)
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:laser_shotgunshot")
				minetest.sound_play("rangedweapons_laser", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 18})
				obj:setacceleration({x=dir.x * math.random(0,0), y=math.random(0,0), z=dir.z * math.random(0,0)})
				obj:setyaw(yaw + math.pi)
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:laser_shotgunshot")
				minetest.sound_play("rangedweapons_laser", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 21})
				obj:setacceleration({x=dir.x * math.random(0,0), y=math.random(0,0), z=dir.z * math.random(0,0)})
				obj:setyaw(yaw + math.pi)
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:laser_shotgunshot")
				minetest.sound_play("rangedweapons_laser", {object=obj})
				obj:setvelocity({x=dir.x * 18, y=dir.y * 15, z=dir.z * 15})
				obj:setacceleration({x=dir.x * math.random(0,0), y=math.random(0,0), z=dir.z * math.random(0,0)})
				obj:setyaw(yaw + math.pi)
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:laser_shotgunshot")
				minetest.sound_play("rangedweapons_laser", {object=obj})
				obj:setvelocity({x=dir.x * 21, y=dir.y * 15, z=dir.z * 15})
				obj:setacceleration({x=dir.x * math.random(0,0), y=math.random(0,0), z=dir.z * math.random(0,0)})
				obj:setyaw(yaw + math.pi)

				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or player

				end
			end
		end
	end
end

end
	end
		end
			end
				end)

local rangedweapons_laser_shotgunshot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons_invisible.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_laser_shotgunshot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.22 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:laser_shotgunshot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 12 then
					local damage = math.random(31,59)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=0},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(15,26)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 0},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 12 then
				local damage = math.random(31,59)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(15,26)
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
		expirationtime = 0.2,
		size = 7,
		collisiondetection = false,
		vertical = false,
		texture = "rangedweapons_ray_green.png",
		glow = 30,
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
		if node.name == "rangedweapons:barrel" then
		minetest.get_node_timer(pos):start(0)
		end
		self.object:remove()
	end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end
end
end



minetest.register_entity("rangedweapons:laser_shotgunshot", rangedweapons_laser_shotgunshot )