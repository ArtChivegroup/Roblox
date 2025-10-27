-- BloxHub CB - Enhanced Aimbot & ESP (FIXED)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()

-- Settings
local settings = {
    chamsEnabled = true,
    aimbotEnabled = true,
    aimbotMode = "hold",
    aimbotActive = false,
    hotkey = Enum.KeyCode.LeftControl,
    fovRadius = 200,
    fovVisible = true,
    aimPart = "Head",
    enemyColor = Color3.fromRGB(255, 0, 0),
    chamsTransparency = 0.5,
    dotSize = 3,
    
    -- New Settings
    wallCheck = true, -- Hanya untuk aimbot
    smoothAim = true,
    smoothAmount = 0.15,
    aimPrediction = true,
    predictionAmount = 0.13,
    maxDistance = 1200
}

-- Storage
local chamsObjects = {}
local updateConnection
local aimbotConnection
local currentTarget = nil

-- FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 64
fovCircle.Radius = settings.fovRadius
fovCircle.Filled = false
fovCircle.Visible = settings.fovVisible
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Transparency = 1

-- Fungsi untuk cek apakah player adalah musuh
local function isEnemy(targetPlayer)
    if not player.Team or not targetPlayer.Team then return false end
    return player.Team ~= targetPlayer.Team
end

-- Fungsi untuk cek apakah ada wall antara player dan target
local function hasWallBetween(targetPart)
    if not player.Character or not player.Character:FindFirstChild("Head") then return false end
    
    local origin = player.Character.Head.Position
    local direction = (targetPart.Position - origin)
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {player.Character, targetPart.Parent}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    
    local result = workspace:Raycast(origin, direction, raycastParams)
    
    return result ~= nil
end

-- Fungsi untuk membuat Chams
local function createChams(targetPlayer)
    local chamsFolder = Instance.new("Folder")
    chamsFolder.Name = "Chams_" .. targetPlayer.Name
    chamsFolder.Parent = CoreGui
    
    local chamsParts = {}
    
    local dot = Drawing.new("Circle")
    dot.Radius = settings.dotSize
    dot.Thickness = 1
    dot.Filled = true
    dot.Color = settings.enemyColor
    dot.Visible = false
    dot.ZIndex = 1000
    
    return {
        player = targetPlayer,
        folder = chamsFolder,
        parts = chamsParts,
        dot = dot
    }
end

-- Fungsi untuk update Chams (FIXED - ESP selalu aktif terlepas dari wall check)
local function updateChams(chamsData)
    local targetPlayer = chamsData.player
    
    if not targetPlayer or not targetPlayer.Parent then
        return false
    end
    
    if targetPlayer == player then
        return true
    end
    
    -- Cek apakah ESP diaktifkan dan apakah target adalah musuh
    if not settings.chamsEnabled or not isEnemy(targetPlayer) then
        for _, cham in pairs(chamsData.parts) do
            if cham and cham.Parent then
                cham:Destroy()
            end
        end
        chamsData.parts = {}
        chamsData.dot.Visible = false
        return true
    end
    
    local character = targetPlayer.Character
    if not character then
        for _, cham in pairs(chamsData.parts) do
            if cham and cham.Parent then
                cham:Destroy()
            end
        end
        chamsData.parts = {}
        chamsData.dot.Visible = false
        return true
    end
    
    local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
    if not head then
        chamsData.dot.Visible = false
        return true
    end
    
    -- Check distance
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (head.Position - player.Character.HumanoidRootPart.Position).Magnitude
        if distance > settings.maxDistance then
            -- Too far, hide ESP
            for _, cham in pairs(chamsData.parts) do
                if cham and cham.Parent then
                    cham:Destroy()
                end
            end
            chamsData.parts = {}
            chamsData.dot.Visible = false
            return true
        end
    end
    
    -- ESP LOGIC: Cek wall untuk menentukan tampilan (chams atau dot)
    -- Wall check di sini HANYA untuk ESP visual, TIDAK mempengaruhi aimbot
    local behindWall = hasWallBetween(head)
    
    if behindWall then
        -- Ada wall: Tampilkan CHAMS (wallhack)
        chamsData.dot.Visible = false
        
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                local chamName = "Cham_" .. part.Name
                local existingCham = chamsData.parts[part.Name]
                
                if not existingCham or not existingCham.Parent then
                    local cham = Instance.new("BoxHandleAdornment")
                    cham.Name = chamName
                    cham.Size = part.Size
                    cham.Color3 = settings.enemyColor
                    cham.Transparency = settings.chamsTransparency
                    cham.AlwaysOnTop = true
                    cham.ZIndex = 5
                    cham.Adornee = part
                    cham.Parent = chamsData.folder
                    
                    chamsData.parts[part.Name] = cham
                else
                    existingCham.Adornee = part
                    existingCham.Size = part.Size
                    existingCham.Color3 = settings.enemyColor
                    existingCham.Transparency = settings.chamsTransparency
                end
            end
        end
    else
        -- Tidak ada wall: Tampilkan DOT saja
        for _, cham in pairs(chamsData.parts) do
            if cham and cham.Parent then
                cham:Destroy()
            end
        end
        chamsData.parts = {}
        
        local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
        if onScreen and screenPos.Z > 0 then
            chamsData.dot.Position = Vector2.new(screenPos.X, screenPos.Y)
            chamsData.dot.Visible = true
        else
            chamsData.dot.Visible = false
        end
    end
    
    return true
