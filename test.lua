getgenv().SecureMode = true 
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Doors Hub",
	LoadingTitle = "Doors Epic Hub",
	LoadingSubtitle = "by kiprovka26",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "DoorsAC"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Kip Hub Modern",
		Subtitle = "Key System",
		Note = "Theres no key for you JAJAJAJA",
		FileName = "KHKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "UnlockKardinHongCrocs"
	}
})
Rayfield:LoadConfiguration()
