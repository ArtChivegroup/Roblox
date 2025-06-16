--// BloxHub Key System Template Final by DimasHop
--// Combined with Entrenched WW1 ESP+Aimbot

-- SERVICES (Combined)
local HttpService = game:GetService("HttpService") -- Still useful for HttpService:JSONDecode/Encode if needed elsewhere, or future changes
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Teams = game:GetService("Teams") -- From ESP script
local RunService = game:GetService("RunService") -- From ESP script

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera -- From ESP script

-- CONFIG (Key System)
local keyURL = "https://raw.githubusercontent.com/ArtChivegroup/Jinx/main/Jinx/files/Sync"
local getKeyPage = "https://bloxhub.work.gd/keyblox.html"

-- VARIABLES (Key System)
local uiVisible = true -- For Key System UI

-- =========================================================================================
-- MAIN ESP + AIMBOT SCRIPT (Wrapped in a function to be called after key verification)
-- =========================================================================================
local function ExecuteMainScript()
    print("BloxHub Key Verified. Initializing ESP + Aimbot script...")

    -- GUI SETUP (ESP/Aimbot)
    local ESP_Aimbot_ScreenGui = Instance.new("ScreenGui", CoreGui)
    ESP_Aimbot_ScreenGui.Name = "ESP_Aimbot_GUI"
    ESP_Aimbot_ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ESP_Aimbot_ScreenGui)
    MainFrame.Size = UDim2.new(0, 200, 0, 280)
    MainFrame.Position = UDim2.new(0, 100, 0, 100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.BackgroundTransparency = 0.1
    local MainFrameCorner = Instance.new("UICorner", MainFrame)
    MainFrameCorner.CornerRadius = UDim.new(0, 8)


    local MinimizeButton = Instance.new("TextButton", MainFrame)
    MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
    MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
    MinimizeButton.Text = "—"
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 18
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
    MinimizeButton.TextColor3 = Color3.fromRGB(200,200,200)
    local MinimizeButtonCorner = Instance.new("UICorner", MinimizeButton)
    MinimizeButtonCorner.CornerRadius = UDim.new(0,4)


    local ExitButton = Instance.new("TextButton", MainFrame)
    ExitButton.Size = UDim2.new(0, 25, 0, 25)
    ExitButton.Position = UDim2.new(1, -65, 0, 5)
    ExitButton.Text = "X"
    ExitButton.Font = Enum.Font.GothamBold
    ExitButton.TextSize = 18
    ExitButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
    ExitButton.TextColor3 = Color3.fromRGB(255,255,255)
    local ExitButtonCorner = Instance.new("UICorner", ExitButton)
    ExitButtonCorner.CornerRadius = UDim.new(0,4)


    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Size = UDim2.new(1, -70, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.Text = "ESP + Aimbot"
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 16
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local ToggleESPButton = Instance.new("TextButton", MainFrame)
    ToggleESPButton.Size = UDim2.new(0, 180, 0, 30)
    ToggleESPButton.Position = UDim2.new(0.5, -90, 0, 40)
    ToggleESPButton.Text = "ESP: ON"
    ToggleESPButton.Font = Enum.Font.Gotham
    ToggleESPButton.TextSize = 16
    ToggleESPButton.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
    ToggleESPButton.TextColor3 = Color3.fromRGB(255,255,255)
    local ToggleESPButtonCorner = Instance.new("UICorner", ToggleESPButton)
    ToggleESPButtonCorner.CornerRadius = UDim.new(0,5)


    local ToggleAimbotButton = Instance.new("TextButton", MainFrame)
    ToggleAimbotButton.Size = UDim2.new(0, 180, 0, 30)
    ToggleAimbotButton.Position = UDim2.new(0.5, -90, 0, 75)
    ToggleAimbotButton.Text = "Aimbot: ON"
    ToggleAimbotButton.Font = Enum.Font.Gotham
    ToggleAimbotButton.TextSize = 16
    ToggleAimbotButton.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
    ToggleAimbotButton.TextColor3 = Color3.fromRGB(255,255,255)
    local ToggleAimbotButtonCorner = Instance.new("UICorner", ToggleAimbotButton)
    ToggleAimbotButtonCorner.CornerRadius = UDim.new(0,5)


    local TeamCheckButton = Instance.new("TextButton", MainFrame)
    TeamCheckButton.Size = UDim2.new(0, 180, 0, 30)
    TeamCheckButton.Position = UDim2.new(0.5, -90, 0, 110)
    TeamCheckButton.Text = "Team Check: ON"
    TeamCheckButton.Font = Enum.Font.Gotham
    TeamCheckButton.TextSize = 16
    TeamCheckButton.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
    TeamCheckButton.TextColor3 = Color3.fromRGB(255,255,255)
    local TeamCheckButtonCorner = Instance.new("UICorner", TeamCheckButton)
    TeamCheckButtonCorner.CornerRadius = UDim.new(0,5)


    local FOVLabel = Instance.new("TextLabel", MainFrame)
    FOVLabel.Size = UDim2.new(0, 180, 0, 20)
    FOVLabel.Position = UDim2.new(0.5, -90, 0, 145)
    FOVLabel.BackgroundTransparency = 1
    FOVLabel.Text = "Aimbot FOV:"
    FOVLabel.Font = Enum.Font.Gotham
    FOVLabel.TextSize = 14
    FOVLabel.TextColor3 = Color3.fromRGB(200,200,200)
    FOVLabel.TextXAlignment = Enum.TextXAlignment.Left

    local FOVSizeBox = Instance.new("TextBox", MainFrame)
    FOVSizeBox.Size = UDim2.new(0, 180, 0, 30)
    FOVSizeBox.Position = UDim2.new(0.5, -90, 0, 165)
    FOVSizeBox.Text = "150"
    FOVSizeBox.PlaceholderText = "Enter FOV (e.g., 150)"
    FOVSizeBox.Font = Enum.Font.Gotham
    FOVSizeBox.TextSize = 14
    FOVSizeBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    FOVSizeBox.TextColor3 = Color3.fromRGB(220,220,220)
    local FOVSizeBoxCorner = Instance.new("UICorner", FOVSizeBox)
    FOVSizeBoxCorner.CornerRadius = UDim.new(0,5)


    local DotSizeLabel = Instance.new("TextLabel", MainFrame)
    DotSizeLabel.Size = UDim2.new(0, 180, 0, 20)
    DotSizeLabel.Position = UDim2.new(0.5, -90, 0, 200)
    DotSizeLabel.BackgroundTransparency = 1
    DotSizeLabel.Text = "ESP Dot Size:"
    DotSizeLabel.Font = Enum.Font.Gotham
    DotSizeLabel.TextSize = 14
    DotSizeLabel.TextColor3 = Color3.fromRGB(200,200,200)
    DotSizeLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DotSizeBox = Instance.new("TextBox", MainFrame)
    DotSizeBox.Size = UDim2.new(0, 180, 0, 30)
    DotSizeBox.Position = UDim2.new(0.5, -90, 0, 220)
    DotSizeBox.Text = "5"
    DotSizeBox.PlaceholderText = "Enter Dot Size (e.g., 5)"
    DotSizeBox.Font = Enum.Font.Gotham
    DotSizeBox.TextSize = 14
    DotSizeBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    DotSizeBox.TextColor3 = Color3.fromRGB(220,220,220)
    local DotSizeBoxCorner = Instance.new("UICorner", DotSizeBox)
    DotSizeBoxCorner.CornerRadius = UDim.new(0,5)


    local MinimizedIcon = Instance.new("TextButton", ESP_Aimbot_ScreenGui)
    MinimizedIcon.Size = UDim2.new(0, 60, 0, 30)
    MinimizedIcon.Position = UDim2.new(0, 10, 0, 10)
    MinimizedIcon.Text = "ESP"
    MinimizedIcon.Font = Enum.Font.GothamBold
    MinimizedIcon.TextSize = 16
    MinimizedIcon.Visible = false
    MinimizedIcon.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    MinimizedIcon.TextColor3 = Color3.fromRGB(255,255,255)
    MinimizedIcon.Active = true
    MinimizedIcon.Draggable = true
    local MinimizedIconCorner = Instance.new("UICorner", MinimizedIcon)
    MinimizedIconCorner.CornerRadius = UDim.new(0,5)


    -- VARIABLES (ESP/Aimbot)
    local ESPEnabled = true
    local AimbotEnabled = true
    local TeamCheck = true
    local AimbotFOV = 150
    local DotSize = 5
    local ESPFolder = Instance.new("Folder", CoreGui)
    ESPFolder.Name = "ESP_Dots"
    local ActiveDots = {}

    -- ESP SYSTEM
    local function UpdateDotAppearance(player, data)
        if not data or not data.Dot or not data.Dot.Parent or not data.Head or not data.Head.Parent then
            if ActiveDots[player] then
                if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
                ActiveDots[player] = nil
            end
            return
        end
        local isSameTeam = player.Team == LocalPlayer.Team
        data.Dot.Enabled = ESPEnabled and (not TeamCheck or not isSameTeam)
        data.Dot.Size = UDim2.new(0, DotSize, 0, DotSize)
        if data.Head:IsA("BasePart") then
            data.Dot.Adornee = data.Head
        end
    end

    local function CreateDot(player)
        if player == LocalPlayer then return end
        if ActiveDots[player] then
            if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
            ActiveDots[player] = nil
        end

        local function SetupDot(character)
            if not character or not character.Parent then return end
            local head = character:WaitForChild("Head", 2)
            if not head or not head:IsA("BasePart") then return end
            
            for _, child in pairs(ESPFolder:GetChildren()) do
                if child.Name == "ESPDot_" .. player.UserId then
                    child:Destroy()
                end
            end
            
            local dot = Instance.new("BillboardGui", ESPFolder)
            dot.Name = "ESPDot_" .. player.UserId
            dot.Adornee = head
            dot.Size = UDim2.new(0, DotSize, 0, DotSize)
            dot.AlwaysOnTop = true
            dot.LightInfluence = 0
            dot.ResetOnSpawn = false

            local frame = Instance.new("Frame", dot)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            if player.Team then
                frame.BackgroundColor3 = player.Team.TeamColor.Color
            end
            frame.BackgroundTransparency = 0.2
            frame.BorderSizePixel = 0
            local frameCorner = Instance.new("UICorner", frame)
            frameCorner.CornerRadius = UDim.new(0.5,0)

            ActiveDots[player] = {Dot = dot, Head = head, Frame = frame, Character = character}
            UpdateDotAppearance(player, ActiveDots[player])
        end

        if player.Character then
            SetupDot(player.Character)
        end

        player.CharacterAdded:Connect(function(character)
            task.wait(1)
            if ActiveDots[player] then
                 if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
                 ActiveDots[player] = nil
            end
            SetupDot(character)
        end)

        player.CharacterRemoving:Connect(function(character)
            if ActiveDots[player] and ActiveDots[player].Character == character then
                if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
                ActiveDots[player] = nil
            end
        end)
    end

    for _, player in pairs(Players:GetPlayers()) do
        CreateDot(player)
    end

    Players.PlayerAdded:Connect(CreateDot)
    Players.PlayerRemoving:Connect(function(player)
        if ActiveDots[player] then
            if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
            ActiveDots[player] = nil
        end
    end)
    
    local espUpdaterConnection
    local function StartEspUpdater()
        if espUpdaterConnection and espUpdaterConnection.Connected then return end
        espUpdaterConnection = RunService.RenderStepped:Connect(function()
            if not ESPEnabled then return end
            for player, data in pairs(ActiveDots) do
                if player and data and data.Dot and data.Dot.Parent then
                    if not data.Head or not data.Head.Parent or not player.Character or player.Character ~= data.Character then
                        if player.Character and player.Character:FindFirstChild("Head") then
                            data.Head = player.Character.Head
                            data.Character = player.Character
                            data.Dot.Adornee = data.Head
                        else
                            if data.Dot then data.Dot:Destroy() end -- Check if dot exists before destroying
                            ActiveDots[player] = nil
                            continue
                        end
                    end
                    UpdateDotAppearance(player, data)
                elseif ActiveDots[player] then
                    if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
                    ActiveDots[player] = nil
                end
            end
        end)
    end

    local function StopEspUpdater()
        if espUpdaterConnection then
            espUpdaterConnection:Disconnect()
            espUpdaterConnection = nil
        end
    end

    if ESPEnabled then StartEspUpdater() end

    local function GetClosestTarget()
        local closestPlayerHead = nil
        local shortestDistance = AimbotFOV

        for player, data in pairs(ActiveDots) do
            if player and player.Character and data and data.Head and data.Head.Parent and data.Dot and data.Dot.Enabled then
                local head = data.Head
                local screenPoint, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if distance < shortestDistance then
                        closestPlayerHead = head
                        shortestDistance = distance
                    end
                end
            end
        end
        return closestPlayerHead
    end

    local aimbotConnection
    local function StartAimbotListener()
        if aimbotConnection and aimbotConnection.Connected then return end
        aimbotConnection = RunService.RenderStepped:Connect(function()
            if AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local target = GetClosestTarget()
                if target and target:IsA("BasePart") and target.Parent then
                    local targetPosition = target.Position
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                end
            end
        end)
    end
    
    local function StopAimbotListener()
        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end
    end
    
    if AimbotEnabled then StartAimbotListener() end

    ToggleESPButton.MouseButton1Click:Connect(function()
        ESPEnabled = not ESPEnabled
        ToggleESPButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
        ToggleESPButton.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
        if ESPEnabled then
            StartEspUpdater()
            for player, data in pairs(ActiveDots) do if data and data.Dot then UpdateDotAppearance(player, data) end end
        else
            StopEspUpdater()
            for player, data in pairs(ActiveDots) do if data and data.Dot then data.Dot.Enabled = false end end
        end
    end)

    ToggleAimbotButton.MouseButton1Click:Connect(function()
        AimbotEnabled = not AimbotEnabled
        ToggleAimbotButton.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
        ToggleAimbotButton.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
        if AimbotEnabled then StartAimbotListener() else StopAimbotListener() end
    end)

    TeamCheckButton.MouseButton1Click:Connect(function()
        TeamCheck = not TeamCheck
        TeamCheckButton.Text = TeamCheck and "Team Check: ON" or "Team Check: OFF"
        TeamCheckButton.BackgroundColor3 = TeamCheck and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
        for player, data in pairs(ActiveDots) do if data and data.Dot then UpdateDotAppearance(player, data) end end
    end)

    FOVSizeBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local fov = tonumber(FOVSizeBox.Text)
            if fov and fov > 0 then
                AimbotFOV = fov
                FOVSizeBox.Text = tostring(AimbotFOV)
            else
                FOVSizeBox.Text = tostring(AimbotFOV)
            end
        end
    end)
    FOVSizeBox.InputEnded:Connect(function(inputObject)
        if inputObject.UserInputType == Enum.UserInputType.Focus then return end
        local fov = tonumber(FOVSizeBox.Text)
        if fov and fov > 0 then
            AimbotFOV = fov
            FOVSizeBox.Text = tostring(AimbotFOV)
        else
            FOVSizeBox.Text = tostring(AimbotFOV)
        end
    end)


    DotSizeBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local size = tonumber(DotSizeBox.Text)
            if size and size > 0 then
                DotSize = size
                DotSizeBox.Text = tostring(DotSize)
                for player, data in pairs(ActiveDots) do if data and data.Dot then UpdateDotAppearance(player, data) end end
            else
                DotSizeBox.Text = tostring(DotSize)
            end
        end
    end)
    DotSizeBox.InputEnded:Connect(function(inputObject)
        if inputObject.UserInputType == Enum.UserInputType.Focus then return end
        local size = tonumber(DotSizeBox.Text)
        if size and size > 0 then
            DotSize = size
            DotSizeBox.Text = tostring(DotSize)
            for player, data in pairs(ActiveDots) do if data and data.Dot then UpdateDotAppearance(player, data) end end
        else
            DotSizeBox.Text = tostring(DotSize)
        end
    end)

    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        MinimizedIcon.Visible = true
        MinimizedIcon.Position = MainFrame.Position
    end)

    MinimizedIcon.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        MinimizedIcon.Visible = false
    end)

    ExitButton.MouseButton1Click:Connect(function()
        StopEspUpdater()
        StopAimbotListener()
        if ESP_Aimbot_ScreenGui and ESP_Aimbot_ScreenGui.Parent then ESP_Aimbot_ScreenGui:Destroy() end
        if ESPFolder and ESPFolder.Parent then ESPFolder:Destroy() end
        ESPEnabled = false
        AimbotEnabled = false
        ActiveDots = {}
        print("ESP + Aimbot script terminated.")
    end)

    ToggleESPButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
    ToggleESPButton.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
    ToggleAimbotButton.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    ToggleAimbotButton.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
    TeamCheckButton.Text = TeamCheck and "Team Check: ON" or "Team Check: OFF"
    TeamCheckButton.BackgroundColor3 = TeamCheck and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(170, 0, 0)
    FOVSizeBox.Text = tostring(AimbotFOV)
    DotSizeBox.Text = tostring(DotSize)

    print("ESP + Aimbot script initialized successfully.")
