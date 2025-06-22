-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- State
local ESPEnabled = true
local AimbotEnabled = true
local FOVRadius = 180         -- default FOV
local TeamCheck = false
local AutoSnap = true
local MaxDetectionDistance = 110 -- default
local isMinimized = false
local isActive = true

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESP_Aimbot_GUI"
screenGui.Parent = CoreGui

-- Main Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 410)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true
mainFrame.Active = true
local mainFrameCorner = Instance.new("UICorner", mainFrame)
mainFrameCorner.CornerRadius = UDim.new(0, 8)

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleLabel.Text = "BloxHub AIMBOT"
titleLabel.TextColor3 = Color3.fromRGB(0, 170, 250)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
local titleCorner = Instance.new("UICorner", titleLabel)
titleCorner.CornerRadius = UDim.new(0,8)

-- Minimize & Exit
local minimizeButton = Instance.new("TextButton", mainFrame)
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -60, 0, 3)
minimizeButton.Text = "_"
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20
minimizeButton.TextColor3 = Color3.fromRGB(220, 220, 220)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
local minimizeCorner = Instance.new("UICorner", minimizeButton)
minimizeCorner.CornerRadius = UDim.new(0, 4)

local exitButton = Instance.new("TextButton", mainFrame)
exitButton.Size = UDim2.new(0, 25, 0, 25)
exitButton.Position = UDim2.new(1, -30, 0, 3)
exitButton.Text = "X"
exitButton.Font = Enum.Font.SourceSansBold
exitButton.TextSize = 20
exitButton.TextColor3 = Color3.fromRGB(220, 220, 220)
exitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
local exitCorner = Instance.new("UICorner", exitButton)
exitCorner.CornerRadius = UDim.new(0, 4)

-- Logo Button (for minimize)
local logoButton = Instance.new("TextButton", screenGui)
logoButton.Size = UDim2.new(0, 60, 0, 30)
logoButton.Position = UDim2.new(0, 20, 0, 20)
logoButton.Text = "GUI"
logoButton.Font = Enum.Font.SourceSansBold
logoButton.TextSize = 18
logoButton.BackgroundColor3 = Color3.fromRGB(0, 170, 250)
logoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
logoButton.Visible = false
local logoCorner = Instance.new("UICorner", logoButton)
logoCorner.CornerRadius = UDim.new(0, 6)

-- Drawing FOV Circle (using Drawing API)
local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Filled = false
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(255, 128, 128)
FOVring.Radius = FOVRadius
FOVring.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

-- Minimize/restore/exit logic
local function toggleMinimize()
    isMinimized = not isMinimized
    mainFrame.Visible = not isMinimized
    logoButton.Visible = isMinimized
    fovFrame.Visible = not isMinimized and isActive
    FOVring.Visible = not isMinimized and isActive
end
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
logoButton.MouseButton1Click:Connect(toggleMinimize)

local function cleanup()
    isActive = false
    if fovFrame then fovFrame:Destroy() end
    FOVring.Visible = false
    FOVring:Remove()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            for _, child in ipairs(player.Character:GetChildren()) do
                if child:IsA("BillboardGui") and child.Name == "ESP_DOT" then
                    child:Destroy()
                end
            end
        end
    end
    if screenGui then screenGui:Destroy() end
end
exitButton.MouseButton1Click:Connect(cleanup)

-- FOV CIRCLE (GUI, fallback for exploits without Drawing API)
local fovFrame = Instance.new("Frame", screenGui)
fovFrame.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
fovFrame.AnchorPoint = Vector2.new(0.5, 0.5)
fovFrame.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y)
fovFrame.BackgroundTransparency = 1
fovFrame.BorderSizePixel = 2
fovFrame.BorderColor3 = Color3.fromRGB(0, 170, 250)
fovFrame.Visible = true
local fovCorner = Instance.new("UICorner", fovFrame)
fovCorner.CornerRadius = UDim.new(1, 0)

