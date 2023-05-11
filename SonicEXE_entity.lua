local function a()

		if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then			a()

			return

		end

	--1427189017--

	--4458337219--

	--4903742660--

	---====== Define spawner ======---

	local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

	---====== Create entity ======---

	local entity = Spawner.createEntity({

		CustomName = "Sonic.EXE",

		Model = "https://github.com/Kiprov/Kip-Hub/blob/main/SONIC.EXE.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)

		Speed = 200,

		MoveDelay = 3.5,

		HeightOffset = 1.2,

		CanKill = true,

		KillRange = 100,

		SpawnInFront = false,

		ShatterLights = true,

		FlickerLights = {

			Enabled = true,

			Duration = 1.3

		},

		Cycles = {

			Min = math.random(3,5),

			Max = math.random(5,7),

			Delay = 2

		},

		CamShake = {

			Enabled = true,

			Values = {1.5, 20, 0.1, 1},

			Range = 100

		},

		ResistCrucifix = true,

		BreakCrucifix = true,

		DeathMessage = {"You died to someone who you call Sonic.EXE", "He is the fastest hedgehog in the world.", "He calls himself a GOD and he kills his victims.", "Be careful because you are next.", "...","Hes immune to crucifix.","Nothing can stop him."},

		IsCuriousLight = true

	})

	---====== Debug ======---

	entity.Debug.OnEntitySpawned = function()

		print("Entity has spawned")

	end

	entity.Debug.OnEntityDespawned = function()

			print("Entity has despawned")

			if not game.ReplicatedStorage:FindFirstChild("UnlockedEXE") then

				local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)

				unlockedThisAchievement.Name = "UnlockedEXE"

				if unlockedThisAchievement then

					if unlockedThisAchievement.Value == true then

						--Already achieved

					else

						local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

						-- Creates and displays your custom achievement

						Achievements.Get({

							Title = "I AM GOD.",

							Desc = "SO MANY SOULS TO PLAY WITH, SO LITTLE TIME... WOULD YOU AGREE?.",

							Reason = "Encounter Sonic.EXE.",

							Image = "https://avatars.mds.yandex.net/i?id=386dea65f6952e9d3a336fe53baaa3d5-5345494-images-thumbs&n=13",

						})

						wait(2)

						unlockedThisAchievement.Value = true

					end

				end

			elseif game.ReplicatedStorage:FindFirstChild("UnlockedEXE") then

				local unlockedThisAchievement = game.ReplicatedStorage.UnlockedEXE

				if unlockedThisAchievement then

					if unlockedThisAchievement.Value == true then

						--Already achieved

					else

						local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

						-- Creates and displays your custom achievement

						Achievements.Get({

							Title = "I AM GOD.",

							Desc = "SO MANY SOULS TO PLAY WITH, SO LITTLE TIME... WOULD YOU AGREE?.",

							Reason = "Encounter Sonic.EXE.",

							Image = "https://avatars.mds.yandex.net/i?id=386dea65f6952e9d3a336fe53baaa3d5-5345494-images-thumbs&n=13",

						})

						wait(2)

						unlockedThisAchievement.Value = true

					end

				end

			end

			--The end

		end

	end

	entity.Debug.OnEntityStartMoving = function()

		print("Entity started moving")

		local Sonic = workspace:FindFirstChild("Sonic.EXE")

		local Talk = Instance.new("Sound", Sonic)

		Talk.Name = "HELLO"

		Talk.SoundId = "rbxassetid://1494570444"

		Talk.RollOffMaxDistance = 500

		Talk.RollOffMinDistance = 10

		Talk.Volume = 1

		Talk:Play()

		Talk.Loaded:Wait()

		wait(Talk.TimeLength)

		Talk:Destroy()

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

		local Sonic = workspace:FindFirstChild("Sonic.EXE")

		local Found = Instance.new("Sound", Sonic)

		Found.Name = "FOUNDYOU"

		local randomDeath = math.random(1, 3)

		if randomDeath == 1 then

			Found.SoundId = "rbxassetid://1497457250"

		elseif randomDeath == 2 then

			Found.SoundId = "rbxassetid://1497475377"

		elseif randomDeath == 3 then

			Found.SoundId = "rbxassetid://930613220"

		end

		Found.Volume = 2

		Found.RollOffMaxDistance = 500

		Found.RollOffMinDistance = 5

		Found:Play()

		Found.Loaded:Wait()

		wait(Found.TimeLength)

		Found:Destroy()

	end

--[[entity.Debug.OnUseCrucifix = function()

        print("Sonic iz dead")

        

    end

    ]]--

	---====== Run entity ======---

		Spawner.runEntity(entity)

end

a()