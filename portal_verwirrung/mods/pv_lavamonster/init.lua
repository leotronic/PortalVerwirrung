
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("mobs_monster") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_monster = true
	input:close()
	input = nil
end


-- Monsters
dofile(path .. "pv_lavamonster.lua") -- PilzAdam


-- Load custom spawning
if mobs.custom_spawn_monster then
	dofile(path .. "spawn.lua")
end


-- Lucky Blocks
dofile(path .. "lucky_block.lua")


print (S("[MOD] PV Lava Monster"))
