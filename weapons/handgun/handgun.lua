-- General defaults for a handgun.

local handgun = {
    damage = 4,
    knock_back=4,
    critical_chance = 15,
    critical_efficiency = 2,
    velocity = 25,
    skill = {"handgun_skill",43},
    magazine = "rangedweapons:handgun_mag_black",
    accuracy = 94,
    fire_rate = 0.9,
    cooldown = 0.4,
    reload_delay = 0.5,
    projectiles = 1,
    has_shell = 1,
    durability = 1150,
    smoke_size = 5,
    unload_sound = "rangedweapons_handgun_mag_out",
}

return handgun
