local Death = nil

		local randomDeath = math.random(1, 5)		if randomDeath == 1 then

			Death = {"You keep your secret hidedðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥", "Keep it as a secretðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£ðŸ”¥ðŸ¤£"}

		elseif randomDeath == 2 then

			Death = {"average day in ohio ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomDeath == 3 then

			Death = {"RONALDO IS BETTER THAN MESSIðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯ðŸ’¯", "MESSI SUCKS ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomDeath == 4 then

			Death = {"It seems like YOUR MOM is causing quite the ruckus...", "GO DO YOUR HOMEWORK BOI. ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€ðŸ’€"}

		elseif randomDeath == 5 then

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

    CustomName = "Jeff the Killer",

    Model = "https://github.com/Kiprov/Kip-Hub/raw/main/JeffTheKillerModel.rbxm", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)

    Speed = 100,

    MoveDelay = 1.5,

    HeightOffset = 0,

    CanKill = true,

    KillRange = 30,

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

        Values = {3.5, 20, 0.1, 1},

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

    print("Entity has despawned")
	if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
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
			else
			warn("The player is dead, cannot give achievement")
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
