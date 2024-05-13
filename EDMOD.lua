local plr = game.Players.LocalPlayer
local gam = workspace.Game
local entities = gam.Entities
local ds = plr.PlayerGui.DeathScreen
local function GetGitSound(GithubSnd,SoundName,snd)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=snd
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
end
local function GetGitImage(GithubImg,ImageName,img)
	local url=GithubImg
	if not isfile(ImageName..".png") then
		writefile(ImageName..".png", game:HttpGet(url))
	end
	local image=img
	if image:IsA("ImageLabel") then
	image.Image=(getcustomasset or getsynasset)(ImageName..".png")
	elseif image:IsA("ParticleEmitter") then
		image.Texture=(getcustomasset or getsynasset)(ImageName..".png")
	end
	return image
end
local m1 = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Matcher.png?raw=true","EpicMatcher",ds.Matcher)
local m2 = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Matcher.png?raw=true","EpicMatcher",ds.Matcher2)
local r1 = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Rebound.png?raw=true","EpicRebound",ds.Rebound)
local match = GetGitSound("https://github.com/Kiprov/Kip-Hub/blob/main/DogScream.mp3?raw=true","MatchScream",ds.MatcherScream)
local bound = GetGitSound("https://github.com/Kiprov/Kip-Hub/blob/main/DogScream2.mp3?raw=true","BoundScream",ds.ReboundScream)
entities.ChildAdded:Connect(function(child)
if child.Name == "Matcher" then
local root = child:WaitForChild("Root")
local attach = root.Attachment
local ma = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Matcher.png?raw=true","EpicMatcher",attach.Entity)
root.Idle.SoundId = "rbxassetid://2180219416"
elseif child.Name == "Rebound" then
local root = child:WaitForChild("Root")
local attach = root.Attachment
local re = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Rebound.png?raw=true","EpicRebound",attach.Entity)
local idle = GetGitSound("https://github.com/Kiprov/Kip-Hub/blob/main/PinchMode.mp3?raw=true","PinchMode",root.Idle)
elseif child.Name == "Claim" then
local attach = child:WaitForChild("Attachment")
child.Spawn.SoundId = "rbxassetid://5274463739"
child.Whisper.SoundId = "rbxassetid://3734543629"
child.Kill.SoundId = "rbxassetid://9083355768"
local cl = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/Claim.png?raw=true","EpicClaim",attach.Eyes)
local cl2 = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/ClaimVFX.png?raw=true","GreenFarts",attach.Sparkles)
child.PointLight.Color = Color3.new(0,1,0)
child.Leftovers.Color = ColorSequence.new(Color3.fromRGB(57, 40, 0))
elseif child.Name == "Blink" then
local attach = child:WaitForChild("Attachment")
local bl = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/BlinkClosedEyes.png?raw=true","EpicBlinkClosed",child.ClosedParticle)
local bl2 = GetGitImage("https://github.com/Kiprov/Kip-Hub/blob/main/PNG/BlinkOpenEyes.png?raw=true","EpicBlinkClosed",child.OpenParticle)
child.Spawn.SoundId = "rbxassetid://5104257032"
child.Whisper.SoundId = "rbxassetid://3839780286"
child.PointLight.Color = Color3.new(1,1,1)
child.OpenParticle.Color = ColorSequence.new(Color3.new(1,1,1))
end
end)