-- FOV Slider With +/- Buttons and Draggable Handle
local fovLabel = Instance.new("TextLabel", mainFrame)
fovLabel.Position = UDim2.new(0, 20, 0, 170)
fovLabel.Size = UDim2.new(0, 140, 0, 25)
fovLabel.Text = "FOV Radius: " .. tostring(FOVRadius)
fovLabel.BackgroundTransparency = 1
fovLabel.TextColor3 = Color3.fromRGB(170,170,255)
fovLabel.TextScaled = true
fovLabel.Font = Enum.Font.Gotham

local fovSliderBG = Instance.new("Frame", mainFrame)
fovSliderBG.Position = UDim2.new(0, 20, 0, 200)
fovSliderBG.Size = UDim2.new(0, 140, 0, 12)
fovSliderBG.BackgroundColor3 = Color3.fromRGB(55, 60, 80)
fovSliderBG.BorderSizePixel = 0
local fovSliderCorner = Instance.new("UICorner", fovSliderBG)
fovSliderCorner.CornerRadius = UDim.new(1,0)

local fovSliderBar = Instance.new("Frame", fovSliderBG)
fovSliderBar.Size = UDim2.new((FOVRadius-0)/240, 0, 1, 0)
fovSliderBar.BackgroundColor3 = Color3.fromRGB(0, 170, 250)
fovSliderBar.BorderSizePixel = 0
local fovSliderBarCorner = Instance.new("UICorner", fovSliderBar)
fovSliderBarCorner.CornerRadius = UDim.new(1,0)

local fovSliderHandle = Instance.new("Frame", fovSliderBG)
fovSliderHandle.Size = UDim2.new(0, 12, 1.5, 0)
fovSliderHandle.Position = UDim2.new((FOVRadius-0)/240, -6, 0, -3)
fovSliderHandle.BackgroundColor3 = Color3.fromRGB(0, 170, 250)
fovSliderHandle.BorderSizePixel = 0
local fovSliderHandleCorner = Instance.new("UICorner", fovSliderHandle)
fovSliderHandleCorner.CornerRadius = UDim.new(1,0)

local fovMinus = Instance.new("TextButton", mainFrame)
fovMinus.Size = UDim2.new(0, 20, 0, 20)
fovMinus.Position = UDim2.new(0, 2, 0, 198)
fovMinus.Text = "-"
fovMinus.Font = Enum.Font.SourceSansBold
fovMinus.TextSize = 18
fovMinus.TextColor3 = Color3.fromRGB(200,200,255)
fovMinus.BackgroundColor3 = Color3.fromRGB(55, 60, 80)
fovMinus.BorderSizePixel = 0

local fovPlus = Instance.new("TextButton", mainFrame)
fovPlus.Size = UDim2.new(0, 20, 0, 20)
fovPlus.Position = UDim2.new(0, 162, 0, 198)
fovPlus.Text = "+"
fovPlus.Font = Enum.Font.SourceSansBold
fovPlus.TextSize = 18
fovPlus.TextColor3 = Color3.fromRGB(200,200,255)
fovPlus.BackgroundColor3 = Color3.fromRGB(55, 60, 80)
fovPlus.BorderSizePixel = 0

-- Max Distance Slider With +/- Buttons and Draggable Handle
local distLabel = Instance.new("TextLabel", mainFrame)
distLabel.Position = UDim2.new(0, 20, 0, 225)
distLabel.Size = UDim2.new(0, 140, 0, 25)
distLabel.Text = "Max Distance: " .. tostring(MaxDetectionDistance)
distLabel.BackgroundTransparency = 1
distLabel.TextColor3 = Color3.fromRGB(170,255,170)
distLabel.TextScaled = true
distLabel.Font = Enum.Font.Gotham

local distSliderBG = Instance.new("Frame", mainFrame)
distSliderBG.Position = UDim2.new(0, 20, 0, 255)
distSliderBG.Size = UDim2.new(0, 140, 0, 12)
distSliderBG.BackgroundColor3 = Color3.fromRGB(55, 80, 60)
distSliderBG.BorderSizePixel = 0
local distSliderCorner = Instance.new("UICorner", distSliderBG)
distSliderCorner.CornerRadius = UDim.new(1,0)

