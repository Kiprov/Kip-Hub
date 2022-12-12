	local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Kill = false, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Jack", Configuration)
