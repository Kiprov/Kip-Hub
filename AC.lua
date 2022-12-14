local v1 = game.Players.LocalPlayer.PlayerGui.MainUI
local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
local function Jumpscare()	game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
			v1.Jumpscare_Ambush.Visible = true;
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					v1.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(v79, math.clamp(math.random(25, 50) / 50, v79, 1), math.clamp(math.random(25, 50) / 150, v79, 1));
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			return;
		end
Jumpscare()
firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, {"bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "Bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "bruh", "just letting you know ambush killed you infinite times so all your revives are gone sorry", "bruh", "bruh"})
game.Players.LocalPlayer.Character.Humanoid.Health = 0
