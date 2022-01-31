local modpath = minetest.get_modpath(minetest.get_current_modname())
local colors = dofile(modpath.."/colors.lua")
local constants = dofile(modpath.."/constants.lua")

local weapon = {}

weapon.weapons = {
    handgun = {'glock17', 'luger', 'makarov', 'deagle', 'beretta', 'm1991'},
    revolver = {'python', 'taurus'},
    rifle = {},
    auto_rifle = {'ak47', 'g36', 'm16', 'scar'},
    sniper_rifle = {'awp', 'm200'},
    shotgun = {'remington', 'spas12', 'benelli'},
    auto_shotgun = {'aa12', 'jackhammer'},
    machine_gun = {'rpk', 'm60', 'minigun'},
    machine_pistol = {'tmp', 'uzi', 'tec9'},
    sub_machine_gun = {'mp40', 'mp5', 'kriss_sv', 'ump', 'thompson'},
    force_weapon = {'forcegun'},
    power_weapon = {'laser_blaster', 'laser_rifle', 'laser_shotgun'},
    throwable = {'shuriken', 'javelin'},
    explosive = {'m79', 'milkor', 'rpg', 'hand_grenade'}
}

weapon.weapons_directory = "weapons"

function weapon.get_weapon_path(modpath, weapon_type, weapon_name)
    return modpath .. "/" .. weapon.weapons_directory .. "/" .. weapon_type .. "/" .. weapon_name .. ".lua"
end


function weapon.get_texture_name(weapon_type, weapon_name, texture_name)
    return constants.mod_name .. "_" .. weapon_type .. "_" .. weapon_name .. "_" .. texture_name
end


function weapon.generate_description(weapon_data)
    local description = ""
    local text = {
        string.format("%s", weapon_data["name"]),
        string.format("Damage: %d", weapon_data["damage"]),
        string.format("Accuracy: %d", weapon_data["accuracy"]).."%",
        string.format("Velocity: %d", weapon_data["velocity"]),
        string.format("Knockback: %d", weapon_data["knock_back"]),
        string.format("Critical chance: %d", weapon_data["critical_chance"]).."%",
        string.format("Critical efficiency: %d", weapon_data["critical_efficiency"]),
        string.format("Reload delay: %.2f", weapon_data["reload_delay"]),
        string.format("Capacity: %d", weapon_data["capacity"]),
        string.format("Ammunition: %s", weapon_data["ammunition_string"]),
        string.format("Rate of fire: %.2f", weapon_data["fire_rate"]),
    }

    for i,v in ipairs(text) do
        if i == 0 then
            color_text = core.colorize(item.title_color, v)
        else
            color_text = core.colorize(colors.white, v)
        end

        description = description .. color_text
    end

    return description

end

return weapon
