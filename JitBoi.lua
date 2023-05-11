local function a()
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
		--1427189017--
		--4458337219--
		--4903742660--
		---====== Define spawner ======---

		local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

		---====== Create entity ======---

		local entity = Spawner.createEntity({
			CustomName = "Jit",
			Model = "https://github.com/Kiprov/Kip-Hub/blob/main/Jit.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
			Speed = 300,
			MoveDelay = 4,
			HeightOffset = 0,
			CanKill = true,
			KillRange = 80,
			SpawnInFront = false,
			ShatterLights = true,
			FlickerLights = {
				Enabled = true,
				Duration = 1.5
			},
			Cycles = {
				Min = 1,
				Max = 10,
				Delay = 1.3
			},
			CamShake = {
				Enabled = true,
				Values = {1.5, 20, 0.5, 1},
				Range = 100
			},
			ResistCrucifix = true,
			BreakCrucifix = true,
			DeathMessage = {"You died to someone who you call Jit.", "Naw man, jit trippin!", "You cant even survive Jit. Thats Crazy!"},
			IsCuriousLight = true
		})

		---====== Debug ======---

		entity.Debug.OnEntitySpawned = function()
			print("Entity has spawned")
			local Jit = workspace:FindFirstChild("Jit")
			--Rainbow PointLight. 10 - speed--

			while wait(0.0125) do
				Jit.RushNew.Attachment.PointLight.Color = Color3.new(255/255,0/255,0/255)
				for i = 0,255,20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(255/255,i/255,0/255)
				end
				for i = 255,0,-20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(i/255,255/255,0/255)
				end
				for i = 0,255,20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(0/255,255/255,i/255)
				end
				for i = 255,0,-20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(0/255,i/255,255/255)
				end
				for i = 0,255,20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(i/255,0/255,255/255)
				end
				for i = 255,0,-20 do
					wait()
					Jit.RushNew.Attachment.PointLight.Color = Color3.new(255/255,0/255,i/255)
				end
			end
		end

		entity.Debug.OnEntityDespawned = function()
			print("Entity has despawned")
			if not game.ReplicatedStorage:FindFirstChild("UnlockedJit") then
				local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
				unlockedThisAchievement.Name = "UnlockedJit"
				if unlockedThisAchievement then
					if unlockedThisAchievement.Value == true then
						--Already achieved
					else
						local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

						-- Creates and displays your custom achievement
						Achievements.Get({
							Title = "Naw man jit trippin!",
							Desc = "Cant even go to school in ohio. Thats crazy!",
							Reason = "Encounter Jit.",
							Image = "https://avatars.yandex.net/get-music-content/5631481/48415dd7.a.20786156-1/m1000x1000?webp=false",
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
							Title = "Naw man jit trippin!",
							Desc = "Cant even go to school in ohio. Thats crazy!",
							Reason = "Encounter Jit.",
							Image = "https://avatars.yandex.net/get-music-content/5631481/48415dd7.a.20786156-1/m1000x1000?webp=false",
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
        print("Jit iz dead")
    end
]]--

		---====== Run entity ======---

		Spawner.runEntity(entity)
end
a()
