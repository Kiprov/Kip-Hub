-- Gui to Lua
-- Version: 3.2

-- Instances:

local KipX = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local Status = Instance.new("TextLabel")
local LoadCircle = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UI_Sounds = Instance.new("Folder")
local Boing = Instance.new("Sound")
local Error = Instance.new("Sound")
local Notification = Instance.new("Sound")
local Success = Instance.new("Sound")
local Type = Instance.new("Sound")
local UI_Click = Instance.new("Sound")
local UI_Close = Instance.new("Sound")
local UI_Hover = Instance.new("Sound")
local UI_Open = Instance.new("Sound")
local LogIn = Instance.new("Frame")
local DropShadowHolder_2 = Instance.new("Frame")
local DropShadow_2 = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local Title2 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local UsernameBox = Instance.new("TextBox")
local PasswordBox = Instance.new("TextBox")
local Login = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Main = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Logo = Instance.new("TextLabel")
local UIGradient_4 = Instance.new("UIGradient")
local Title_3 = Instance.new("TextLabel")
local UIGradient_5 = Instance.new("UIGradient")
local Status_2 = Instance.new("TextLabel")
local UIGradient_6 = Instance.new("UIGradient")
local Indicator = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local Input = Instance.new("TextBox")
local Execute = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local UIScale = Instance.new("UIScale")
local Clear = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UIScale_2 = Instance.new("UIScale")
local Inject = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local UIScale_3 = Instance.new("UIScale")
local Title2_2 = Instance.new("TextLabel")
local UIGradient_7 = Instance.new("UIGradient")
local Scripts = Instance.new("ScrollingFrame")
local Template = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local UIScale_4 = Instance.new("UIScale")
local UIListLayout = Instance.new("UIListLayout")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local OpenUI = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Open = Instance.new("TextButton")
local UIGradient_8 = Instance.new("UIGradient")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local Shadow = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")

--Properties:

KipX.Name = "KipX"
KipX.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KipX.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Loader.Name = "Loader"
Loader.Parent = KipX
Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
Loader.BorderSizePixel = 0
Loader.ClipsDescendants = true
Loader.Position = UDim2.new(0.43900001, 0, -1, 0)
Loader.Size = UDim2.new(0, 20, 0, 20)

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Loader
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.Visible = false
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Loader

Title.Name = "Title"
Title.Parent = Loader
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.375, 0, 0.200000003, 0)
Title.Size = UDim2.new(0, 50, 0, 50)
Title.Font = Enum.Font.Unknown
Title.Text = "K"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient.Parent = Title

Status.Name = "Status"
Status.Parent = Loader
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0.375, 0, 0.75, 0)
Status.Size = UDim2.new(0, 50, 0, 50)
Status.Font = Enum.Font.Unknown
Status.Text = "Loading"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 14.000
Status.TextTransparency = 1.000

LoadCircle.Name = "LoadCircle"
LoadCircle.Parent = Loader
LoadCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadCircle.BackgroundTransparency = 1.000
LoadCircle.Position = UDim2.new(0.370051563, 0, 0.566458464, 0)
LoadCircle.Size = UDim2.new(0, 50, 0, 50)
LoadCircle.SizeConstraint = Enum.SizeConstraint.RelativeYY
LoadCircle.Visible = false
LoadCircle.Image = "rbxassetid://2632484460"

UIAspectRatioConstraint.Parent = Loader

UI_Sounds.Name = "UI_Sounds"
UI_Sounds.Parent = KipX

Boing.Name = "Boing"
Boing.Parent = UI_Sounds
Boing.SoundId = "rbxasset://sounds//short spring sound.wav"
Boing.Volume = 1

Error.Name = "Error"
Error.Parent = UI_Sounds
Error.SoundId = "rbxassetid://136075117"
Error.Volume = 1

Notification.Name = "Notification"
Notification.Parent = UI_Sounds
Notification.SoundId = "rbxassetid://6897623656"
Notification.Volume = 1

Success.Name = "Success"
Success.Parent = UI_Sounds
Success.SoundId = "rbxassetid://3997124966"
Success.Volume = 1

Type.Name = "Type"
Type.Parent = UI_Sounds
Type.SoundId = "rbxassetid://9113868529"
Type.Volume = 5

UI_Click.Name = "UI_Click"
UI_Click.Parent = UI_Sounds
UI_Click.SoundId = "rbxassetid://6895079853"
UI_Click.Volume = 1

