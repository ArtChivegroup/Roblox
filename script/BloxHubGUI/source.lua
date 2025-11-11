--[[
    BloxHub GUI Executor - Single File Source
    Version: 1.0
    Author: Dibuat berdasarkan PRD BloxHub
    Last Update: 2025-11-11

    Fitur:
    - Single File Source
    - Cross-Platform (PC & Mobile)
    - Draggable Window & Icon
    - Custom Hotkey System (Keyboard & Mouse)
    - Icon Toggle Mode
    - Grid Layout Menu
    - Settings Panel
    - Dibuat dari awal tanpa library eksternal
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- -----------------------------------------------------------------------------
-- [[ Core BloxHub Table ]]
-- Sesuai dengan spesifikasi arsitektur di PRD
-- -----------------------------------------------------------------------------
local BloxHub = {
    UI = {},
    Settings = {
        IconEnabled = true,
        Hotkeys = {
            ToggleGUI = Enum.KeyCode.RightControl,
        },
        -- Contoh nilai slider untuk Aimbot
        Aimbot = {
            Enabled = false,
            FOV = 90,
            Smoothness = 5,
        }
    },
    State = {
        GUIVisible = true,
        ListeningHotkeyFor = nil, -- Key dari tabel Hotkeys (e.g., "ToggleGUI")
        DragStart = nil,
        DragInput = nil,
        DraggingFrame = nil
    },
    Events = {
        OnToggle = Instance.new("BindableEvent")
    }
}

-- -----------------------------------------------------------------------------
-- [[ Mini Component Library (Internal) ]]
-- Untuk membuat UI secara konsisten dan bersih
-- -----------------------------------------------------------------------------
local Components = {}

function Components.Create(instanceType, properties)
    local inst = Instance.new(instanceType)
    for prop, value in pairs(properties) do
        inst[prop] = value
    end
    return inst
end

function Components.CreateWindow(id, title)
    local screenGui = Components.Create("ScreenGui", {
        Name = id,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        ResetOnSpawn = false,
    })

    local mainFrame = Components.Create("Frame", {
        Name = "MainFrame",
        Parent = screenGui,
        Size = UDim2.fromOffset(450, 350),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(35, 35, 45),
        BorderSizePixel = 0,
    })

    local corner = Components.Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = mainFrame })
    local stroke = Components.Create("UIStroke", { Color = Color3.fromRGB(80, 80, 90), Thickness = 1, Parent = mainFrame })

    local header = Components.Create("Frame", {
        Name = "Header",
        Parent = mainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Color3.fromRGB(45, 45, 55),
        BorderSizePixel = 0,
    })

    local headerCorner = Components.Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = header })
    local headerLayout = Components.Create("UIListLayout", {
        Parent = header,
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 10),
    })

    local headerLabel = Components.Create("TextLabel", {
        Name = "Title",
        Parent = header,
        Size = UDim2.new(1, -50, 1, 0), -- Sisakan ruang untuk tombol
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(45, 45, 55),
        BackgroundTransparency = 1,
    })

    local minimizeButton = Components.Create("TextButton", {
        Name = "MinimizeButton",
        Parent = header,
        Size = UDim2.fromOffset(30, 30),
        Text = "-",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 30,
        BackgroundColor3 = Color3.fromRGB(45, 45, 55),
        BackgroundTransparency = 1,
    })

    local contentFrame = Components.Create("Frame", {
        Name = "ContentFrame",
        Parent = mainFrame,
        Size = UDim2.new(1, -20, 1, -50),
        Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1,
    })

    BloxHub.UI.ScreenGui = screenGui
    BloxHub.UI.MainFrame = mainFrame
    BloxHub.UI.ContentFrame = contentFrame

    return mainFrame, header, contentFrame, minimizeButton
end