local distSliderBar = Instance.new("Frame", distSliderBG)
distSliderBar.Size = UDim2.new((MaxDetectionDistance-0)/240, 0, 1, 0)
distSliderBar.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
distSliderBar.BorderSizePixel = 0
local distSliderBarCorner = Instance.new("UICorner", distSliderBar)
distSliderBarCorner.CornerRadius = UDim.new(1,0)

local distSliderHandle = Instance.new("Frame", distSliderBG)
distSliderHandle.Size = UDim2.new(0, 12, 1.5, 0)
distSliderHandle.Position = UDim2.new((MaxDetectionDistance-0)/240, -6, 0, -3)
distSliderHandle.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
distSliderHandle.BorderSizePixel = 0
local distSliderHandleCorner = Instance.new("UICorner", distSliderHandle)
distSliderHandleCorner.CornerRadius = UDim.new(1,0)

local distMinus = Instance.new("TextButton", mainFrame)
distMinus.Size = UDim2.new(0, 20, 0, 20)
distMinus.Position = UDim2.new(0, 2, 0, 253)
distMinus.Text = "-"
distMinus.Font = Enum.Font.SourceSansBold
distMinus.TextSize = 18
distMinus.TextColor3 = Color3.fromRGB(200,255,200)
distMinus.BackgroundColor3 = Color3.fromRGB(55, 80, 60)
distMinus.BorderSizePixel = 0

local distPlus = Instance.new("TextButton", mainFrame)
distPlus.Size = UDim2.new(0, 20, 0, 20)
distPlus.Position = UDim2.new(0, 162, 0, 253)
distPlus.Text = "+"
distPlus.Font = Enum.Font.SourceSansBold
distPlus.TextSize = 18
distPlus.TextColor3 = Color3.fromRGB(200,255,200)
distPlus.BackgroundColor3 = Color3.fromRGB(55, 80, 60)
distPlus.BorderSizePixel = 0

-- == FOV SLIDER LOGIC (Drag, +, -) ==
local draggingFOV = false
local draggingFOVHandle = false

fovSliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFOV = true
        mainFrame.Active = false
    end
end)
fovSliderBG.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFOV = false
        mainFrame.Active = true
    end
end)
fovSliderHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFOVHandle = true
        mainFrame.Active = false
    end
end)
fovSliderHandle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFOVHandle = false
        mainFrame.Active = true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if (draggingFOV or draggingFOVHandle) and input.UserInputType == Enum.UserInputType.MouseMovement then
        local relX = math.clamp((input.Position.X - fovSliderBG.AbsolutePosition.X) / fovSliderBG.AbsoluteSize.X, 0, 1)
        FOVRadius = math.floor(0 + relX * 240)
        fovSliderBar.Size = UDim2.new((FOVRadius-0)/240, 0, 1, 0)
        fovSliderHandle.Position = UDim2.new((FOVRadius-0)/240, -6, 0, -3)
        fovLabel.Text = "FOV Radius: " .. tostring(FOVRadius)
        FOVring.Radius = FOVRadius
    end
end)
fovMinus.MouseButton1Click:Connect(function()
    FOVRadius = math.max(0, FOVRadius - 1)
    fovSliderBar.Size = UDim2.new((FOVRadius-0)/240, 0, 1, 0)
    fovSliderHandle.Position = UDim2.new((FOVRadius-0)/240, -6, 0, -3)
    fovLabel.Text = "FOV Radius: " .. tostring(FOVRadius)
    FOVring.Radius = FOVRadius
end)
fovPlus.MouseButton1Click:Connect(function()
    FOVRadius = math.min(240, FOVRadius + 1)
    fovSliderBar.Size = UDim2.new((FOVRadius-0)/240, 0, 1, 0)
    fovSliderHandle.Position = UDim2.new((FOVRadius-0)/240, -6, 0, -3)
    fovLabel.Text = "FOV Radius: " .. tostring(FOVRadius)
    FOVring.Radius = FOVRadius
end)

