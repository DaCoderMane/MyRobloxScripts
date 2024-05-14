local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local Remotes = workspace.Remote
local Debris = game:GetService("Debris")
local Teams = game:GetService("Teams")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local FireMessage = ReplicatedStorage:FindFirstChild("SayMessageRequest", true)
local CriminalPad = workspace["Criminals Spawn"].SpawnLocation
local CurrentCamera = workspace.CurrentCamera
local Cellblock = workspace.Prison_Cellblock
local CarContainer = workspace.CarContainer
local PrisonItems = workspace.Prison_ITEMS

local function SendNotificationPOLARADMIN(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = "Polar Admin - "..Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local function SendNotification(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local function FindPlayer(Player)
    if Player then
        if typeof(Player) == "Instance" then
            local Model = Player:FindFirstAncestorOfClass("Model")
            if Model then
                return Players:GetPlayerFromCharacter(Model)
            end
        elseif type(Player) == "string" then
            Player = Player:lower()
            for i, v in pairs(Players:GetPlayers()) do
                if v.Name:lower():find(Player) or v.DisplayName:lower():find(Player) then
                    return v
                end
            end
        end
        return nil
    end
end

local function nonosquare(MainPart, SecondaryPart)
    if MainPart:IsA("Part") and SecondaryPart:IsA("Part") then
        local OldCFrame = SecondaryPart.CFrame
        local OldCollide = SecondaryPart.CanCollide
        local OldTransparency = SecondaryPart.Transparency
        SecondaryPart.Transparency = 1
        SecondaryPart.CanCollide = false
        for i = 1, 3 do
            SecondaryPart.CFrame = MainPart.CFrame
            task.wait(.1)
        end
        SecondaryPart.CFrame = OldCFrame
        SecondaryPart.Transparency = OldTransparency
        SecondaryPart.CanCollide = OldCollide
    end
end

local function CLoad(Team)
    if Team == "Bright orange" then
        Remotes.TeamEvent:FireServer("Bright orange") 
    elseif Team == "Medium stone grey" then
        Remotes.TeamEvent:FireServer("Medium stone grey") 
    elseif Team == "Bright blue" then
        if #Teams.Guards:GetPlayers() >= 8 then
            if LocalPlayer.TeamColor.Name ~= "Bright blue" then
                NotifyLib.prompt('Polar Admin', 'Cannot become a guard.', 15)
                return
            elseif LocalPlayer.TeamColor.Name == "Bright blue" then
                Remotes.TeamEvent:FireServer("Bright orange")
                LocalPlayer.CharacterAppearanceLoaded:Wait()
            end
        end
        Remotes.TeamEvent:FireServer("Bright blue")
    elseif Team == "Really red" then
        if #Teams.Guards:GetPlayers() >= 8 and LocalPlayer.TeamColor.Name ~= "Bright blue" then
            Remotes.TeamEvent:FireServer("Bright orange")
            LocalPlayer.CharacterAppearanceLoaded:Wait()
            nonosquare(LocalPlayer.Character.HumanoidRootPart, CriminalPad)
        else
            Remotes.TeamEvent:FireServer("Bright blue")
            LocalPlayer.CharacterAppearanceLoaded:Wait()
            nonosquare(LocalPlayer.Character.HumanoidRootPart, CriminalPad)
        end
    end
end

local Prefix = ";"

SendNotification("Polar Admin (Prison Life) Loaded!!")
NotifyLib.prompt('Polar Admin', 'Polar Admin (Prison Life) Loaded!! Prefix: ' .. Prefix, 15)

local Teleports = {
    Jointp = CFrame.new(916.521545, 99.9899826, 2395.70215),
    Base = CFrame.new(-925.228882, 94.1287613, 2062.90356),
    Base2 = CFrame.new(-941.564087, 94.1287613, 1988.74573),
    Base3 = CFrame.new(-944.584961, 94.1287613, 1917.64111),
    Yard = CFrame.new(777.757385, 97.9999237, 2469.80005),
    Nex = CFrame.new(875.113098, 99.9899826, 2393.79126),
    CellBlock = CFrame.new(916.960693, 99.9899673, 2445.24561),
    CellBlockUpperRight = CFrame.new(943.535339, 114.790039, 2436.57642),
    CellBlockUpperLeft = CFrame.new(889.900879, 114.789978, 2438.86792),
    Back = CFrame.new(982.978516, 99.989975, 2305.05737),
    Cafe = CFrame.new(931.438354, 99.9899368, 2288.12964),
    Armory = CFrame.new(836.197021, 99.9899826, 2269.56323),
    Roof = CFrame.new(827.404724, 118.989983, 2323.45825),
    Store = CFrame.new(403.71817, 11.8254099, 1143.49036),
    Store2 = CFrame.new(473.79892, 11.8254099, 1143.13831),
    Undermap = CFrame.new(245.467575, -24.3250809, 1256.79285),
    Tower = CFrame.new(822.793091, 130.039902, 2587.95557),
    Tower2 = CFrame.new(502.821136, 130.039902, 2590.08521),
    Tower3 = CFrame.new(502.789368, 130.039902, 2069.16455),
    Tower4 = CFrame.new(822.85437, 130.039902, 2071.76245),
    Tower5 = CFrame.new(1158.47046, 130.039902, 2070.02637),
    Tower6 = CFrame.new(1157.4624, 130.039902, 2589.5498),
    funnyroom = CFrame.new(693.883179, 99.9899826, 2352.97925),
    Gate = CFrame.new(497.621429, 98.039917, 2216.75952)
}

local Settings = {
    Backdoor = {
        "DaCoderMane",
        "hackdude999",
        "SkidBreakerLife"
    },
    {
        AutoRe = false
    }
}

LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Jointp

local function LPCharacterAdded(Character)
    if Character then
        local Humanoid = LocalPlayer.Character:WaitForChild("Humanoid", 1)
        if Humanoid then
            Humanoid.Died:Connect(function()
                local CframeBeforeDeath = LocalPlayer.Character.HumanoidRootPart.CFrame
                CLoad(LocalPlayer.TeamColor.Name)
                LocalPlayer.Character.HumanoidRootPart.CFrame = CframeBeforeDeath
            end)
        end
    end
end

LocalPlayer.CharacterAdded:Connect(LPCharacterAdded)

local function ChatCommands(Messages)
    local Args = string.split(Messages, " ")
    local function FindCommand(CommandList)
        for i, v in pairs(CommandList) do
            if Args[1] == Prefix..v then
                return true
            end
        end
        return false
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if Noclip then 
                LocalPlayer.Character.Torso.CanCollide = false;
                LocalPlayer.Character.Head.CanCollide = false
            end
        end)
    end)

    if FindCommand({"help", "cmds", "commands"}) then
        NotifyLib.prompt('Polar Admin', 'Printed commands to console, press CTRL+F9 to see all commands.', 15)
        print("The prefix is ".. Prefix)
        print("Here are all the commands in Polar Admin [Prison Life]:")
        -- Teleports
        print("-- Teleports --")
        print("crimbase|cbase|base | Teleports you to the criminal base.")
        print("base2 | Teleports you to the secondary criminal base.")
        print("yard | Teleports you to the yard.")
        print("nex | Teleports you to nexus.")
        print("cellblock|cells|cell | Teleports you to the cell block.")
        print("urcellblock|urcells|urcell | Teleports you to the upper right cell block.")
        print("ulcellblock|ulcells|ulcell | Teleports you to the upper left cell block.")
        print("back | Teleports you to the weird back hallway next to the cafe.")
        print("cafe | Teleports you to the cafe.")
        print("armory | Teleports you to the armory.")
        print("roof | Teleports you to the roof.")
        print("store1 | Teleports you to store 1.")
        print("store2 | Teleports you to store2")
        print("undermap | Teleports you under the map.")
        print("tower | Teleports you to tower 1.")
        print("tower2 | Teleports you to tower 2.")
        print("tower3 | Teleports you to tower 3.")
        print("tower4 | Teleports you to tower 4.")
        print("tower5 | Teleports you to tower 5.")
        print("tower6 | Teleports you to tower 6.")
        print("funnyroom | Teleports you to the funny room.")
        print("gate | Teleports you to the front gate.")
        -- Utilities
        print("-- Utilities --")
        print("cmds | Shows this message.")
        print("getcoords|coords | Copies the current RootParts CFrame values to your clipboard.")
        -- Player
        print("-- Player --")
        print("walkspeed|speed|ws | Sets the players walkspeed.")
        print("jumppower|jp | Sets your jumppower.")
        print("noclip | Lets you walk through walls.")
        print("clip | Turns off noclip.")
        print("hipheight|hh | Sets hit height.")
        print("team [guard|inmate|criminal|neutral] | Sets your team.")
        print("rejoin|rj | Rejoins the game.")
        print("infiniteyeild|iy | Executes Infinite Yeild")
    elseif FindCommand({"crimbase", "cbase", "base"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Base
        NotifyLib.prompt('Polar Admin', 'Teleported to criminal base.', 15)
    elseif FindCommand({"base2"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Base2
        NotifyLib.prompt('Polar Admin', 'Teleported to Base 2.', 15)
    elseif FindCommand({"yard"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Yard
        NotifyLib.prompt('Polar Admin', 'Teleported to yard.', 15)
    elseif FindCommand({"nex", "nexus"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Nex
        NotifyLib.prompt('Polar Admin', 'Teleported to nexus.', 15)
    elseif FindCommand({"gate"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Gate
        NotifyLib.prompt('Polar Admin', 'Teleported to Front Gate.', 15)
    elseif FindCommand({"cellblock", "cells", "cell"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CellBlock
        NotifyLib.prompt('Polar Admin', 'Teleported to CellBlock.', 15)
    elseif FindCommand({"urcellblock", "urcells", "urcell"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CellBlockUpperRight
        NotifyLib.prompt('Polar Admin', 'Teleported to CellBlock Upper Right.', 15)
    elseif FindCommand({"ulcellblock", "ulcells", "ulcell"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CellBlockUpperLeft
        NotifyLib.prompt('Polar Admin', 'Teleported to CellBlock Upper Left.', 15)
    elseif FindCommand({"back"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Back
        NotifyLib.prompt('Polar Admin', 'Teleported to Back.', 15)
    elseif FindCommand({"cafe"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Cafe
        NotifyLib.prompt('Polar Admin', 'Teleported to Cafe.', 15)
    elseif FindCommand({"armory"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Armory
        NotifyLib.prompt('Polar Admin', 'Teleported to Armory.', 15)
    elseif FindCommand({"roof"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Roof
        NotifyLib.prompt('Polar Admin', 'Teleported to Roof.', 15)
    elseif FindCommand({"store1"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Store
        NotifyLib.prompt('Polar Admin', 'Teleported to Store 1.', 15)
    elseif FindCommand({"store2"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Store2
        NotifyLib.prompt('Polar Admin', 'Teleported to Store 2.', 15)
    elseif FindCommand({"undermap"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Undermap
        NotifyLib.prompt('Polar Admin', 'Teleported to Undermap.', 15)
    elseif FindCommand({"tower"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 1.', 15)
    elseif FindCommand({"tower2"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower2
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 2.', 15)
    elseif FindCommand({"tower3"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower3
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 3.', 15)
    elseif FindCommand({"tower4"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower4
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 4.', 15)
    elseif FindCommand({"tower5"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower5
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 5.', 15)
    elseif FindCommand({"tower6"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Tower6
        NotifyLib.prompt('Polar Admin', 'Teleported to Tower 6.', 15)
    elseif FindCommand({"funnyroom"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.funnyroom
        NotifyLib.prompt('Polar Admin', 'Teleported to Funny Room.', 15)
    elseif FindCommand({"walkspeed", "speed", "ws"}) then
        LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Args[2]) and Args[2] or 16
        NotifyLib.prompt('Polar Admin', 'Walkspeed set to ' .. tonumber(Args[2]) .. '.', 15)
    elseif FindCommand({"jumppower", "jp"}) then
        LocalPlayer.Character.Humanoid.JumpPower = tonumber(Args[2]) and Args[2] or 50
        NotifyLib.prompt('Polar Admin', 'JumpPower set to ' .. tonumber(Args[2]) .. '.', 15)
    elseif FindCommand({"hipheight", "hh"}) then
        LocalPlayer.Character.Humanoid.HipHeight = tonumber(Args[2]) and Args[2] or 0
        NotifyLib.prompt('Polar Admin', 'HipHeight set to ' .. tonumber(Args[2]) .. '.', 15)
    elseif FindCommand({"noclip"}) then
        Noclip = true
        LocalPlayer.Character.Torso.CanCollide = true;
        LocalPlayer.Character.Head.CanCollide = true
        NotifyLib.prompt('Polar Admin', 'Noclip enabled.', 15)
    elseif FindCommand({"clip"}) then
        Noclip = false
        LocalPlayer.Character.Torso.CanCollide = true;
        LocalPlayer.Character.Head.CanCollide = true
        NotifyLib.prompt('Polar Admin', 'Noclip disabled.', 15)
    elseif FindCommand({"teleportto", "goto", "to"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = FindPlayer(Args[2]).Character.HumanoidRootPart.CFrame
    elseif FindCommand({"respawn", "refresh", "re"}) then
        CLoad(LocalPlayer.TeamColor.Name)
    elseif FindCommand({"team", "t"}) then
        if Args[2] == "guard" then
            CLoad("Bright blue")
        elseif Args[2] == "inmate" then
            CLoad("Bright orange")
        elseif Args[2] == "criminal" or Args[2] == "crim" then
            CLoad("Really red")
        elseif Args[2] == "neutral" then
            CLoad("Medium stone grey")
        else
            return
        end
    elseif FindCommand({"rejoin", "rj"}) then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    elseif FindCommand({"infiniteyeild", "iy"}) then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    elseif FindCommand({"getcoords", "coords"}) then
        setclipboard(tostring(LocalPlayer.Character.HumanoidRootPart.CFrame))
        NotifyLib.prompt('Polar Admin', 'Copied current RootParts CFrame values to clipboard.', 15)
    end
end

LocalPlayer.Chatted:Connect(ChatCommands)