function Components.CreateGrid(parent)
    local grid = Components.Create("UIGridLayout", {
        Parent = parent,
        CellSize = UDim2.fromOffset(130, 50),
        CellPadding = UDim2.fromOffset(8, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
    })
    return grid
end

function Components.CreateButton(parent, text, layoutOrder)
    local button = Components.Create("TextButton", {
        Name = text .. "Button",
        Parent = parent,
        LayoutOrder = layoutOrder,
        Text = text,
        Font = Enum.Font.SourceSans,
        TextSize = 16,
        TextColor3 = Color3.fromRGB(220, 220, 220),
        BackgroundColor3 = Color3.fromRGB(55, 55, 65),
        BorderSizePixel = 0,
    })
    local corner = Components.Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = button })
    local stroke = Components.Create("UIStroke", { Color = Color3.fromRGB(90, 90, 100), Thickness = 1, Parent = button })

    -- Animasi hover
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(70, 70, 80) }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(120, 120, 130) }):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(55, 55, 65) }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(90, 90, 100) }):Play()
    end)

    return button
end

function Components.CreateSlider(parent, text, min, max, initialValue, callback)
    local container = Components.Create("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
    })
    local layout = Components.Create("UIListLayout", { Parent = container, FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, 5) })

    local labelFrame = Components.Create("Frame", { Parent = container, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1 })
    local labelLayout = Components.Create("UIListLayout", { Parent = labelFrame, FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center })
    
    local nameLabel = Components.Create("TextLabel", {
        Parent = labelFrame,
        Size = UDim2.new(0.8, 0, 1, 0),
        Text = text,
        Font = Enum.Font.SourceSans,
        TextSize = 16,
        TextColor3 = Color3.fromRGB(240, 240, 240),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
    })

    local valueLabel = Components.Create("TextLabel", {
        Parent = labelFrame,
        Size = UDim2.new(0.2, 0, 1, 0),
        Text = tostring(initialValue),
        Font = Enum.Font.SourceSans,
        TextSize = 16,
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextXAlignment = Enum.TextXAlignment.Right,
        BackgroundTransparency = 1,
    })

    local sliderTrack = Components.Create("Frame", {
        Parent = container,
        Size = UDim2.new(1, 0, 0, 8),
        BackgroundColor3 = Color3.fromRGB(25, 25, 35),
        BorderSizePixel = 0,
    })
    local corner = Components.Create("UICorner", { Parent = sliderTrack, CornerRadius = UDim.new(1, 0) })
    
    local sliderFill = Components.Create("Frame", {
        Parent = sliderTrack,
        Size = UDim2.new((initialValue - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(90, 90, 200),
        BorderSizePixel = 0,
    })
    local fillCorner = Components.Create("UICorner", { Parent = sliderFill, CornerRadius = UDim.new(1, 0) })

    local sliderThumb = Components.Create("TextButton", {
        Parent = sliderTrack,
        Size = UDim2.fromOffset(16, 16),
        Position = UDim2.new((initialValue - min) / (max - min), 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = "",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
    })
    local thumbCorner = Components.Create("UICorner", { Parent = sliderThumb, CornerRadius = UDim.new(1, 0) })

    local isDragging = false
    local function updateValue(input)
        local relativePos = (input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X
        relativePos = math.clamp(relativePos, 0, 1)
        
        local value = math.floor(min + (max - min) * relativePos + 0.5)
        
        sliderThumb.Position = UDim2.new(relativePos, 0, 0.5, 0)
        sliderFill.Size = UDim2.new(relativePos, 0, 1, 0)
        valueLabel.Text = tostring(value)

        if callback then
            callback(value)
        end
    end

    sliderThumb.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            updateValue(input)
        end
    end)
    
    sliderThumb.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateValue(input)
        end
    end)

    return container
end

function Components.CreateIconToggle()
    local iconButton = Components.Create("TextButton", {
        Name = "IconToggle",
        Parent = BloxHub.UI.ScreenGui,
        Size = UDim2.fromOffset(100, 30),
        Position = UDim2.fromOffset(20, 20),
        Text = "BloxHub",
        Font = Enum.Font.SourceSansBold,
        TextSize = 16,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(35, 35, 45),
        BorderSizePixel = 0,
        Visible = not BloxHub.State.GUIVisible, -- Hanya terlihat saat GUI utama disembunyikan
    })
    local corner = Components.Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = iconButton })
    local stroke = Components.Create("UIStroke", { Color = Color3.fromRGB(80, 80, 90), Thickness = 1, Parent = iconButton })

    BloxHub.UI.IconToggle = iconButton

    return iconButton
end

