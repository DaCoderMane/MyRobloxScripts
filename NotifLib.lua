-- Skid = gay nigger

local AbyssNotifLib = {}
local activeNotifications = {}

function AbyssNotifLib:createNotification(titleText, messageText, autoDismissTime)
    local Notification = Instance.new("ScreenGui")
    local NotifFrame = Instance.new("Frame")
    local UIC = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Dismiss = Instance.new("TextButton")
    local UIC2 = Instance.new("UICorner")

    Notification.Name = "Notification"
    Notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    NotifFrame.Name = "NotifFrame"
    NotifFrame.Parent = Notification
    NotifFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    NotifFrame.BackgroundTransparency = 0.35
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Size = UDim2.new(0, 235, 0, 128)
    
    UIC.Name = "UIC"
    UIC.Parent = NotifFrame
    UIC.CornerRadius = UDim.new(0, 5)

    Title.Name = "Title"
    Title.Parent = NotifFrame
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.03, 0, 0.08, 0)
    Title.Size = UDim2.new(0, 229, 0, 20)
    Title.Font = Enum.Font.GothamMedium
    Title.Text = titleText or "Title"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Text.Name = "Text"
    Text.Parent = NotifFrame
    Text.BackgroundColor3 = Color3.new(1, 1, 1)
    Text.BackgroundTransparency = 1
    Text.Position = UDim2.new(0.05, 0, 0.29, 0)
    Text.Size = UDim2.new(0, 213, 0, 39)
    Text.Font = Enum.Font.GothamMedium
    Text.TextColor3 = Color3.new(0.53, 0.53, 0.53)
    Text.TextSize = 16
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.TextYAlignment = Enum.TextYAlignment.Top
    Text.Text = messageText or "Message"

    Dismiss.Name = "Dismiss"
    Dismiss.Parent = NotifFrame
    Dismiss.BackgroundColor3 = Color3.new(1, 1, 1)
    Dismiss.BorderSizePixel = 0
    Dismiss.Position = UDim2.new(0.05, 0, 0.67, 0)
    Dismiss.Size = UDim2.new(0, 212, 0, 31)
    Dismiss.Font = Enum.Font.GothamMedium
    Dismiss.Text = "Dismiss"
    Dismiss.TextColor3 = Color3.new(0, 0, 0)
    Dismiss.TextSize = 18
    Dismiss.TextWrapped = true

    UIC2.Name = "UIC2"
    UIC2.Parent = Dismiss

    local notifCount = #activeNotifications
    local notifPadding = 10
    local bottomOffset = -(140 + (notifCount * (NotifFrame.Size.Y.Offset + notifPadding)))

    NotifFrame.Position = UDim2.new(1, 250, 1, bottomOffset)
    NotifFrame:TweenPosition(
        UDim2.new(1, -250, 1, bottomOffset),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.5,
        true
    )

    table.insert(activeNotifications, NotifFrame)

    local function dismissNotification()
        NotifFrame:TweenPosition(
            UDim2.new(1, 250, 1, bottomOffset),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quad,
            0.5,
            true,
            function()
                Notification:Destroy()
                for i, frame in ipairs(activeNotifications) do
                    if frame == NotifFrame then
                        table.remove(activeNotifications, i)
                        break
                    end
                end
                for i, frame in ipairs(activeNotifications) do
                    local newBottomOffset = -(140 + ((i - 1) * (NotifFrame.Size.Y.Offset + notifPadding)))
                    frame:TweenPosition(
                        UDim2.new(1, -250, 1, newBottomOffset),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        0.5,
                        true
                    )
                end
            end
        )
    end

    Dismiss.MouseButton1Click:Connect(dismissNotification)

    if autoDismissTime and autoDismissTime > 0 then
        task.delay(autoDismissTime, dismissNotification)
    end
end

return AbyssNotifLib