UI_Close.Name = "UI_Close"
UI_Close.Parent = UI_Sounds
UI_Close.SoundId = "rbxassetid://7025035451"
UI_Close.Volume = 1

UI_Hover.Name = "UI_Hover"
UI_Hover.Parent = UI_Sounds
UI_Hover.SoundId = "rbxassetid://542332175"
UI_Hover.Volume = 1

UI_Open.Name = "UI_Open"
UI_Open.Parent = UI_Sounds
UI_Open.SoundId = "rbxassetid://2062119347"
UI_Open.Volume = 1


LogIn.Name = "LogIn"
LogIn.Parent = KipX
LogIn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LogIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
LogIn.BorderSizePixel = 0
LogIn.ClipsDescendants = true
LogIn.Position = UDim2.new(0.381283849, 0, 0.195652172, 0)
LogIn.Visible = false

DropShadowHolder_2.Name = "DropShadowHolder"
DropShadowHolder_2.Parent = LogIn
DropShadowHolder_2.BackgroundTransparency = 1.000
DropShadowHolder_2.BorderSizePixel = 0
DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder_2.ZIndex = 0

DropShadow_2.Name = "DropShadow"
DropShadow_2.Parent = DropShadowHolder_2
DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow_2.BackgroundTransparency = 1.000
DropShadow_2.BorderSizePixel = 0
DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow_2.Size = UDim2.new(1, 47, 1, 47)
DropShadow_2.ZIndex = 0
DropShadow_2.Image = "rbxassetid://6014261993"
DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow_2.ImageTransparency = 0.500
DropShadow_2.ScaleType = Enum.ScaleType.Slice
DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

UICorner_2.Parent = LogIn

Title_2.Name = "Title"
Title_2.Parent = LogIn
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.417483658, 0, 0.0186157599, 0)
Title_2.Size = UDim2.new(0, 50, 0, 50)
Title_2.Font = Enum.Font.Unknown
Title_2.Text = "K"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_2.Parent = Title_2

Title2.Name = "Title2"
Title2.Parent = LogIn
Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title2.BackgroundTransparency = 1.000
Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title2.BorderSizePixel = 0
Title2.Position = UDim2.new(0.343552142, 0, 0.152267307, 0)
Title2.Size = UDim2.new(0, 95, 0, 50)
Title2.Font = Enum.Font.Unknown
Title2.Text = "LOGIN"
Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title2.TextScaled = true
Title2.TextSize = 14.000
Title2.TextWrapped = true

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_3.Parent = Title2

UsernameBox.Name = "UsernameBox"
UsernameBox.Parent = LogIn
UsernameBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
UsernameBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
UsernameBox.BorderSizePixel = 0
UsernameBox.Position = UDim2.new(0.169934645, 0, 0.357995212, 0)
UsernameBox.Size = UDim2.new(0, 200, 0, 50)
UsernameBox.Font = Enum.Font.Unknown
UsernameBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.PlaceholderText = "Username"
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextScaled = true
UsernameBox.TextSize = 14.000
UsernameBox.TextWrapped = true

PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = LogIn
PasswordBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PasswordBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(0.173202619, 0, 0.615751803, 0)
PasswordBox.Size = UDim2.new(0, 200, 0, 50)
PasswordBox.Font = Enum.Font.Unknown
PasswordBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.PlaceholderText = "Password"
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.TextScaled = true
PasswordBox.TextSize = 14.000
PasswordBox.TextWrapped = true

Login.Name = "Login"
Login.Parent = LogIn
Login.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Login.BorderColor3 = Color3.fromRGB(0, 0, 0)
Login.BorderSizePixel = 0
Login.Position = UDim2.new(0.258584827, 0, 0.806682587, 0)
Login.Size = UDim2.new(0, 147, 0, 50)
Login.Font = Enum.Font.Unknown
Login.Text = "LOG IN"
Login.TextColor3 = Color3.fromRGB(255, 255, 255)
Login.TextScaled = true
Login.TextSize = 14.000
Login.TextWrapped = true

UIAspectRatioConstraint_2.Parent = LogIn
UIAspectRatioConstraint_2.AspectRatio = 0.730

Main.Name = "Main"
Main.Parent = KipX
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.292343378, 0, 0.249279544, 0)
Main.Visible = false

UICorner_3.Parent = Main

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0, 0, -0.0011494077, 0)
Logo.Size = UDim2.new(0, 50, 0, 50)
Logo.Font = Enum.Font.Unknown
Logo.Text = "K"
Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Logo.TextScaled = true
Logo.TextSize = 14.000
Logo.TextWrapped = true

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_4.Parent = Logo

