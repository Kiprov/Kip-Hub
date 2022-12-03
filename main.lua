local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
db = false
_G.Key = "OCS_SYSTEM_ACCESS_GRANTED_NO_HACK"
_G.Key2 = "PRISON_LIFE_ACCESS_GRANTED_NO_HACK"
_G.Input = "string"
OrionLib:MakeNotification({
	Name = "",
	Content = "Checking if game supported",
	Image = "rbxassetid://4483345998",
	Time = 2
})
wait(2)
if game.PlaceId == 6839171747 then
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Game supported! Loading OCS",
	Image = "rbxassetid://4483345998",
	Time = 5
})
wait(5)
local Window = OrionLib:MakeWindow({Name = "Ownership Check System", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "OCS"})
local KeyFrame = Window:MakeTab({
	Name = "Anti-Piracy",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local APNote = KeyFrame:AddSection({
Name = "This is a key system."
})
KeyFrame:AddTextbox({
Name = "Key",
Default = "",
TextDissapear = true,
Callback = function(txt)
_G.Input = txt
if _G.Input == _G.Key then
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Correct Key. Loading Hub!",
	Image = "rbxassetid://4483345998",
	Time = 3
})
wait(3)
game.CoreGui.Orion:Destroy()
wait(0.5)
ScriptHub()
else
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "INCORRECT KEY!",
	Image = "rbxassetid://4483345998",
	Time = 2
})
wait(2)
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "IT IS A SERIOUS CRIME TO STEAL SCRIPTHUBS FROM CREATORS, BEGONE PIRATE!",
	Image = "rbxassetid://4483345998",
	Time = 2
})
wait(2)
game:Shutdown()
end
end
})
elseif game.PlaceId == 155615604 then
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Game supported! Loading OCS",
	Image = "rbxassetid://4483345998",
	Time = 5
})
wait(5)
local Window = OrionLib:MakeWindow({Name = "Ownership Check System", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "OCS"})
local KeyFrame = Window:MakeTab({
	Name = "Anti-Piracy",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local APNote = KeyFrame:AddSection({
Name = "This is a key system."
})
KeyFrame:AddTextbox({
Name = "Key",
Default = "",
TextDissapear = true,
Callback = function(txt)
_G.Input = txt
if _G.Input == _G.Key2 then
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Correct Key. Loading Hub!",
	Image = "rbxassetid://4483345998",
	Time = 3
})
wait(3)
game.CoreGui.Orion:Destroy()
wait(0.5)
ScriptHub2()
else
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "INCORRECT KEY!",
	Image = "rbxassetid://4483345998",
	Time = 2
})
wait(2)
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "IT IS A SERIOUS CRIME TO STEAL SCRIPTHUBS FROM CREATORS, BEGONE PIRATE!",
	Image = "rbxassetid://4483345998",
	Time = 2
})
wait(2)
game:Shutdown()
end
end
})
elseif game.PlaceId == 4620170611 then
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Game supported! Loading plasma hub.",
	Image = "rbxassetid://4483345998",
	Time = 5
})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/break-in-v1/main/.gitignore"))();
else
OrionLib:MakeNotification({
	Name = "Kip Hub",
	Content = "Sorry the game is not supported. Please join the supported game!",
	Image = "rbxassetid://4483345998",
	Time = 3
})
end
function ScriptHub()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
-- Main
local Window = OrionLib:MakeWindow({Name = "DOORS", HidePremium = false, IntroText = "Doors Anti Cheat", SaveConfig = true, ConfigFolder = "DoorsAC"})

