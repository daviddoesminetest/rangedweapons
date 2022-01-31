local weapon = dofile(modpath.."/weapon.lua")
local handgun = dofile(modpath.."/weapons".."/handgun".."/handgun.lua")

local modpath = minetest.get_modpath(minetest.get_current_modname())

local weapon_type = "handgun"
local weapon_name = "glock17"

local weapon_item_name = rangedweapons.mod_name .. ":" .. weapon_name

-- Attributes for the weapon
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
    wield_scale = {x = 1.2, y = 1.2, z =1.2}
}

glock_data.suitable_ammo = {{rangedweapons.mod_name .. ":" .. "9mm", glock_data.capacity}}

-- Populate any unset values with handgun defaults
for k,v in pairs(handgun) do
    if glock_data[k] == nil then
        glock_data[k] = v
    end
end

-- Define the Glock 17 item
minetest.register_tool("rangedweapons:glock17", {
    description = weapon.generate_description(glock_data),
	wield_scale = glock_data.default_wield_scale,
	range = 0,
	inventory_image = glock_data.texture.default,
    rw_gun_data = glock_data,
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
})

-- This is a trick that creates multiple in-game items for each step of the
-- reload animation.
minetest.register_tool("rangedweapons:glock17_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	loaded_gun = weapon_item_name,
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = glock_data.texture.reload,
})

minetest.register_tool("rangedweapons:glock17_r", {
	stack_max= 1,
	wield_scale = glock_data.wield_scale,
	description = "",
	rw_next_reload = "rangedweapons:glock17_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = glock_data.texture.default,
})

minetest.register_tool("rangedweapons:glock17_rr", {
	stack_max= 1,
	wield_scale = glock_data.default_wield_scale,
	description = "",
	rw_next_reload = "rangedweapons:glock17_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = glock_data.texture.default,
})

minetest.register_tool("rangedweapons:glock17_rrr", {
	stack_max= 1,
	wield_scale = glock_data.default_wield_scale,
	description = "",
	rw_next_reload = "rangedweapons:glock17",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = glock_data.texture.reload,
})



-- Crafting recipe for the Glock 17
minetest.register_craft({
	output = weapon_item_name,
	recipe = {
		{"rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:diamond", "rangedweapons:plastic_sheet"},
	}
})
