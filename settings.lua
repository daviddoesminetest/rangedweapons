
rweapons_player_dmg_multiplier = 1.0
rweapons_mob_dmg_multiplier = 1.0
rweapons_headshot_dmg_multiplier = 1.75
rweapons_max_gun_efficiency = 300
rweapons_min_gun_efficiency = 40
rweapons_bloodyness = 10

rweapons_gun_crafting = "true"
rweapons_gun_durability = "true"
rweapons_shurikens = "true"
rweapons_handguns = "true"
rweapons_forceguns = "true"
rweapons_javelins = "true"
rweapons_power_weapons = "true"
rweapons_machine_pistols = "true"
rweapons_shotguns = "true"
rweapons_auto_shotguns = "true"
rweapons_smgs = "true"
rweapons_rifles = "true"
rweapons_assault_rifles = "true"
rweapons_heavy_machineguns = "true"
rweapons_revolvers = "true"
rweapons_explosives = "true"
rweapons_glass_breaking = "true"
rweapons_door_breaking = "true"
rweapons_other_weapon_crafting = "true"
rweapons_ammo_crafting = "true"
rweapons_item_crafting = "true"

-- Add this table to the rangedweapons global (when we get to that)
--rangedweapons.settings = {}
--local settings = rangedweapons.settings
local settings = {}

-- Encapsulate the data into cagegories (e.g. rangedweapons.settings.dmg_multiplier.mob_dmg)
settings.dmg_multiplier = {}
local dmg_multiplier = settings.dmg_multiplier
dmg_multiplier.player_dmg = minetest.settings:get("rangedweapons.player_dmg_multiplier")
if dmg_multiplier.player_dmg == nil then
    dmg_multiplier.player_dmg = 1.0
    minetest.settings:set("rangedweapons.player_dmg_multiplier", dmg_multiplier.player_dmg)
else
    dmg_multiplier.player_dmg = tonumber(dmg_multiplier.player_dmg)
end

dmg_multiplier.mob_dmg = minetest.settings:get("rangedweapons.mob_dmg_multiplier")
if dmg_multiplier.mob_dmg == nil then
    dmg_multiplier.mob_dmg = 1.0
    minetest.settings:set("rangedweapons.mob_dmg_multiplier", dmg_multiplier.mob_dmg)
else
    dmg_multiplier.mob_dmg = tonumber(dmg_multiplier.mob_dmg)
end

dmg_multiplier.headshot_dmg = minetest.settings:get("rangedweapons.headshot_dmg_multiplier")
if dmg_multiplier.headshot_dmg == nil then
    dmg_multiplier.headshot_dmg = 1.75
    minetest.settings:set("rangedweapons.headshot_dmg_multiplier", dmg_multiplier.headshot_dmg)
else
    dmg_multiplier.headshot_dmg = tonumber(dmg_multiplier.headshot_dmg)
end

-- (e.g. rangedweapons.settings.crafting.ammo_crafting)
settings.crafting = {}
local crafting = settings.crafting
crafting.gun_crafting = minetest.settings:get_bool("rangedweapons.gun_crafting")
if crafting.gun_crafting == nil then
    crafting.gun_crafting = true
    minetest.settings:set_bool("rangedweapons.gun_crafting", crafting.gun_crafting)
end

crafting.ammo_crafting = minetest.settings:get_bool("rangedweapons.ammo_crafting")
if crafting.ammo_crafting == nil then
    crafting.ammo_crafting = true
    minetest.settings:set_bool("rangedweapons.ammo_crafting", crafting.ammo_crafting)
end

crafting.item_crafting = minetest.settings:get_bool("rangedweapons.item_crafting")
if crafting.item_crafting == nil then
    crafting.item_crafting = true
    minetest.settings:set_bool("rangedweapons.item_crafting", crafting.item_crafting)
end

-- Formerly called rangedweapons.other_weapon_crafting
crafting.gun_parts_crafting = minetest.settings:get_bool("rangedweapons.gun_parts_crafting")
if crafting.gun_parts_crafting == nil then
    crafting.gun_parts_crafting = true
    minetest.settings:set_bool("rangedweapons.gun_parts_crafting", crafting.gun_parts_crafting)
end

-- (e.g. rangedweapons.settings.skills.min_gun_efficiency)
settings.skills = {}
local skills = settings.skills
skills.max_gun_efficiency = minetest.settings:get("rangedweapons.max_gun_efficiency")
if skills.max_gun_efficiency == nil then
    skills.max_gun_efficiency = 300
    minetest.settings:set("rangedweapons.max_gun_efficiency", skills.max_gun_efficiency)
else
    skills.max_gun_efficiency = tonumber(skills.max_gun_efficiency)
end

skills.min_gun_efficiency = minetest.settings:get("rangedweapons.min_gun_efficiency")
if skills.min_gun_efficiency == nil then
    skills.min_gun_efficiency = 40
    minetest.settings:set("rangedweapons.min_gun_efficiency", skills.min_gun_efficiency)