end

-- Fungsi untuk remove Chams
local function removeChams(chamsData)
    for _, cham in pairs(chamsData.parts) do
        if cham and cham.Parent then
            cham:Destroy()
        end
    end
    if chamsData.dot then
        chamsData.dot.Visible = false
        chamsData.dot:Remove()
    end
    if chamsData.folder then
        chamsData.folder:Destroy()
    end
end

-- Fungsi untuk get target terdekat dalam FOV (FIXED - Wall check hanya untuk aimbot)
local function getClosestEnemy()
    local closestPlayer = nil
    local shortestDistance = settings.fovRadius
    
    local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player and isEnemy(targetPlayer) then
            local character = targetPlayer.Character
            if character then
                local aimPart = character:FindFirstChild(settings.aimPart)
                if aimPart then
                    -- WALL CHECK HANYA UNTUK AIMBOT
                    -- Jika wall check aktif DAN ada wall, skip target ini untuk aimbot
                    if settings.wallCheck and hasWallBetween(aimPart) then
                        continue
                    end
                    
                    local screenPos, onScreen = camera:WorldToViewportPoint(aimPart.Position)
                    
                    if onScreen and screenPos.Z > 0 then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                        
                        if distance < shortestDistance then
                            closestPlayer = targetPlayer
                            shortestDistance = distance
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- Aimbot function with prediction
local function aimAt(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local aimPart = targetPlayer.Character:FindFirstChild(settings.aimPart)
    if not aimPart then return end
    
    local targetPosition = aimPart.Position
    
    -- Aim Prediction
    if settings.aimPrediction then
        local humanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
            local velocity = humanoidRootPart.AssemblyLinearVelocity
            targetPosition = targetPosition + (velocity * settings.predictionAmount)
        end
    end
    
    -- Smooth Aim
    if settings.smoothAim then
        local currentCFrame = camera.CFrame
        local targetCFrame = CFrame.new(currentCFrame.Position, targetPosition)
        camera.CFrame = currentCFrame:Lerp(targetCFrame, settings.smoothAmount)
    else
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
    end
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BloxHubCB"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 540)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -270)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Gradient Background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 45))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BloxHub CB"
title.TextColor3 = Color3.fromRGB(100, 200, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Version
local version = Instance.new("TextLabel")
version.Size = UDim2.new(0, 60, 0, 16)
version.Position = UDim2.new(0, 15, 0, 28)
version.BackgroundTransparency = 1
version.Text = "v2.1"
version.TextColor3 = Color3.fromRGB(150, 150, 160)
version.TextSize = 10
version.Font = Enum.Font.Gotham
version.TextXAlignment = Enum.TextXAlignment.Left
version.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -80, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "─"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 16
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 8)
minimizeCorner.Parent = minimizeBtn

-- Content Frame
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -60)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 6
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 730)
contentFrame.Parent = mainFrame

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 5)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
statusLabel.BorderSizePixel = 0
statusLabel.Text = "● Status: Ready"
statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 6)
statusCorner.Parent = statusLabel