local Ent = Window:MakeTab({
	Name = "Entities",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Ent:AddSection({
Name = "Be like Kardin Hong"
})

Ent:AddButton({
Name = "Summon Screech",
	Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
  	end    
})
Ent:AddButton({
Name = "Summon Halt",
Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end
})
Ent:AddTextbox({
Name = "Summon Eyes",
Default = "",
TextDissapear = true,
Callback = function(txt)
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Damage = txt , -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Eyes", Configuration)
end
})
Ent:AddButton({
Name = "Summon Glitch",
Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])  
end
})
Ent:AddButton({
Name = "Summon Seek",
Callback = function()
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Kill = false, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Seek", Configuration)
end
})
Ent:AddButton({
Name = "Seek Eyes",
Callback = function()
require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms:WaitForChild(game.ReplicatedStorage.GameData.LatestRoom.Value), 14, 1665596753, true)
end
})
Ent:AddButton({
Name = "Spawn Rush",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Rush.lua"))()
end
})
Ent:AddButton({
Name = "Spawn Ambush",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Ambush.lua"))()
end
})
local Crocs = Window:MakeTab({
	Name = "LocalPlayer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Note = Crocs:AddSection({
Name = "Useful Hacks"
})
Crocs:AddTextbox({
Name = "Speed",
Default = "",
TextDissapear = true,
Callback = function(txt)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end
})
Crocs:AddTextbox({
Name = "JumpPower",
Default = "",
TextDissapear = true,
Callback = function(txt)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end
})
Crocs:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(state)
	if state then
		for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
else
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
	end    
})
Crocs:AddButton({
Name = "Speed loop(until u set value to false)",
Callback = function()
if db then return end
db = true
local lol = Instance.new("BoolValue", workspace)
lol.Value=true
repeat
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=50
wait()
until lol.Value == false
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
lol:Destroy()
db = false
end
})
local Misc = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local MiscMOTD = Misc:AddSection({
Name = "Miscellaneous"
})
Misc:AddButton({
Name = "Infinite Yield",
Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end
})
Misc:AddButton({
Name = "Linoria Hub",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OminousVibes-Exploit/Scripts/main/doors/main.lua"))()
end
})
Misc:AddParagraph("Warning!","While using Linoria hub, do not use Infinite yield! It'll break the hub")
Misc:AddButton({
Name = "Break Lights",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/BreakLights.lua"))()
end
})
Misc:AddTextbox({
Name = "Flicker Lights",
Default = "",
TextDissapear = true,
Callback = function(txt)
local rush = Instance.new("Model", game:GetService("Teams"))
rush.Name = "FlickerLights"
game:GetService("ReplicatedStorage").JumpscareModels.RushNew:Clone().Parent = rush
rush.RushNew.CanCollide = false
local tweensv = game:GetService("TweenService")
local currentLoadedRoom
local firstLoadedRoom

local function setRooms()
    local tb = {}
    table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
        if r:FindFirstChild("Base") then
            table.insert(tb, tonumber(r.Name))
        end
    end)
    firstLoadedRoom = workspace.CurrentRooms[tostring(math.min(unpack(tb)))]
    currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
    workspace.CurrentRooms.ChildAdded:Connect(function()
        local tb = {}
        table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
            if r:FindFirstChild("Base") then
                table.insert(tb, tonumber(r.Name))
            end
        end)
        currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
    end)
end
setRooms()

rush.Parent = workspace
rush:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