Title_3.Name = "Title"
Title_3.Parent = Main
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.406716406, 0, -0.0011494077, 0)
Title_3.Size = UDim2.new(0, 74, 0, 50)
Title_3.Font = Enum.Font.Unknown
Title_3.Text = "KIP X"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextScaled = true
Title_3.TextSize = 14.000
Title_3.TextWrapped = true

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_5.Parent = Title_3

Status_2.Name = "Status"
Status_2.Parent = Main
Status_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_2.BackgroundTransparency = 1.000
Status_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status_2.BorderSizePixel = 0
Status_2.Position = UDim2.new(0, 0, 0.91839081, 0)
Status_2.Size = UDim2.new(0, 189, 0, 27)
Status_2.Font = Enum.Font.Unknown
Status_2.Text = "STATUS:NOT INJECTED"
Status_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Status_2.TextScaled = true
Status_2.TextSize = 14.000
Status_2.TextWrapped = true

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_6.Parent = Status_2

Indicator.Name = "Indicator"
Indicator.Parent = Main
Indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Indicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
Indicator.BorderSizePixel = 0
Indicator.Position = UDim2.new(0.352611929, 0, 0.928160906, 0)
Indicator.Size = UDim2.new(0, 20, 0, 20)
Indicator.Font = Enum.Font.SourceSans
Indicator.Text = ""
Indicator.TextColor3 = Color3.fromRGB(0, 0, 0)
Indicator.TextSize = 14.000

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = Indicator

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.906716406, 0, 0, 0)
Close.Size = UDim2.new(0, 50, 0, 34)
Close.Font = Enum.Font.Unknown
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

Input.Name = "Input"
Input.Parent = Main
Input.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderSizePixel = 0
Input.Position = UDim2.new(0, 0, 0.169540226, 0)
Input.Size = UDim2.new(0, 406, 0, 208)
Input.Font = Enum.Font.Unknown
Input.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Input.PlaceholderText = "print(\"Kip X on top!\")"
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 14.000
Input.TextWrapped = true
Input.TextXAlignment = Enum.TextXAlignment.Left
Input.TextYAlignment = Enum.TextYAlignment.Top

Execute.Name = "Execute"
Execute.Parent = Main
Execute.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 0, 0.767241359, 0)
Execute.Size = UDim2.new(0, 197, 0, 52)
Execute.Font = Enum.Font.Unknown
Execute.Text = "EXECUTE"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true

UICorner_5.Parent = Execute

UIScale.Parent = Execute

Clear.Name = "Clear"
Clear.Parent = Main
Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.389925361, 0, 0.767241359, 0)
Clear.Size = UDim2.new(0, 197, 0, 52)
Clear.Font = Enum.Font.Unknown
Clear.Text = "CLEAR"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextScaled = true
Clear.TextSize = 14.000
Clear.TextWrapped = true

UICorner_6.Parent = Clear

UIScale_2.Parent = Clear

Inject.Name = "Inject"
Inject.Parent = Main
Inject.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Inject.BorderColor3 = Color3.fromRGB(0, 0, 0)
Inject.BorderSizePixel = 0
Inject.Position = UDim2.new(0.768656731, 0, 0.767241359, 0)
Inject.Size = UDim2.new(0, 124, 0, 52)
Inject.Font = Enum.Font.Unknown
Inject.Text = "INJECT"
Inject.TextColor3 = Color3.fromRGB(255, 255, 255)
Inject.TextScaled = true
Inject.TextSize = 14.000
Inject.TextWrapped = true

UICorner_7.Parent = Inject

UIScale_3.Parent = Inject

Title2_2.Name = "Title2"
Title2_2.Parent = Main
Title2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title2_2.BackgroundTransparency = 1.000
Title2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title2_2.BorderSizePixel = 0
Title2_2.Position = UDim2.new(0.777985096, 0, 0.073563233, 0)
Title2_2.Size = UDim2.new(0, 114, 0, 50)
Title2_2.Font = Enum.Font.Unknown
Title2_2.Text = "SCRIPTS:"
Title2_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title2_2.TextScaled = true
Title2_2.TextSize = 14.000
Title2_2.TextWrapped = true

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_7.Parent = Title2_2