function Components.CreateHotkeyChanger(parent, label, hotkeyName)
    local container = Components.Create("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
    })
    local layout = Components.Create("UIListLayout", { Parent = container, FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 10) })
    
    local nameLabel = Components.Create("TextLabel", {
        Parent = container,
        Size = UDim2.new(0.5, -10, 1, 0),
        Text = label,
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(220, 220, 220),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
    })

    local hotkeyButton = Components.Create("TextButton", {
        Parent = container,
        Size = UDim2.new(0.5, -10, 1, 0),
        Text = tostring(BloxHub.Settings.Hotkeys[hotkeyName]),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(55, 55, 65),
    })
    local corner = Components.Create("UICorner", { Parent = hotkeyButton, CornerRadius = UDim.new(0, 4) })
    
    hotkeyButton.MouseButton1Click:Connect(function()
        BloxHub:StartListeningHotkey(hotkeyName, hotkeyButton)
    end)
    
    return container, hotkeyButton
end

-- -----------------------------------------------------------------------------
-- [[ Core GUI Logic ]]
-- -----------------------------------------------------------------------------

function BloxHub:ToggleGUI(visible)
    local shouldBeVisible = visible
    if visible == nil then
        shouldBeVisible = not self.State.GUIVisible
    end
    self.State.GUIVisible = shouldBeVisible

    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    if self.State.GUIVisible then
        self.UI.MainFrame.Visible = true
        local tween = TweenService:Create(self.UI.MainFrame, tweenInfo, { Size = UDim2.fromOffset(450, 350), Position = UDim2.fromScale(0.5, 0.5) })
        tween:Play()
    else
        local tween = TweenService:Create(self.UI.MainFrame, tweenInfo, { Size = UDim2.fromOffset(0, 0), Position = UDim2.fromScale(0.5, 0.5) })
        tween:Play()
        tween.Completed:Wait()
        self.UI.MainFrame.Visible = false
    end

    if self.Settings.IconEnabled then
        self.UI.IconToggle.Visible = not self.State.GUIVisible
    end

    self.Events.OnToggle:Fire(self.State.GUIVisible)
end

function BloxHub:Draggable(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self.State.DraggingFrame = frame
            self.State.DragInput = input
            self.State.DragStart = input.Position
            
            local startPos = frame.AbsolutePosition
            local con
            con = UserInputService.InputChanged:Connect(function(newInput)
                if newInput == self.State.DragInput then
                    local delta = newInput.Position - self.State.DragStart
                    frame.Position = UDim2.fromOffset(startPos.X + delta.X, startPos.Y + delta.Y)
                end
            end)
            
            local con2
            con2 = UserInputService.InputEnded:Connect(function(endInput)
                if endInput == self.State.DragInput then
                    self.State.DraggingFrame = nil
                    self.State.DragInput = nil
                    con:Disconnect()
                    con2:Disconnect()
                end
            end)
        end
    end)
end

function BloxHub:StartListeningHotkey(hotkeyName, buttonElement)
    if self.State.ListeningHotkeyFor then return end -- Already listening
    
    self.State.ListeningHotkeyFor = hotkeyName
    local oldText = buttonElement.Text
    buttonElement.Text = "..."

    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and self.State.ListeningHotkeyFor == hotkeyName then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode ~= Enum.KeyCode.Unknown then
                    self.Settings.Hotkeys[hotkeyName] = input.KeyCode
                    buttonElement.Text = tostring(input.KeyCode.Name)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                self.Settings.Hotkeys[hotkeyName] = "MouseButton1"
                buttonElement.Text = "Mouse1"
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                self.Settings.Hotkeys[hotkeyName] = "MouseButton2"
                buttonElement.Text = "Mouse2"
            end
            
            self.State.ListeningHotkeyFor = nil
            connection:Disconnect()
        end
    end)
    
    -- Timeout
    delay(5, function()
        if self.State.ListeningHotkeyFor == hotkeyName then
            self.State.ListeningHotkeyFor = nil
            buttonElement.Text = oldText
            connection:Disconnect()
        end
    end)
end

