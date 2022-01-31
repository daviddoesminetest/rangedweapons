local weapon_type = "handgun"
local weapon_name = "beretta"

local modpath = minetest.get_modpath(minetest.get_current_modname())

local item = dofile(modpath.."/item.lua")
local weapon = dofile(modpath.."/weapon.lua")
local handgun = dofile(modpath.."/weapons".."/handgun".."/handgun.lua")
local colors = dofile(modpath.."/colors.lua")
local constants = dofile(modpath.."/constants.lua")

local beretta_data = {
    name = "Beretta 92",
    capacity = 15,
    ammunition_string = "9mm Ammo",
    texture = {
        icon = weapon.get_texture_name(weapon_type, weapon_name, "icon.png"),
        default = weapon.get_texture_name(weapon_type, weapon_name, "texture.png"),
        reload = weapon.get_texture_name(weapon_type, weapon_name, "reload.png"),
    },
    --unloaded = constants.mod_name .. ":beretta_r",
    unloaded = "rangedweapons:beretta_r",
    --cooling = constants.mod_name .. ":beretta_rld",
    cooling = "rangedweapons:beretta_rld",
    fire_sound = "rangedweapons_beretta",
}

beretta_data["suitable_ammo"] = {{"rangedweapons:9mm",beretta_data["capacity"]}}

-- Populate any unset values with handgun defaults
for k,v in pairs(handgun) do
    if beretta_data[k] == nil then
        beretta_data[k] = v
    end
end

minetest.register_tool("rangedweapons:beretta_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	range = 0,
	loaded_gun = "rangedweapons:beretta",
	groups = {not_in_creative_inventory = 1},
    inventory_image = beretta_data["texture"]["reload"]
})

minetest.register_tool("rangedweapons:beretta_r", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	rw_next_reload = "rangedweapons:beretta",
	load_sound = handgun["load_sound"],
	range = 0,
	groups = {not_in_creative_inventory = 1},
    inventory_image = beretta_data["texture"]["reload"]
})

minetest.register_tool("rangedweapons:beretta", {
    description = weapon.generate_description(beretta_data),
	wield_scale = {x=1.1,y=1.1,z=1.05},
	range = 0,
    inventory_image = beretta_data["texture"]["default"],
    RW_gun_capabilities = beretta_data,
	on_secondary_use = function(itemstack, user, pointed_thing)
        rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
})