Scripts.Name = "Scripts"
Scripts.Parent = Main
Scripts.Active = true
Scripts.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Scripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scripts.BorderSizePixel = 0
Scripts.Position = UDim2.new(0.75746268, 0, 0.217241302, 0)
Scripts.Size = UDim2.new(0, 130, 0, 185)
Scripts.CanvasSize = UDim2.new(0, 0, 0, 0)

Template.Name = "Template"
Template.Parent = Scripts
Template.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 124, 0, 50)
Template.Font = Enum.Font.Unknown
Template.Text = "Script 1"
Template.TextColor3 = Color3.fromRGB(255, 255, 255)
Template.TextScaled = true
Template.TextSize = 14.000
Template.TextWrapped = true

UICorner_8.Parent = Template

UIScale_4.Parent = Template

UIListLayout.Parent = Scripts
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UIAspectRatioConstraint_3.Parent = Main
UIAspectRatioConstraint_3.AspectRatio = 1.540

OpenUI.Name = "OpenUI"
OpenUI.Parent = KipX
OpenUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenUI.BorderSizePixel = 0
OpenUI.ClipsDescendants = true
OpenUI.Position = UDim2.new(0, 0, 0.81556195, 0)
OpenUI.Visible = false

UICorner_9.Parent = OpenUI

Open.Name = "Open"
Open.Parent = OpenUI
Open.Active = false
Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Open.BackgroundTransparency = 1.000
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderSizePixel = 0
Open.Size = UDim2.new(1, 0, 1, 0)
Open.Font = Enum.Font.Unknown
Open.Text = "OPEN"
Open.TextColor3 = Color3.fromRGB(255, 255, 255)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(37, 255, 26)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(36, 65, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(4, 36, 0))}
UIGradient_8.Parent = Open

UIAspectRatioConstraint_4.Parent = OpenUI

Shadow.Name = "Shadow"
Shadow.Parent = KipX
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.500
Shadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BorderSizePixel = 0
Shadow.ClipsDescendants = true
Shadow.Position = UDim2.new(0.287972778, 0, 0.239683732, 0)
Shadow.Visible = false
Shadow.ZIndex = 0

UICorner_10.Parent = Shadow

UIAspectRatioConstraint_5.Parent = Shadow
UIAspectRatioConstraint_5.AspectRatio = 1.522

--Scripts:
local function LogIn_LS()
	local main = LogIn
	local username,password = main.UsernameBox,main.PasswordBox
	local login = main.Login
	local gbp = ""
	local user,pass = "Kiprov","KipXPassword"
	local sfx = main.Parent.UI_Sounds
	username.Changed:Connect(function(prop)
		if prop == "Text" then
			local type = sfx.Type:Clone()
			type.PlayOnRemove = true
			type.Parent = sfx
			type:Destroy()
		end
	end)
	password.Changed:Connect(function(prop)
		if prop == "Text" then
			local type = sfx.Type:Clone()
			type.PlayOnRemove = true
			type.Parent = sfx
			type:Destroy()
			gbp = password.Text
		end
	end)
	login.MouseButton1Click:Connect(function()
		if username.Text == user and password.Text == pass then
			writefile("KipX\Login","hehe")
			main.Parent.Loader:SetAttribute("FinishLogin",true)
		end
	end)