-- Section: ESP
local espSection = Instance.new("TextLabel")
espSection.Size = UDim2.new(1, -20, 0, 20)
espSection.Position = UDim2.new(0, 10, 0, 40)
espSection.BackgroundTransparency = 1
espSection.Text = "━━━ ESP SETTINGS ━━━"
espSection.TextColor3 = Color3.fromRGB(100, 200, 255)
espSection.TextSize = 12
espSection.Font = Enum.Font.GothamBold
espSection.Parent = contentFrame

-- Chams Toggle
local chamsToggle = Instance.new("TextButton")
chamsToggle.Size = UDim2.new(1, -20, 0, 35)
chamsToggle.Position = UDim2.new(0, 10, 0, 70)
chamsToggle.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
chamsToggle.BorderSizePixel = 0
chamsToggle.Text = "✓ Chams ESP"
chamsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
chamsToggle.TextSize = 14
chamsToggle.Font = Enum.Font.GothamBold
chamsToggle.Parent = contentFrame

local chamsCorner = Instance.new("UICorner")
chamsCorner.CornerRadius = UDim.new(0, 8)
chamsCorner.Parent = chamsToggle

-- Section: Aimbot
local aimbotSection = Instance.new("TextLabel")
aimbotSection.Size = UDim2.new(1, -20, 0, 20)
aimbotSection.Position = UDim2.new(0, 10, 0, 120)
aimbotSection.BackgroundTransparency = 1
aimbotSection.Text = "━━━ AIMBOT SETTINGS ━━━"
aimbotSection.TextColor3 = Color3.fromRGB(100, 200, 255)
aimbotSection.TextSize = 12
aimbotSection.Font = Enum.Font.GothamBold
aimbotSection.Parent = contentFrame

-- Aimbot Toggle
local aimbotToggle = Instance.new("TextButton")
aimbotToggle.Size = UDim2.new(1, -20, 0, 35)
aimbotToggle.Position = UDim2.new(0, 10, 0, 150)
aimbotToggle.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
aimbotToggle.BorderSizePixel = 0
aimbotToggle.Text = "✓ Aimbot"
aimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotToggle.TextSize = 14
aimbotToggle.Font = Enum.Font.GothamBold
aimbotToggle.Parent = contentFrame

local aimbotCorner = Instance.new("UICorner")
aimbotCorner.CornerRadius = UDim.new(0, 8)
aimbotCorner.Parent = aimbotToggle

-- Wall Check Toggle
local wallCheckToggle = Instance.new("TextButton")
wallCheckToggle.Size = UDim2.new(1, -20, 0, 35)
wallCheckToggle.Position = UDim2.new(0, 10, 0, 195)
wallCheckToggle.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
wallCheckToggle.BorderSizePixel = 0
wallCheckToggle.Text = "✓ Wall Check (Aimbot Only)"
wallCheckToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
wallCheckToggle.TextSize = 13
wallCheckToggle.Font = Enum.Font.GothamSemibold
wallCheckToggle.Parent = contentFrame

local wallCheckCorner = Instance.new("UICorner")
wallCheckCorner.CornerRadius = UDim.new(0, 8)
wallCheckCorner.Parent = wallCheckToggle

-- Smooth Aim Toggle
local smoothToggle = Instance.new("TextButton")
smoothToggle.Size = UDim2.new(0.48, 0, 0, 35)
smoothToggle.Position = UDim2.new(0, 10, 0, 240)
smoothToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
smoothToggle.BorderSizePixel = 0
smoothToggle.Text = "✗ Smooth Aim"
smoothToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
smoothToggle.TextSize = 12
smoothToggle.Font = Enum.Font.GothamSemibold
smoothToggle.Parent = contentFrame

