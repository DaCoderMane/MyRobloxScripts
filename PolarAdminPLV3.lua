local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local Debris = game:GetService("Debris")
local Teams = game:GetService("Teams")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local FireMessage = ReplicatedStorage:FindFirstChild("SayMessageRequest", true)

local function SendNotificationPOLARADMIN(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = "Polar Admin - "..Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local function SendNotification(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local Prefix = ";"

SendNotification("Polar Admin (Prison Life) Loaded!!")
NotifyLib.prompt('Polar Admin', 'Polar Admin (Prison Life) Loaded!! Prefix: ' .. Prefix, 15)

 -- Heli Pads
 -- Front/Back Gates

local Teleports = {
    Jointp = CFrame.new(1942.76636, 155.524475, 2824.13428),
    Nexus = CFrame.new(1904.04675, 155.524475, 2810.21704),
    MafiaBase = CFrame.new(1518.0957, 67.0211029, 1349.0083),
    CriminalBase = CFrame.new(82.3134308, 149.738586, 2475.04248),
    CargoBase = CFrame.new(51.930378, 147.910706, 881.536011),
    DoubbleBarrel = CFrame.new(455.641632, 110.169228, 2064.46997),
    Keycard = CFrame.new(2286.09814, 155.392792, 2715.4082),
    Storage = CFrame.new(2332.78198, 155.47261, 2914.00659),
    Yard1 = CFrame.new(1793.95032, 153.550079, 2908.89551),
    Yard2 = CFrame.new(2112.37939, 153.545761, 2877.76196),
    Armory1 = CFrame.new(1860.81042, 155.522812, 2684.08301),
    Armory2 = CFrame.new(2216.35791, 155.393097, 2707.79297),
    Armory3 = CFrame.new(1430.64246, 67.3664398, 1562.32605),
    StaffHangout = CFrame.new(1223.3728, 110.620232, 2856.83496),
    CriminalHeliPads = CFrame.new(89.0385971, 149.746689, 2379.1665),
    GuardHeliPads = CFrame.new(1739.24023, 179.72406, 2699.46265),
    FrontGate = CFrame.new(1527.20447, 153.577454, 2636.00146),
    BackGate = CFrame.new(2494.33252, 153.634293, 2615.42529),
    WardenOffice = CFrame.new(1728.99316, 155.575577, 2775.63501)
}

LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Jointp

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
        print("Here are all the commands in Polar Admin [Prison Life V3]:")

        -- Teleports

        print("-- Teleports --")
        print("default | Teleports you to the Default Teleport.")
        print("nexus|nex | Teleports you to the Nexus.")
        print("mafia|mafiabase | Teleports you to the Mafia Base.")
        print("criminalbase|cbase|crimbase | Teleports you to the Default Criminal Base.")
        print("cargo | Teleports you to Cargo Site.")
        print("armory1 | Teleports you to Armory1.")
        print("armory2 | Teleports you to Armory2.")
        print("armory3 | Teleports you to Armory3.")
        print("doubblebarrel|db | Teleports you to the Doubble Barrel.")
        print("keycard|key | Teleports you to the Keycard.")
        print("storage | Teleports you to Storage.")
        print("yard1 | Teleports you to yard1.")
        print("yard2 | Teleports you to yard2.")
        print("staffhangout|sh | Teleports you to the Staff Hangout.")
        print("gheli | Teleports you to Guard Helipads.")
        print("cheli | Teleports you to Criminal Helipad.")
        print("frontgate|fgate | Teleports you to the Front Gate.")
        print("backgate|bgate | Teleports you to the Back Gate.")
        print("wardenoffice|office | Teleports you to the Wardens Office.")

        -- Player

        print("-- Player --")
        print("noclip | Removes the collision on your character.")
        print("clip | Adds collision back to your character.")
        print("walkspeed|speed|ws (NUM) | Sets your walkspeed to the provided integer.")
        print("jumppower|jp (NUM) | Sets your jumppower to the provided integer.")
        print("hipheight|hh (NUM) | Sets your hipheight to the provided integer.")

        -- Utilities

        print("-- Utilities --")
        print("getcoords|coords | Prints your CFrame coords to the console.")
        print("rejoin|rj | Rejoins the game.")
    elseif FindCommand({"default"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Jointp
        NotifyLib.prompt('Polar Admin', 'Teleported to default tp.', 15)

    elseif FindCommand({"nex", "nexus"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Nexus
        NotifyLib.prompt('Polar Admin', 'Teleported to Nexus.', 15)

    elseif FindCommand({"mafia", "mafiabase"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.MafiaBase
        NotifyLib.prompt('Polar Admin', 'Teleported to Mafia Criminal Base.', 15)

    elseif FindCommand({"cbase", "criminalbase", "crimbase"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CriminalBase
        NotifyLib.prompt('Polar Admin', 'Teleported to Criminal Base.', 15)

    elseif FindCommand({"cargo"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CargoBase
        NotifyLib.prompt('Polar Admin', 'Teleported to Cargo Criminal Base.', 15)

    elseif FindCommand({"armory1"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Armory1
        NotifyLib.prompt('Polar Admin', 'Teleported to Armory 1.', 15)

    elseif FindCommand({"armory2"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Armory2
        NotifyLib.prompt('Polar Admin', 'Teleported to Armory 2.', 15)

    elseif FindCommand({"armory3"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Armory3
        NotifyLib.prompt('Polar Admin', 'Teleported to Armory 3.', 15)

    elseif FindCommand({"doubblebarrel", "db"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.DoubbleBarrel
        NotifyLib.prompt('Polar Admin', 'Teleported to Doubble Barrel.', 15)

    elseif FindCommand({"key", "keycard"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Keycard
        NotifyLib.prompt('Polar Admin', 'Teleported to Keycard.', 15)

    elseif FindCommand({"storage"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Storage
        NotifyLib.prompt('Polar Admin', 'Teleported to Storage.', 15)

    elseif FindCommand({"yard1"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Yard1
        NotifyLib.prompt('Polar Admin', 'Teleported to Yard 1.', 15)

    elseif FindCommand({"yard2"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Yard2
        NotifyLib.prompt('Polar Admin', 'Teleported to Yard 2.', 15)

    elseif FindCommand({"staffhangout", "sh"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.StaffHangout
        NotifyLib.prompt('Polar Admin', 'Teleported to Staff Hangout.', 15)

    elseif FindCommand({"gheli"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.GuardHeliPads
        NotifyLib.prompt('Polar Admin', 'Teleported to Guard HeliPads.', 15)

    elseif FindCommand({"cheli"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.CriminalHeliPads
        NotifyLib.prompt('Polar Admin', 'Teleported to Criminal HeliPads.', 15)

    elseif FindCommand({"frontgate", "fgate"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.FrontGate
        NotifyLib.prompt('Polar Admin', 'Teleported to the Front Gate.', 15)

    elseif FindCommand({"backgate", "bgate"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.BackGate
        NotifyLib.prompt('Polar Admin', 'Teleported to the Back Gate.', 15)

    elseif FindCommand({"wardenoffice", "office"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.WardenOffice
        NotifyLib.prompt('Polar Admin', 'Teleported to the Wardens Office.', 15)

    elseif FindCommand({"rejoin", "rj"}) then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)

    elseif FindCommand({"getcoords", "coords"}) then
        print(tostring(LocalPlayer.Character.HumanoidRootPart.CFrame))
        NotifyLib.prompt('Polar Admin', 'Printed RootParts CFrame values to console.', 15)

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
        LocalPlayer.Character.Torso.CanCollide = false;
        LocalPlayer.Character.Head.CanCollide = false
        NotifyLib.prompt('Polar Admin', 'Noclip enabled.', 15)

    elseif FindCommand({"clip"}) then
        Noclip = false
        LocalPlayer.Character.Torso.CanCollide = true;
        LocalPlayer.Character.Head.CanCollide = true
        NotifyLib.prompt('Polar Admin', 'Noclip disabled.', 15)

    end
end

LocalPlayer.Chatted:Connect(ChatCommands)