end
local function Main_LS()
	local scripts
	if not isfile("KipX\Scripts") then
		scripts = makefolder("KipX\Scripts")
	else
		scripts = "KipX\Scripts"
	end
	local main = Main
	local scriptfold = main.Scripts
	local template = scriptfold.Template:Clone()
	scriptfold.Template:Destroy()
	local status = main.Status
	local shadow = main.Parent.Shadow
	local open = main.Parent.OpenUI
	local ind = main.Indicator
	local close = main.Close
	local input = main.Input
	local execute,clear,inject = main.Execute,main.Clear,main.Inject
	local injected = false
	local blur = workspace.CurrentCamera.MainEffect
	local sfx = main.Parent.UI_Sounds
	local canvas = 0
	local tween1 = game.TweenService:Create(blur,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = 30})
	local tween2 = game.TweenService:Create(blur,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = 0})
	local tween3 = game.TweenService:Create(main,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 536,0, 348)})
	local tween4 = game.TweenService:Create(main,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new()})
	local tween9 = game.TweenService:Create(shadow,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new()})
	local tween10 = game.TweenService:Create(shadow,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 548,0, 360)})
	local tween5 = game.TweenService:Create(close,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.new(1,0,0)})
	local tween6 = game.TweenService:Create(close,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.new(0,0,0)})
	local tween7 = game.TweenService:Create(ind,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.new(1,1,0)})
	local tween8 = game.TweenService:Create(ind,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.new(0,1,0)})
	local tween11 = game.TweenService:Create(open,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new()})
	local tween12 = game.TweenService:Create(open,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 100,0,100)})
	spawn(function()
		while wait() do
			shadow.Position = main.Position
		end
	end)
	input.Changed:Connect(function(prop)
		if prop == "Text" then
			local type = sfx.Type:Clone()
			type.PlayOnRemove = true
			type.Parent = sfx
			type:Destroy()
		end
	end)
	close.MouseEnter:Connect(function()
		tween5:Play()
	end)
	close.MouseLeave:Connect(function()
		tween6:Play()
	end)
	close.MouseButton1Click:Connect(function()
		close.Active = false
		sfx.UI_Close:Play()
		tween4:Play()
		tween2:Play()
		tween9:Play()
		tween4.Completed:Wait()
		main.Visible = false
		shadow.Visible = false
		wait(1)
		open.Visible = true
		sfx.UI_Open:Play()
		tween12:Play()
		wait(1.044)
		open.Open.Active = true
	end)
	open.Open.MouseButton1Click:Connect(function()
		sfx.UI_Close:Play()
		tween11:Play()
		tween11.Completed:Wait()
		open.Visible = false
		wait(1)
		sfx.UI_Open:Play()
		main.Visible = true
		shadow.Visible = true
		tween3:Play()
		tween1:Play()
		tween10:Play()
		wait(1.044)
		close.Active = true
	end)
	local function setupButton(btn,f)
		btn.MouseEnter:Connect(function()
			sfx.UI_Hover:Play()
			local tween = game.TweenService:Create(btn.UIScale,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Scale = 1.05})
			tween:Play()
		end)
		btn.MouseLeave:Connect(function()
			sfx.UI_Hover:Play()
			local tween = game.TweenService:Create(btn.UIScale,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Scale = 1})
			tween:Play()
		end)
		btn.MouseButton1Click:Connect(f)
	end
	setupButton(execute,function()
		sfx.UI_Click:Play()
		if injected == false then return end
		loadstring(input.Text)
	end)
	setupButton(clear,function()
		sfx.UI_Click:Play()
		input.Text = ""
	end)
	setupButton(inject,function()
		sfx.UI_Click:Play()
		if injected == false then
			tween7:Play()
			status.Text = "STATUS:INJECTING"
			for i = 1,5 do
				status.Text = "STATUS:INJECTING."
				wait(.5)
				status.Text = "STATUS:INJECTING.."
				wait(.5)
				status.Text = "STATUS:INJECTING..."
				wait(.5)
			end
			injected = true
			status.Text = "STATUS:INJECTED"
			tween8:Play()
		end
	end)
	local ebat = listfiles(scripts)
	for i = 1,#ebat do
		canvas = canvas + 0.2
		local scriptik = ebat[i]
		local script = template:Clone()
		script.Parent = scriptfold
		script.Name = scriptik
		scriptfold.CanvasSize = UDim2.new(0,0,canvas,0)
		setupButton(script,function()
			if injected == false then return end
			loadstring(readfile(scriptik))
		end)
	end