local smoothCorner = Instance.new("UICorner")
smoothCorner.CornerRadius = UDim.new(0, 8)
smoothCorner.Parent = smoothToggle

-- Prediction Toggle
local predictionToggle = Instance.new("TextButton")
predictionToggle.Size = UDim2.new(0.48, 0, 0, 35)
predictionToggle.Position = UDim2.new(0.52, 0, 0, 240)
predictionToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
predictionToggle.BorderSizePixel = 0
predictionToggle.Text = "✗ Prediction"
predictionToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
predictionToggle.TextSize = 12
predictionToggle.Font = Enum.Font.GothamSemibold
predictionToggle.Parent = contentFrame

local predictionCorner = Instance.new("UICorner")
predictionCorner.CornerRadius = UDim.new(0, 8)
predictionCorner.Parent = predictionToggle

-- Smooth Amount Label
local smoothLabel = Instance.new("TextLabel")
smoothLabel.Size = UDim2.new(1, -20, 0, 18)
smoothLabel.Position = UDim2.new(0, 10, 0, 285)
smoothLabel.BackgroundTransparency = 1
smoothLabel.Text = "Smooth: " .. settings.smoothAmount
smoothLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
smoothLabel.TextSize = 11
smoothLabel.Font = Enum.Font.Gotham
smoothLabel.TextXAlignment = Enum.TextXAlignment.Left
smoothLabel.Parent = contentFrame

-- Smooth Slider
local smoothSlider = Instance.new("TextBox")
smoothSlider.Size = UDim2.new(1, -20, 0, 30)
smoothSlider.Position = UDim2.new(0, 10, 0, 305)
smoothSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
smoothSlider.BorderSizePixel = 0
smoothSlider.Text = tostring(settings.smoothAmount)
smoothSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
smoothSlider.TextSize = 13
smoothSlider.Font = Enum.Font.Gotham
smoothSlider.PlaceholderText = "0.1 - 1.0"
smoothSlider.Parent = contentFrame

local smoothSliderCorner = Instance.new("UICorner")
smoothSliderCorner.CornerRadius = UDim.new(0, 6)
smoothSliderCorner.Parent = smoothSlider

-- Prediction Amount Label
local predictionLabel = Instance.new("TextLabel")
predictionLabel.Size = UDim2.new(1, -20, 0, 18)
predictionLabel.Position = UDim2.new(0, 10, 0, 345)
predictionLabel.BackgroundTransparency = 1
predictionLabel.Text = "Prediction: " .. settings.predictionAmount
predictionLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
predictionLabel.TextSize = 11
predictionLabel.Font = Enum.Font.Gotham
predictionLabel.TextXAlignment = Enum.TextXAlignment.Left
predictionLabel.Parent = contentFrame

-- Prediction Slider
local predictionSlider = Instance.new("TextBox")
predictionSlider.Size = UDim2.new(1, -20, 0, 30)
predictionSlider.Position = UDim2.new(0, 10, 0, 365)
predictionSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
predictionSlider.BorderSizePixel = 0
predictionSlider.Text = tostring(settings.predictionAmount)
predictionSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
predictionSlider.TextSize = 13
predictionSlider.Font = Enum.Font.Gotham
predictionSlider.PlaceholderText = "0.1 - 0.5"
predictionSlider.Parent = contentFrame

local predictionSliderCorner = Instance.new("UICorner")
predictionSliderCorner.CornerRadius = UDim.new(0, 6)
predictionSliderCorner.Parent = predictionSlider

-- Aimbot Mode Label
local modeLabel = Instance.new("TextLabel")
modeLabel.Size = UDim2.new(1, -20, 0, 18)
modeLabel.Position = UDim2.new(0, 10, 0, 405)
modeLabel.BackgroundTransparency = 1
modeLabel.Text = "Aimbot Mode:"
modeLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
modeLabel.TextSize = 11
modeLabel.Font = Enum.Font.Gotham
modeLabel.TextXAlignment = Enum.TextXAlignment.Left
modeLabel.Parent = contentFrame

