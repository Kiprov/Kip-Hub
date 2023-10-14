if not game:GetService("RunService"):IsServer() then
  error("Script must be ran on serverside. Use h/ instead of hl/!")
  else
    -- Gui to Lua
-- Version: 3.2

-- Instances:

local Scripts = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Close = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Canvas = Instance.new("ScrollingFrame")
local Template = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIGridLayout = Instance.new("UIGridLayout")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local Credits = Instance.new("TextLabel")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local Open = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")

--Properties:

Scripts.Name = "Scripts"
Scripts.Parent = owner:WaitForChild("PlayerGui")
Scripts.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = Scripts
Main.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.330990851, 0, 0.268741161, 0)
Main.Size = UDim2.new(0, 481, 0, 327)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Main

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 419, 0, 50)
Title.Font = Enum.Font.Unknown
Title.Text = "Script Collection"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UIAspectRatioConstraint.Parent = Title
UIAspectRatioConstraint.AspectRatio = 8.380

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.fromRGB(8, 136, 255)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.871101856, 0, 0, 0)
Close.Size = UDim2.new(0, 62, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

UIAspectRatioConstraint_2.Parent = Close
UIAspectRatioConstraint_2.AspectRatio = 1.240

Canvas.Name = "Canvas"
Canvas.Parent = Main
Canvas.Active = true
Canvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Canvas.BackgroundTransparency = 1.000
Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
Canvas.BorderSizePixel = 0
Canvas.Position = UDim2.new(0, 0, 0.152905196, 0)
Canvas.Size = UDim2.new(0, 481, 0, 234)

Template.Name = "Template"
Template.Parent = Canvas
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 200, 0, 50)
Template.Font = Enum.Font.SourceSans
Template.Text = "Template"
Template.TextColor3 = Color3.fromRGB(121, 121, 121)
Template.TextScaled = true
Template.TextSize = 14.000
Template.TextWrapped = true

UICorner_2.Parent = Template

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.23, Color3.fromRGB(116, 17, 17)), ColorSequenceKeypoint.new(0.35, Color3.fromRGB(91, 27, 27)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(133, 59, 59)), ColorSequenceKeypoint.new(0.63, Color3.fromRGB(80, 0, 0)), ColorSequenceKeypoint.new(0.78, Color3.fromRGB(77, 0, 0)), ColorSequenceKeypoint.new(0.91, Color3.fromRGB(57, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Parent = Template

UIAspectRatioConstraint_3.Parent = Template
UIAspectRatioConstraint_3.AspectRatio = 3.677

UIGridLayout.Parent = Canvas
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0.5, 0, 0.100000001, 0)

UIAspectRatioConstraint_4.Parent = Canvas
UIAspectRatioConstraint_4.AspectRatio = 2.056

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.847094774, 0)
Credits.Size = UDim2.new(0, 481, 0, 50)
Credits.Font = Enum.Font.Unknown
Credits.Text = "Made by Skeleton"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextWrapped = true

UIAspectRatioConstraint_5.Parent = Credits
UIAspectRatioConstraint_5.AspectRatio = 9.620

UIAspectRatioConstraint_6.Parent = Main
UIAspectRatioConstraint_6.AspectRatio = 1.471

Open.Name = "Open"
Open.Parent = Scripts
Open.Active = false
Open.BackgroundColor3 = Color3.fromRGB(19, 133, 255)
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(-1, 0, 0.463999987, 0)
Open.Size = UDim2.new(0, 123, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(255, 255, 255)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = Open

UIAspectRatioConstraint_7.Parent = Open
UIAspectRatioConstraint_7.AspectRatio = 2.460

-- Scripts:

local function TUGNV_fake_script() -- Main.Dragify 
	local script = Instance.new('LocalScript', Main)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(TUGNV_fake_script)()
local function XLJK_fake_script() -- Main.Main 
	local script = Instance.new('Script', Main)

	--Variables
	task.spawn(function()
		while wait() do
			local owner = script.Parent.Parent.Parent.Parent
			if not owner then return end
			return owner
		end
	end)
	local btn = script.Parent.Close
	local btn2 = script.Parent.Parent.Open
	local main = script.Parent
	local click = btn.Click
	local canvas = main.Canvas
	local HttpService = game:GetService("HttpService")
	
	local temp = canvas.Template:Clone()
	canvas.Template:Destroy()
	--Scripts data
	local URL = "https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/VSBScripts/allscriptsdata.json"
	
	local response = HttpService:GetAsync(URL)
	
	local SCRIPTS_DATA = HttpService:JSONDecode(response)
	--Tables
	local colors = {
		Cyan = btn.BackgroundColor3;
		Red = Color3.new(1,0,0)
	}
	
	local sizes = {
		OG = UDim2.new(0, 481,0, 327),
		New = UDim2.new(0, 511,0, 357)
	}
	
	local TS = game:GetService("TweenService")
	--Tweens
	local tweens = {
		cyantween = TS:Create(btn,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = colors.Cyan});
		redtween = TS:Create(btn,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = colors.Red});
		mainclose = TS:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = UDim2.new(0,0,0,0)});
		mainopen = TS:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = UDim2.new(0, 481,0, 327)});
		openslideright = TS:Create(btn2,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0, 0,0.464, 0)});
		openslideleft = TS:Create(btn2,TweenInfo.new(3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(-1, 0,0.464, 0)});
		mainsizeog = TS:Create(main,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = sizes.OG});
		mainsizenew = TS:Create(main,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = sizes.New})
	}
	--Functions
	local function calculateScripts(data:any)
		print("SETUP.EXE HAS BEEN EXECUTED!")
		wait(1)
		for i, scriptneed in pairs(data.Scripts) do
			local template = temp:Clone()
			template.Parent = canvas
			template.Name = i
			template.Text = i
			--FINAL PART
			template.MouseButton1Click:Connect(function()
				template.Click:Play()
				loadstring(HttpService:GetAsync(scriptneed))()
			end)
		end
		print("SETUP.EXE HAS BEEN FINISHED!")
		wait(1)
		print("TOTAL SCRIPTS AFFECTED:"..data.Total)
	end
	calculateScripts(SCRIPTS_DATA)
	--Connections
	btn.MouseEnter:Connect(function()
		tweens.redtween:Play()
	end)
	
	btn.MouseLeave:Connect(function()
		tweens.cyantween:Play()
	end)
	
	btn.MouseButton1Click:Connect(function()
		click:Play()
		btn.Active = false
		tweens.mainclose:Play()
		wait(1)
		tweens.openslideright:Play()
		tweens.openslideright.Completed:Wait()
		btn2.Active = true
	end)
	
	btn2.MouseButton1Click:Connect(function()
		click:Play()
		tweens.openslideleft:Play()
		btn2.Active = false
		wait(1)
		tweens.mainopen:Play()
		tweens.mainopen.Completed:Wait()
		btn.Active = true
	end)
end
coroutine.wrap(XLJK_fake_script)()
end