end
local function Loader_LS()
	game.CoreGui.FluxusAndroidUI:Destroy()
	repeat wait() until game:IsLoaded()
	local mainfolder
	if not isfile("KipX") then
		mainfolder = makefolder("KipX")
	else
		mainfolder = "KipX"
	end
	local main = Main
	local login = main.Parent.LogIn
	local mainfr = main.Parent.Main
	local shadow = main.Parent.Shadow
	local corner = main.UICorner
	local status = main.Status
	local circle = main.LoadCircle
	local tween1 = game.TweenService:Create(main,TweenInfo.new(.621,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out),{Position = UDim2.new(0.492, 0,0.486, 0)})
	local tween2 = game.TweenService:Create(main,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Position = UDim2.new(0.439, 0,0.355, 0),Size = UDim2.new(0,200,0,200)})
	local tween6 = game.TweenService:Create(main,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new()})
	local tween7 = game.TweenService:Create(login,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 306,0, 419)})
	local tween8 = game.TweenService:Create(login,TweenInfo.new(1.276,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new()})
	local tween9 = game.TweenService:Create(mainfr,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 536,0, 348)})
	local tween10 = game.TweenService:Create(shadow,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.new(0, 548,0, 360)})
	local blur = Instance.new("BlurEffect",workspace.CurrentCamera)
	blur.Size = 0
	blur.Name = "MainEffect"
	local tween3 = game.TweenService:Create(blur,TweenInfo.new(1.044,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = 30})
	local tween4 = game.TweenService:Create(corner,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{CornerRadius = UDim.new(0,8)})
	local tween5 = game.TweenService:Create(status,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{TextTransparency = 0})
	local sfx = UI_Sounds
	sfx.Boing:Play()
	tween1:Play()
	wait(1)
	sfx.UI_Open:Play()
	tween2:Play()
	tween3:Play()
	tween4:Play()
	wait(1.5)
	tween5:Play()
	wait(1)
	status.Flash.Enabled = true
	circle.Visible = true
	for i = 1,5 do
		status.Text = "Loading."
		wait(.5)
		status.Text = "Loading.."
		wait(.5)
		status.Text = "Loading..."
		wait(.5)
	end
	for i = 1,5 do
		status.Text = "Checking login details."
		wait(.5)
		status.Text = "Checking login details.."
		wait(.5)
		status.Text = "Checking login details..."
		wait(.5)
	end
	if not isfile("KipX\Login") then
		status:SetAttribute("Flashing",false)
		sfx.Error:Play()
		circle.Visible = false
		status.Text = "Validation Error!"
		for i = 1,20 do
			status.TextColor3 = Color3.new(1,0,0)
			wait()
		end
		wait(1)
		sfx.Notification:Play()
		status.Text = "Please login!"
		wait(3)
		sfx.UI_Close:Play()
		tween6:Play()
		tween6.Completed:Wait()
		main.Visible = false
		status.Text = ""
		status.TextColor3 = Color3.new(1,1,1)
		wait(1)
		login.Visible = true
		sfx.UI_Open:Play()
		tween7:Play()
		spawn(LogIn_LS)
		repeat wait() until main:GetAttribute("FinishLogin") == true
		sfx.UI_Close:Play()
		tween8:Play()
		tween8.Completed:Wait()
		login.Visible = false
		wait(1)
		main.Visible = true
		sfx.UI_Open:Play()
		tween2:Play()
		wait(1.044)
		sfx.Success:Play()
		status.Text = "Login success!"
		status.TextColor3 = Color3.new(0,1,0)
		wait(1)
		circle.Visible = true
		status.TextColor3 = Color3.new(1,1,1)
		status.Text = "Loading"
		status:SetAttribute("Flashing",true)
		status.Flash.Enabled = true
		for i = 1,10 do
			status.Text = "Loading."
			wait(.5)
			status.Text = "Loading.."
			wait(.5)
			status.Text = "Loading..."
			wait(.5)
		end
		circle.Visible = false
		status:SetAttribute("Flashing",false)
		sfx.Notification:Play()
		status.Text = "Loaded!"
		for i = 1,20 do
			status.TextColor3 = Color3.new(1,1,1)
			wait()
		end
		wait(1)
		sfx.UI_Close:Play()
		tween6:Play()
		tween6.Completed:Wait()
		main.Visible = false
		wait(1)
		mainfr.Visible = true
		shadow.Visible = true
		spawn(Main_LS)
		sfx.UI_Open:Play()
		tween9:Play()
		tween10:Play()
		tween9.Completed:Wait()
		login:Destroy()
		main:Destroy()
	else
		sfx.Success:Play()
		status.Text = "Login success!"
		status.TextColor3 = Color3.new(0,1,0)
		wait(1)
		circle.Visible = true
		status.TextColor3 = Color3.new(1,1,1)
		status.Text = "Loading"
		status:SetAttribute("Flashing",true)
		status.Flash.Enabled = true
		for i = 1,10 do
			status.Text = "Loading."
			wait(.5)
			status.Text = "Loading.."
			wait(.5)
			status.Text = "Loading..."
			wait(.5)
		end
		circle.Visible = false
		status:SetAttribute("Flashing",false)
		sfx.Notification:Play()
		status.Text = "Loaded!"
		for i = 1,20 do
			status.TextColor3 = Color3.new(1,1,1)
			wait()
		end
		wait(1)
		sfx.UI_Close:Play()
		tween6:Play()
		tween6.Completed:Wait()
		main.Visible = false
		wait(1)
		mainfr.Visible = true
		shadow.Visible = true
		spawn(Main_LS)
		sfx.UI_Open:Play()
		tween9:Play()
		tween10:Play()
		tween9.Completed:Wait()
		login:Destroy()
		main:Destroy()
	end
end
spawn(Loader_LS)