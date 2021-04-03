

	local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.35 then
	for _, player in pairs(minetest.get_connected_players()) do
	if player:get_wielded_item():get_name() == "rangedweapons:glock17_rld" then
		player:set_wielded_item("rangedweapons:glock17")
				minetest.sound_play("", {player})
	end
		end
			end
				end)


minetest.register_craftitem("rangedweapons:glock17_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "***RELOADING GLOCK 17 ***",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17_rld.png",
})


minetest.register_tool("rangedweapons:glock17", {
		description = "" ..core.colorize("#35cdff","Glock 17\n") ..core.colorize("#FFFFFF", "Ranged damage: 7-11\n") ..core.colorize("#FFFFFF", "Accuracy: 96%\n")     ..core.colorize("#FFFFFF", "Mob knockback: 4\n")  ..core.colorize("#FFFFFF", "Critical chance: 19%\n") ..core.colorize("#FFFFFF", "Critical damage: 12-22\n") ..core.colorize("#FFFFFF", "Ammunition: 9mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.35\n") ..core.colorize("#FFFFFF", "Gun type: Handgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 30"),
	wield_scale = {x=1.2,y=1.2,z=1.2},
	range = 0,
	inventory_image = "rangedweapons_glock17.png",
	on_use = function(itemstack, user, pointed_thing)
		timer = 0
		local inv = user:get_inventory()
		if not inv:contains_item("main", "rangedweapons:9mm 1") then
			minetest.sound_play("rangedweapons_empty", {object=user})
			return itemstack
		end
		if not minetest.setting_getbool("creative_mode") then
			inv:remove_item("main", "rangedweapons:9mm")
		end
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:glock17shot")
			if obj then
				minetest.sound_play("rangedweapons_glock", {object=obj})
				obj:setvelocity({x=dir.x * 30, y=dir.y * 30, z=dir.z * 30})
				obj:setacceleration({x=dir.x * math.random(-0.4,0.4), y=math.random(-0.4,0.4), z=dir.z * math.random(-0.4,0.4)})
				obj:setyaw(yaw + math.pi)
			pos.y = pos.y + 0
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell")
				minetest.sound_play("", {object=obj})
				obj:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:setyaw(yaw + math.pi)
			local obj = minetest.add_entity(pos, "rangedweapons:smoke")
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 0.7,
		size = 5,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "rangedweapons:glock17_rld"
				end
			end
		end
		return itemstack
	end,
})
minetest.register_craft({
	output = 'rangedweapons:glock17',
	recipe = {
		{'rangedweapons:plastic_sheet', 'rangedweapons:plastic_sheet', 'rangedweapons:plastic_sheet'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'default:diamond', 'rangedweapons:plastic_sheet'},
	}
})

local rangedweapons_glock17shot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons_invisible.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_glock17shot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.1 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:glock17shot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 19 then
					local damage = math.random(12,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=8},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(7,11)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 19 then
				local damage = math.random(12,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(7,11)
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


minetest.register_entity("rangedweapons:glock17shot", rangedweapons_glock17shot )


