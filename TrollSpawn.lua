local Name = nil

local Death = nil

		local textureID = nil

		local randomName = math.random(1, 5)

		if randomName == 1 then

			Name = "MrZhorno"

			textureID = "rbxassetid://11761802678"

			Death = {"You keep your secret hidedðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥", "Keep it as a secretðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£"}

		elseif randomName == 2 then

			Name = "TrollFace"

			textureID = "rbxassetid://9585820180"

			Death = {"average day in ohio ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomName == 3 then

			Name = "RushPlushie"

			textureID = "rbxassetid://11437572154"

			Death = {"RONALDO IS BETTER THAN MESSIðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯", "MESSI SUCKS ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomName == 4 then

			Name = "Santa"

			textureID = "rbxassetid://5763046355"

			Death = {"It seems like YOUR MOM is causing quite the ruckus...", "GO DO YOUR HOMEWORK BOI. ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomName == 5 then

			Name = "GoofyCat"

			textureID = "rbxassetid://9808349833"

			Death = {"Whopper, whopper, whopper, whopper", "Junior, double, triple whopper.","Flame grilled taste with perfect toppers.","I rule this day!","Lettuce, mayo, pickle, ketchup.","Its okay if i dont want that.","Impossible, or Bacon Whopper, any Whopper my way!","You rule, youre seizing the day!","At BK... Have it your way!","You Rule!"}

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

    CustomName = Name,

    Model = "https://github.com/Kiprov/Kip-Hub/raw/main/TrollRush.rbxm", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)

    Speed = 100,

    MoveDelay = 2,

    HeightOffset = 0,

    CanKill = true,

    KillRange = 50,

    SpawnInFront = false,

    ShatterLights = true,

    FlickerLights = {

        Enabled = true,

        Duration = 1

    },

    Cycles = {

        Min = 1,

        Max = 1,

        Delay = 2

    },

    CamShake = {

        Enabled = true,

        Values = {1.5, 20, 0.1, 1},

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

    local Entity = workspace:FindFirstChild(Name)

			Entity.RushNew:FindFirstChild("Attachment").ParticleEmitter.Texture = textureID

			print("Face applied.")

end

entity.Debug.OnEntityDespawned = function()

    print("Entity has despawned")

    if not game.ReplicatedStorage:FindFirstChild("UnlockedTroll") then

			local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)

			unlockedThisAchievement.Name = "UnlockedTroll"

			if unlockedThisAchievement then

				if unlockedThisAchievement.Value == true then

					--Already achieved

				else

					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement

					Achievements.Get({

						Title = "LALALALALA.",

						Desc = "Ohohohohoho...",

						Reason = "Encounter Troll.",

						Image = textureID,

					})

					wait(2)

					unlockedThisAchievement.Value = true

				end

			end

		elseif game.ReplicatedStorage:FindFirstChild("UnlockedTroll") then

			local unlockedThisAchievement = game.ReplicatedStorage.UnlockedTroll

			if unlockedThisAchievement then

				if unlockedThisAchievement.Value == true then

					--Already achieved

				else

					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement

					Achievements.Get({

						Title = "LALALALALA.",

						Desc = "Ohohohohoho...",

						Reason = "Encounter Troll.",

						Image = textureID,

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
