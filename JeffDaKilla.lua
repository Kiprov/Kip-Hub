local function a()
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
		local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


		-- Create entity
		local entity = Spawner.createEntity({
			CustomName = "Jeff", -- Custom name of your entity
			Model = "https://github.com/Kiprov/Kip-Hub/blob/main/JeffTheKillerModel.rbxm?raw=true", -- Can be GitHub file or rbxassetid
			Speed = 300, -- Percentage, 100 = default Rush speed
			DelayTime = 1.5, -- Time before starting cycles (seconds)
			HeightOffset = 0,
			CanKill = true,
			NoDieOnCrouching = false,
			NoHiding = false,
			AntiCrucifix = true,
			KillRange = 30,
			OneRoom = false,
			DieOnLook = false,
			BreakLights = false,
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
				Max = 1,
				WaitTime = 2,
			},
			CamShake = {
				true, -- Enabled/Disabled
				{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
				50, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Type = "1", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
					Image1 = "http://www.roblox.com/asset/?id=184251462", -- Image1 url
					Image2 = "https://yt3.ggpht.com/ytc/AMLnZu9g130-3NnU4PKOJO-pPDt5LJvagdFCPfgrC8_97Q=s900-c-k-c0x00ffffff-no-rj", -- Image2 url
					Shake = false,
					Sound1 = {
						"rbxassetid://0", -- SoundId Link or Roblox ID
						{ Volume = 5}, -- Sound properties
					},
					Sound2 = {
						"rbxassetid://314678645", -- SoundId Link or Roblox ID
						{ Volume = 3}, -- Sound properties
					},
					Flashing = {
						true, -- Enabled/Disabled
						Color3.fromRGB(255, 255, 255), -- Color
					},
					Tease = {
						false, -- Enabled/Disabled
						Min = 1,
						Max = 10,
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
			task.spawn(function()
				while wait(3) do
					local Jeff = workspace:FindFirstChild("Jeff")
					if Jeff:FindFirstChildOfClass("Humanoid").Health ~= 0 then
						Jeff.Head.ChatAttachment.Chat.Enabled = true
						wait(3)
						Jeff.Head.ChatAttachment.Chat.Enabled = false
					end
				end
			end)
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
		if not game.ReplicatedStorage:FindFirstChild("UnlockedJeff") then
			local unlockedThisAchievement = Instance.new("BoolValue", game.ReplicatedStorage)
			unlockedThisAchievement.Name = "UnlockedJeff"
			if unlockedThisAchievement then
				if unlockedThisAchievement.Value == true then
					--Already achieved
				else
					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement
					Achievements.Get({
						Title = "ITS PAST YOUR BED TIME.",
						Desc = "GO TO SLEEP.",
						Reason = "Encounter Jeff.",
						Image = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/68a40625-080a-47c5-ad1b-ee8f01453dbd/d629rde-fc9dbdf2-5894-4eac-8351-9ba59d446f1d.png/v1/fill/w_900,h_720,q_80,strp/jeff_by_myhatisblue_d629rde-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvNjhhNDA2MjUtMDgwYS00N2M1LWFkMWItZWU4ZjAxNDUzZGJkXC9kNjI5cmRlLWZjOWRiZGYyLTU4OTQtNGVhYy04MzUxLTliYTU5ZDQ0NmYxZC5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.6C7ynO3GMP4RyjAW903SY6Jzenxt9hQJ_NkcelPGLTM",
					})
					wait(2)
					unlockedThisAchievement.Value = true
				end
			end
		elseif game.ReplicatedStorage:FindFirstChild("UnlockedJeff") then
			local unlockedThisAchievement = game.ReplicatedStorage.UnlockedJeff
			if unlockedThisAchievement then
				if unlockedThisAchievement.Value == true then
					--Already achieved
				else
					local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

					-- Creates and displays your custom achievement
					Achievements.Get({
						Title = "ITS PAST YOUR BED TIME.",
						Desc = "GO TO SLEEP.",
						Reason = "Encounter Jeff.",
						Image = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/68a40625-080a-47c5-ad1b-ee8f01453dbd/d629rde-fc9dbdf2-5894-4eac-8351-9ba59d446f1d.png/v1/fill/w_900,h_720,q_80,strp/jeff_by_myhatisblue_d629rde-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvNjhhNDA2MjUtMDgwYS00N2M1LWFkMWItZWU4ZjAxNDUzZGJkXC9kNjI5cmRlLWZjOWRiZGYyLTU4OTQtNGVhYy04MzUxLTliYTU5ZDQ0NmYxZC5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.6C7ynO3GMP4RyjAW903SY6Jzenxt9hQJ_NkcelPGLTM",
					})
					wait(2)
					unlockedThisAchievement.Value = true
				end
			end
		end
	end
	a()
