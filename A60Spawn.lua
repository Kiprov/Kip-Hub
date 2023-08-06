local Death = nil
		local randomDeath = math.random(1, 5)
		if randomDeath == 1 then
			Death = {"You died to someone who you call A-60.", "they make the lights red when they spawn.", "Watch out for their scream, and light."}
		elseif randomDeath == 2 then
			Death = {"You died to A-60.","Listen to his sounds attentively!"}
		elseif randomDeath == 3 then
			Death = {"...", "Use what you have learned from Ambush!"}
		elseif randomDeath == 4 then
			Death = {"It seems like A-60 is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!","Remember, he always screams and makes the lights red always."}
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
    CustomName = "A-60",
    Model = "https://github.com/Kiprov/Kip-Hub/blob/main/A60NewModel.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 300,
    MoveDelay = 5,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = false,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = math.random(10,15),
        Delay = 3
    },
    CamShake = {
        Enabled = true,
        Values = {3.5, 20, 2, 5},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = Death,
    IsCuriousLight = true
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
	local RedScreen = game.Lighting:FindFirstChild("RedLight")
			game.TweenService:Create(RedScreen, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Brightness = 0, TintColor = Color3.new(1,1,1)}):Play()
			wait(3)
			RedScreen:Destroy()
		end)
			if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
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
	 local v1 = game.Players.LocalPlayer.PlayerGui.MainUI
local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
local OGRush = v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.SoundId
local OGScream = v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.SoundId
local OGPitch = v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.Pitch
local ORush = v1.Jumpscare.Jumpscare_Rush.ImageLabel.Image
local ORush2 = v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Image
local OVol = v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Volume
local function Deathscare()
      v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Volume = 5;
      v1.Jumpscare.Jumpscare_Rush.ImageLabel.Image = "rbxassetid://12485176630";
v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Image = "rbxassetid://12485176630";
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.SoundId = "rbxassetid://4737106301";
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.SoundId = "rbxassetid://144433323";
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.Pitch = 0.5
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Play();
			v1.Jumpscare.Jumpscare_Rush.Visible = true;
			local v64 = tick();
			local v65 = math.random(5, 30) / 10;
			local v66 = v65 + math.random(10, 60) / 10;
			local v67 = 0.25;
			for v68 = 1, 100000 do
				task.wait();
				if v64 + v65 <= tick() then
					v1.Jumpscare.Jumpscare_Rush.ImageLabel.Visible = true;
					v65 = v65 + math.random(7, 44) / 10;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Pitch = 1 + math.random(-100, 100) / 500;
					v1.Jumpscare.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, math.random(0, 10) / 255);
					v1.Jumpscare.Jumpscare_Rush.ImageLabel.Position = UDim2.new(0.5, math.random(-2, 2), 0.5, math.random(-2, 2));
					v67 = v67 + 0.05;
					v1.Jumpscare.Jumpscare_Rush.ImageLabel.Size = UDim2.new(v67, 0, v67, 0);
				end;
				if v64 + v66 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare.Jumpscare_Rush.ImageLabel.Visible = true;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Stop();
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2:Play();
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.Ended:Connect(function()
			v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.SoundId = OGScream;
			v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2.SoundId = OGPitch;
			end)
			v1.Jumpscare.Jumpscare_Rush.ImageLabel.Visible = false;
			v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Visible = true;
			v1.Jumpscare.Jumpscare_Rush.ImageLabelBig:TweenSize(UDim2.new(2.5, 0, 2.5, 0), "In", "Sine", 0.3, true);
			local v69 = tick();
			for v70 = 1, 1000 do
				local v71 = math.random(0, 10) / 10;
				v1.Jumpscare.Jumpscare_Rush.BackgroundColor3 = Color3.new(math.clamp(math.random(25, 50) / 50, v71, 1),v71,v71);
				v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Position = UDim2.new(0.5 + math.random(-100, 100) / 5000, 0, 0.5 + math.random(-100, 100) / 3000, 0);
				task.wait(0.016666666666666666);
				if v69 + 0.3 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Visible = false;
			v1.Jumpscare.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare.Jumpscare_Rush.Visible = false;
			u2.deathtick = tick();
			game.SoundService.Main.Volume = 2;
		end
Deathscare()
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Volume = OVol;
      v1.Jumpscare.Jumpscare_Rush.ImageLabel.Image = ORush;
v1.Jumpscare.Jumpscare_Rush.ImageLabelBig.Image = ORush2;
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.SoundId = OGRush;
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
