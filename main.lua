local function callback(Text)
if Text == "Load" then
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Main = Library.CreateLib("Doors", "Ocean")
local KH = Main:NewTab("Entities")
local MainFrame= KH:NewSection("Be like Kardin Hong")
MainFrame:NewTextBox("Spawn Eyes", "NOTE:Type here a number for eyes damage(IMPORTANT)", function(txt)
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Damage = txt , -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160,
    Time = 3,
}

EntitySpawner:Spawn("Eyes", Configuration)
end)
MainFrame:NewButton("Spawn Screech", "Spawns Screech in the game", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
end)
MainFrame:NewButton("Spawn Halt", "Spawns Halt in the game", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end)
MainFrame:NewButton("Spawn Glitch", "Spawns Glitch in the game", function()
  local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])  
end)
MainFrame:NewButton("Spawn Seek","Spawns Seek in starter rooms", function()
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/EntitySpawner.lua"))()
local Configuration = {}

EntitySpawner:Spawn("Seek", unpack(Configuration))
end)
MainFrame:NewButton("Seek Eyes","Works at 5 graphics settings", function()
require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms:WaitForChild(game.ReplicatedStorage.GameData.LatestRoom.Value), 14, 1665596753, true)
end)
MainFrame:NewButton("Spawn Rush","Spawns Rush into the game", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Rush.lua"))()
end)
MainFrame:NewButton("Spawn Ambush","Spawns Ambush into the game", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Ambush.lua"))()
end)
local Crocs = Main:NewTab("LocalPlayer")
local Hacks = Crocs:NewSection("Useful Hacks")
Hacks:NewTextBox("Speed", "Sets the given amount of speed to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)
Hacks:NewTextBox("JumpPower", "Sets the given amount of jumppower to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)
Hacks:NewToggle("Noclip", "Turns on noclip", function(state)
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
end)
local Misc = Main:NewTab("Misc")
local MiscS = Misc:NewSection("Other scripts")
MiscS:NewButton("Infinite Yield", "Gives you the IY Admin", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
MiscS:NewButton("Doors hub", "Runs the most good doors hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OminousVibes-Exploit/Scripts/main/doors/main.lua"))()
end)
MiscS:NewButton("Break Lights","Breaks the lights in the room", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/BreakLights.lua"))()
end)
MiscS:NewTextBox("Flicker Lights","Flickers the lights. MUST PUT DURATION NUMBER", function(txt)
local rush = Instance.new("Model", game:GetService("Teams"))
rush.Name = "RushMoving"
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
end)
MiscS:NewLabel("Other scripts coming soon!")
local Toggle = Main:NewTab("Keybind")
local Keybind = Toggle:NewSection("Keybinds")
Keybind:NewKeybind("ToggleGui", "Toggles the gui", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
Keybind:NewKeybind("Eyes", "Spawns eyes when pressed keybind", Enum.KeyCode.Q, function()
	local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Damage = 10, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160, -- 60 for rush, doesnt work on other entities
    Time = 3 -- 5 for rush, doesnt work on other entities
}

EntitySpawner:Spawn("Eyes", Configuration)
end)
Keybind:NewKeybind("Screech", "Spawns Screech when pressed keybind", Enum.KeyCode.E, function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
end)
Keybind:NewKeybind("Halt", "Spawns Halt when pressed keybind", Enum.KeyCode.R, function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end)
Keybind:NewKeybind("Glitch", "Spawns Glitch when pressed keybind", Enum.KeyCode.T, function()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
end)
Keybind:NewKeybind("Seek", "Spawns Seek when pressed keybind", Enum.KeyCode.Y, function()
local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
local Configuration = {
    Kill = false, -- change to "Damage = 10," for eyes, doesnt work on other entities
    Speed = 160, -- 60 for rush, doesnt work on other entities
    Time = 3 -- 5 for rush, doesnt work on other entities
}

EntitySpawner:Spawn("Seek", Configuration)
end)
Keybind:NewKeybind("Seek Eyes", "Spawns SeekEyes MUST HAVE 5 GRAPHICS ON", Enum.KeyCode.U, function()
require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms:WaitForChild(game.ReplicatedStorage.GameData.LatestRoom.Value), 14, 1665596753, true)
end)
Keybind:NewKeybind("Rush","Spawns Rush", Enum.KeyCode.G, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Rush.lua"))()
end)
Keybind:NewKeybind("Ambush","Spawns Ambush", Enum.KeyCode.H, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/Ambush.lua"))()
end)
Keybind:NewKeybind("Break Lights","Breaks the lights", Enum.KeyCode.J, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/BreakLights.lua"))()
end)
Keybind:NewKeybind("Flicker lights","Flickers the lights", Enum.KeyCode.K, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/FlickerLights.lua"))()
end)
end
end
local function callback2(Text)
if Text == "Load" then
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Main = Library.CreateLib("Prison Life", "Ocean")
local MainTab = Main:NewTab("Main")
local MainS = MainTab:NewSection("Main scripts")
MainS:NewButton("Admin commands", "Gives you the LocalPlayer Admin", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1RvgFtcx"))()
end)
MainS:NewButton("IY", "Gives you the Infinite Yield FE Admin", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
MainS:NewButton("KFM", "Runs the Kung fu master script", function()
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
end)
MainS:NewButton("Laptop Boss(Edited)", "Spawns the laptop boss with cutscene", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EFQy8Mpf"))()
end)
local Crocs = Main:NewTab("LocalPlayer")
local Hacks = Crocs:NewSection("Useful Hacks")
Hacks:NewTextBox("Speed", "Sets the given amount of speed to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)
Hacks:NewTextBox("JumpPower", "Sets the given amount of jumppower to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)
Hacks:NewToggle("Noclip", "Turns on noclip", function(state)
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
end)
local Toggle = Main:NewTab("Keybind")
local Keybind = Toggle:NewSection("Gui Toggle")
Keybind:NewKeybind("ToggleGui", "Toggles the gui", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
end
end
local function callback3(Text)
if Text == "Load" then
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Main = Library.CreateLib("Redwood Prison", "Ocean")
local MainTab = Main:NewTab("Main")
local MainS = MainTab:NewSection("Main scripts")
MainS:NewButton("Owl hub", "Runs the most op hub OWL Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)
MainS:NewButton("Get all gamepassed", "Gives u all gamepassed in game(except vehicles)", function()
    sv=function(a,b)
game:GetService("Workspace").resources.RemoteFunction:InvokeServer("setDataValue",a,b)
end
gv=function(a)
return game:GetService("Workspace").resources.RemoteFunction:InvokeServer("getDataValue",a)
end
sv("hasPilot",true)
sv("hasSwat",true)
sv("hasMerc",true)
sv("hasSpecOps",true)
sv("hasAtv",true)
end)
MainS:NewButton("IY", "Runs Infinite Yield FE admin", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
MainS:NewButton("KFM(LAG)", "Runs the Kung fu master script", function()
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
end)
MainS:NewButton("Laptop Boss(Edited)", "Spawns the laptop boss with cutscene", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EFQy8Mpf"))()
end)
local Crocs = Main:NewTab("LocalPlayer")
local Hacks = Crocs:NewSection("Useful Hacks")
Hacks:NewTextBox("Speed", "Sets the given amount of speed to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)
Hacks:NewTextBox("JumpPower", "Sets the given amount of jumppower to your Humanoid", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)
Hacks:NewToggle("Noclip", "Turns on noclip", function(state)
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
end)
local Toggle = Main:NewTab("Keybind")
local Keybind = Toggle:NewSection("Gui Toggle")
Keybind:NewKeybind("ToggleGui", "Toggles the gui", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
end
end
local function callback4(Text)
if Text == "Break In!" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/break-in-v1/main/.gitignore"))();
end
end
local SG = game.StarterGui
SG:SetCore("SendNotification",{
Title = "",
Text = "Checking if game supported",
Icon = "",
Duration = 2
})
wait(2)
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
if game.PlaceId == 6839171747 then
SG:SetCore("SendNotification", {
Title = "Kip Hub",
Text = "Game supported! Load hub?",
Icon = "",
Duration = 5,
Button1 = "Load",
Callback = NotificationBindable;
})
elseif game.PlaceId == 155615604 then
local NotificationBind = Instance.new("BindableFunction")
NotificationBind.OnInvoke = callback2
SG:SetCore("SendNotification", {
Title = "Kip Hub",
Text = "Game supported! Load hub?",
Icon = "",
Duration = 5,
Button1 = "Load",
Callback = NotificationBind;
})
elseif game.PlaceId == 402122991 then
local NotificationBind2 = Instance.new("BindableFunction")
NotificationBind2.OnInvoke = callback3
SG:SetCore("SendNotification", {
Title = "Kip Hub",
Text = "Game supported! Load hub?",
Icon = "",
Duration = 5,
Button1 = "Load",
Callback = NotificationBind2;
})
elseif game.PlaceId == 4620170611 then
local NotificationBind3 = Instance.new("BindableFunction")
NotificationBind3.OnInvoke = callback4
SG:SetCore("SendNotification", {
Title = "Kip Hub",
Text = "Game supported! Load Plasma hub?",
Icon = "",
Duration = 5,
Button1 = "Break In!",
Callback = NotificationBind3;
})
else
SG:SetCore("SendNotification", {
Title = "Kip Hub",
Text = "Sorry. The game is not supported. Please join a supported game!",
Icon = "",
Duration = 5,
Button1 = "Okay",
})
end
