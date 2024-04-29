-- Credits to Wyvern Scripts for the chat notification system https://discord.gg/bjWF97jvyK [NO I DID NOT SKID I WAS GIVEN THE SCRIPT BY THE OWNER!!!]

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

local function SendNotificationRAINADMIN(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = "Rain Admin - "..Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local function SendNotification(Text)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = Text; Font = Enum.Font.GothamBlack; Color = Color3.fromRGB(6, 180, 255); FontSize = 12})
end

local Prefix = ";"

SendNotification("Rain Admin (Prison Life) Loaded!!")
NotifyLib.prompt('Rain Admin', 'Rain Admin (Prison Life) Loaded!! Prefix: ' .. Prefix, 15)

local Teleports = {
    Jointp = CFrame.new(1942.76636, 155.524475, 2824.13428),
    Base = CFrame.new(-925.228882, 94.1287613, 2062.90356),
    Base2 = CFrame.new(-941.564087, 94.1287613, 1988.74573)
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
        NotifyLib.prompt('Rain Admin', 'Printed commands to console, press CTRL+F9 to see all commands.', 15)
        print("Credits to Wyvern Scripts for the chat notification system https://discord.gg/bjWF97jvyK [NO I DID NOT SKID I WAS GIVEN THE SCRIPT BY THE OWNER!!!]")
        print("The prefix is ".. Prefix)
        print("Here are all the commands in Rain Admin [Prison Life]:")
        -- Teleports
        print("-- Teleports --")
        print("default | Teleports you to the default teleport.")

        print("rejoin|rj | Rejoins the game.")
    elseif FindCommand({"default"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Jointp
        NotifyLib.prompt('Rain Admin', 'Teleported to default tp.', 15)
    elseif FindCommand({"crimbase", "cbase", "base"}) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.Base
        NotifyLib.prompt('Rain Admin', 'Teleported to criminal base.', 15)
    elseif FindCommand({"rejoin", "rj"}) then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    elseif FindCommand({"getcoords", "coords"}) then
        print(tostring(LocalPlayer.Character.HumanoidRootPart.CFrame))
        NotifyLib.prompt('Rain Admin', 'Printed RootParts CFrame values to console.', 15)
    end
end

LocalPlayer.Chatted:Connect(ChatCommands)
