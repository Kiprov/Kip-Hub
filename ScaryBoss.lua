local function a()
	if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				print("Aww man i cant spawn :(")
				return
			end
			--1427189017--
		--4458337219--
		--4903742660--
		---====== Define spawner ======---

		local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

		---====== Create entity ======---

		local entity = Spawner.createEntity({
			CustomName = "Scaranger",
			Model = "https://github.com/Kiprov/Kip-Hub/blob/main/ScaryZombie.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
			Speed = 200,
			MoveDelay = 3,
			HeightOffset = 0,
			CanKill = true,
			KillRange = 130,
			SpawnInFront = false,
			ShatterLights = true,
			FlickerLights = {
				Enabled = true,
				Duration = 1.5
			},
			Cycles = {
				Min = 1,
				Max = 20,
				Delay = 1.05
			},
			CamShake = {
				Enabled = true,
				Values = {1.5, 20, 0.5, 1},
				Range = 100
			},
			ResistCrucifix = true,
			BreakCrucifix = true,
			DeathMessage = {"You died to someone who you call Scaranger.", "He is a red zombie that has red eyes, that came from the dead.", "Whenever he arrives, he screams for help...","...","Get out."},
			IsCuriousLight = true
		})

		---====== Debug ======---

		entity.Debug.OnEntitySpawned = function()
			print("Entity has spawned")
		end

		entity.Debug.OnEntityDespawned = function()
			print("Entity has despawned")
			if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			if not game.ReplicatedStorage:FindFirstChild("UnlockedScaranger") then
				local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
				unlockedThisAchievement.Name = "UnlockedScaranger"
				if unlockedThisAchievement then
					if unlockedThisAchievement.Value == true then
						--Already achieved
					else
						local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

						-- Creates and displays your custom achievement
						Achievements.Get({
							Title = "THE DEAD IS RISING.",
							Desc = "THE ZOMBIES ARE COMING FOR UR BRAINS.",
							Reason = "Encounter Scaranger.",
							Image = "https://pbs.twimg.com/profile_images/239506442/redzombie_ipwp_400x400.jpg",
						})
						wait(2)
						unlockedThisAchievement.Value = true
					end
				end
			elseif game.ReplicatedStorage:FindFirstChild("UnlockedScaranger") then
				local unlockedThisAchievement = game.ReplicatedStorage.UnlockedScaranger
				if unlockedThisAchievement then
					if unlockedThisAchievement.Value == true then
						--Already achieved
					else
						local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

						-- Creates and displays your custom achievement
						Achievements.Get({
							Title = "THE DEAD IS RISING.",
							Desc = "THE ZOMBIES ARE COMING FOR UR BRAINS.",
							Reason = "Encounter Scaranger.",
							Image = "https://pbs.twimg.com/profile_images/239506442/redzombie_ipwp_400x400.jpg",
						})
						wait(2)
						unlockedThisAchievement.Value = true
					end
				end
				else
				warn("The player is dead, cannot give achievement")
			end
			end
			--The end
		end

		entity.Debug.OnEntityStartMoving = function()
			print("Entity started moving")
		end

		entity.Debug.OnEntityFinishedRebound = function()
			
		end

		entity.Debug.OnEntityEnteredRoom = function(room)
			
		end

		entity.Debug.OnLookAtEntity = function()
			
		end

		entity.Debug.OnDeath = function()
			print("Player has died")
		end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Red iz dead")
    end
]]--

		---====== Run entity ======---

		Spawner.runEntity(entity)
end
a()
