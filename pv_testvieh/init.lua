
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("pv_testvieh") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end

dofile(path .. "pv_testvieh.lua") -- KrupnoPavel

-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end

-- Lucky Blocks
dofile(path .. "lucky_block.lua")

print (S("[MOD] PV Testvieh loaded"))
