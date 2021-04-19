
local S = mobs.intllib

mobs:register_mob("pv_testvieh:pv_testvieh", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	reach = 2,
	damage = 1,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.2, 0.4},
	visual = "mesh",
	mesh = "pv_testvieh.b3d",
	textures = {
		{"pv_testvieh.png"},
	},
	makes_footstep_sound = true,
--	sounds = {
--		random = "mobs_pv_testvieh",
--	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		walk_start = 0,
		walk_end = 80,
		walk_speed = 20,
		run_start = 0,
		run_end = 80,
		run_speed = 30,
	},
	follow = {
		"farming:wheat", "default:grass_1", "farming:barley",
		"farming:oat", "farming:rye"
	},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1}
	},
--	stay_near = {{"farming:straw", "group:grass"}, 10},
	fear_height = 2,
})


if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "pv_testvieh:pv_testvieh",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})
end


mobs:register_egg("pv_testvieh:pv_testvieh", S("Testvieh"), "pv_testvieh.png")
