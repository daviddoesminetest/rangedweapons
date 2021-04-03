minetest.register_craft({
	output = 'rangedweapons:jackhammer',
	recipe = {
		{'', 'rangedweapons:gunsteel_ingot', 'rangedweapons:gunsteel_ingot'},
		{'default:mese', 'default:steelblock', 'default:diamondblock'},
		{'', 'default:mese', 'default:diamondblock'},
	}
})

	minetest.register_craftitem("rangedweapons:jackhammer", {
	stack_max= 1,
	wield_scale = {x=2.6,y=2.6,z=1.8},
		description = "" ..core.colorize("#35cdff","Jackhammer\n") ..core.colorize("#FFFFFF", "Ranged damage: 5-12 X 15\n") ..core.colorize("#FFFFFF", "Accuracy: 70%\n") ..core.colorize("#FFFFFF", "Mob knockback: 3\n")..core.colorize("#FFFFFF", "Critical chance: 5%\n") ..core.colorize("#FFFFFF", "Critical damage: 13-25 X 15\n")  ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shells\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.35\n") ..core.colorize("#FFFFFF", "Gun type: Auto-shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	range = 0,
	inventory_image = "rangedweapons_jackhammer.png",
})

local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.35 then
	for _, player in pairs(minetest.get_connected_players()) do
			local inv = player:get_inventory()
			local controls = player:get_player_control()
			if controls.LMB then
			timer = 0
	local wielded_item = player:get_wielded_item():get_name()
		if wielded_item == "rangedweapons:jackhammer" then
			if not inv:contains_item("main", "rangedweapons:shell") then
minetest.sound_play("rangedweapons_empty", {object=player})
		else
		if wielded_item == "rangedweapons:jackhammer" then
		inv:remove_item("main", "rangedweapons:shell")
		local pos = player:getpos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
			if obj then
				minetest.sound_play("rangedweapons_shotgun_shot", {object=obj})
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
------------------------------------------------------------
			local obj = minetest.add_entity(pos, "rangedweapons:jackhammershot")
				obj:setvelocity({x=dir.x * math.random(23,27), y=dir.y * math.random(23,27), z=dir.z * math.random(23,27)})
				obj:setacceleration({x=dir.x * math.random(-3.0,3.0), y=math.random(-3.0,3.0), z=dir.z * math.random(-3.0,3.0)})
			pos.y = pos.y + 0
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell_shotgun")
				minetest.sound_play("", {object=obj})
				obj:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
				obj:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
				obj:setyaw(yaw + math.pi)
	minetest.add_particle({
		pos = pos,
		velocity = {x=dir.x * 3, y=dir.y * 3, z=dir.z * 3} ,
          	acceleration = {x=dir.x * -4, y=2, z=dir.z * -4},
		expirationtime = 0.5,
		size = 6,
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

local rangedweapons_jackhammershot = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"rangedweapons_buckball.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_jackhammershot.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.17 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:jackhammershot" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 5 then
					local damage = math.random(13,25)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=6},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(5,12)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback = 3},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 5 then
				local damage = math.random(13,25)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(5,12)
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



minetest.register_entity("rangedweapons:jackhammershot", rangedweapons_jackhammershot )