-- Hold/Toggle Buttons
local holdBtn = Instance.new("TextButton")
holdBtn.Size = UDim2.new(0.48, 0, 0, 32)
holdBtn.Position = UDim2.new(0, 10, 0, 425)
holdBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 220)
holdBtn.BorderSizePixel = 0
holdBtn.Text = "Hold"
holdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
holdBtn.TextSize = 13
holdBtn.Font = Enum.Font.GothamBold
holdBtn.Parent = contentFrame

local holdCorner = Instance.new("UICorner")
holdCorner.CornerRadius = UDim.new(0, 6)
holdCorner.Parent = holdBtn

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.48, 0, 0, 32)
toggleBtn.Position = UDim2.new(0.52, 0, 0, 425)
toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
toggleBtn.BorderSizePixel = 0
toggleBtn.Text = "Toggle"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 13
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = contentFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleBtn

-- Aim Part Label
local aimPartLabel = Instance.new("TextLabel")
aimPartLabel.Size = UDim2.new(1, -20, 0, 18)
aimPartLabel.Position = UDim2.new(0, 10, 0, 467)
aimPartLabel.BackgroundTransparency = 1
aimPartLabel.Text = "Aim Target:"
aimPartLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
aimPartLabel.TextSize = 11
aimPartLabel.Font = Enum.Font.Gotham
aimPartLabel.TextXAlignment = Enum.TextXAlignment.Left
aimPartLabel.Parent = contentFrame

-- Aim Part Buttons
local aimParts = {"Head", "Torso", "HumanoidRootPart"}
local aimPartButtons = {}

for i, partName in ipairs(aimParts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.31, 0, 0, 30)
    btn.Position = UDim2.new((i-1) * 0.345, 10 + (i > 1 and 5 or 0), 0, 487)
    btn.BackgroundColor3 = partName == "Head" and Color3.fromRGB(70, 140, 220) or Color3.fromRGB(60, 60, 70)
    btn.BorderSizePixel = 0
    btn.Text = partName == "HumanoidRootPart" and "HRP" or partName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = contentFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    aimPartButtons[partName] = btn
    
    btn.MouseButton1Click:Connect(function()
        settings.aimPart = partName
        for part, button in pairs(aimPartButtons) do
            button.BackgroundColor3 = part == partName and Color3.fromRGB(70, 140, 220) or Color3.fromRGB(60, 60, 70)
        end
    end)
end

-- Hotkey Label
local hotkeyLabel = Instance.new("TextLabel")
hotkeyLabel.Size = UDim2.new(1, -20, 0, 18)
hotkeyLabel.Position = UDim2.new(0, 10, 0, 527)
hotkeyLabel.BackgroundTransparency = 1
hotkeyLabel.Text = "Hotkey: (Click to change)"
hotkeyLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
hotkeyLabel.TextSize = 11
hotkeyLabel.Font = Enum.Font.Gotham
hotkeyLabel.TextXAlignment = Enum.TextXAlignment.Left
hotkeyLabel.Parent = contentFrame

-- Hotkey Button
local hotkeyBtn = Instance.new("TextButton")
hotkeyBtn.Size = UDim2.new(1, -20, 0, 32)
hotkeyBtn.Position = UDim2.new(0, 10, 0, 547)
hotkeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
hotkeyBtn.BorderSizePixel = 0
hotkeyBtn.Text = "LeftControl"
hotkeyBtn.TextColor3 = Color3.fromRGB(100, 200, 255)
hotkeyBtn.TextSize = 14
hotkeyBtn.Font = Enum.Font.GothamBold
hotkeyBtn.Parent = contentFrame

local hotkeyCorner = Instance.new("UICorner")
hotkeyCorner.CornerRadius = UDim.new(0, 6)
hotkeyCorner.Parent = hotkeyBtn

-- FOV Label
local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(1, -20, 0, 18)
fovLabel.Position = UDim2.new(0, 10, 0, 589)
fovLabel.BackgroundTransparency = 1
fovLabel.Text = "FOV Radius: " .. settings.fovRadius
fovLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
fovLabel.TextSize = 11
fovLabel.Font = Enum.Font.Gotham
fovLabel.TextXAlignment = Enum.TextXAlignment.Left
fovLabel.Parent = contentFrame