rush.RushNew.Attachment.BlackTrail.Enabled = false
rush.RushNew.PlaySound:Stop()
rush.RushNew.Footsteps:Stop()
require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), txt)
rush:Destroy()
end
})
Misc:AddLabel("Coming Soon!")
local Keybind = Window:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local KOTD = Keybind:AddSection({
Name = "Keybinds"
})
Keybind:AddBind({
	Name = "Eyes",
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function()
		local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Damage = 10, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Eyes", Configuration)
	end    
})
Keybind:AddBind({
Name = "Screech",
Default = Enum.KeyCode.E,
Hold = false,
Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
end
})
Keybind:AddBind({
Name = "Halt",
Default = Enum.KeyCode.R,
Hold = false,
Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end
})
Keybind:AddBind({
Name = "Glitch",
Default = Enum.KeyCode.T,
Hold = false,
Callback = function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end
})
Keybind:AddBind({
Name = "Seek",
Default = Enum.KeyCode.Y,
Hold = false,
Callback = function()
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Kill = false,
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Seek", Configuration)
end
})
Keybind:AddBind({
Name = "Seek Eyes",
Default = Enum.KeyCode.U,
Hold = false,
Callback = function()
require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms:WaitForChild(game.ReplicatedStorage.GameData.LatestRoom.Value), 14, 1665596753, true)
end
})
Keybind:AddBind({
Name = "Rush",
Default = Enum.KeyCode.F,
Hold = false,
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Rush.lua"))()
end
})
Keybind:AddBind({
Name = "Ambush",
Default = Enum.KeyCode.G,
Hold = false,
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Ambush.lua"))()
end
})
Keybind:AddBind({
Name = "Break Lights",
Default = Enum.KeyCode.H,
Hold = false,
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/BreakLights.lua"))()
end
})
Keybind:AddBind({
Name = "Flicker Lights",
Default = Enum.KeyCode.J,
Hold = false,
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/FlickerLights.lua"))()
end
})
OrionLib:Init()
end
function ScriptHub2()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Main = OrionLib:MakeWindow({Name = "Prison Life", HidePremium = false, IntroText = "Prison Life", SaveConfig = true, ConfigFolder = "PS_AC"})
local MainFrame = Main:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local MMOTD = MainFrame:AddSection({
Name = "Main scripts"
})
MainFrame:AddButton({
	Name = "Admin commands",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/1RvgFtcx"))()	
  	end 
})
MainFrame:AddButton({
Name = "Infinite Yield",
Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end
})
MainFrame:AddButton({
Name = "Kung Fu Master",
Callback = function()
-- Methods
local Methods = loadstring(game:HttpGet("https://raw.githubusercontent.com/coolsk8rboy/The-John-Cena-Factory/main/JohnCenasMain.lua"))()
-- Setup
Methods:SetIdleAnimation(7142933331, .1)
Methods:SetWalkAnimation(7142732585, .1)
Methods:SetWalkSpeed(8)
Methods:EnableSprinting(7142895580, .1, 25)
-- Fling
Methods:BodyPartFlingOnTouch("Right Arm")
Methods:BodyPartFlingOnTouch("Left Arm")
Methods:BodyPartFlingOnTouch("Right Leg")
Methods:BodyPartFlingOnTouch("Left Leg")
-- Key Connections
Methods:OnKeyPress("q", function()
    Methods:ApplyVelocityFoward(-5)
    Methods:ApplyVelocityUpward(80)
    Methods:PlayAnimation(7142738887, .1, 5)
end)
Methods:OnKeyPress("e", function()
    Methods:ApplyVelocityFoward(5)
    Methods:ApplyVelocityUpward(80)
    Methods:PlayAnimation(6936454190, .1, 5)
end)
-- Attacks
Methods:NewAttack("Attack1", "z", 7142975235, .1, 3)
Methods:NewAttack("Attack2", "x", 7142973417, .1, 3)
Methods:NewAttack("Attack3", "c", 7142740591, .1, 3)
Methods:NewAttack("Attack4", "v", 7142741890, .1, 3)
Methods:NewAttack("Attack5", "b", 6936458635, .1, 3)
Methods:NewAttack("Attack6", "t", 4837749916, .1, 2)
-- Finishing up
Methods:SetScriptCreator("CROAXER")
Methods:SystemMessage([[Controls:
z - Combo 1
x - Combo 2
c - Combo 3
v - Combo 4
b - Combo 5
e - Front Flip
q - Back Flip
t - Taunt
Left Alt - Sprint
]])
Methods:PlaySound(1842802203, true)
Methods:RunScript()
end
})
MainFrame:AddButton({
Name = "Laptop Boss(Edited)",
Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/EFQy8Mpf"))()
end
})
local Crocs = Window:MakeTab({
	Name = "LocalPlayer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Note = Crocs:AddSection({
Name = "Useful Hacks"
})
Crocs:AddTextbox({
Name = "Speed",
Default = "",
TextDissapear = true,
Callback = function(txt)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end
})
Crocs:AddTextbox({
Name = "JumpPower",
Default = "",
TextDissapear = true,
Callback = function(txt)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end
})
Crocs:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(state)
	if state then
		for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
else
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
	end    
})
end
