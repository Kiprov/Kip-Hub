local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Kill = false, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 60, -- 60 for rush, doesnt work on other entities
    Time = 5 -- 5 for rush, doesnt work on other entities
}

EntitySpawner:Spawn("Rush", Configuration)
