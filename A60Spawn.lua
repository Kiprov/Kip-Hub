local function a()
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
		local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


		-- Create entity
		local entity = Spawner.createEntity({
			CustomName = "A-60", -- Custom name of your entity
			Model = "https://github.com/Kiprov/Kip-Hub/blob/main/A60NewModel.rbxm?raw=true", -- Can be GitHub file or rbxassetid
			Speed = 300, -- Percentage, 100 = default Rush speed
			DelayTime = 5, -- Time before starting cycles (seconds)
			HeightOffset = 0,
			CanKill = true,
			NoDieOnCrouching = false,
			NoHiding = false,
			AntiCrucifix = true,
			KillRange = 100,
			OneRoom = false,
			DieOnLook = false,
			BreakLights = true,
			BackwardsMovement = false,
			MovementDeath = {
				false, -- Turned On?
				'1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
			},
			FlickerLights = {
				false, -- Enabled/Disabled
				1, -- Time (seconds)
			},
			EntitySounds = { -- Can Get rid Of
				--Empty table
			}, -- Up to Here

			Cycles = {
				Min = 1,
				Max = math.random(10, 15),
				WaitTime = 3,
			},
			CamShake = {
				true, -- Enabled/Disabled
				{3.5, 20, 2, 5}, -- Shake values (don't change if you don't know)
				100, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Type = "2", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
					Image1 = "http://www.roblox.com/asset/?id=184251462", -- Image1 url
					Image2 = "rbxassetid://12485176630", -- Image2 url
					Shake = false,
					Sound1 = {
						"rbxassetid://4737106301", -- SoundId Link or Roblox ID
						{ Volume = 5}, -- Sound properties
					},
					Sound2 = {
						"rbxassetid://144433323", -- SoundId Link or Roblox ID
						{ Volume = 3, Pitch = 0.5}, -- Sound properties
					},
					Flashing = {
						true, -- Enabled/Disabled
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
				{"You died to someone who you call A-60.", "they make the lights red when they spawn.", "Watch out for their scream, and light."}, -- Death Messages
				{"You died to A-60.","Listen to his sounds attentively!"},
				{"...", "Use what you have learned from Ambush!"},
				{"It seems like A-60 is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!","Remember, he always screams and makes the lights red always."},
				{"...", "Are you serious right neow.","Get lost..."}
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
			local RedLights = Instance.new("ColorCorrectionEffect", game.Lighting)
			RedLights.Name = "RedLight"
			RedLights.Brightness = 0
			RedLights.Enabled = false
			wait(0.5)
			game.TweenService:Create(RedLights, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Brightness = 0, TintColor = Color3.new(1,0,0)}):Play()
			RedLights.Enabled = true
		end

		entity.Debug.OnEntityDespawned = function()
			print("Entity has despawned:")
			local RedScreen = game.Lighting:FindFirstChild("RedLight")
			game.TweenService:Create(RedScreen, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Brightness = 0, TintColor = Color3.new(1,1,1)}):Play()
			wait(3)
			RedScreen:Destroy()
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
		if not game.ReplicatedStorage:FindFirstChild("UnlockedA60") then
			local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
			unlockedThisAchievement.Name = "UnlockedA60"
			if unlockedThisAchievement then
				if unlockedThisAchievement.Value == true then
					--Already achieved
				else
					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement
					Achievements.Get({
						Title = "FAST AS POSSIBLE.",
						Desc = "U got lucky that i didnt kill you.",
						Reason = "Encounter A-60.",
						Image = "https://progamer.biz/wp-content/uploads/2023/02/roblox-doors-hotel-update-a-60.jpg",
					})
					wait(2)
					unlockedThisAchievement.Value = true
				end
			end
		elseif game.ReplicatedStorage:FindFirstChild("UnlockedA60") then
			local unlockedThisAchievement = game.ReplicatedStorage.UnlockedA60
			if unlockedThisAchievement then
				if unlockedThisAchievement.Value == true then
					--Already achieved
				else
					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement
					Achievements.Get({
						Title = "FAST AS POSSIBLE.",
						Desc = "U got lucky that i didnt kill you.",
						Reason = "Encounter A-60.",
						Image = "https://progamer.biz/wp-content/uploads/2023/02/roblox-doors-hotel-update-a-60.jpg",
					})
					wait(2)
					unlockedThisAchievement.Value = true
				end
			end
		end
	end
		a()
