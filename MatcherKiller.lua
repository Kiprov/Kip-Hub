local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/EntitySpawner.lua"))()
local Configuration = {
    Kill = true,
    Speed = 100,
    Time = 5,
}

EntitySpawner:Spawn("Matcher", Configuration)
