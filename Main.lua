-- Blox Fruits Script
-- Features: Combat, Movement, Misc, Fun

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Combat Feature: Auto Attack Nearest Enemy
local function autoAttack()
    print("Auto-attacking the nearest enemy...")
    while true do
        wait(0.1) -- Adjust delay as needed
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                Character:SetPrimaryPartCFrame(enemy.PrimaryPart.CFrame)
                wait(0.1)
                game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0), workspace.CurrentCamera)
            end
        end
    end
end

-- Movement Feature: Teleport to Safe Zone
local function teleportToSafeZone()
    print("Teleporting to safe zone...")
    local safeZone = workspace:FindFirstChild("SafeZone")
    if safeZone then
        Character:SetPrimaryPartCFrame(safeZone.CFrame)
    else
        print("Safe zone not found!")
    end
end

-- Misc Feature: Fast Health Regen
local function fastRegen()
    print("Healing faster...")
    LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
end

-- Fun Feature: Random Dance
local function randomDance()
    print("Performing a random dance!")
    local dances = {"Dance", "Wave", "Point"}
    local randomIndex = math.random(1, #dances)
    LocalPlayer.Character.Humanoid:LoadAnimation(workspace.Animations[dances[randomIndex]]):Play()
end

-- UI for Easy Access
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

local Buttons = {
    {Text = "Auto Attack", Callback = autoAttack},
    {Text = "Teleport to Safe Zone", Callback = teleportToSafeZone},
    {Text = "Fast Health Regen", Callback = fastRegen},
    {Text = "Random Dance", Callback = randomDance},
}

for i, button in ipairs(Buttons) do
    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0, 180, 0, 30)
    Btn.Position = UDim2.new(0, 10, 0, 10 + (i - 1) * 40)
    Btn.Text = button.Text
    Btn.MouseButton1Click:Connect(button.Callback)
end
