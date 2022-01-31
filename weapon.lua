local modpath = minetest.get_modpath(minetest.get_current_modname())
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


function weapon.get_texture_name(weapon_name, texture_name)
    return constants.mod_name .. "_" .. weapon_name .. "_" .. texture_name
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
            color_text = core.colorize(rangedweapons.colors.white, v)
        end

        description = description .. color_text
    end

    return description

end

function weapon.eject_shell(itemstack, player, rld_item, rld_time, rldsound, shell)
    itemstack:set_name(rld_item)
    local meta = player:get_meta()
    meta:set_float("rw_cooldown", rld_time)

    local gunMeta = itemstack:get_meta()

    local bulletStack = ItemStack({name = gunMeta:get_string("RW_ammo_name")})

    minetest.sound_play(rldsound, {player})
    local pos = player:get_pos()
    local dir = player:get_look_dir()
    local yaw = player:get_look_horizontal()
    if pos and dir and yaw then
        pos.y = pos.y + 1.6
        local obj = minetest.add_entity(pos, "rangedweapons:empty_shell")

        if AmmoCaps and bulletStack ~= "" then
            AmmoCaps = bulletStack:get_definition().RW_ammo_capabilities

            local bullet_shell_visual = "wielditem"
            local bullet_shell_texture = "rangedweapons:shelldrop"

            bullet_shell_visual = AmmoCaps.shell_visual or "wielditem"
            bullet_shell_texture = AmmoCaps.shell_texture or "rangedweapons:shelldrop"

            obj:set_properties({textures = {bullet_shell_texture}})
            obj:set_properties({visual = bullet_shell_visual})
        end
        if obj then
            obj:set_velocity({x = dir.x * -10, y = dir.y * -10, z = dir.z * -10})
            obj:set_acceleration({x = dir.x * -5, y = -10, z = dir.z * -5})
            obj:set_yaw(yaw + math.pi)
        end
    end
end

return weapon