-- FOV Slider
local fovSlider = Instance.new("TextBox")
fovSlider.Size = UDim2.new(1, -20, 0, 32)
fovSlider.Position = UDim2.new(0, 10, 0, 609)
fovSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
fovSlider.BorderSizePixel = 0
fovSlider.Text = tostring(settings.fovRadius)
fovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
fovSlider.TextSize = 13
fovSlider.Font = Enum.Font.Gotham
fovSlider.PlaceholderText = "50-500"
fovSlider.Parent = contentFrame

local fovSliderCorner = Instance.new("UICorner")
fovSliderCorner.CornerRadius = UDim.new(0, 6)
fovSliderCorner.Parent = fovSlider

-- FOV Visible Toggle
local fovVisibleToggle = Instance.new("TextButton")
fovVisibleToggle.Size = UDim2.new(1, -20, 0, 32)
fovVisibleToggle.Position = UDim2.new(0, 10, 0, 651)
fovVisibleToggle.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
fovVisibleToggle.BorderSizePixel = 0
fovVisibleToggle.Text = "✓ Show FOV Circle"
fovVisibleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
fovVisibleToggle.TextSize = 13
fovVisibleToggle.Font = Enum.Font.GothamSemibold
fovVisibleToggle.Parent = contentFrame

local fovVisibleCorner = Instance.new("UICorner")
fovVisibleCorner.CornerRadius = UDim.new(0, 8)
fovVisibleCorner.Parent = fovVisibleToggle

-- Max Distance Label
local maxDistLabel = Instance.new("TextLabel")
maxDistLabel.Size = UDim2.new(1, -20, 0, 18)
maxDistLabel.Position = UDim2.new(0, 10, 0, 693)
maxDistLabel.BackgroundTransparency = 1
maxDistLabel.Text = "Max ESP Distance: " .. settings.maxDistance .. " studs"
maxDistLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
maxDistLabel.TextSize = 11
maxDistLabel.Font = Enum.Font.Gotham
maxDistLabel.TextXAlignment = Enum.TextXAlignment.Left
maxDistLabel.Parent = contentFrame

-- Max Distance Slider
local maxDistSlider = Instance.new("TextBox")
maxDistSlider.Size = UDim2.new(1, -20, 0, 32)
maxDistSlider.Position = UDim2.new(0, 10, 0, 713)
maxDistSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
maxDistSlider.BorderSizePixel = 0
maxDistSlider.Text = tostring(settings.maxDistance)
maxDistSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
maxDistSlider.TextSize = 13
maxDistSlider.Font = Enum.Font.Gotham
maxDistSlider.PlaceholderText = "100-2000"
maxDistSlider.Parent = contentFrame

local maxDistSliderCorner = Instance.new("UICorner")
maxDistSliderCorner.CornerRadius = UDim.new(0, 6)
maxDistSliderCorner.Parent = maxDistSlider

-- Mini Icon
local miniIcon = Instance.new("TextButton")
miniIcon.Size = UDim2.new(0, 60, 0, 60)
miniIcon.Position = UDim2.new(0, 10, 0, 10)
miniIcon.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
miniIcon.BorderSizePixel = 2
miniIcon.BorderColor3 = Color3.fromRGB(100, 200, 255)
miniIcon.Text = "BH"
miniIcon.TextColor3 = Color3.fromRGB(100, 200, 255)
miniIcon.TextSize = 18
miniIcon.Font = Enum.Font.GothamBold
miniIcon.Visible = false
miniIcon.Parent = screenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = miniIcon

local miniGradient = Instance.new("UIGradient")
miniGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 45))
}
miniGradient.Rotation = 45
miniGradient.Parent = miniIcon

-- Functions
local function updateStatus()
    local mode = settings.aimbotMode == "hold" and "Hold" or "Toggle"
    local active = settings.aimbotActive and " [ACTIVE]" or ""
    local wallCheckStatus = settings.wallCheck and " | Wall Check ON" or ""
    statusLabel.Text = "● " .. mode .. active .. wallCheckStatus
    statusLabel.TextColor3 = settings.aimbotActive and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 255, 100)
