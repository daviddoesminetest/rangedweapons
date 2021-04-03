

minetest.register_craftitem("rangedweapons:shell_shotgundrop", {
	wield_scale = {x=2.5,y=1.5,z=1.0},
	inventory_image = "rangedweapons_shelldrop_shotgun.png",
})

minetest.register_craftitem("rangedweapons:shell_whitedrop", {
	wield_scale = {x=2.5,y=1.5,z=1.0},
	inventory_image = "rangedweapons_shelldrop_white.png",
})

minetest.register_craftitem("rangedweapons:shell_grenadedrop", {
	wield_scale = {x=2.5,y=1.5,z=3.0},
	inventory_image = "rangedweapons_shelldrop_grenade.png",
})

minetest.register_craftitem("rangedweapons:shelldrop", {
	wield_scale = {x=2.5,y=1.5,z=1.0},
	inventory_image = "rangedweapons_shelldrop.png",
})

minetest.register_craftitem("rangedweapons:plastic_sheet", {
		description = "" ..core.colorize("#35cdff","Black plastic sheet\n")..core.colorize("#FFFFFF", "Used in guncraft"),
	inventory_image = "rangedweapons_plastic_sheet.png",
})

minetest.register_craftitem("rangedweapons:gunsteel_ingot", {
		description = "" ..core.colorize("#35cdff","GunSteel ingot\n")..core.colorize("#FFFFFF", "A strong, but light alloy, used in guncraft"),
	inventory_image = "rangedweapons_gunsteel_ingot.png",
})
minetest.register_craft({
	output = "rangedweapons:gunsteel_ingot",
	recipe = {
		{"default:steel_ingot", "default:tin_ingot", "default:coal_lump"},
	}
})
minetest.register_craftitem("rangedweapons:ultra_gunsteel_ingot", {
		description = "" ..core.colorize("#35cdff","Ultra-GunSteel ingot\n")..core.colorize("#FFFFFF", "A even stronger alloy, for even stronger guns."),
	inventory_image = "rangedweapons_ultra_gunsteel_ingot.png",
})
minetest.register_craft({
	output = "rangedweapons:ultra_gunsteel_ingot",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"default:gold_ingot", "rangedweapons:gunsteel_ingot", "default:gold_ingot"},
		{"", "default:diamond", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:plastic_sheet",
	recipe = {
		{"default:tree", "default:coal_lump", "default:tree"},
		{"default:coal_lump", "default:tree", "default:coal_lump"},
	}
})
minetest.register_craftitem("rangedweapons:gun_power_core", {
		description = "" ..core.colorize("#35cdff","Gun Power Core\n")..core.colorize("#FFFFFF", "A powerful core, for making the most powerful weapons"),
	inventory_image = "rangedweapons_gun_power_core.png",
})
minetest.register_craft({
	output = "rangedweapons:gun_power_core",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:goldblock", "rangedweapons:gunsteel_ingot"},
		{"default:diamondblock", "default:mese", "default:diamondblock"},
		{"rangedweapons:gunsteel_ingot", "default:goldblock", "rangedweapons:gunsteel_ingot"},
	}
})
minetest.register_craftitem("rangedweapons:power_particle", {
		description = "" ..core.colorize("#35cdff","Power Particle\n")..core.colorize("#FFFFFF", "A power unit, that strangelly can be carryed arround with no vessel, used by power guns"),
	stack_max = 10000,
	inventory_image = "rangedweapons_power_particle.png",
})

local rangedweapons_smoke = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.5, y=0.5},
	textures = {"tnt_smoke.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_smoke.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)
	if self.lastpos.x ~= nil then
		if self.timer > 0.30 then
		self.object:remove()
			end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end



minetest.register_entity("rangedweapons:smoke", rangedweapons_smoke )

