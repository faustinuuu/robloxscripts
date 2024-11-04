local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fisch - faustino", "DarkTheme")
local autof = Window:NewTab("Auto Fish")

local Players = game:GetService('Players')
local VirtualInputManager = game:GetService('VirtualInputManager')

local LocalPlayer = Players.LocalPlayer
local Enabled = false  -- Control flag for toggling the script on/off
local Button = nil  -- Reference to the button UI element

-- Function to simulate a click on the button
local function clickButton()
    if Button then
        local ButtonPosition = Button.AbsolutePosition
        local ButtonSize = Button.AbsoluteSize

        local centerX = ButtonPosition.X + (ButtonSize.X / 2)
        local centerY = ButtonPosition.Y + (ButtonSize.Y / 2)

        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, Button, 1)
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, Button, 1)
    end
end

-- Listen for the button appearing in PlayerGui and store its reference
LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Descendant)
    if Descendant.Name == 'button' and Descendant.Parent.Name == 'safezone' then
        Button = Descendant
    end
end)

-- Listen for the button being removed from PlayerGui
LocalPlayer.PlayerGui.DescendantRemoving:Connect(function(Descendant)
    if Descendant == Button then
        Button = nil
    end
end)

-- Rod Cast Section
local cr = autof:NewSection("Rod Cast")

cr:NewButton("Cast 25%", "Casts the rod at 25% distance", function()
    local args = {
        [1] = 25.69999999999993,
        [2] = 1
    }
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Nocturnal Rod").events.cast:FireServer(unpack(args))
end)

cr:NewButton("Cast 50%", "Casts the rod at 50% distance", function()
    local args = {
        [1] = 50.69999999999993,
        [2] = 1
    }
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Nocturnal Rod").events.cast:FireServer(unpack(args))
end)

cr:NewButton("Cast 100%", "Casts the rod at 100% distance", function()
    local args = {
        [1] = 98.69999999999993,
        [2] = 1
    }
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Nocturnal Rod").events.cast:FireServer(unpack(args))
end)

-- Shake Section
local sk = autof:NewSection("Shake")

-- Toggle for Auto Shake
sk:NewToggle("Auto Shake", "Shakes the rod automatically", function(state) 
    Enabled = state  -- Enable or disable based on the toggle state
    if Enabled then
        print("Auto Shake Enabled")
    else
        print("Auto Shake Disabled")
    end
end)

-- Continuously click the button every 0.25 seconds if Enabled is true
spawn(function()
    while true do
        if Enabled and Button then
            clickButton()
            task.wait(0.25)  -- Click every 0.25 seconds
        else
            task.wait(0.1)  -- Smaller wait time when script is off or button is not present
        end
    end
end)

-- Reeling Section
local rl = autof:NewSection("Reeling")

rl:NewButton("Finish Reel - Perfect", "Perfect Catch!", function()
    local args = {
        [1] = 100,
        [2] = true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
end)

rl:NewButton("Finish Reel - Normal", "Normal Catch.", function()
    local args = {
        [1] = 100,
        [2] = false
    }
    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
end)

rl:NewButton("Snap Line", "Good to end streaks.", function()
    local args = {
        [1] = -1,
        [2] = false
    }
    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
end)