end

-- Toggle Functions
chamsToggle.MouseButton1Click:Connect(function()
    settings.chamsEnabled = not settings.chamsEnabled
    chamsToggle.Text = settings.chamsEnabled and "✓ Chams ESP" or "✗ Chams ESP"
    chamsToggle.BackgroundColor3 = settings.chamsEnabled and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(180, 50, 50)
end)

aimbotToggle.MouseButton1Click:Connect(function()
    settings.aimbotEnabled = not settings.aimbotEnabled
    aimbotToggle.Text = settings.aimbotEnabled and "✓ Aimbot" or "✗ Aimbot"
    aimbotToggle.BackgroundColor3 = settings.aimbotEnabled and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(180, 50, 50)
    
    if not settings.aimbotEnabled then
        settings.aimbotActive = false
        updateStatus()
    end
end)

wallCheckToggle.MouseButton1Click:Connect(function()
    settings.wallCheck = not settings.wallCheck
    wallCheckToggle.Text = settings.wallCheck and "✓ Wall Check (Aimbot Only)" or "✗ Wall Check (Aimbot Only)"
    wallCheckToggle.BackgroundColor3 = settings.wallCheck and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(180, 50, 50)
    updateStatus()
end)

smoothToggle.MouseButton1Click:Connect(function()
    settings.smoothAim = not settings.smoothAim
    smoothToggle.Text = settings.smoothAim and "✓ Smooth Aim" or "✗ Smooth Aim"
    smoothToggle.BackgroundColor3 = settings.smoothAim and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 70)
end)

predictionToggle.MouseButton1Click:Connect(function()
    settings.aimPrediction = not settings.aimPrediction
    predictionToggle.Text = settings.aimPrediction and "✓ Prediction" or "✗ Prediction"
    predictionToggle.BackgroundColor3 = settings.aimPrediction and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 70)
end)

-- Mode Buttons
holdBtn.MouseButton1Click:Connect(function()
    settings.aimbotMode = "hold"
    settings.aimbotActive = false
    holdBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 220)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    updateStatus()
end)

toggleBtn.MouseButton1Click:Connect(function()
    settings.aimbotMode = "toggle"
    settings.aimbotActive = false
    toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 220)
    holdBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    updateStatus()
end)

-- Hotkey Change
local changingHotkey = false
hotkeyBtn.MouseButton1Click:Connect(function()
    if changingHotkey then return end
    changingHotkey = true
    hotkeyBtn.Text = "Press any key..."
    hotkeyBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.UserInputType == Enum.UserInputType.Keyboard then
            settings.hotkey = input.KeyCode
            hotkeyBtn.Text = input.KeyCode.Name
            hotkeyLabel.Text = "Hotkey: " .. input.KeyCode.Name .. " (Click to change)"
            hotkeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            changingHotkey = false
            connection:Disconnect()
        end
    end)
end)

-- Smooth Slider
smoothSlider.FocusLost:Connect(function()
    local value = tonumber(smoothSlider.Text)
    if value and value >= 0.1 and value <= 1.0 then
        settings.smoothAmount = value
        smoothLabel.Text = "Smooth: " .. value
    else
        smoothSlider.Text = tostring(settings.smoothAmount)
    end
end)

-- Prediction Slider
predictionSlider.FocusLost:Connect(function()
    local value = tonumber(predictionSlider.Text)
    if value and value >= 0.1 and value <= 0.5 then
        settings.predictionAmount = value
        predictionLabel.Text = "Prediction: " .. value
    else
        predictionSlider.Text = tostring(settings.predictionAmount)
    end
end)

-- FOV Slider
fovSlider.FocusLost:Connect(function()
    local value = tonumber(fovSlider.Text)
    if value and value >= 50 and value <= 500 then
        settings.fovRadius = value
        fovCircle.Radius = value
        fovLabel.Text = "FOV Radius: " .. value
    else
        fovSlider.Text = tostring(settings.fovRadius)
    end
end)

