minetest.register_craft({
	output = 'rangedweapons:rpk',
	recipe = {
		{'default:diamond', 'default:mese', ''},
		{'default:steel_ingot', 'default:steelblock', 'default:tree'},
		{'', 'default:diamond', 'default:steel_ingot'},
	}
})

	minetest.register_craftitem("rangedweapons:rpk", {
	stack_max= 1,
	wield_scale = {x=2.5,y=2.5,z=1.5},
		description = "" ..core.colorize("#35cdff","RPK\n") ..core.colorize("#FFFFFF", "Ranged damage: 2-5\n") ..core.colorize("#FFFFFF", "Accuracy: 55%\n") ..core.colorize("#FFFFFF", "Mob knockback: 2\n")  ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical damage: 4-9\n")  ..core.colorize("#FFFFFF", "Ammunition: 7.26mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.05\n") ..core.colorize("#FFFFFF", "Gun type: heavy machinegun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 30"),
	range = 0,
	inventory_image = "rangedweapons_rpk.png",
})

local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.05 then
	for _, player in pairs(minetest.get_connected_players()) do
			local inv = player:get_inventory()
			local controls = player:get_player_control()
			if controls.LMB then
			timer = 0
	local wielded_item = player:get_wielded_item():get_name()
		if wielded_item == "rangedweapons:rpk" then
			if not inv:contains_item("main", "rangedweapons:726mm") then
minetest.sound_play("rangedweapons_empty", {object=player})
		else
		if wielded_item == "rangedweapons:rpk" then
		inv:remove_item("main", "rangedweapons:726mm")
		local pos = player:getpos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:rpkshot")
			if obj then
				minetest.sound_play("rangedweapons_machinegun", {object=obj})
				obj:setvelocity({x=dir.x * 30, y=dir.y * 30, z=dir.z * 30})
				obj:setacceleration({x=dir.x * math.random(-4.5,4.5), y=math.random(-4.5,4.5), z=dir.z * math.random(-4.5,4.5)})
				obj:setyaw(yaw + math.pi)
			pos.y = pos.y + 0
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell")
				minetest.sound_play("", {object=obj})
				obj:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:setyaw(yaw + math.pi)
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 0.25,
		size = 4,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
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

local rangedweapons_rpkshot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons_invisible.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_rpkshot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.11 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:rpkshot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 8 then
					local damage = math.random(4,9)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=4},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(2,5)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 2},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 8 then
				local damage = math.random(4,9)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(2,5)
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



minetest.register_entity("rangedweapons:rpkshot", rangedweapons_rpkshot )