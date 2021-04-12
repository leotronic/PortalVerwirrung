
local S = mobs.intllib

local dirt_types = {

	{	nodes = {"ethereal:dry_dirt"},
		skins = {"mobs_dirt_monster3.png"},
		drops = {
			{name = "ethereal:dry_dirt", chance = 1, min = 0, max = 2}
		}
	}
}



mobs:register_mob("pv_lavamonster:pv_lavamonster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "pv_lavamonster.b3d",
	textures = {
		{"pv_lavamonster.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:dirt", chance = 1, min = 0, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 3,
	fear_height = 4,
	animation = {
	},

	-- check surrounding nodes and spawn a specific monster
	on_spawn = function(self)

		local pos = self.object:get_pos() ; pos.y = pos.y - 1
		local tmp

		for n = 1, #dirt_types do

			tmp = dirt_types[n]

			if minetest.find_node_near(pos, 1, tmp.nodes) then

				self.base_texture = tmp.skins
				self.object:set_properties({textures = tmp.skins})

				if tmp.drops then
					self.drops = tmp.drops
				end

				return true
			end
		end

		return true -- run only once, false/nil runs every activation
	end
})


if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "pv_lavamonster:pv_lavamonster",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt", "ethereal:dry_dirt"},
	min_light = 0,
	max_light = 7,
	chance = 6000,
	active_object_count = 2,
	min_height = 0,
	day_toggle = false,
})
end


mobs:register_egg("pv_lavamonster:pv_lavamonster", S("Lava Monster"), "default_dirt.png", 1)