-- FOV Visible Toggle
fovVisibleToggle.MouseButton1Click:Connect(function()
    settings.fovVisible = not settings.fovVisible
    fovVisibleToggle.Text = settings.fovVisible and "✓ Show FOV Circle" or "✗ Show FOV Circle"
    fovVisibleToggle.BackgroundColor3 = settings.fovVisible and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 70)
end)

-- Max Distance Slider
maxDistSlider.FocusLost:Connect(function()
    local value = tonumber(maxDistSlider.Text)
    if value and value >= 100 and value <= 2000 then
        settings.maxDistance = value
        maxDistLabel.Text = "Max ESP Distance: " .. value .. " studs"
    else
        maxDistSlider.Text = tostring(settings.maxDistance)
    end
end)

-- Close & Minimize
closeBtn.MouseButton1Click:Connect(function()
    for _, chamsData in pairs(chamsObjects) do
        removeChams(chamsData)
    end
    
    if updateConnection then updateConnection:Disconnect() end
    if aimbotConnection then aimbotConnection:Disconnect() end
    
    fovCircle:Remove()
    screenGui:Destroy()
    
    print("BloxHub CB closed")
end)

minimizeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    miniIcon.Visible = true
end)

miniIcon.MouseButton1Click:Connect(function()
    miniIcon.Visible = false
    mainFrame.Visible = true
end)

-- Input Handler
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or changingHotkey then return end
    
    if input.KeyCode == settings.hotkey and settings.aimbotEnabled then
        if settings.aimbotMode == "hold" then
            settings.aimbotActive = true
            updateStatus()
        elseif settings.aimbotMode == "toggle" then
            settings.aimbotActive = not settings.aimbotActive
            updateStatus()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == settings.hotkey and settings.aimbotMode == "hold" then
        settings.aimbotActive = false
        updateStatus()
    end
end)

-- Also handle right ctrl
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or changingHotkey then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl and settings.hotkey == Enum.KeyCode.LeftControl and settings.aimbotEnabled then
        if settings.aimbotMode == "hold" then
            settings.aimbotActive = true
            updateStatus()
        elseif settings.aimbotMode == "toggle" then
            settings.aimbotActive = not settings.aimbotActive
            updateStatus()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl and settings.hotkey == Enum.KeyCode.LeftControl and settings.aimbotMode == "hold" then
        settings.aimbotActive = false
        updateStatus()
    end
end)

-- Scan players
local function scanPlayers()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player and not chamsObjects[targetPlayer] then
            local chamsData = createChams(targetPlayer)
            chamsObjects[targetPlayer] = chamsData
        end
    end
end

-- Player events
Players.PlayerAdded:Connect(function(targetPlayer)
    if not chamsObjects[targetPlayer] then
        local chamsData = createChams(targetPlayer)
        chamsObjects[targetPlayer] = chamsData
    end
end)

Players.PlayerRemoving:Connect(function(targetPlayer)
    if chamsObjects[targetPlayer] then
        removeChams(chamsObjects[targetPlayer])
        chamsObjects[targetPlayer] = nil
    end
end)

-- Main Loop
updateConnection = RunService.RenderStepped:Connect(function()
    -- Update FOV circle
    fovCircle.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    fovCircle.Radius = settings.fovRadius
    fovCircle.Visible = settings.aimbotEnabled and settings.fovVisible
    
    -- Scan players
    scanPlayers()
    
    -- Update chams
    for targetPlayer, chamsData in pairs(chamsObjects) do
        if not updateChams(chamsData) then
            removeChams(chamsData)
            chamsObjects[targetPlayer] = nil
        end
    end
    
    -- Aimbot
    if settings.aimbotEnabled and settings.aimbotActive then
        local target = getClosestEnemy()
        if target then
            aimAt(target)
            currentTarget = target
        else
            currentTarget = nil
        end
    else
        currentTarget = nil
    end
end)

print("✅ BloxHub CB v2.1 Loaded!")
print("📌 Wall Check hanya berlaku untuk Aimbot")
print("📌 ESP tetap aktif (Chams di wall, Dot tanpa wall)")
