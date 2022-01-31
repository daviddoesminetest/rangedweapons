local weapon_type = "handgun"
local weapon_name = "glock17"

local modpath = minetest.get_modpath(minetest.get_current_modname())

local item = dofile(modpath.."/item.lua")
local weapon = dofile(modpath.."/weapon.lua")
local handgun = dofile(modpath.."/weapons".."/handgun".."/handgun.lua")
local colors = dofile(modpath.."/colors.lua")
local constants = dofile(modpath.."/constants.lua")

local glock_data = {
    name = "Glock 17",
    capacity = 17,
    ammunition_string = "9mm Ammo",
    texture = {
        icon = "rangedweapons_glock17_icon.png",
        default = "rangedweapons_glock17.png",
        reload = "rangedweapons_glock17_rld.png",
    },
    fire_sound = "rangedweapons_glock",
}

glock_data["suitable_ammo"] = {{"rangedweapons:9mm",glock_data["capacity"]}}

-- Populate any unset values with handgun defaults
for k,v in pairs(handgun) do
    if glock_data[k] == nil then
        glock_data[k] = v
    end
end

minetest.register_tool("rangedweapons:glock17_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	loaded_gun = "rangedweapons:glock17",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = glock_data["texture"]["reload"],
})


minetest.register_tool("rangedweapons:glock17_r", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17.png",
})

minetest.register_tool("rangedweapons:glock17_rr", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17.png",
})

minetest.register_tool("rangedweapons:glock17_rrr", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17_rld.png",
})




minetest.register_tool("rangedweapons:glock17", {
    description = weapon.generate_description(glock_data),
	wield_scale = {x=1.2,y=1.2,z=1.2},
	range = 0,
	inventory_image = glock_data["texture"]["default"],
    rw_gun_data = {
            gun_damage = {fleshy=5,knockback=4},
            gun_crit = 15,
            gun_critEffc = 2.2,
            suitable_ammo = {{"rangedweapons:9mm",17},{"rangedweapons:10mm",17},{"rangedweapons:45acp",17}},
            gun_skill = {"handgun_skill",45},
            gun_magazine = "rangedweapons:handgun_mag_black",
            gun_icon = "rangedweapons_glock17_icon.png",
            gun_unloaded = "rangedweapons:glock17_r",
            gun_cooling = "rangedweapons:glock17_rld",
            gun_velocity = 30,
            gun_accuracy = 96,
            gun_cooldown = 0.35,
            gun_reload = 0.9/4,
            gun_projectiles = 1,
            has_shell = 1,
            gun_durability = 1400,
            gun_smokeSize = 5,
            gun_unload_sound = "rangedweapons_handgun_mag_out",
            gun_sound = "rangedweapons_glock",
        },
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
})
