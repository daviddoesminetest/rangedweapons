if minetest.global_exists("armor") and armor.attributes then
	table.insert(armor.attributes, "bullet_res")
	table.insert(armor.attributes, "ammo_save")
	table.insert(armor.attributes, "ranged_dmg")
end
