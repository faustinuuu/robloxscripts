local args = {
    [1] = 100,
    [2] = true
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function fireEvent()
    ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
end

task.spawn(function()
    while true do
        fireEvent()
        task.wait(0.00001)
    end
end)