-- == DISTANCE SLIDER LOGIC (Drag, +, -) ==
local draggingDist = false
local draggingDistHandle = false

distSliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingDist = true
        mainFrame.Active = false
    end
end)
distSliderBG.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingDist = false
        mainFrame.Active = true
    end
end)
distSliderHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingDistHandle = true
        mainFrame.Active = false
    end
end)
distSliderHandle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingDistHandle = false
        mainFrame.Active = true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if (draggingDist or draggingDistHandle) and input.UserInputType == Enum.UserInputType.MouseMovement then
        local relX = math.clamp((input.Position.X - distSliderBG.AbsolutePosition.X) / distSliderBG.AbsoluteSize.X, 0, 1)
        MaxDetectionDistance = math.floor(0 + relX * 240)
        distSliderBar.Size = UDim2.new((MaxDetectionDistance-0)/240, 0, 1, 0)
        distSliderHandle.Position = UDim2.new((MaxDetectionDistance-0)/240, -6, 0, -3)
        distLabel.Text = "Max Distance: " .. tostring(MaxDetectionDistance)
    end
end)
distMinus.MouseButton1Click:Connect(function()
    MaxDetectionDistance = math.max(0, MaxDetectionDistance - 1)
    distSliderBar.Size = UDim2.new((MaxDetectionDistance-0)/240, 0, 1, 0)
    distSliderHandle.Position = UDim2.new((MaxDetectionDistance-0)/240, -6, 0, -3)
    distLabel.Text = "Max Distance: " .. tostring(MaxDetectionDistance)
end)
distPlus.MouseButton1Click:Connect(function()
    MaxDetectionDistance = math.min(240, MaxDetectionDistance + 1)
    distSliderBar.Size = UDim2.new((MaxDetectionDistance-0)/240, 0, 1, 0)
    distSliderHandle.Position = UDim2.new((MaxDetectionDistance-0)/240, -6, 0, -3)
    distLabel.Text = "Max Distance: " .. tostring(MaxDetectionDistance)
end)

-- ESP Toggle
local espButton = Instance.new("TextButton", mainFrame)
espButton.Size = UDim2.new(0, 140, 0, 40)
espButton.Position = UDim2.new(0, 20, 0, 20)
espButton.Text = "ESP: ON"
espButton.BackgroundColor3 = Color3.fromRGB(34, 38, 54)
espButton.TextColor3 = Color3.fromRGB(0, 255, 120)
espButton.TextScaled = true

-- Team Check Toggle
local teamButton = Instance.new("TextButton", mainFrame)
teamButton.Size = UDim2.new(0, 140, 0, 40)
teamButton.Position = UDim2.new(0, 20, 0, 70)
teamButton.Text = "Team Check: OFF"
teamButton.BackgroundColor3 = Color3.fromRGB(34, 38, 54)
teamButton.TextColor3 = Color3.fromRGB(255, 255, 120)
teamButton.TextScaled = true

-- Auto Snap Toggle
local autoSnapButton = Instance.new("TextButton", mainFrame)
autoSnapButton.Size = UDim2.new(0, 140, 0, 40)
autoSnapButton.Position = UDim2.new(0, 20, 0, 120)
autoSnapButton.Text = "Auto Snap: ON"
autoSnapButton.BackgroundColor3 = Color3.fromRGB(34, 38, 54)
autoSnapButton.TextColor3 = Color3.fromRGB(0, 255, 120)
autoSnapButton.TextScaled = true

-- Aimbot Toggle (manual, only active if AutoSnap is off)
local aimbotButton = Instance.new("TextButton", mainFrame)
aimbotButton.Size = UDim2.new(0, 140, 0, 40)
aimbotButton.Position = UDim2.new(0, 20, 0, 320)
aimbotButton.Text = "Aimbot: OFF"
aimbotButton.BackgroundColor3 = Color3.fromRGB(34, 38, 54)
aimbotButton.TextColor3 = Color3.fromRGB(255, 100, 100)
aimbotButton.TextScaled = true