-- -----------------------------------------------------------------------------
-- [[ UI Construction ]]
-- -----------------------------------------------------------------------------
function BloxHub:BuildUI()
    -- 1. Create Main Window
    local mainFrame, header, contentFrame, minimizeButton = Components.CreateWindow("BloxHubGUI", "BloxHub")

    -- 2. Create Icon Toggle
    local iconToggle = Components.CreateIconToggle()
    iconToggle.MouseButton1Click:Connect(function() self:ToggleGUI(true) end)

    -- 3. Make them draggable
    self:Draggable(header)
    self:Draggable(iconToggle)

    -- 4. Handle Minimize
    minimizeButton.MouseButton1Click:Connect(function() self:ToggleGUI(false) end)

    -- 5. Main Content Pages
    local pages = {}
    local pageContainer = Components.Create("Frame", {
        Parent = contentFrame,
        Size = UDim2.new(1, 0, 1, -60),
        Position = UDim2.new(0, 0, 0, 60),
        BackgroundTransparency = 1,
    })

    -- 6. Grid Menu
    local gridFrame = Components.Create("Frame", {
        Parent = contentFrame,
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 1,
    })
    local gridLayout = Components.CreateGrid(gridFrame)
    
    local featureNames = {"ESP", "Chams", "Aimbot", "Recoil", "Visuals", "Settings"}
    local featureButtons = {}

    local function showPage(name)
        for pageName, page in pairs(pages) do
            page.Visible = (pageName == name)
        end
    end

    for i, name in ipairs(featureNames) do
        -- Create a page for this feature
        pages[name] = Components.Create("Frame", {
            Name = name .. "Page",
            Parent = pageContainer,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = (i == 1), -- Show first page by default
        })
        local pageLayout = Components.Create("UIListLayout", {
            Parent = pages[name],
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 10),
        })

        -- Create the grid button
        local button = Components.CreateButton(gridFrame, name, i)
        button.MouseButton1Click:Connect(function() showPage(name) end)
        table.insert(featureButtons, button)
    end

    -- 7. Populate Pages with Content
    
    -- Populate ESP Page (example)
    local espLabel = Components.Create("TextLabel", { Parent = pages["ESP"], Text = "ESP Settings Here", TextColor3 = Color3.fromRGB(255,255,255), BackgroundTransparency = 1, Size = UDim2.new(1,0,0,30)})
    
    -- Populate Aimbot Page
    Components.CreateSlider(pages["Aimbot"], "FOV", 10, 300, self.Settings.Aimbot.FOV, function(value)
        self.Settings.Aimbot.FOV = value
    end)
    Components.CreateSlider(pages["Aimbot"], "Smoothness", 1, 20, self.Settings.Aimbot.Smoothness, function(value)
        self.Settings.Aimbot.Smoothness = value
    end)

    -- Populate Settings Page
    local toggleIconLabel = Components.Create("TextLabel", { Parent = pages["Settings"], Text = "Enable Icon Toggle:", TextColor3 = Color3.fromRGB(255,255,255), BackgroundTransparency = 1, Size = UDim2.new(0.5,0,0,30), TextXAlignment = Enum.TextXAlignment.Left })
    
    Components.CreateHotkeyChanger(pages["Settings"], "Toggle GUI", "ToggleGUI")
    -- Add more hotkey changers here as needed
    
    -- Show ESP page by default
    showPage("ESP")
end

-- -----------------------------------------------------------------------------
-- [[ Input Handler ]]
-- -----------------------------------------------------------------------------
function BloxHub:InitializeInputHandler()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or self.State.ListeningHotkeyFor then return end
        
        -- Keyboard Hotkeys
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == self.Settings.Hotkeys.ToggleGUI then
                self:ToggleGUI()
            end
        end

        -- Mouse Hotkeys
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if self.Settings.Hotkeys.ToggleGUI == "MouseButton1" then
                self:ToggleGUI()
            end
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
            if self.Settings.Hotkeys.ToggleGUI == "MouseButton2" then
                self:ToggleGUI()
            end
        end
    end)
end

-- -----------------------------------------------------------------------------
-- [[ Initialization ]]
-- -----------------------------------------------------------------------------
function BloxHub:Init()
    -- Prevent re-running the script
    if game:GetService("CoreGui"):FindFirstChild("BloxHubGUI") then
        game:GetService("CoreGui"):FindFirstChild("BloxHubGUI"):Destroy()
    end
    
    self:BuildUI()
    self:InitializeInputHandler()
    self:ToggleGUI(true) -- Show GUI on start
    
    print("BloxHub GUI Initialized.")
end

-- Run the script
BloxHub:Init()

-- Optional: Return the table for external script interaction
return BloxHub
