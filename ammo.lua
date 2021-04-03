
minetest.register_craftitem("rangedweapons:9mm", {
	stack_max= 10000,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","9mm round\n")..core.colorize("#FFFFFF", "Ammunition for handguns, machine-pistols and rarely sub-machineguns"),
	inventory_image = "rangedweapons_9mm.png",
})


minetest.register_craft({
	output = 'rangedweapons:9mm 30',
	recipe = {
		{'default:steel_ingot', '', ''},
		{'tnt:gunpowder', '', ''},
		{'default:copper_ingot', '', ''},
	}
})

minetest.register_craftitem("rangedweapons:10mm", {
	stack_max= 1500,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","10mm round\n")..core.colorize("#FFFFFF", "Ammunition for sub-machineguns"),
	inventory_image = "rangedweapons_10mm.png",
})


minetest.register_craft({
	output = 'rangedweapons:10mm 60',
	recipe = {
		{'', 'default:bronze_ingot', ''},
		{'default:steel_ingot', 'tnt:gunpowder', 'default:steel_ingot'},
		{'default:steel_ingot', 'tnt:gunpowder', 'default:steel_ingot'},
	}
})


minetest.register_craftitem("rangedweapons:357", {
	stack_max= 250,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff",".357 magnum round\n")..core.colorize("#FFFFFF", "Ammunition for magnums/revolvers"),
	inventory_image = "rangedweapons_357.png",
})


minetest.register_craft({
	output = 'rangedweapons:357 15',
	recipe = {
		{'default:copper_ingot', '', ''},
		{'tnt:gunpowder', '', ''},
		{'default:gold_ingot', '', ''},
	}
})

minetest.register_craftitem("rangedweapons:726mm", {
	stack_max= 2000,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","7.26mm round\n")..core.colorize("#FFFFFF", "Ammunition for Heavy machineguns and some assault rifles"),
	inventory_image = "rangedweapons_762mm.png",
})


minetest.register_craft({
	output = 'rangedweapons:726mm 50',
	recipe = {
		{'default:bronze_ingot', 'tnt:gunpowder', 'default:bronze_ingot'},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
	}
})

minetest.register_craftitem("rangedweapons:556mm", {
	stack_max= 1000,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","5.56mm round\n")..core.colorize("#FFFFFF", "Ammunition for most assault rifles"),
	inventory_image = "rangedweapons_556mm.png",
})


minetest.register_craft({
	output = 'rangedweapons:556mm 75',
	recipe = {
		{'', 'default:gold_ingot', ''},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
	}
})

minetest.register_craftitem("rangedweapons:shell", {
	stack_max= 84,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","12 gauge shell\n")..core.colorize("#FFFFFF", "Ammunition for shotguns"),
	inventory_image = "rangedweapons_shell.png",
})


minetest.register_craft({
	output = 'rangedweapons:shell 12',
	recipe = {
		{'default:bronze_ingot', 'default:steel_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'tnt:gunpowder', 'default:bronze_ingot'},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
	}
})

minetest.register_craftitem("rangedweapons:308winchester", {
	stack_max= 120,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","308.winchester round\n")..core.colorize("#FFFFFF", "Ammunition for rifles"),
	inventory_image = "rangedweapons_308winchester.png",
})


minetest.register_craft({
	output = 'rangedweapons:308winchester 15',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:bronze_ingot', 'tnt:gunpowder', 'default:bronze_ingot'},
		{'default:gold_ingot', 'tnt:gunpowder', 'default:gold_ingot'},
	}
})

minetest.register_craftitem("rangedweapons:40mm", {
	stack_max= 48,
	wield_scale = {x=0.8,y=0.8,z=2.4},
		description = "" ..core.colorize("#35cdff","40mm grenade\n")..core.colorize("#FFFFFF", "Ammunition for grenade launchers"),
	inventory_image = "rangedweapons_40mm.png",
})


minetest.register_craft({
	output = 'rangedweapons:40mm 6',
	recipe = {
		{'', 'default:gold_ingot', ''},
		{'default:steel_ingot', 'tnt:gunpowder', 'default:steel_ingot'},
		{'tnt:gunpowder', 'default:bronze_ingot', 'tnt:gunpowder'},
	}
})

minetest.register_craftitem("rangedweapons:rocket", {
	stack_max= 25,
	wield_scale = {x=1.2,y=1.2,z=2.4},
		description = "" ..core.colorize("#35cdff","Rocket\n")..core.colorize("#FFFFFF", "Ammunition for rocket launchers"),
	inventory_image = "rangedweapons_rocket.png",
})


minetest.register_craft({
	output = 'rangedweapons:rocket 1',
	recipe = {
		{'', '', 'rangedweapons:40mm'},
		{'', 'tnt:gunpowder', ''},
		{'default:steel_ingot', '', ''},
	}
})