local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()
LatestRoom.Changed:Wait()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(61, 171, 98)
game.Lighting.MainColorCorrection.Contrast = 0.2
game.Lighting.MainColorCorrection.Saturation = -0.7
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Saturation = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
wait(2.8)

-- Create entity
local function a()
    if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
        a()
        return
    end
local entity = Spawner.createEntity({
    CustomName = "Rebound", -- Custom name of your entity
    Model = "https://github.com/Kiprov/Kip-Hub/blob/main/NewRebound.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 1, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    NoDieOnCrouching = false,
    NoHiding = false,
    AntiCrucifix = true,
    KillRange = 50,
    OneRoom = false,
    DieOnLook = false,
    BreakLights = false,
    BackwardsMovement = true,
     MovementDeath = {
        false, -- Turned On?
        '1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
    },
    FlickerLights = {
        false, -- Enabled/Disabled
        1, -- Time (seconds)
    },
EntitySounds = { -- Can Get rid Of
PlaySound = {
              "https://github.com/Kiprov/Kip-Hub/blob/main/ReboundMoving.mp3?raw=true", -- SoundId Link or Roblox ID
            { Volume = 0.5, RollOffMaxDistance = 300, RollOffMinDistance = 30,Pitch = 0.5}, -- Sound properties
       },
    }, -- Up to Here

    Cycles = {
        Min = 1,
        Max = math.random(3,5),
        WaitTime = 1,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Type = "3", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
            Image1 = "rbxassetid://12954492733", -- Image1 url
            Image2 = "rbxassetid://11862656458", -- Image2 url
            Shake = true,
            Sound1 = {
                "rbxassetid://4860560167", -- SoundId Link or Roblox ID
                { Volume = 9, Pitch = 2}, -- Sound properties
            },
            Sound2 = {
                "rbxassetid://5567523008", -- SoundId Link or Roblox ID
                { Volume = 3, Pitch = 1.5, TimePosition = 0}, -- Sound properties
            },
            Flashing = {
                false, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 5,
            },
        },
    },
    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
    DiffrentMessages = true,
    CustomDialog = {  
        {"You died to someone who you call Rebound.", "He spawns randomly, comes from front", "He might spawn again when u open a door.", "Just. Look out for his sounds."}, -- Death Messages
        {"You died to Rebound","Use what you have learned from Rush and Ambush!"},
        {"You died to Rebound again...", "His light is always blue so you will know when he arrives."},
        {"It seems like you have problems with Rebound...", "Hide in a closet or bed as quickly as possible!","Listen to his sounds carefully!"},
         {"...", "💀💀💀💀💀"}
    }
})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)
print("Invincible: "..tostring(Invincible))
print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))
print("Hiding: "..tostring(Hiding))
end
       
entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned:")
	wait(0.5)
	local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
	local Rebound = workspace:FindFirstChild("Rebound")
	local sound = Rebound.Rebound.PlaySound
	local dist = Instance.new("DistortionSoundEffect", sound)
	dist.Level = 0.72
	local equal = Instance.new("EqualizerSoundEffect", sound)
	equal.HighGain = -60
	equal.MidGain = 10
	equal.LowGain = 10
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned:")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:")
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:",room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:")
end

entity.Debug.OnDeath = function()
    warn("Player has died.")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
end

------------------------

-- Run the created entity
Spawner.runEntity(entity)
end
a()
local Cycles = math.random(3,6)
if Cycles == 3 then
		LatestRoom.Changed:Wait()
		a()
		LatestRoom.Changed:Wait()
		a()
		if not game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
unlockedThisAchievement.Name = "UnlockedRebound"
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is only the beginning.",
    Desc = "5 times rebounding is fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
elseif game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = game.ReplicatedStorage.UnlockedRebound
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is the only beginning",
    Desc = "5 times rebound is so fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
end
elseif Cycles == 4 then
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	if not game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
unlockedThisAchievement.Name = "UnlockedRebound"
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is only the beginning.",
    Desc = "5 times rebounding is fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
elseif game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = game.ReplicatedStorage.UnlockedRebound
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is the only beginning",
    Desc = "5 times rebound is so fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
end
elseif Cycles == 5 then
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	if not game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
unlockedThisAchievement.Name = "UnlockedRebound"
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is only the beginning.",
    Desc = "5 times rebounding is fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
elseif game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = game.ReplicatedStorage.UnlockedRebound
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is the only beginning",
    Desc = "5 times rebound is so fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
end
elseif Cycles == 6 then
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	LatestRoom.Changed:Wait()
	a()
	if not game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
unlockedThisAchievement.Name = "UnlockedRebound"
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is only the beginning.",
    Desc = "5 times rebounding is fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
elseif game.ReplicatedStorage:FindFirstChild("UnlockedRebound") then
local unlockedThisAchievement = game.ReplicatedStorage.UnlockedRebound
if unlockedThisAchievement then
if unlockedThisAchievement.Value == true then
--Already achieved
else
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "This is the only beginning",
    Desc = "5 times rebound is so fun.",
    Reason = "Encounter Rebound.",
    Image = "https://avatars.mds.yandex.net/i?id=6249df3b9a3bf2f17e3985dd2aba57f55524884e-5231938-images-thumbs&n=13",
})
wait(2)
unlockedThisAchievement.Value = true
end
end
end
--The end
    end
	a()