else
    skills.min_gun_efficiency = tonumber(skills.min_gun_efficiency)
end

-- (e.g. rangedweapons.settings.gore.bloodyness)
settings.gore = {}
local gore = settings.gore
gore.bloodyness = minetest.settings:get("rangedweapons.bloodyness")
if gore.bloodyness == nil then
    gore.bloodyness = 10
    minetest.settings:set("rangedweapons.bloodyness", gore.bloodyness)
else
    gore.bloodyness = tonumber(gore.bloodyness)
end

-- (e.g. rangedweapons.settings.durability.gun_durability)
settings.durability = {}
local durability = settings.durability
durability.gun_durability = minetest.settings:get_bool("rangedweapons.gun_durability")
if durability.gun_durability == nil then
    durability.gun_durability = true
    minetest.settings:set_bool("rangedweapons.gun_durability", durability.gun_durability)
end

-- (e.g. rangedweapons.settings.node_dmgs.break_glass)
settings.node_dmgs = {}
local node_dmgs = settings.node_dmgs
node_dmgs.break_glass = minetest.settings:get_bool("rangedweapons.break_glass")
if node_dmgs.break_glass == nil then
    node_dmgs.break_glass = true
    minetest.settings:set_bool("rangedweapons.break_glass", node_dmgs.break_glass)
end

node_dmgs.break_doors = minetest.settings:get_bool("rangedweapons.break_doors")
if node_dmgs.break_doors == nil then
    node_dmgs.break_doors = true
    minetest.settings:set_bool("rangedweapons.break_doors", node_dmgs.break_doors)
end

-- (e.g. rangedweapons.settings.categories.sniper_rifles)
settings.categories = {}
local cats = settings.categories
cats.throwables = minetest.settings:get_bool("rangedweapons.throwables")
if cats.throwables == nil then
    cats.throwables = true
    minetest.settings:set_bool("ranged.weapons.throwables", cats.throwables)
end

cats.handguns = minetest.settings:get_bool("rangedweapons.handguns")
if cats.handguns == nil then
    cats.handguns = true
    minetest.settings:set_bool("rangedweapons.handguns", cats.handguns)
end

cats.revolvers = minetest.settings:get_bool("rangedweapons.revolvers")
if cats.revolvers == nil then
    cats.revolvers = true
    minetest.settings:set_bool("rangedweapons.revolvers", cats.revolvers)
end

-- Sub Machine Guns
cats.smgs = minetest.settings:get_bool("rangedweapons.smgs")
if cats.smgs == nil then
    cats.smgs = true
    minetest.settings:set_bool("rangedweapons.smgs", cats.smgs)
end

-- Machine Pistols
cats.mps = minetest.settings:get_bool("rangedweapons.mps")
if cats.mps == nil then
    cats.mps = true
    minetest.settings:set_bool("rangedweapons.mps", cats.mps)
end

-- Machine Guns (Heavy)
cats.mgs = minetest.settings:get_bool("rangedweapons.mgs")
if cats.mgs == nil then
    cats.mgs = true
    minetest.settings:set_bool("rangedweapons.mgs", cats.mgs)
end

-- Shotguns (Pump Action)
cats.shotguns = minetest.settings:get_bool("rangedweapons.shotguns")
if cats.shotguns == nil then
    cats.shotguns = true
    minetest.settings:set_bool("rangedweapons.shotguns", cats.shotguns)
end

-- Shotguns (Fully automatic)
cats.auto_shotguns = minetest.settings:get_bool("rangedweapons.auto_shotguns")
if cats.auto_shotguns == nil then
    cats.auto_shotguns = true
    minetest.settings:set_bool("rangedweapons.auto_shotguns", cats.auto_shotguns)
end

-- Assault Rifles (Fully automatic)
cats.auto_rifles = minetest.settings:get_bool("rangedweapons.auto_rifles")
if cats.auto_rifles == nil then
    cats.auto_rifles = true
    minetest.settings:set_bool("rangedweapons.rifles", cats.auto_rifles)
end

-- Horse shoes & Hand grenades (Minus the Horse shoes)
cats.explosives = minetest.settings:get_bool("rangedweapons.explosives")
if cats.explosives == nil then
    cats.explosives = true
    minetest.settings:set_bool("rangedweapons.explosives", cats.explosives)
end

-- Laser weapons (Include Power Generator here)
cats.power_weapons = minetest.settings:get_bool("rangedweapons.power_weapons")
if cats.power_weapons == nil then
    cats.power_weapons = true
    minetest.settings:set_bool("rangedweapons.power_weapons", cats.power_weapons)
end

-- May the shwartz be with you
cats.force_guns = minetest.settings:get_bool("rangedweapons.force_guns")
if cats.force_guns == nil then
    cats.force_guns = true
    minetest.settings:set_bool("rangedweapons.force_guns", cats.force_guns)
end
