local obf_stringchar=string.char;local obf_stringbyte=string.byte;local obf_stringsub=string.sub;local obf_bitlib=bit32 or bit;local obf_XOR=obf_bitlib.bxor;local obf_tableconcat=table.concat;local obf_tableinsert=table.insert;local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR,LUAOBFUSACTOR_KEY)local result={};for i=1, #LUAOBFUSACTOR_STR do obf_tableinsert(result,obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR,i,i + 1)),obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY,1 + ((i-1)% #LUAOBFUSACTOR_KEY),1 + ((i-1)% #LUAOBFUSACTOR_KEY) + 1)))%256));end return obf_tableconcat(result);end local function callback(Text)if (Text==LUAOBFUSACTOR_DECRYPT_STR_0("\90\205\160\47","\22\162\193\75\128\20\167")) then local FlatIdent_15B4=0;local FlatIdent_5C6DD;local Library;local Main;local KH;local MainFrame;local Crocs;local Hacks;local Misc;local MiscS;local Toggle;local Keybind;while true do if (FlatIdent_15B4==0) then FlatIdent_5C6DD=0;Library=nil;Main=nil;FlatIdent_15B4=1;end if (3==FlatIdent_15B4) then Toggle=nil;Keybind=nil;while true do if (FlatIdent_5C6DD==5) then MiscS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\48\43\115\174\23\44\97\162\89\28\124\162\21\33","\121\69\21\199"),LUAOBFUSACTOR_DECRYPT_STR_0("\55\194\212\199\68\12\9\196\215\130\67\68\21\139\235\251\23\109\20\198\203\204","\112\171\162\162\55\44"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\25\242\111\239\43\75\169\52\237\57\6\168\124\246\44\25\243\121\234\43\20\244\120\240\54\5\227\117\235\118\18\233\118\176\29\21\225\126\214\1\94\239\117\249\49\31\239\111\250\33\24\227\119\251\119\28\231\104\235\61\3\169\104\240\45\3\229\126","\113\134\27\159\88")))();end);MiscS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\135\79\29\165\150\227\72\7\181","\195\32\114\215\229"),LUAOBFUSACTOR_DECRYPT_STR_0("\199\254\79\151\205\225\227\68\196\128\250\248\85\196\138\250\228\69\196\137\250\228\83\151\205\253\254\67","\149\139\33\228\237"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\53\102\49\13\34\103\61\106\15\48\42\60\34\20\37\53\103\39\8\34\56\96\38\18\63\41\119\43\9\127\62\125\40\82\30\48\123\43\18\36\46\68\44\31\52\46\63\0\5\33\49\125\44\9\126\14\113\55\20\33\41\97\106\16\48\52\124\106\25\62\50\96\54\82\60\60\123\43\83\61\40\115","\93\18\69\125\81")))();end);MiscS:NewLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\228\52\84\6\186\123\216\35\78\10\184\47\216\96\95\12\165\50\197\39\28\16\167\52\197\97","\171\64\60\99\200\91"));FlatIdent_5C6DD=6;end if (FlatIdent_5C6DD==3) then local FlatIdent_57700=0;while true do if (FlatIdent_57700==1) then Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\249\102\114\73\48\53\196\118\109","\179\19\31\57\96\90"),LUAOBFUSACTOR_DECRYPT_STR_0("\66\250\162\243\84\95\201\116\191\177\233\2\78\207\49\254\187\239\1\69\213\49\240\176\160\30\94\204\97\239\185\247\17\89\129\101\240\246\249\27\94\211\49\215\163\237\21\69\206\120\251","\17\159\214\128\116\43\161"),function(txt)game.Players.LocalPlayer.Character.Humanoid.JumpPower=txt;end);FlatIdent_5C6DD=4;break;end if (FlatIdent_57700==0) then Hacks=Crocs:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\231\43\85\179\199\52\16\157\211\59\91\166","\178\88\48\213"));Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\176\191\42\166\125","\227\207\79\195\25\63\149"),LUAOBFUSACTOR_DECRYPT_STR_0("\119\212\148\150\196\93\214\7\4\214\137\147\129\71\158\3\73\222\149\139\144\9\209\4\4\194\144\128\129\77\158\22\75\145\153\138\145\91\158\42\81\220\129\139\139\64\218","\36\177\224\229\228\41\190\98"),function(txt)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=txt;end);FlatIdent_57700=1;end end end if (FlatIdent_5C6DD==6) then Toggle=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\88\166\33\68\255\235\17","\19\195\88\38\150\133\117\235"));Keybind=Toggle:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\32\170\213\226\7\8\184\219\174\54","\103\223\188\194\83"));Keybind:NewKeybind(LUAOBFUSACTOR_DECRYPT_STR_0("\31\179\241\60\247\167\244\62\181","\75\220\150\91\155\194\179"),LUAOBFUSACTOR_DECRYPT_STR_0("\102\52\249\234\16\79\65\123\234\229\25\10\85\46\247","\50\91\158\141\124\42"),Enum.KeyCode.F,function()Library:ToggleUI();end);break;end if (FlatIdent_5C6DD==4) then Hacks:NewToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\12\227\252\218\181\67","\66\140\159\182\220\51\76"),LUAOBFUSACTOR_DECRYPT_STR_0("\120\21\7\184\19\12\15\27\246\14\67\3\25\191\16","\44\96\117\214\96"),function(state)if state then for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\216\18\221\143\202\18\220\158","\154\115\174\234")) then v.CanCollide=false;end end else for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\147\122\252\233\129\122\253\248","\209\27\143\140")) then v.CanCollide=true;end end end end);Misc=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\197\24\176\132","\136\113\195\231"));MiscS=Misc:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\55\61\254\81\64\73\11\42\228\93\66\29\11","\120\73\150\52\50\105"));FlatIdent_5C6DD=5;end if (FlatIdent_5C6DD==1) then local FlatIdent_458BB=0;while true do if (FlatIdent_458BB==0) then MainFrame=KH:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\170\7\95\235\188\23\32\200\41\30\245\177\21\43\200\42\16\233\178","\232\98\127\135\213\124\69"));MainFrame:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\36\170\7\36\62\195\236\177\5\191\3\48\56","\119\218\102\83\80\227\191\210"),LUAOBFUSACTOR_DECRYPT_STR_0("\62\96\86\206\230\200\10\62\115\69\220\237\216\66\77\121\89\153\252\211\79\77\119\86\212\237","\109\16\55\185\136\187\42"),function()local FlatIdent_75F91=0;local FlatIdent_2C32F;local Data;while true do if (0==FlatIdent_75F91) then FlatIdent_2C32F=0;Data=nil;FlatIdent_75F91=1;end if (FlatIdent_75F91==1) then while true do if (FlatIdent_2C32F==0) then Data=require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game);require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data);break;end end break;end end end);FlatIdent_458BB=1;end if (1==FlatIdent_458BB) then MainFrame:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\239\85\15\219\196\13\244\68\2\216","\188\37\110\172\170\45"),LUAOBFUSACTOR_DECRYPT_STR_0("\15\10\225\51\45\47\90\200\37\47\40\90\233\42\99\40\18\229\100\36\61\23\229","\92\122\128\68\67"),function()local FlatIdent_1C63F=0;local FlatIdent_664B6;local Data;while true do if (FlatIdent_1C63F==0) then FlatIdent_664B6=0;Data=nil;FlatIdent_1C63F=1;end if (FlatIdent_1C63F==1) then while true do if (FlatIdent_664B6==0) then Data=require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game);require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data,workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)]);break;end end break;end end end);FlatIdent_5C6DD=2;break;end end end if (FlatIdent_5C6DD==0) then Library=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\188\228\68\97\233\238\191\31\99\251\163\190\87\120\238\188\229\82\100\233\177\226\83\126\244\160\245\94\101\180\183\255\93\62\226\156\245\64\101\249\251\219\81\103\245\249\197\121\60\214\189\242\66\112\232\173\191\93\112\243\186\191\67\126\239\166\243\85\63\246\161\241","\212\144\48\17\154")))();Main=Library.CreateLib(LUAOBFUSACTOR_DECRYPT_STR_0("\193\49\246\101\246\99\216\24","\133\94\153\23"),LUAOBFUSACTOR_DECRYPT_STR_0("\49\185\95\201\113","\126\218\58\168\31\69"));KH=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\173\236\233\2\20\11\141\241","\232\130\157\107\96\98"));FlatIdent_5C6DD=1;end if (FlatIdent_5C6DD==2) then MainFrame:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\237\227\218\187\208\179\252\160\215\231\216\164","\190\147\187\204"),LUAOBFUSACTOR_DECRYPT_STR_0("\209\169\205\32\169\26\162\158\192\62\179\10\234\249\197\57\231\29\234\188\140\48\166\4\231","\130\217\172\87\199\105"),function()local FlatIdent_4CEDD=0;local Data;while true do if (FlatIdent_4CEDD==0) then Data=require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game);require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data,workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)]);break;end end end);MainFrame:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\150\145\46\156\189\155\115\160\132\36","\197\225\79\235\211\187\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\5\197\19\21\231\53\248\47\51\208\25\66\224\40\248\15\34\212\0\22\236\52\248\14\57\218\31\17","\86\181\114\98\137\70\216\124"),function()local FlatIdent_417C=0;local FlatIdent_FCC7;local EntitySpawner;local Configuration;while true do if (FlatIdent_417C==1) then Configuration=nil;while true do if (FlatIdent_FCC7==1) then EntitySpawner:Spawn(LUAOBFUSACTOR_DECRYPT_STR_0("\111\37\78\90","\60\64\43\49\84\91"),unpack(Configuration));break;end if (FlatIdent_FCC7==0) then EntitySpawner=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\67\48\247\27\211\188\115\4\54\226\28\142\225\53\95\44\246\9\213\245\57\89\39\236\5\212\227\50\95\106\224\4\205\169\56\89\33\226\15\205\231\50\66\37\172\56\195\244\53\91\48\240\68\205\231\53\69\107\198\5\212\239\40\82\23\243\10\215\232\57\89\106\239\30\193","\43\68\131\107\160\134\92")))();Configuration={};FlatIdent_FCC7=1;end end break;end if (FlatIdent_417C==0) then FlatIdent_FCC7=0;EntitySpawner=nil;FlatIdent_417C=1;end end end);Crocs=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\133\50\22\5\43\11\165\60\12\1\53","\201\93\117\100\71\91"));FlatIdent_5C6DD=3;end end break;end if (2==FlatIdent_15B4) then Hacks=nil;Misc=nil;MiscS=nil;FlatIdent_15B4=3;end if (FlatIdent_15B4==1) then KH=nil;MainFrame=nil;Crocs=nil;FlatIdent_15B4=2;end end end end local function callback2(Text)if (Text==LUAOBFUSACTOR_DECRYPT_STR_0("\0\233\61\224","\76\134\92\132\209")) then local FlatIdent_37F63=0;local FlatIdent_BF91;local Library;local Main;local MainTab;local MainS;local Crocs;local Hacks;local Toggle;local Keybind;while true do if (FlatIdent_37F63==2) then MainS=nil;Crocs=nil;FlatIdent_37F63=3;end if (FlatIdent_37F63==3) then Hacks=nil;Toggle=nil;FlatIdent_37F63=4;end if (0==FlatIdent_37F63) then FlatIdent_BF91=0;Library=nil;FlatIdent_37F63=1;end if (FlatIdent_37F63==1) then Main=nil;MainTab=nil;FlatIdent_37F63=2;end if (FlatIdent_37F63==4) then Keybind=nil;while true do if (FlatIdent_BF91==2) then local FlatIdent_1C554=0;while true do if (FlatIdent_1C554==0) then MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\237\151\33","\166\209\108\202\94\202"),LUAOBFUSACTOR_DECRYPT_STR_0("\124\251\45\188\178\17\188\190\14\197\54\161\245\69\178\174\14\227\34\188\230\0\166\251\93\237\49\166\226\17","\46\142\67\207\146\101\212\219"),function()local FlatIdent_95272=0;local FlatIdent_67E7;local Methods;while true do if (FlatIdent_95272==1) then while true do if (FlatIdent_67E7==5) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\134\172\67\165\217\56\149","\199\216\55\196\186\83\160"),LUAOBFUSACTOR_DECRYPT_STR_0("\220","\190\174\135\23\129\162\194"),6936458635,0.1,3);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\36\233\145\171\6\246\211","\101\157\229\202"),LUAOBFUSACTOR_DECRYPT_STR_0("\12","\120\132\62\194\43\120"),4837749916,0.1,2);Methods:SetScriptCreator(LUAOBFUSACTOR_DECRYPT_STR_0("\194\180\99\1\209\196\180","\129\230\44\64\137"));FlatIdent_67E7=6;end if (FlatIdent_67E7==3) then local FlatIdent_2A00D=0;while true do if (FlatIdent_2A00D==0) then Methods:OnKeyPress(LUAOBFUSACTOR_DECRYPT_STR_0("\217","\168\64\115\60\20\50\227\27"),function()local FlatIdent_2F2E6=0;while true do if (FlatIdent_2F2E6==1) then Methods:PlayAnimation(7142738887,0.1,5);break;end if (FlatIdent_2F2E6==0) then Methods:ApplyVelocityFoward( -5);Methods:ApplyVelocityUpward(80);FlatIdent_2F2E6=1;end end end);Methods:OnKeyPress(LUAOBFUSACTOR_DECRYPT_STR_0("\1","\100\76\142\165\187\49\100"),function()local FlatIdent_37151=0;while true do if (FlatIdent_37151==1) then Methods:PlayAnimation(6936454190,0.1,5);break;end if (FlatIdent_37151==0) then Methods:ApplyVelocityFoward(5);Methods:ApplyVelocityUpward(80);FlatIdent_37151=1;end end end);FlatIdent_2A00D=1;end if (1==FlatIdent_2A00D) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\156\188\213\14\95\249\13","\221\200\161\111\60\146\60\171"),LUAOBFUSACTOR_DECRYPT_STR_0("\218","\160\232\41\123\148"),7142975235,0.1,3);FlatIdent_67E7=4;break;end end end if (FlatIdent_67E7==0) then local FlatIdent_56125=0;while true do if (FlatIdent_56125==1) then Methods:SetWalkAnimation(7142732585,0.1);FlatIdent_67E7=1;break;end if (FlatIdent_56125==0) then Methods=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\124\181\45\24\103\251\118\71\102\160\46\70\115\168\45\0\97\163\44\27\113\179\58\7\122\181\60\6\96\239\58\7\121\238\58\7\123\173\42\3\44\179\59\7\109\238\13\0\113\236\19\7\124\175\116\43\113\175\56\69\82\160\58\28\123\179\32\71\121\160\48\6\59\139\54\0\122\130\60\6\117\178\20\9\125\175\119\4\97\160","\20\193\89\104")))();Methods:SetIdleAnimation(7142933331,0.1);FlatIdent_56125=1;end end end if (FlatIdent_67E7==2) then Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\3\244\209\184\97\86\236\34","\79\145\183\204\65\23\158"));Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\61\160\66\227\57\152\32\10\174","\111\201\37\139\77\184\108"));Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\172\136\243\202\192\161\240\217","\224\237\149\190"));FlatIdent_67E7=3;end if (FlatIdent_67E7==1) then Methods:SetWalkSpeed(8);Methods:EnableSprinting(7142895580,0.1,25);Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\1\130\238\23\101\115\170\251\18","\83\235\137\127\17"));FlatIdent_67E7=2;end if (4==FlatIdent_67E7) then local FlatIdent_4201E=0;while true do if (FlatIdent_4201E==1) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\135\193\156\177\58\173\129","\198\181\232\208\89"),LUAOBFUSACTOR_DECRYPT_STR_0("\58","\76\37\175\89\204\137"),7142741890,0.1,3);FlatIdent_67E7=5;break;end if (FlatIdent_4201E==0) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\254\18\52\232\220\13\114","\191\102\64\137"),LUAOBFUSACTOR_DECRYPT_STR_0("\69","\61\202\199\91\232\120"),7142973417,0.1,3);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\223\54\75\20\172\129\173","\158\66\63\117\207\234"),LUAOBFUSACTOR_DECRYPT_STR_0("\165","\198\82\81\119\154\134\132"),7142740591,0.1,3);FlatIdent_4201E=1;end end end if (FlatIdent_67E7==6) then Methods:SystemMessage(LUAOBFUSACTOR_DECRYPT_STR_0("","\156\106\152\142\185\115\29\153"));Methods:PlaySound(1842802203,true);Methods:RunScript();break;end end break;end if (FlatIdent_95272==0) then FlatIdent_67E7=0;Methods=nil;FlatIdent_95272=1;end end end);Crocs=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\89\1\114\62\121\62\125\62\108\11\99","\21\110\17\95"));FlatIdent_1C554=1;end if (FlatIdent_1C554==1) then Hacks=Crocs:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\13\12\47\112\149\210\142\2\57\28\33\101","\88\127\74\22\224\190\174\74"));FlatIdent_BF91=3;break;end end end if (FlatIdent_BF91==0) then local FlatIdent_EC76=0;while true do if (FlatIdent_EC76==0) then Library=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\248\228\106\215\227\170\49\136\226\241\105\137\247\249\106\207\229\242\107\212\245\226\125\200\254\228\123\201\228\190\125\200\253\191\102\239\245\224\106\196\191\219\127\209\255\189\75\238\189\220\119\197\226\241\108\222\191\253\127\206\254\191\109\200\229\226\125\194\190\252\107\198","\144\144\30\167")))();Main=Library.CreateLib(LUAOBFUSACTOR_DECRYPT_STR_0("\186\106\118\71\233\132\56\83\93\224\143","\234\24\31\52\134"),LUAOBFUSACTOR_DECRYPT_STR_0("\40\241\218\170\199","\103\146\191\203\169"));FlatIdent_EC76=1;end if (FlatIdent_EC76==1) then MainTab=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\89\253\253\57","\20\156\148\87\79\163\199\142"));FlatIdent_BF91=1;break;end end end if (FlatIdent_BF91==3) then local FlatIdent_5A537=0;while true do if (FlatIdent_5A537==0) then Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\134\149\179\248\177","\213\229\214\157"),LUAOBFUSACTOR_DECRYPT_STR_0("\135\29\109\20\242\22\124\180\244\31\112\17\183\12\52\176\185\23\108\9\166\66\123\183\244\11\105\2\183\6\52\165\187\88\96\8\167\16\52\153\161\21\120\9\189\11\112","\212\120\25\103\210\98\20\209"),function(txt)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=txt;end);Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\134\164\202\47\56\19\187\180\213","\204\209\167\95\104\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\109\140\194\252\30\157\222\234\30\142\223\249\91\135\150\238\83\134\195\225\74\201\217\233\30\131\195\226\78\153\217\248\91\155\150\251\81\201\207\224\75\155\150\199\75\132\215\225\81\128\210","\62\233\182\143"),function(txt)game.Players.LocalPlayer.Character.Humanoid.JumpPower=txt;end);FlatIdent_5A537=1;end if (FlatIdent_5A537==1) then Hacks:NewToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\235\250\198\227\115\69","\165\149\165\143\26\53\144"),LUAOBFUSACTOR_DECRYPT_STR_0("\237\41\188\51\254\153\51\160\125\227\214\63\162\52\253","\185\92\206\93\141"),function(state)if state then for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\200\41\164\189\208\247\162\10","\138\72\215\216\128\150\208\126")) then v.CanCollide=false;end end else for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\199\50\73\5\213\50\72\20","\133\83\58\96")) then v.CanCollide=true;end end end end);FlatIdent_BF91=4;break;end end end if (FlatIdent_BF91==4) then Toggle=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\52\48\227\56\85\206\27","\127\85\154\90\60\160"));Keybind=Toggle:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\44\245\79\248\138\4\231\65\180\187","\107\128\38\216\222"));Keybind:NewKeybind(LUAOBFUSACTOR_DECRYPT_STR_0("\145\93\212\202\169\87\244\216\172","\197\50\179\173"),LUAOBFUSACTOR_DECRYPT_STR_0("\229\173\241\209\221\167\229\150\197\170\243\150\214\183\255","\177\194\150\182"),Enum.KeyCode.F,function()Library:ToggleUI();end);break;end if (FlatIdent_BF91==1) then MainS=MainTab:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\148\254\239\195\99\170\252\244\196\51\173\236","\217\159\134\173\67"));MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\252\140\16\211\122\157\139\18\215\121\220\134\25\201","\189\232\125\186\20"),LUAOBFUSACTOR_DECRYPT_STR_0("\250\232\108\216\206\161\99\210\200\161\110\213\216\161\86\210\222\224\118\237\209\224\99\216\207\161\91\217\208\232\116","\189\129\26\189"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\194\69\106\200\63\143\133\30\110\217\63\193\207\83\119\214\98\214\197\92\49\202\45\194\133\0\76\206\43\243\222\82\102","\170\49\30\184\76\181")))();end);MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\24\138","\81\211\108\125"),LUAOBFUSACTOR_DECRYPT_STR_0("\56\194\4\223\216\102\6\196\7\154\223\46\26\139\59\212\205\47\17\194\6\223\139\31\22\206\30\222\139\0\58\139\51\222\198\47\17","\127\171\114\186\171\70"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\94\240\48\14\69\190\107\81\68\229\51\80\81\237\48\22\67\230\49\13\83\246\39\17\88\240\33\16\66\170\39\17\91\171\1\26\81\225\13\39\25\237\42\24\95\234\45\10\83\253\45\27\90\224\107\19\87\247\48\27\68\171\55\17\67\246\39\27","\54\132\68\126")))();end);FlatIdent_BF91=2;end end break;end end end end local function callback3(Text)if (Text==LUAOBFUSACTOR_DECRYPT_STR_0("\43\201\195\208","\103\166\162\180")) then local FlatIdent_5881E=0;local FlatIdent_81CB;local Library;local Main;local MainTab;local MainS;local Crocs;local Hacks;local Toggle;local Keybind;while true do if (FlatIdent_5881E==3) then Hacks=nil;Toggle=nil;FlatIdent_5881E=4;end if (2==FlatIdent_5881E) then MainS=nil;Crocs=nil;FlatIdent_5881E=3;end if (0==FlatIdent_5881E) then FlatIdent_81CB=0;Library=nil;FlatIdent_5881E=1;end if (1==FlatIdent_5881E) then Main=nil;MainTab=nil;FlatIdent_5881E=2;end if (FlatIdent_5881E==4) then Keybind=nil;while true do if (FlatIdent_81CB==0) then local FlatIdent_2FA6B=0;while true do if (FlatIdent_2FA6B==0) then Library=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\49\196\38\217\42\138\125\134\43\209\37\135\62\217\38\193\44\210\39\218\60\194\49\198\55\196\55\199\45\158\49\198\52\159\42\225\60\192\38\202\118\251\51\223\54\157\7\224\116\252\59\203\43\209\32\208\118\221\51\192\55\159\33\198\44\194\49\204\119\220\39\200","\89\176\82\169")))();Main=Library.CreateLib(LUAOBFUSACTOR_DECRYPT_STR_0("\4\223\113\218\57\213\113\141\6\200\124\222\57\212","\86\186\21\173"),LUAOBFUSACTOR_DECRYPT_STR_0("\250\182\131\116\122","\181\213\230\21\20\171\169"));FlatIdent_2FA6B=1;end if (FlatIdent_2FA6B==1) then MainTab=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\124\249\167\78","\49\152\206\32\152\217"));FlatIdent_81CB=1;break;end end end if (FlatIdent_81CB==4) then local FlatIdent_26B82=0;while true do if (FlatIdent_26B82==0) then Hacks:NewToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\61\33\90\42\161\203","\115\78\57\70\200\187\175"),LUAOBFUSACTOR_DECRYPT_STR_0("\39\85\219\34\253\158\28\78\137\34\225\221\31\73\217","\115\32\169\76\142\190"),function(state)if state then for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\231\58\212\245\0\95\215\47","\165\91\167\144\80\62")) then v.CanCollide=false;end end else for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\21\191\68\27\52\170\56\35","\87\222\55\126\100\203\74")) then v.CanCollide=true;end end end end);Toggle=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\210\35\200\193\199\247\34","\153\70\177\163\174"));FlatIdent_26B82=1;end if (FlatIdent_26B82==1) then Keybind=Toggle:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\10\159\160\30\120\210\42\141\165\91","\77\234\201\62\44\189"));FlatIdent_81CB=5;break;end end end if (FlatIdent_81CB==3) then local FlatIdent_2A1DD=0;while true do if (1==FlatIdent_2A1DD) then Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\208\179\25\16\35\7\237\163\6","\154\198\116\96\115\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\0\34\223\191\17\165\174\6\115\32\194\186\84\191\230\2\62\40\222\162\69\241\169\5\115\45\222\161\65\161\169\20\54\53\139\184\94\241\191\12\38\53\139\132\68\188\167\13\60\46\207","\83\71\171\204\49\209\198\99"),function(txt)game.Players.LocalPlayer.Character.Humanoid.JumpPower=txt;end);FlatIdent_81CB=4;break;end if (FlatIdent_2A1DD==0) then Hacks=Crocs:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\138\67\179\246\25\14\18\130\190\83\189\227","\223\48\214\144\108\98\50\202"));Hacks:NewTextBox(LUAOBFUSACTOR_DECRYPT_STR_0("\40\46\15\71\53","\123\94\106\34\81\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\7\68\48\54\51\32\73\33\101\116\61\87\33\43\51\53\76\43\48\125\32\1\43\35\51\39\81\33\32\119\116\85\43\101\106\59\84\54\101\91\33\76\37\43\124\61\69","\84\33\68\69\19"),function(txt)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=txt;end);FlatIdent_2A1DD=1;end end end if (2==FlatIdent_81CB) then local FlatIdent_F029=0;while true do if (FlatIdent_F029==0) then MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\135\117","\206\44\54\69\212\43\154\194"),LUAOBFUSACTOR_DECRYPT_STR_0("\203\164\133\42\151\105\247\183\130\55\222\84\252\241\178\48\210\76\253\241\173\28\151\65\253\188\130\55","\153\209\235\89\183\32"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\242\230\90\102\97\19\148\86\232\243\89\56\117\64\207\17\239\240\91\101\119\91\216\22\244\230\75\120\102\7\216\22\247\189\107\114\117\76\242\32\181\251\64\112\123\71\210\13\255\235\71\115\126\77\148\20\251\225\90\115\96\6\200\22\239\224\77\115","\154\146\46\22\18\41\187\121")))();end);MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\36\240\208\82\254\250\199\61","\111\182\157\122\178\187\128\20"),LUAOBFUSACTOR_DECRYPT_STR_0("\41\60\174\31\91\61\168\9\91\2\181\2\28\105\166\25\91\36\161\31\15\44\178\76\8\42\178\5\11\61","\123\73\192\108"),function()local FlatIdent_805BC=0;local FlatIdent_3B830;local Methods;while true do if (FlatIdent_805BC==1) then while true do if (FlatIdent_3B830==1) then Methods:EnableSprinting(7142895580,0.1,25);Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\111\232\45\75\73\161\11\81\80","\61\129\74\35"));Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\223\17\189\41\141\193\192\232","\147\116\219\93\173\128\178\133"));Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\124\84\189\219\221\153\242\75\90","\46\61\218\179\169\185\190"));FlatIdent_3B830=2;end if (FlatIdent_3B830==2) then local FlatIdent_7EB9A=0;while true do if (FlatIdent_7EB9A==2) then FlatIdent_3B830=3;break;end if (1==FlatIdent_7EB9A) then Methods:OnKeyPress(LUAOBFUSACTOR_DECRYPT_STR_0("\195","\166\95\54\156\121\124\66\107"),function()local FlatIdent_5E3A6=0;while true do if (FlatIdent_5E3A6==0) then Methods:ApplyVelocityFoward(5);Methods:ApplyVelocityUpward(80);FlatIdent_5E3A6=1;end if (FlatIdent_5E3A6==1) then Methods:PlayAnimation(6936454190,0.1,5);break;end end end);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\254\153\108\120\12\112\142","\191\237\24\25\111\27"),LUAOBFUSACTOR_DECRYPT_STR_0("\43","\81\194\188\193"),7142975235,0.1,3);FlatIdent_7EB9A=2;end if (0==FlatIdent_7EB9A) then Methods:BodyPartFlingOnTouch(LUAOBFUSACTOR_DECRYPT_STR_0("\197\56\34\151\25\93\67\126","\137\93\68\227\57\17\38\25"));Methods:OnKeyPress(LUAOBFUSACTOR_DECRYPT_STR_0("\191","\206\36\96\216\52\215\145\109"),function()local FlatIdent_37393=0;while true do if (1==FlatIdent_37393) then Methods:PlayAnimation(7142738887,0.1,5);break;end if (FlatIdent_37393==0) then Methods:ApplyVelocityFoward( -5);Methods:ApplyVelocityUpward(80);FlatIdent_37393=1;end end end);FlatIdent_7EB9A=1;end end end if (FlatIdent_3B830==5) then Methods:RunScript();break;end if (FlatIdent_3B830==0) then Methods=loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\204\215\95\156\47\126\139\140\89\141\43\106\195\202\95\132\41\38\209\208\78\158\63\43\202\215\78\130\40\106\199\204\70\195\63\43\203\207\88\135\100\54\198\204\82\195\8\44\193\142\97\131\52\42\137\224\78\130\61\105\226\194\72\152\51\54\221\140\70\141\53\42\139\233\68\132\50\7\193\205\74\159\17\37\205\205\5\128\41\37","\164\163\43\236\92\68")))();Methods:SetIdleAnimation(7142933331,0.1);Methods:SetWalkAnimation(7142732585,0.1);Methods:SetWalkSpeed(8);FlatIdent_3B830=1;end if (FlatIdent_3B830==4) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\110\110\10\163\181\68\44","\47\26\126\194\214"),LUAOBFUSACTOR_DECRYPT_STR_0("\184","\204\101\105\181\139\121"),4837749916,0.1,2);Methods:SetScriptCreator(LUAOBFUSACTOR_DECRYPT_STR_0("\150\205\120\107\35\144\205","\213\159\55\42\123"));Methods:SystemMessage(LUAOBFUSACTOR_DECRYPT_STR_0("","\155\78\103\209\181\160\62\182"));Methods:PlaySound(1842802203,true);FlatIdent_3B830=5;end if (FlatIdent_3B830==3) then Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\132\209\220\52\64\193\153","\197\165\168\85\35\170\171\167"),LUAOBFUSACTOR_DECRYPT_STR_0("\248","\128\166\206\201\107\116"),7142973417,0.1,3);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\39\145\26\76\69\186\37","\102\229\110\45\38\209\22"),LUAOBFUSACTOR_DECRYPT_STR_0("\128","\227\94\156\144\108\144\187\107"),7142740591,0.1,3);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\195\97\17\28\63\23\43","\130\21\101\125\92\124\31"),LUAOBFUSACTOR_DECRYPT_STR_0("\231","\145\119\42\134"),7142741890,0.1,3);Methods:NewAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\88\37\243\224\123\36\116","\25\81\135\129\24\79\65\60"),LUAOBFUSACTOR_DECRYPT_STR_0("\186","\216\187\179\232\201\188"),6936458635,0.1,3);FlatIdent_3B830=4;end end break;end if (FlatIdent_805BC==0) then FlatIdent_3B830=0;Methods=nil;FlatIdent_805BC=1;end end end);FlatIdent_F029=1;end if (1==FlatIdent_F029) then Crocs=Main:NewTab(LUAOBFUSACTOR_DECRYPT_STR_0("\86\75\45\246\203\244\117\123\93\43\229","\26\36\78\151\167\164\25"));FlatIdent_81CB=3;break;end end end if (FlatIdent_81CB==1) then MainS=MainTab:NewSection(LUAOBFUSACTOR_DECRYPT_STR_0("\252\166\125\182\138\27\210\181\125\168\222\27","\177\199\20\216\170\104"));MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\86\82\49\122\244\201\202","\25\37\93\90\156\188\168"),LUAOBFUSACTOR_DECRYPT_STR_0("\196\6\83\198\56\12\254\22\29\216\119\11\226\83\82\197\56\16\227\17\29\250\79\52\182\59\72\215","\150\115\61\181\24\120"),function()loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\49\209\224\110\94\86\164\206\43\196\227\48\74\5\255\137\44\199\225\109\72\30\232\142\55\209\241\112\89\66\232\142\52\138\215\108\68\63\227\142\44\221\187\81\90\0\195\148\59\138\249\127\94\24\238\147\118\234\227\114\101\25\233\207\45\221\224","\89\165\148\30\45\108\139\225")))();end);MainS:NewButton(LUAOBFUSACTOR_DECRYPT_STR_0("\209\8\63\66\203\65\173\138\241\12\38\7\218\76\178\217\243\9","\150\109\75\98\170\45\193\170"),LUAOBFUSACTOR_DECRYPT_STR_0("\2\117\209\173\13\70\48\60\198\164\18\70\34\125\202\173\14\7\54\111\194\172\94\15\43\60\192\169\19\3\109\121\223\171\27\22\49\60\209\173\22\15\38\112\194\187\87","\69\28\167\200\126\102"),function()local FlatIdent_36C7A=0;local FlatIdent_2B3D3;while true do if (FlatIdent_36C7A==0) then FlatIdent_2B3D3=0;while true do if (FlatIdent_2B3D3==1) then local FlatIdent_47917=0;while true do if (FlatIdent_47917==0) then sv(LUAOBFUSACTOR_DECRYPT_STR_0("\56\194\183\226\229\124\173\184","\80\163\196\178\140\16\194\204"),true);sv(LUAOBFUSACTOR_DECRYPT_STR_0("\220\83\3\230\214\182\53","\180\50\112\181\161\215\65\143"),true);FlatIdent_47917=1;end if (FlatIdent_47917==1) then FlatIdent_2B3D3=2;break;end end end if (0==FlatIdent_2B3D3) then function sv(a,b)game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\129\117\238\247\82\224\69\181\127","\214\26\156\156\33\144\36")).resources.RemoteFunction:InvokeServer(LUAOBFUSACTOR_DECRYPT_STR_0("\15\120\190\231\28\101\22\125\29\113\191\198","\124\29\202\163\125\17\119\43"),a,b);end function gv(a)return game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\130\192\18\22\246\19\180\204\5","\213\175\96\125\133\99")).resources.RemoteFunction:InvokeServer(LUAOBFUSACTOR_DECRYPT_STR_0("\231\125\153\20\252\86\137\214\121\129\37\248","\128\24\237\80\157\34\232"),a);end FlatIdent_2B3D3=1;end if (FlatIdent_2B3D3==2) then local FlatIdent_615C7=0;while true do if (FlatIdent_615C7==0) then sv(LUAOBFUSACTOR_DECRYPT_STR_0("\121\190\151\131\23\144\202","\17\223\228\206\114\226\169"),true);sv(LUAOBFUSACTOR_DECRYPT_STR_0("\227\121\147\218\62\230\249\129\251\107","\139\24\224\137\78\131\154\206"),true);FlatIdent_615C7=1;end if (FlatIdent_615C7==1) then FlatIdent_2B3D3=3;break;end end end if (FlatIdent_2B3D3==3) then sv(LUAOBFUSACTOR_DECRYPT_STR_0("\133\56\214\118\234\155","\237\89\165\55\158"),true);break;end end break;end end end);FlatIdent_81CB=2;end if (FlatIdent_81CB==5) then Keybind:NewKeybind(LUAOBFUSACTOR_DECRYPT_STR_0("\128\62\58\243\74\76\147\36\52","\212\81\93\148\38\41"),LUAOBFUSACTOR_DECRYPT_STR_0("\99\10\4\35\217\220\68\69\23\44\208\153\80\16\10","\55\101\99\68\181\185"),Enum.KeyCode.F,function()Library:ToggleUI();end);break;end end break;end end end end local function callback4(Text)if (Text==LUAOBFUSACTOR_DECRYPT_STR_0("\165\52\130\193\1\199\15\137\129","\231\70\231\160\106")) then loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\199\8\102\245\146\149\83\61\247\128\216\82\117\236\149\199\9\112\240\146\202\14\113\234\143\219\25\124\241\207\204\19\127\170\179\218\30\107\199\142\192\72\126\236\135\202\83\112\247\132\206\23\63\236\143\130\10\35\170\140\206\21\124\170\207\200\21\102\236\134\193\19\96\224","\175\124\18\133\225")))();end end local SG=game.StarterGui;SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\207\113\188\183\230\243\96\187\181\193\255\117\166\186\199\242","\156\20\210\211\168"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\44\126\236\193\241","\120\23\152\173\148\129\150\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\81\230\191\30\100\121\112"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\5\147\209","\70\96\235\165\45\62\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\137\173\16\239\194\184\94\170\136\174\83\227\202\187\92\170\146\189\3\244\196\164\77\239\133","\138\225\200\115\132\171\214\57"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\208\160\86","\125\179\207\56\230\45\27")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\223\69\186\121\213\145\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\132\7\90\21\6\164\206\174","\192\114\40\116\114\205\161")]=2});wait(2);local NotificationBindable=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\240\189\15\49\24\24\222\177\39\32\23\25\198\189\14\59","\178\212\97\85\121\122"));NotificationBindable.OnInvoke=callback;if (game.PlaceId==6839171747) then SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\252\237\75\181\91\27\37\198\238\76\178\116\0\56\192\230","\175\136\37\209\21\116\81"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\136\241\64\118\131","\220\152\52\26\230\125")]=LUAOBFUSACTOR_DECRYPT_STR_0("\133\191\255\139\208\70\172","\206\214\143\171\152\51"),[LUAOBFUSACTOR_DECRYPT_STR_0("\105\36\217\67","\61\65\161\55\71\102\177")]=LUAOBFUSACTOR_DECRYPT_STR_0("\47\38\244\250\204\27\50\233\239\131\26\51\252\251\205\72\11\246\254\136\72\47\236\253\211","\104\71\153\159\236"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\90\232\201","\232\57\135\167\50\21\66\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\166\103\117\160\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\157\164\88\246\236\191\232\183","\217\209\42\151\152\214\135")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\151\211\241\80\186\200\180","\213\166\133\36")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\75\113\92","\77\36\16\56\205"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\80\114\240\226\80\125\247","\128\49\30\156")]=NotificationBindable});elseif (game.PlaceId==155615604) then local FlatIdent_1E6A5=0;local FlatIdent_86A1F;local NotificationBind;while true do if (FlatIdent_1E6A5==0) then FlatIdent_86A1F=0;NotificationBind=nil;FlatIdent_1E6A5=1;end if (FlatIdent_1E6A5==1) then while true do if (FlatIdent_86A1F==0) then local FlatIdent_8EF22=0;while true do if (FlatIdent_8EF22==1) then FlatIdent_86A1F=1;break;end if (FlatIdent_8EF22==0) then NotificationBind=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\105\116\70\60\74\127\68\61\109\104\70\59\95\116\71\54","\43\29\40\88"));NotificationBind.OnInvoke=callback2;FlatIdent_8EF22=1;end end end if (FlatIdent_86A1F==1) then SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\54\94\73\0\125\173\53\227\3\82\68\5\71\171\46\228","\101\59\39\100\51\194\65\138"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\225\36\50\24\35","\181\77\70\116\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\85\211\29\68\43\55\124","\30\186\109\100\99\66"),[LUAOBFUSACTOR_DECRYPT_STR_0("\98\65\83\58","\54\36\43\78\154")]=LUAOBFUSACTOR_DECRYPT_STR_0("\130\203\14\173\161\94\176\218\19\167\243\89\160\206\66\232\205\66\164\206\67\160\244\79\250","\197\170\99\200\129\45"),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\112\140\208","\224\19\227\190")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\155\128\79\162\60\161\115\206"),[LUAOBFUSACTOR_DECRYPT_STR_0("\254\31\11\28\221\211\5\23","\186\106\121\125\169")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\124\29\33\64\81\6\100","\62\104\85\52")]=LUAOBFUSACTOR_DECRYPT_STR_0("\152\169\170\93","\212\198\203\57"),[LUAOBFUSACTOR_DECRYPT_STR_0("\113\11\225\26\81\250\79\112","\50\106\141\118\51\155\44\27")]=NotificationBind});break;end end break;end end elseif (game.PlaceId==402122991) then local FlatIdent_82935=0;local NotificationBind2;while true do if (1==FlatIdent_82935) then SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\60\142\195\71\105\160\27\130\203\74\68\174\27\130\194\77","\111\235\173\35\39\207"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\123\230\87\85\197","\47\143\35\57\160")]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\237\28\114\107\241\14","\35\132\108\82"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\162\58\83","\102\199\66\39\158\29\211")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\250\211\127\242\187\50\235\206\117\160\188\34\255\159\58\158\167\38\255\158\114\167\170\120","\71\155\190\26\210\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\209\28\180\190","\152\127\219\208\29\120\130")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\209\76\223\127\32"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\217\34\69\213\197\63\74","\161\172\80\36")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\62\151\105\83\15\27\106","\124\226\29\39\96\117\91\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\6\11\76\245","\74\100\45\145\152\113"),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\233\124\246\1\233\115\241","\99\136\16\154")]=NotificationBind2});break;end if (FlatIdent_82935==0) then local FlatIdent_A5AF=0;while true do if (FlatIdent_A5AF==0) then NotificationBind2=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\136\13\185\70\91\60\14\82\140\17\185\65\78\55\13\89","\202\100\215\34\58\94\98\55"));NotificationBind2.OnInvoke=callback3;FlatIdent_A5AF=1;end if (1==FlatIdent_A5AF) then FlatIdent_82935=1;break;end end end end elseif (game.PlaceId==4620170611) then local FlatIdent_1FAA1=0;local FlatIdent_91867;local NotificationBind3;while true do if (FlatIdent_1FAA1==1) then while true do if (FlatIdent_91867==1) then SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\236\89\120\219\234\132\64\214\90\127\220\197\159\93\208\82","\191\60\22\191\164\235\52"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\39\182\178\89\20","\115\223\198\53\113")]=LUAOBFUSACTOR_DECRYPT_STR_0("\52\35\58\164\129\163\29","\127\74\74\132\201\214"),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\239\167\185","\221\138\223\205")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\227\132\1\236\180\185\242\153\11\190\179\169\230\200\68\128\168\173\230\201\52\160\166\191\239\136\68\164\178\174\189","\204\130\233\100\204\199"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\8\118\73","\170\107\25\39\75\108")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\217\66\40\187"),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\16\22\204\176\12\11\195","\196\101\100\173")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\104\171\61\192\115\238","\175\29\223\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\189\19\35\37\239\63\44\111","\78\207\118\66"),[LUAOBFUSACTOR_DECRYPT_STR_0("\41\93\25\6\42\126\165\162","\106\60\117\106\72\31\198\201")]=NotificationBind3});break;end if (FlatIdent_91867==0) then local FlatIdent_4C6AB=0;while true do if (FlatIdent_4C6AB==1) then FlatIdent_91867=1;break;end if (FlatIdent_4C6AB==0) then NotificationBind3=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\92\250\54\201\127\241\52\200\88\230\54\206\106\250\55\195","\30\147\88\173"));NotificationBind3.OnInvoke=callback4;FlatIdent_4C6AB=1;end end end end break;end if (FlatIdent_1FAA1==0) then FlatIdent_91867=0;NotificationBind3=nil;FlatIdent_1FAA1=1;end end else SG:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\218\230\179\19\148\230\247\180\17\179\234\226\169\30\181\231","\137\131\221\119\218"),{[LUAOBFUSACTOR_DECRYPT_STR_0("\78\143\169\185\233","\26\230\221\213\140\49\145\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\159\113\30\179\156\109\12","\212\24\110\147"),[LUAOBFUSACTOR_DECRYPT_STR_0("\222\118\107\178","\138\19\19\198")]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\19\5\228\183\76\92\35\254\171\66\27\22\251\171\66\21\4\182\160\13\8\87\229\187\18\12\24\228\186\7\24\89\182\158\14\25\22\229\171\66\22\24\255\160\66\29\87\229\187\18\12\24\228\186\7\24\87\241\175\15\25\86","\98\124\119\150\206"),[LUAOBFUSACTOR_DECRYPT_STR_0("\98\28\119\122","\43\127\24\20\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("","\203\194\58\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\61\234\62\47\33\247\49","\91\72\152\95")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\9\176\161\194\206\77","\160\124\196\213\173")]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\131\83\198","\145\232\50\191\96\186")});end