-- Button Toggles
espButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    espButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
    espButton.TextColor3 = ESPEnabled and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,100,100)
end)
teamButton.MouseButton1Click:Connect(function()
    TeamCheck = not TeamCheck
    teamButton.Text = TeamCheck and "Team Check: ON" or "Team Check: OFF"
    teamButton.TextColor3 = TeamCheck and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,255,120)
end)
autoSnapButton.MouseButton1Click:Connect(function()
    AutoSnap = not AutoSnap
    autoSnapButton.Text = AutoSnap and "Auto Snap: ON" or "Auto Snap: OFF"
    autoSnapButton.TextColor3 = AutoSnap and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,100,100)
end)
aimbotButton.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    aimbotButton.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    aimbotButton.TextColor3 = AimbotEnabled and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,100,100)
end)

-- Team Check Helper
local function isSameTeam(player)
    if LocalPlayer.Team and player.Team then
        return LocalPlayer.Team == player.Team
    end
    return false
end

local function inMaxDistance(targetPart)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not targetPart then return false end
    return (LocalPlayer.Character.HumanoidRootPart.Position - targetPart.Position).Magnitude <= MaxDetectionDistance
end

-- DOT ESP
local function createDotESP(player)
    local function setup()
        if player.Character and player.Character:FindFirstChild("Head") then
            if player.Character:FindFirstChild("ESP_DOT") then return end
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_DOT"
            billboard.Size = UDim2.new(0, 7, 0, 7)
            billboard.Adornee = player.Character.Head
            billboard.AlwaysOnTop = true
            billboard.LightInfluence = 0
            billboard.Parent = player.Character

            local dot = Instance.new("Frame", billboard)
            dot.Size = UDim2.new(1, 0, 1, 0)
            dot.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
            dot.BackgroundTransparency = 0
            dot.BorderSizePixel = 0
            local dotCorner = Instance.new("UICorner", dot)
            dotCorner.CornerRadius = UDim.new(1, 0)
        end
    end
    if player.Character then
        setup()
    end
    player.CharacterAdded:Connect(function()
        task.wait(1)
        setup()
    end)
end

local function removeDotESP(player)
    if player.Character then
        for _, child in ipairs(player.Character:GetChildren()) do
            if child:IsA("BillboardGui") and child.Name == "ESP_DOT" then
                child:Destroy()
            end
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createDotESP(player)
    end
end
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createDotESP(player)
    end
end)
Players.PlayerRemoving:Connect(function(player)
    removeDotESP(player)
end)

-- Get Closest Target
local function getClosestTarget()
    local closest = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer
            and player.Character
            and player.Character:FindFirstChild("Humanoid")
            and player.Character.Humanoid.Health > 0
            and player.Character:FindFirstChild("Head")
            and player.Character:FindFirstChild("HumanoidRootPart")
        then
            if TeamCheck and isSameTeam(player) then
                continue
            end
            if not inMaxDistance(player.Character.HumanoidRootPart) then
                continue
            end
            local head = player.Character.Head
            local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                if distance < shortestDistance and distance < FOVRadius then
                    shortestDistance = distance
                    closest = head
                end
            end
        end
    end
    return closest
end

-- MAIN LOOP: FOV CIRCLE POS, ESP, AIMBOT (TENGAH CROSSHAIR)
RunService.RenderStepped:Connect(function()
    if not isActive then return end

    -- FOV CIRCLE
    fovFrame.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y)
    fovFrame.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
    fovFrame.Visible = not isMinimized

    -- Drawing FOVring (always middle of screen)
    FOVring.Radius = FOVRadius
    FOVring.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    FOVring.Visible = not isMinimized and isActive

    -- ESP Display (dot)
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local esp = player.Character:FindFirstChild("ESP_DOT")
            if esp then
                esp.Enabled = ESPEnabled and not isMinimized
            end
        end
    end

    -- Aimbot: HEAD PASTI DI TENGAH LAYAR
    if ((AutoSnap and AimbotEnabled) or (not AutoSnap and AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)))
        and not isMinimized then
        local target = getClosestTarget()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)