end
-- =========================================================================================
-- END OF MAIN ESP + AIMBOT SCRIPT FUNCTION
-- =========================================================================================


-- FUNCTIONS (Key System)
local function fetchKey()
    local success, response = pcall(function()
        -- Reverted to game:HttpGet as per original template
        return game:HttpGet(keyURL)
    end)

    if success then
        if type(response) == "string" then
            local key = string.match(response, "%S+") -- Match any non-whitespace characters
            if key then
                return key
            else
                warn("Key System: Fetched response successfully, but no key found in the content. Response: ", response)
                return nil
            end
        else
            warn("Key System: Fetched response successfully, but the response was not a string. Type: ", type(response), " Value: ", response)
            return nil
        end
    else
        -- 'response' here will contain the error message from pcall
        warn("Key System: Failed to fetch key! Error: ", response)
        return nil
    end
end

local function createKeySystemUI()
    if CoreGui:FindFirstChild("BloxHubKeySystem") then
        CoreGui.BloxHubKeySystem:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "BloxHubKeySystem"
    ScreenGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 350, 0, 250)
    Frame.Position = UDim2.new(0.5, -175, 0.5, -125)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Frame.BackgroundTransparency = 0.1

    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundTransparency = 1
    Title.Text = "🔑 BloxHub Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22

    local Note = Instance.new("TextLabel", Frame)
    Note.Size = UDim2.new(1, -20, 0, 20)
    Note.Position = UDim2.new(0, 10, 0, 50)
    Note.BackgroundTransparency = 1
    Note.Text = "🔄 The key changes every 3 hours."
    Note.TextColor3 = Color3.fromRGB(200, 200, 200)
    Note.Font = Enum.Font.Gotham
    Note.TextSize = 14
    Note.TextXAlignment = Enum.TextXAlignment.Left

    local KeyBox = Instance.new("TextBox", Frame)
    KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
    KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    KeyBox.PlaceholderText = "Enter Key..."
    KeyBox.Text = ""
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.TextSize = 18
    KeyBox.TextColor3 = Color3.fromRGB(230,230,230)
    KeyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    KeyBox.ClearTextOnFocus = false

    local UICornerKey = Instance.new("UICorner", KeyBox)
    UICornerKey.CornerRadius = UDim.new(0, 5)

    local Submit = Instance.new("TextButton", Frame)
    Submit.Size = UDim2.new(0.8, 0, 0, 40)
    Submit.Position = UDim2.new(0.1, 0, 0.58, 0)
    Submit.Text = "✅ Submit Key"
    Submit.Font = Enum.Font.GothamBold
    Submit.TextSize = 18
    Submit.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Submit.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerSubmit = Instance.new("UICorner", Submit)
    UICornerSubmit.CornerRadius = UDim.new(0, 5)

    local GetKeyBrowser = Instance.new("TextButton", Frame)
    GetKeyBrowser.Size = UDim2.new(0.35, 0, 0, 30)
    GetKeyBrowser.Position = UDim2.new(0.1, 0, 0.82, 0)
    GetKeyBrowser.Text = "🌐 Open Link"
    GetKeyBrowser.Font = Enum.Font.Gotham
    GetKeyBrowser.TextSize = 14
    GetKeyBrowser.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GetKeyBrowser.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerBrowser = Instance.new("UICorner", GetKeyBrowser)
    UICornerBrowser.CornerRadius = UDim.new(0, 5)

    local GetKeyClipboard = Instance.new("TextButton", Frame)
    GetKeyClipboard.Size = UDim2.new(0.35, 0, 0, 30)
    GetKeyClipboard.Position = UDim2.new(0.55, 0, 0.82, 0)
    GetKeyClipboard.Text = "📋 Copy Link"
    GetKeyClipboard.Font = Enum.Font.Gotham
    GetKeyClipboard.TextSize = 14
    GetKeyClipboard.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GetKeyClipboard.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerClipboard = Instance.new("UICorner", GetKeyClipboard)
    UICornerClipboard.CornerRadius = UDim.new(0, 5)

    local Minimize = Instance.new("TextButton", Frame)
    Minimize.Size = UDim2.new(0, 25, 0, 25)
    Minimize.Position = UDim2.new(1, -65, 0, 12.5)
    Minimize.Text = "—"
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextSize = 18
    Minimize.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    local MinimizeCorner = Instance.new("UICorner", Minimize)
    MinimizeCorner.CornerRadius = UDim.new(0,4)

    local Exit = Instance.new("TextButton", Frame)
    Exit.Size = UDim2.new(0, 25, 0, 25)
    Exit.Position = UDim2.new(1, -35, 0, 12.5)
    Exit.Text = "X"
    Exit.Font = Enum.Font.GothamBold
    Exit.TextSize = 18
    Exit.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
    local ExitCorner = Instance.new("UICorner", Exit)
    ExitCorner.CornerRadius = UDim.new(0,4)

    Minimize.MouseButton1Click:Connect(function()
        uiVisible = not uiVisible
        Frame.Visible = uiVisible
    end)

    Exit.MouseButton1Click:Connect(function()
        if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end
    end)

    GetKeyBrowser.MouseButton1Click:Connect(function()
        local success = false
        if syn and syn.request then
            pcall(function() syn.request({Url = getKeyPage, Method = "GET"}); success = true end)
        elseif KRNL_LOADED and type(KRNL_LOADED) == "table" and KRNL_LOADED.OpenURL then -- Added type check for KRNL_LOADED
             pcall(function() KRNL_LOADED:OpenURL(getKeyPage); success = true end)
        elseif typeof and typeof(fluxus) == "table" and fluxus.browser_open then -- Added typeof for fluxus
             pcall(function() fluxus.browser_open(getKeyPage); success = true end)
        elseif open_url then
             pcall(function() open_url(getKeyPage); success = true end)
        elseif request then
             pcall(function() request({Url = getKeyPage, Method = "GET"}); success = true end)
        end

        if success then
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "Attempting to open key page in browser...",
                Duration = 5
            })
        else
            if setclipboard then
                setclipboard(getKeyPage)
                StarterGui:SetCore("SendNotification", {
                    Title = "BloxHub Key System",
                    Text = "Browser open not supported. Link copied to clipboard!",
                    Duration = 5
                })
            else
                 StarterGui:SetCore("SendNotification", {
                    Title = "BloxHub Key System",
                    Text = "Browser open and clipboard not supported.",
                    Duration = 5
                })
            end
        end
    end)

    GetKeyClipboard.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(getKeyPage)
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "Link copied to clipboard!",
                Duration = 5
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "Clipboard not supported on this executor.",
                Duration = 5
            })
        end
    end)

    Submit.MouseButton1Click:Connect(function()
        local inputKey = KeyBox.Text
        if inputKey == "" then
             StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "⚠️ Please enter a key!",
                Duration = 3
            })
            return
        end

        local currentKey = fetchKey()

        if not currentKey then
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "❗ Error fetching current key. Check console (F9) or try again.",
                Duration = 5
            })
            return
        end
        
        local trimmedInputKey = inputKey:match("^%s*(.-)%s*$")
        local trimmedCurrentKey = currentKey:match("^%s*(.-)%s*$")

        if trimmedInputKey == trimmedCurrentKey then
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "✅ Key Verified!",
                Duration = 3
            })
            task.wait(1)
            if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end
            
            local successExe, errExe = pcall(ExecuteMainScript)
            if not successExe then
                warn("Error executing main script:", errExe)
                StarterGui:SetCore("SendNotification", {
                    Title = "Script Execution Error",
                    Text = "Main script failed to load. Check console (F9). Error: " .. tostring(errExe),
                    Duration = 10
                })
            end
        else
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "❌ Invalid Key!",
                Duration = 3
            })
            KeyBox.Text = ""
        end
    end)
end

-- EXECUTE KEY SYSTEM UI
pcall(createKeySystemUI)
print("BloxHub Key System UI Initialized. Please enter key to proceed.")