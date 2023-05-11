local Name = nil
		local textureID = nil
		local randomName = math.random(1, 5)
		if randomName == 1 then
			Name = "MrZhorno"
			textureID = "rbxassetid://11761802678"
		elseif randomName == 2 then
			Name = "TrollFace"
			textureID = "rbxassetid://9585820180"
		elseif randomName == 3 then
			Name = "RushPlushie"
			textureID = "rbxassetid://11437572154"
		elseif randomName == 4 then
			Name = "Santa"
			textureID = "rbxassetid://5763046355"
		elseif randomName == 5 then
			Name = "GoofyCat"
			textureID = "rbxassetid://9808349833"
		end
		wait(0.5)
		local function a()
		local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


		-- Create entity
		local entity = Spawner.createEntity({
			CustomName = Name, -- Custom name of your entity
			Model = "https://github.com/Kiprov/Kip-Hub/blob/main/TrollRush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
			Speed = 100, -- Percentage, 100 = default Rush speed
			DelayTime = 2, -- Time before starting cycles (seconds)
			HeightOffset = 0,
			CanKill = true,
			NoDieOnCrouching = false,
			NoHiding = false,
			AntiCrucifix = true,
			KillRange = 50,
			OneRoom = false,
			DieOnLook = false,
			BreakLights = true,
			BackwardsMovement = false,
			MovementDeath = {
				false, -- Turned On?
				'1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
			},
			FlickerLights = {
				true, -- Enabled/Disabled
				1.5, -- Time (seconds)
			},
			EntitySounds = { -- Can Get rid Of
				--Empty table
			}, -- Up to Here

			Cycles = {
				Min = 1,
				Max = 1,
				WaitTime = 2,
			},
			CamShake = {
				true, -- Enabled/Disabled
				{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
				100, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Type = "1", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
					Image1 = "rbxassetid://10483855823", -- Image1 url
					Image2 = textureID, -- Image2 url
					Shake = true,
					Sound1 = {
						"rbxassetid://0", -- SoundId Link or Roblox ID
						{ Volume = 5 }, -- Sound properties
					},
					Sound2 = {
						"rbxassetid://314678645", -- SoundId Link or Roblox ID
						{ Volume = 3 }, -- Sound properties
					},
					Flashing = {
						false, -- Enabled/Disabled
						Color3.fromRGB(255, 255, 255), -- Color
					},
					Tease = {
						false, -- Enabled/Disabled
						Min = 0,
						Max = 0,
					},
				},
			},
			Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
			DiffrentMessages = true,
			CustomDialog = {  
				{"You keep your secret hidedðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥", "Keep it as a secretðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£"}, -- Death Messages
				{"average day in ohio ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"},
				{"RONALDO IS BETTER THAN MESSIðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯", "MESSI SUCKS ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"},
				{"It seems like YOUR MOM is causing quite the ruckus...", "GO DO YOUR HOMEWORK BOI. ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"},
				{"Whopper, whopper, whopper, whopper", "Junior, double, triple whopper.","Flame grilled taste with perfect toppers.","I rule this day!","Lettuce, mayo, pickle, ketchup.","Its okay if i dont want that.","Impossible, or Bacon Whopper, any Whopper my way!","You rule, youre seizing the day!","At BK... Have it your way!","You Rule!"}
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
			local Entity = workspace:FindFirstChild(Name)
			Entity.RushNew:FindFirstChild("Attachment").ParticleEmitter.Texture = textureID
			print("Face applied.")
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
		end

		------------------------

		-- Run the created entity
		Spawner.runEntity(entity)
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
	a()
