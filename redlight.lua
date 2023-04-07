local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Green Light Red Light Gamepasses - faustino#0001", "DarkTheme")
local Gamepasses = Window:NewTab("Gamepasses")
local LocalPlayer = Window:NewTab("LocalPlayer")

-- Gamepasses
local gp = Gamepasses:NewSection("Guard/Frontman")

gp:NewButton("Become Frontman", "Become the Frontman this match.", function()
    local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("FrontmanRemotes"):WaitForChild("BecomeFrontman"):InvokeServer(unpack(args))
end)

gp:NewButton("Become Guard", "Become a Guard this match.", function()
    local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("GuardRemotes"):WaitForChild("BecomeGuard"):InvokeServer(unpack(args))
end)

-- LocalPlayer

local lp = LocalPlayer:NewSection("Movement")

lp:NewToggle("Fast Walk", "Flash walk speed", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

lp:NewToggle("Super Jump", "Jump super high", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)
