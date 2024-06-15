--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 76 | Scripts: 0 | Modules: 0
local KIPX = {};

-- StarterGui.KipX
KIPX["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
KIPX["1"]["IgnoreGuiInset"] = true;
KIPX["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
KIPX["1"]["Name"] = [[KipX]];
KIPX["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.KipX.Loader
KIPX["2"] = Instance.new("Frame", KIPX["1"]);
KIPX["2"]["BorderSizePixel"] = 0;
KIPX["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2"]["ClipsDescendants"] = true;
KIPX["2"]["Size"] = UDim2.new(0, 20, 0, 20);
KIPX["2"]["Position"] = UDim2.new(0.439, 0, -1, 0);
KIPX["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2"]["Name"] = [[Loader]];
-- Attributes
KIPX["2"]:SetAttribute([[FinishLogin]], false);

-- StarterGui.KipX.Loader.DropShadowHolder
KIPX["3"] = Instance.new("Frame", KIPX["2"]);
KIPX["3"]["Visible"] = false;
KIPX["3"]["ZIndex"] = 0;
KIPX["3"]["BorderSizePixel"] = 0;
KIPX["3"]["Size"] = UDim2.new(1, 0, 1, 0);
KIPX["3"]["Name"] = [[DropShadowHolder]];
KIPX["3"]["BackgroundTransparency"] = 1;

-- StarterGui.KipX.Loader.DropShadowHolder.DropShadow
KIPX["4"] = Instance.new("ImageLabel", KIPX["3"]);
KIPX["4"]["ZIndex"] = 0;
KIPX["4"]["BorderSizePixel"] = 0;
KIPX["4"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
KIPX["4"]["ScaleType"] = Enum.ScaleType.Slice;
KIPX["4"]["ImageTransparency"] = 0.5;
KIPX["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
KIPX["4"]["Image"] = [[rbxassetid://6014261993]];
KIPX["4"]["Size"] = UDim2.new(1, 47, 1, 47);
KIPX["4"]["BackgroundTransparency"] = 1;
KIPX["4"]["Name"] = [[DropShadow]];
KIPX["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.KipX.Loader.UICorner
KIPX["5"] = Instance.new("UICorner", KIPX["2"]);
KIPX["5"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.KipX.Loader.Title
KIPX["6"] = Instance.new("TextLabel", KIPX["2"]);
KIPX["6"]["TextWrapped"] = true;
KIPX["6"]["BorderSizePixel"] = 0;
KIPX["6"]["TextScaled"] = true;
KIPX["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["6"]["TextSize"] = 14;
KIPX["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["6"]["BackgroundTransparency"] = 1;
KIPX["6"]["RichText"] = true;
KIPX["6"]["Size"] = UDim2.new(0, 50, 0, 50);
KIPX["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["6"]["Text"] = [[K]];
KIPX["6"]["Name"] = [[Title]];
KIPX["6"]["Position"] = UDim2.new(0.375, 0, 0.2, 0);

-- StarterGui.KipX.Loader.Title.UIGradient
KIPX["7"] = Instance.new("UIGradient", KIPX["6"]);
KIPX["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.Loader.Status
KIPX["8"] = Instance.new("TextLabel", KIPX["2"]);
KIPX["8"]["BorderSizePixel"] = 0;
KIPX["8"]["TextTransparency"] = 1;
KIPX["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["8"]["TextSize"] = 14;
KIPX["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["8"]["BackgroundTransparency"] = 1;
KIPX["8"]["RichText"] = true;
KIPX["8"]["Size"] = UDim2.new(0, 50, 0, 50);
KIPX["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["8"]["Text"] = [[Loading]];
KIPX["8"]["Name"] = [[Status]];
KIPX["8"]["Position"] = UDim2.new(0.375, 0, 0.75, 0);
-- Attributes
KIPX["8"]:SetAttribute([[Flashing]], true);

-- StarterGui.KipX.Loader.LoadCircle
KIPX["9"] = Instance.new("ImageLabel", KIPX["2"]);
KIPX["9"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
KIPX["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["9"]["Image"] = [[rbxassetid://2632484460]];
KIPX["9"]["Size"] = UDim2.new(0, 50, 0, 50);
KIPX["9"]["Visible"] = false;
KIPX["9"]["BackgroundTransparency"] = 1;
KIPX["9"]["Name"] = [[LoadCircle]];
KIPX["9"]["Position"] = UDim2.new(0.37005, 0, 0.56646, 0);

-- StarterGui.KipX.Loader.UIAspectRatioConstraint
KIPX["a"] = Instance.new("UIAspectRatioConstraint", KIPX["2"]);


-- StarterGui.KipX.UI_Sounds
KIPX["b"] = Instance.new("Folder", KIPX["1"]);
KIPX["b"]["Name"] = [[UI_Sounds]];

-- StarterGui.KipX.UI_Sounds.UI_Open
KIPX["c"] = Instance.new("Sound", KIPX["b"]);
KIPX["c"]["Volume"] = 1;
KIPX["c"]["Name"] = [[UI_Open]];
KIPX["c"]["SoundId"] = [[rbxassetid://2062119347]];

-- StarterGui.KipX.UI_Sounds.UI_Close
KIPX["d"] = Instance.new("Sound", KIPX["b"]);
KIPX["d"]["Volume"] = 1;
KIPX["d"]["Name"] = [[UI_Close]];
KIPX["d"]["SoundId"] = [[rbxassetid://7025035451]];

-- StarterGui.KipX.UI_Sounds.Boing
KIPX["e"] = Instance.new("Sound", KIPX["b"]);
KIPX["e"]["Volume"] = 1;
KIPX["e"]["Name"] = [[Boing]];
KIPX["e"]["SoundId"] = [[rbxasset://sounds//short spring sound.wav]];

-- StarterGui.KipX.UI_Sounds.Error
KIPX["f"] = Instance.new("Sound", KIPX["b"]);
KIPX["f"]["Name"] = [[Error]];
KIPX["f"]["SoundId"] = [[rbxassetid://136075117]];

-- StarterGui.KipX.UI_Sounds.Notification
KIPX["10"] = Instance.new("Sound", KIPX["b"]);
KIPX["10"]["Name"] = [[Notification]];
KIPX["10"]["SoundId"] = [[rbxassetid://6897623656]];

-- StarterGui.KipX.UI_Sounds.Type
KIPX["11"] = Instance.new("Sound", KIPX["b"]);
KIPX["11"]["Volume"] = 5;
KIPX["11"]["Name"] = [[Type]];
KIPX["11"]["SoundId"] = [[rbxassetid://9113868529]];

-- StarterGui.KipX.UI_Sounds.UI_Hover
KIPX["12"] = Instance.new("Sound", KIPX["b"]);
KIPX["12"]["Volume"] = 1;
KIPX["12"]["Name"] = [[UI_Hover]];
KIPX["12"]["SoundId"] = [[rbxassetid://542332175]];

-- StarterGui.KipX.UI_Sounds.UI_Click
KIPX["13"] = Instance.new("Sound", KIPX["b"]);
KIPX["13"]["Volume"] = 1;
KIPX["13"]["Name"] = [[UI_Click]];
KIPX["13"]["SoundId"] = [[rbxassetid://6895079853]];

-- StarterGui.KipX.UI_Sounds.Success
KIPX["14"] = Instance.new("Sound", KIPX["b"]);
KIPX["14"]["Volume"] = 1;
KIPX["14"]["Name"] = [[Success]];
KIPX["14"]["SoundId"] = [[rbxassetid://3997124966]];

-- StarterGui.KipX.LogIn
KIPX["15"] = Instance.new("Frame", KIPX["1"]);
KIPX["15"]["Visible"] = false;
KIPX["15"]["BorderSizePixel"] = 0;
KIPX["15"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["15"]["ClipsDescendants"] = true;
KIPX["15"]["Position"] = UDim2.new(0.38128, 0, 0.19565, 0);
KIPX["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["15"]["Name"] = [[LogIn]];

-- StarterGui.KipX.LogIn.DropShadowHolder
KIPX["16"] = Instance.new("Frame", KIPX["15"]);
KIPX["16"]["ZIndex"] = 0;
KIPX["16"]["BorderSizePixel"] = 0;
KIPX["16"]["Size"] = UDim2.new(1, 0, 1, 0);
KIPX["16"]["Name"] = [[DropShadowHolder]];
KIPX["16"]["BackgroundTransparency"] = 1;

-- StarterGui.KipX.LogIn.DropShadowHolder.DropShadow
KIPX["17"] = Instance.new("ImageLabel", KIPX["16"]);
KIPX["17"]["ZIndex"] = 0;
KIPX["17"]["BorderSizePixel"] = 0;
KIPX["17"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
KIPX["17"]["ScaleType"] = Enum.ScaleType.Slice;
KIPX["17"]["ImageTransparency"] = 0.5;
KIPX["17"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
KIPX["17"]["Image"] = [[rbxassetid://6014261993]];
KIPX["17"]["Size"] = UDim2.new(1, 47, 1, 47);
KIPX["17"]["BackgroundTransparency"] = 1;
KIPX["17"]["Name"] = [[DropShadow]];
KIPX["17"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.KipX.LogIn.UICorner
KIPX["18"] = Instance.new("UICorner", KIPX["15"]);


-- StarterGui.KipX.LogIn.Title
KIPX["19"] = Instance.new("TextLabel", KIPX["15"]);
KIPX["19"]["TextWrapped"] = true;
KIPX["19"]["BorderSizePixel"] = 0;
KIPX["19"]["TextScaled"] = true;
KIPX["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["19"]["TextSize"] = 14;
KIPX["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["19"]["BackgroundTransparency"] = 1;
KIPX["19"]["RichText"] = true;
KIPX["19"]["Size"] = UDim2.new(0, 50, 0, 50);
KIPX["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["19"]["Text"] = [[K]];
KIPX["19"]["Name"] = [[Title]];
KIPX["19"]["Position"] = UDim2.new(0.41748, 0, 0.01862, 0);

-- StarterGui.KipX.LogIn.Title.UIGradient
KIPX["1a"] = Instance.new("UIGradient", KIPX["19"]);
KIPX["1a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.LogIn.Title2
KIPX["1b"] = Instance.new("TextLabel", KIPX["15"]);
KIPX["1b"]["TextWrapped"] = true;
KIPX["1b"]["BorderSizePixel"] = 0;
KIPX["1b"]["TextScaled"] = true;
KIPX["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1b"]["TextSize"] = 14;
KIPX["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1b"]["BackgroundTransparency"] = 1;
KIPX["1b"]["RichText"] = true;
KIPX["1b"]["Size"] = UDim2.new(0, 95, 0, 50);
KIPX["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["1b"]["Text"] = [[LOGIN]];
KIPX["1b"]["Name"] = [[Title2]];
KIPX["1b"]["Position"] = UDim2.new(0.34355, 0, 0.15227, 0);

-- StarterGui.KipX.LogIn.Title2.UIGradient
KIPX["1c"] = Instance.new("UIGradient", KIPX["1b"]);
KIPX["1c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.LogIn.UsernameBox
KIPX["1d"] = Instance.new("TextBox", KIPX["15"]);
KIPX["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1d"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1d"]["BorderSizePixel"] = 0;
KIPX["1d"]["TextWrapped"] = true;
KIPX["1d"]["TextSize"] = 14;
KIPX["1d"]["Name"] = [[UsernameBox]];
KIPX["1d"]["TextScaled"] = true;
KIPX["1d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["1d"]["PlaceholderText"] = [[Username]];
KIPX["1d"]["Size"] = UDim2.new(0, 200, 0, 50);
KIPX["1d"]["Position"] = UDim2.new(0.16993, 0, 0.358, 0);
KIPX["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["1d"]["Text"] = [[]];

-- StarterGui.KipX.LogIn.UsernameBox.UIStroke
KIPX["1e"] = Instance.new("UIStroke", KIPX["1d"]);
KIPX["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["1e"]["Thickness"] = 3;
KIPX["1e"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.LogIn.PasswordBox
KIPX["1f"] = Instance.new("TextBox", KIPX["15"]);
KIPX["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1f"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["1f"]["BorderSizePixel"] = 0;
KIPX["1f"]["TextWrapped"] = true;
KIPX["1f"]["TextSize"] = 14;
KIPX["1f"]["Name"] = [[PasswordBox]];
KIPX["1f"]["TextScaled"] = true;
KIPX["1f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["1f"]["PlaceholderText"] = [[Password]];
KIPX["1f"]["Size"] = UDim2.new(0, 200, 0, 50);
KIPX["1f"]["Position"] = UDim2.new(0.1732, 0, 0.61575, 0);
KIPX["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["1f"]["Text"] = [[]];

-- StarterGui.KipX.LogIn.PasswordBox.UIStroke
KIPX["20"] = Instance.new("UIStroke", KIPX["1f"]);
KIPX["20"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["20"]["Thickness"] = 3;
KIPX["20"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.LogIn.Login
KIPX["21"] = Instance.new("TextButton", KIPX["15"]);
KIPX["21"]["TextWrapped"] = true;
KIPX["21"]["BorderSizePixel"] = 0;
KIPX["21"]["TextSize"] = 14;
KIPX["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["21"]["TextScaled"] = true;
KIPX["21"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["21"]["Size"] = UDim2.new(0, 147, 0, 50);
KIPX["21"]["Name"] = [[Login]];
KIPX["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["21"]["Text"] = [[LOG IN]];
KIPX["21"]["Position"] = UDim2.new(0.25858, 0, 0.80668, 0);

-- StarterGui.KipX.LogIn.Login.UIStroke
KIPX["22"] = Instance.new("UIStroke", KIPX["21"]);
KIPX["22"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["22"]["Thickness"] = 3;
KIPX["22"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.LogIn.UIAspectRatioConstraint
KIPX["23"] = Instance.new("UIAspectRatioConstraint", KIPX["15"]);
KIPX["23"]["AspectRatio"] = 0.73031;

-- StarterGui.KipX.Main
KIPX["24"] = Instance.new("Frame", KIPX["1"]);
KIPX["24"]["Visible"] = false;
KIPX["24"]["BorderSizePixel"] = 0;
KIPX["24"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["24"]["ClipsDescendants"] = true;
KIPX["24"]["Position"] = UDim2.new(0.29234, 0, 0.24928, 0);
KIPX["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["24"]["Name"] = [[Main]];

-- StarterGui.KipX.Main.UICorner
KIPX["25"] = Instance.new("UICorner", KIPX["24"]);


-- StarterGui.KipX.Main.Logo
KIPX["26"] = Instance.new("TextLabel", KIPX["24"]);
KIPX["26"]["TextWrapped"] = true;
KIPX["26"]["BorderSizePixel"] = 0;
KIPX["26"]["TextScaled"] = true;
KIPX["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["26"]["TextSize"] = 14;
KIPX["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["26"]["BackgroundTransparency"] = 1;
KIPX["26"]["RichText"] = true;
KIPX["26"]["Size"] = UDim2.new(0, 50, 0, 50);
KIPX["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["26"]["Text"] = [[K]];
KIPX["26"]["Name"] = [[Logo]];
KIPX["26"]["Position"] = UDim2.new(0, 0, -0.00115, 0);

-- StarterGui.KipX.Main.Logo.UIGradient
KIPX["27"] = Instance.new("UIGradient", KIPX["26"]);
KIPX["27"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.Main.Title
KIPX["28"] = Instance.new("TextLabel", KIPX["24"]);
KIPX["28"]["TextWrapped"] = true;
KIPX["28"]["BorderSizePixel"] = 0;
KIPX["28"]["TextScaled"] = true;
KIPX["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["28"]["TextSize"] = 14;
KIPX["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["28"]["BackgroundTransparency"] = 1;
KIPX["28"]["RichText"] = true;
KIPX["28"]["Size"] = UDim2.new(0, 74, 0, 50);
KIPX["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["28"]["Text"] = [[KIP X]];
KIPX["28"]["Name"] = [[Title]];
KIPX["28"]["Position"] = UDim2.new(0.40672, 0, -0.00115, 0);

-- StarterGui.KipX.Main.Title.UIGradient
KIPX["29"] = Instance.new("UIGradient", KIPX["28"]);
KIPX["29"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.Main.Status
KIPX["2a"] = Instance.new("TextLabel", KIPX["24"]);
KIPX["2a"]["TextWrapped"] = true;
KIPX["2a"]["BorderSizePixel"] = 0;
KIPX["2a"]["TextScaled"] = true;
KIPX["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["2a"]["TextSize"] = 14;
KIPX["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["2a"]["BackgroundTransparency"] = 1;
KIPX["2a"]["RichText"] = true;
KIPX["2a"]["Size"] = UDim2.new(0, 189, 0, 27);
KIPX["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2a"]["Text"] = [[STATUS:NOT INJECTED]];
KIPX["2a"]["Name"] = [[Status]];
KIPX["2a"]["Position"] = UDim2.new(0, 0, 0.91839, 0);

-- StarterGui.KipX.Main.Status.UIGradient
KIPX["2b"] = Instance.new("UIGradient", KIPX["2a"]);
KIPX["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.Main.Indicator
KIPX["2c"] = Instance.new("TextLabel", KIPX["24"]);
KIPX["2c"]["BorderSizePixel"] = 0;
KIPX["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
KIPX["2c"]["TextSize"] = 14;
KIPX["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
KIPX["2c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2c"]["Size"] = UDim2.new(0, 20, 0, 20);
KIPX["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2c"]["Text"] = [[]];
KIPX["2c"]["Name"] = [[Indicator]];
KIPX["2c"]["Position"] = UDim2.new(0.35261, 0, 0.92816, 0);

-- StarterGui.KipX.Main.Indicator.UICorner
KIPX["2d"] = Instance.new("UICorner", KIPX["2c"]);
KIPX["2d"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.KipX.Main.Close
KIPX["2e"] = Instance.new("TextButton", KIPX["24"]);
KIPX["2e"]["TextWrapped"] = true;
KIPX["2e"]["BorderSizePixel"] = 0;
KIPX["2e"]["TextSize"] = 14;
KIPX["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["2e"]["TextScaled"] = true;
KIPX["2e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["2e"]["Size"] = UDim2.new(0, 50, 0, 34);
KIPX["2e"]["Name"] = [[Close]];
KIPX["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2e"]["Text"] = [[X]];
KIPX["2e"]["Position"] = UDim2.new(0.90672, 0, 0, 0);

-- StarterGui.KipX.Main.Input
KIPX["2f"] = Instance.new("TextBox", KIPX["24"]);
KIPX["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["2f"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["2f"]["BorderSizePixel"] = 0;
KIPX["2f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
KIPX["2f"]["TextWrapped"] = true;
KIPX["2f"]["TextSize"] = 14;
KIPX["2f"]["Name"] = [[Input]];
KIPX["2f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
KIPX["2f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["2f"]["PlaceholderText"] = [[print("Kip X on top!")]];
KIPX["2f"]["Size"] = UDim2.new(0, 406, 0, 208);
KIPX["2f"]["Position"] = UDim2.new(0, 0, 0.16954, 0);
KIPX["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["2f"]["Text"] = [[]];

-- StarterGui.KipX.Main.Execute
KIPX["30"] = Instance.new("TextButton", KIPX["24"]);
KIPX["30"]["TextWrapped"] = true;
KIPX["30"]["BorderSizePixel"] = 0;
KIPX["30"]["TextSize"] = 14;
KIPX["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["30"]["TextScaled"] = true;
KIPX["30"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["30"]["Size"] = UDim2.new(0, 197, 0, 52);
KIPX["30"]["Name"] = [[Execute]];
KIPX["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["30"]["Text"] = [[EXECUTE]];
KIPX["30"]["Position"] = UDim2.new(0, 0, 0.76724, 0);

-- StarterGui.KipX.Main.Execute.UICorner
KIPX["31"] = Instance.new("UICorner", KIPX["30"]);


-- StarterGui.KipX.Main.Execute.UIStroke
KIPX["32"] = Instance.new("UIStroke", KIPX["30"]);
KIPX["32"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["32"]["Thickness"] = 3;
KIPX["32"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.Main.Execute.UIScale
KIPX["33"] = Instance.new("UIScale", KIPX["30"]);


-- StarterGui.KipX.Main.Clear
KIPX["34"] = Instance.new("TextButton", KIPX["24"]);
KIPX["34"]["TextWrapped"] = true;
KIPX["34"]["BorderSizePixel"] = 0;
KIPX["34"]["TextSize"] = 14;
KIPX["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["34"]["TextScaled"] = true;
KIPX["34"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["34"]["Size"] = UDim2.new(0, 197, 0, 52);
KIPX["34"]["Name"] = [[Clear]];
KIPX["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["34"]["Text"] = [[CLEAR]];
KIPX["34"]["Position"] = UDim2.new(0.38993, 0, 0.76724, 0);

-- StarterGui.KipX.Main.Clear.UICorner
KIPX["35"] = Instance.new("UICorner", KIPX["34"]);


-- StarterGui.KipX.Main.Clear.UIStroke
KIPX["36"] = Instance.new("UIStroke", KIPX["34"]);
KIPX["36"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["36"]["Thickness"] = 3;
KIPX["36"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.Main.Clear.UIScale
KIPX["37"] = Instance.new("UIScale", KIPX["34"]);


-- StarterGui.KipX.Main.Inject
KIPX["38"] = Instance.new("TextButton", KIPX["24"]);
KIPX["38"]["TextWrapped"] = true;
KIPX["38"]["BorderSizePixel"] = 0;
KIPX["38"]["TextSize"] = 14;
KIPX["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["38"]["TextScaled"] = true;
KIPX["38"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["38"]["Size"] = UDim2.new(0, 124, 0, 52);
KIPX["38"]["Name"] = [[Inject]];
KIPX["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["38"]["Text"] = [[INJECT]];
KIPX["38"]["Position"] = UDim2.new(0.76866, 0, 0.76724, 0);

-- StarterGui.KipX.Main.Inject.UICorner
KIPX["39"] = Instance.new("UICorner", KIPX["38"]);


-- StarterGui.KipX.Main.Inject.UIStroke
KIPX["3a"] = Instance.new("UIStroke", KIPX["38"]);
KIPX["3a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["3a"]["Thickness"] = 3;
KIPX["3a"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.Main.Inject.UIScale
KIPX["3b"] = Instance.new("UIScale", KIPX["38"]);


-- StarterGui.KipX.Main.Title2
KIPX["3c"] = Instance.new("TextLabel", KIPX["24"]);
KIPX["3c"]["TextWrapped"] = true;
KIPX["3c"]["BorderSizePixel"] = 0;
KIPX["3c"]["TextScaled"] = true;
KIPX["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["3c"]["TextSize"] = 14;
KIPX["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["3c"]["BackgroundTransparency"] = 1;
KIPX["3c"]["RichText"] = true;
KIPX["3c"]["Size"] = UDim2.new(0, 114, 0, 50);
KIPX["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["3c"]["Text"] = [[SCRIPTS:]];
KIPX["3c"]["Name"] = [[Title2]];
KIPX["3c"]["Position"] = UDim2.new(0.77799, 0, 0.07356, 0);

-- StarterGui.KipX.Main.Title2.UIGradient
KIPX["3d"] = Instance.new("UIGradient", KIPX["3c"]);
KIPX["3d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.Main.Scripts
KIPX["3e"] = Instance.new("ScrollingFrame", KIPX["24"]);
KIPX["3e"]["Active"] = true;
KIPX["3e"]["BorderSizePixel"] = 0;
KIPX["3e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
KIPX["3e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["3e"]["Name"] = [[Scripts]];
KIPX["3e"]["Size"] = UDim2.new(0, 130, 0, 185);
KIPX["3e"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["3e"]["Position"] = UDim2.new(0.75746, 0, 0.21724, 0);
KIPX["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.KipX.Main.Scripts.Template
KIPX["3f"] = Instance.new("TextButton", KIPX["3e"]);
KIPX["3f"]["TextWrapped"] = true;
KIPX["3f"]["BorderSizePixel"] = 0;
KIPX["3f"]["TextSize"] = 14;
KIPX["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["3f"]["TextScaled"] = true;
KIPX["3f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["3f"]["RichText"] = true;
KIPX["3f"]["Size"] = UDim2.new(0, 124, 0, 50);
KIPX["3f"]["Name"] = [[Template]];
KIPX["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["3f"]["Text"] = [[Script 1]];

-- StarterGui.KipX.Main.Scripts.Template.UICorner
KIPX["40"] = Instance.new("UICorner", KIPX["3f"]);


-- StarterGui.KipX.Main.Scripts.Template.UIStroke
KIPX["41"] = Instance.new("UIStroke", KIPX["3f"]);
KIPX["41"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
KIPX["41"]["Thickness"] = 3;
KIPX["41"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.KipX.Main.Scripts.Template.UIScale
KIPX["42"] = Instance.new("UIScale", KIPX["3f"]);


-- StarterGui.KipX.Main.Scripts.UIListLayout
KIPX["43"] = Instance.new("UIListLayout", KIPX["3e"]);
KIPX["43"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- StarterGui.KipX.Main.UIAspectRatioConstraint
KIPX["44"] = Instance.new("UIAspectRatioConstraint", KIPX["24"]);
KIPX["44"]["AspectRatio"] = 1.54023;

-- StarterGui.KipX.OpenUI
KIPX["45"] = Instance.new("Frame", KIPX["1"]);
KIPX["45"]["Visible"] = false;
KIPX["45"]["BorderSizePixel"] = 0;
KIPX["45"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["45"]["ClipsDescendants"] = true;
KIPX["45"]["Position"] = UDim2.new(0, 0, 0.81556, 0);
KIPX["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["45"]["Name"] = [[OpenUI]];

-- StarterGui.KipX.OpenUI.UICorner
KIPX["46"] = Instance.new("UICorner", KIPX["45"]);


-- StarterGui.KipX.OpenUI.Open
KIPX["47"] = Instance.new("TextButton", KIPX["45"]);
KIPX["47"]["TextWrapped"] = true;
KIPX["47"]["Active"] = false;
KIPX["47"]["BorderSizePixel"] = 0;
KIPX["47"]["TextSize"] = 14;
KIPX["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["47"]["TextScaled"] = true;
KIPX["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
KIPX["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
KIPX["47"]["Size"] = UDim2.new(1, 0, 1, 0);
KIPX["47"]["BackgroundTransparency"] = 1;
KIPX["47"]["Name"] = [[Open]];
KIPX["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["47"]["Text"] = [[OPEN]];

-- StarterGui.KipX.OpenUI.Open.UIGradient
KIPX["48"] = Instance.new("UIGradient", KIPX["47"]);
KIPX["48"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(38, 255, 27)),ColorSequenceKeypoint.new(0.479, Color3.fromRGB(37, 66, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(5, 37, 0))};

-- StarterGui.KipX.OpenUI.UIAspectRatioConstraint
KIPX["49"] = Instance.new("UIAspectRatioConstraint", KIPX["45"]);


-- StarterGui.KipX.Shadow
KIPX["4a"] = Instance.new("Frame", KIPX["1"]);
KIPX["4a"]["Visible"] = false;
KIPX["4a"]["ZIndex"] = 0;
KIPX["4a"]["BorderSizePixel"] = 0;
KIPX["4a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["4a"]["ClipsDescendants"] = true;
KIPX["4a"]["Position"] = UDim2.new(0.28797, 0, 0.23968, 0);
KIPX["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
KIPX["4a"]["Name"] = [[Shadow]];
KIPX["4a"]["BackgroundTransparency"] = 0.5;

-- StarterGui.KipX.Shadow.UICorner
KIPX["4b"] = Instance.new("UICorner", KIPX["4a"]);


-- StarterGui.KipX.Shadow.UIAspectRatioConstraint
KIPX["4c"] = Instance.new("UIAspectRatioConstraint", KIPX["4a"]);
KIPX["4c"]["AspectRatio"] = 1.52222;

--Scripts:
local function LogIn_LS()
	local main = KIPX["15"]
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
	local main = KIPX["24"]
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
local function Status_LS()
	while KIPX["8"]:GetAttribute("Flashing") == true do
		game.TweenService:Create(KIPX["8"],TweenInfo.new(.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{TextColor3 = Color3.new(0.494118, 0.494118, 0.494118)}):Play()
		wait(.1)
		game.TweenService:Create(KIPX["8"],TweenInfo.new(.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{TextColor3 = Color3.new(1,1,1)}):Play()
		wait(.1)
	end
end
local function LoadCircle_LS()
	local SpriteClip = require(6505037974)

	local SpriteClipObject = SpriteClip.new()
	local Label = KIPX["9"]

	--We will make the SpriteClipObject take its Adornee's Image property.
	--A custom image asset can be applied manually to the SpriteClip class itself through the SpriteSheet property.
	SpriteClipObject.InheritSpriteSheet = true
	SpriteClipObject.Adornee = Label

	--The size of the individual sprites has to be set in the SpriteSizePixel, as well as their horizontal count and a global count.
	--You can also use a single image for multiple animations with the EdgeOffsetPixel property.
	--Remember that Roblox will scale down large images, so download the asset to check its real size after the upload.
	--It will be a file without an extension, so you will have to add .png to its end.
	SpriteClipObject.SpriteSizePixel = Vector2.new(682/6,1023/9)
	SpriteClipObject.SpriteCountX = 6
	SpriteClipObject.SpriteCount = 6*8+2

	--The frame rate is set to 15 by default. It can range from 1 to 60, but the most important part is that it has to be a divisor of 60 (60%FR == 0).
	--While setting a frame rate that isn't valid won't cause visible issues, it will clamp to the next higher valid value.
	SpriteClipObject.FrameRate = 30

	--Finally we can play our animation. You can also pause it and stop it with :Pause() and :Stop().
	--Play will return true if the animation isn't playing, the reverse goes for pausing and stopping.
	SpriteClipObject:Play()

	--You can also manually increment the animation with the :Advance(FrameCount) method and set the current frame with the CurrentFrame property. Note that
	--you'll have to run :Advance(0) after setting it.
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
	local main = KIPX["2"]
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
	local sfx = KIPX["b"]
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
	spawn(Status_LS)
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
		spawn(Status_LS)
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
		status:SetAttribute("Flashing",false)
		sfx.Success:Play()
		status.Text = "Login success!"
		status.TextColor3 = Color3.new(0,1,0)
		wait(1)
		circle.Visible = true
		status.TextColor3 = Color3.new(1,1,1)
		status.Text = "Loading"
		status:SetAttribute("Flashing",true)
		spawn(Status_LS)
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
spawn(LoadCircle_LS)