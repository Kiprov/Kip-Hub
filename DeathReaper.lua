local Death = nil

		local randomDeath = math.random(1, 5)

		if randomDeath == 1 then

			Death = {"You died to someone who you call Death.", "they make the lights red when they spawn.", "Watch out for their scream, and light."}

		elseif randomDeath == 2 then

			Death = {"You died to Death.","Listen to his sounds attentively!"}

		elseif randomDeath == 3 then

			Death = {"...", "Use what you have learned from Rush!"}

		elseif randomDeath == 4 then

			Death = {"It seems like Death is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!","Remember, he always screams and makes the lights red always."}

		elseif randomDeath == 5 then

			Death = {"...", "Are you serious right neow.","Get lost..."}

		end

wait(0.5)

local function a()

if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then

				a()

				return

			end

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({

    CustomName = "Death",

    Model = "https://github.com/Kiprov/Kip-Hub/raw/main/DeathModel.rbxm", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)

    Speed = 100,

    MoveDelay = 3,

    HeightOffset = 0,

    CanKill = true,

    KillRange = 50,

    SpawnInFront = false,

    ShatterLights = false,

    FlickerLights = {

        Enabled = false,

        Duration = 1

    },

    Cycles = {

        Min = 1,

        Max = 1,

        Delay = 2

    },

    CamShake = {

        Enabled = true,

        Values = {3.5, 20, 2, 5},

        Range = 100

    },

    ResistCrucifix = true,

    BreakCrucifix = true,

    DeathMessage = Death,

    IsCuriousLight = false

})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()

    print("Entity has spawned")

    local RedLights = Instance.new("ColorCorrectionEffect", game.Lighting)

			RedLights.Name = "RedLight"

			RedLights.Brightness = 0

			RedLights.Enabled = false

			wait(0.5)

			game.TweenService:Create(RedLights, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Brightness = 0, TintColor = Color3.new(1,0,0)}):Play()

			RedLights.Enabled = true

end

entity.Debug.OnEntityDespawned = function()

    print("Entity has despawned")

    task.spawn(function()

   local KickSound = Instance.new("Sound", workspace)

			KickSound.Name = "Kick"

			KickSound.PlayOnRemove = true

			KickSound.Volume = 3

			KickSound.TimePosition = 0.5

			KickSound.SoundId = "rbxassetid://2093015544"

			KickSound:Destroy()

			local RedScreen = game.Lighting:FindFirstChild("RedLight")

			game.TweenService:Create(RedScreen, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Brightness = 0, TintColor = Color3.new(1,1,1)}):Play()

			wait(3)

			RedScreen:Destroy()

			end)

			if not game.ReplicatedStorage:FindFirstChild("UnlockedDeath") then

			local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)

			unlockedThisAchievement.Name = "UnlockedDeath"

			if unlockedThisAchievement then

				if unlockedThisAchievement.Value == true then

					--Already achieved

				else

					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement

					Achievements.Get({

						Title = "YOUR DEATH IS SLOW AND PAINFUL.",

						Desc = "U got lucky that i didnt collect ur soul.",

						Reason = "Encounter Death.",

						Image = "https://avatars.yandex.net/get-music-content/5099136/3412b77a.a.19898521-1/m1000x1000?webp=false",

					})

					wait(2)

					unlockedThisAchievement.Value = true

				end

			end

		elseif game.ReplicatedStorage:FindFirstChild("UnlockedDeath") then

			local unlockedThisAchievement = game.ReplicatedStorage.UnlockedDeath

			if unlockedThisAchievement then

				if unlockedThisAchievement.Value == true then

					--Already achieved

				else

					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement

					Achievements.Get({

						Title = "YOUR DEATH IS SLOW AND PAINFUL.",

						Desc = "U got lucky that i didnt collect ur soul.",

						Reason = "Encounter Death.",

						Image = "https://avatars.yandex.net/get-music-content/5099136/3412b77a.a.19898521-1/m1000x1000?webp=false",

					})

					wait(2)

					unlockedThisAchievement.Value = true

				end

			end

		end

end

entity.Debug.OnEntityStartMoving = function()

    print("Entity started moving")

end

entity.Debug.OnEntityFinishedRebound = function()

    print("Entity finished rebound")

end

entity.Debug.OnEntityEnteredRoom = function(room)

    print("Entity entered room:", room)

end

entity.Debug.OnLookAtEntity = function()

    print("Player looking at entity")

end

entity.Debug.OnDeath = function()

    print("Player has died")

end

--[[

    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()

        print("Custom crucifixion script here")

    end

]]--

---====== Run entity ======---

Spawner.runEntity(entity)

end

a()
