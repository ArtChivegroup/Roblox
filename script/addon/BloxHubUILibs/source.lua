-- BloxHub UI Framework v2.0
-- Universal Roblox GUI System - Single File Implementation
-- Author: BloxHub
-- Last Updated: 2025-11-12

local BloxHub = {}
BloxHub.__index = BloxHub

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- Local variables
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Core framework structure
BloxHub.Core = {}
BloxHub.UI = {}
BloxHub.Elements = {}
BloxHub.Settings = {}
BloxHub.State = {
    Windows = {},
    ActiveWindow = nil,
    InputListening = false,
    CurrentKeybind = nil
}

-- Default theme configuration
BloxHub.Settings.Theme = {
    Background = Color3.fromRGB(15, 15, 15),
    Accent = Color3.fromRGB(0, 120, 255),
    Text = Color3.fromRGB(255, 255, 255),
    Highlight = Color3.fromRGB(0, 162, 255),
    Secondary = Color3.fromRGB(40, 40, 40),
    Border = Color3.fromRGB(60, 60, 60),
    Success = Color3.fromRGB(0, 200, 83),
    Warning = Color3.fromRGB(255, 193, 7),
    Error = Color3.fromRGB(244, 67, 54)
}

BloxHub.Settings.Animation = {
    Duration = 0.2,
    EasingStyle = Enum.EasingStyle.Quad,
    EasingDirection = Enum.EasingDirection.Out
}

-- Utility functions
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

local function Tween(obj, properties, duration)
    local tweenInfo = TweenInfo.new(
        duration or BloxHub.Settings.Animation.Duration,
        BloxHub.Settings.Animation.EasingStyle,
        BloxHub.Settings.Animation.EasingDirection
    )
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween:Play()
    return tween
end

local function Round(num, decimalPlaces)
    local multiplier = 10^(decimalPlaces or 0)
    return math.floor(num * multiplier + 0.5) / multiplier
end

-- Input handling system
BloxHub.Core.Input = {
    Connections = {},
    
    Connect = function(self, event, callback)
        local conn = event:Connect(callback)
        table.insert(self.Connections, conn)
        return conn
    end,
    
    DisconnectAll = function(self)
        for _, conn in pairs(self.Connections) do
            conn:Disconnect()
        end
        self.Connections = {}
    end
}

-- Core GUI management
function BloxHub.Core:Initialize()
    -- Create main ScreenGui
    self.ScreenGui = Create("ScreenGui", {
        Name = "BloxHubUI",
        DisplayOrder = 10,
        Parent = CoreGui
    })
    
    -- Setup input handling
    self:SetupInputHandling()
    
    -- Load saved settings
    self:LoadSettings()
end

function BloxHub.Core:SetupInputHandling()
    -- Global toggle key (default: RightShift)
    self.Input:Connect(UserInputService.InputBegan, function(input, processed)
        if processed then return end
        
        if input.KeyCode == Enum.KeyCode.RightShift then
            if self.State.ActiveWindow then
                self.State.ActiveWindow.Enabled = not self.State.ActiveWindow.Enabled
            end
        end
    end)
end

function BloxHub.Core:LoadSettings()
    -- Try to load from file first
    local success, data = pcall(function()
        if readfile and isfile and isfile("BloxHub_Config.json") then
            return HttpService:JSONDecode(readfile("BloxHub_Config.json"))
        end
    end)
    
    if success and data then
        BloxHub.Settings = data
    else
        -- Fallback to global variable
        if getgenv().BloxHubSettings then
            BloxHub.Settings = getgenv().BloxHubSettings
        end
    end
end

function BloxHub.Core:SaveSettings()
    local success, result = pcall(function()
        if writefile then
            writefile("BloxHub_Config.json", HttpService:JSONEncode(BloxHub.Settings))
        else
            getgenv().BloxHubSettings = BloxHub.Settings
        end
    end)
    
    return success
end

-- UI Components Factory
BloxHub.Elements.Create = {}

function BloxHub.Elements.Create:Frame(properties)
    local defaultProps = {
        BackgroundColor3 = BloxHub.Settings.Theme.Background,
        BorderColor3 = BloxHub.Settings.Theme.Border,
        BorderSizePixel = 1,
        ClipsDescendants = true
    }
    
    return Create("Frame", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:TextLabel(properties)
    local defaultProps = {
        BackgroundTransparency = 1,
        TextColor3 = BloxHub.Settings.Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 14
    }
    
    return Create("TextLabel", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:TextButton(properties)
    local defaultProps = {
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        BorderColor3 = BloxHub.Settings.Theme.Border,
        TextColor3 = BloxHub.Settings.Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        AutoButtonColor = false
    }
    
    return Create("TextButton", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:ScrollingFrame(properties)
    local defaultProps = {
        BackgroundColor3 = BloxHub.Settings.Theme.Background,
        BorderColor3 = BloxHub.Settings.Theme.Border,
        ScrollBarThickness = 6,
        CanvasSize = UDim2.new(0, 0, 0, 0)
    }
    
    return Create("ScrollingFrame", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:UIListLayout(properties)
    local defaultProps = {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    }
    
    return Create("UIListLayout", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:UIPadding(properties)
    local defaultProps = {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    }
    
    return Create("UIPadding", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:UICorner(properties)
    local defaultProps = {
        CornerRadius = UDim.new(0, 8)
    }
    
    return Create("UICorner", setmetatable(properties, {__index = defaultProps}))
end

function BloxHub.Elements.Create:UIStroke(properties)
    local defaultProps = {
        Color = BloxHub.Settings.Theme.Border,
        Thickness = 1
    }
    
    return Create("UIStroke", setmetatable(properties, {__index = defaultProps}))
end

-- Main Window Class
BloxHub.UI.Window = {}
BloxHub.UI.Window.__index = BloxHub.UI.Window

function BloxHub.UI.Window.new(title, config)
    config = config or {}
    local self = setmetatable({}, BloxHub.UI.Window)
    
    self.Title = title or "BloxHub GUI"
    self.Resizable = config.Resizable or false
    self.Enabled = config.StartEnabled or false
    self.Tabs = {}
    self.Elements = {}
    
    -- Create window container
    self.Container = BloxHub.Elements.Create:Frame({
        Name = "Window",
        Size = UDim2.new(0, 400, 0, 500),
        Position = UDim2.new(0.5, -200, 0.5, -250),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = BloxHub.Core.ScreenGui,
        Visible = self.Enabled
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 12), Parent = self.Container})
    BloxHub.Elements.Create:UIStroke({Parent = self.Container})
    
    -- Title bar
    self.TitleBar = BloxHub.Elements.Create:Frame({
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        Parent = self.Container
    })
    
    BloxHub.Elements.Create:UICorner({
        CornerRadius = UDim.new(0, 12),
        Parent = self.TitleBar
    })
    
    self.TitleLabel = BloxHub.Elements.Create:TextLabel({
        Name = "Title",
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        Text = self.Title,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        Parent = self.TitleBar
    })
    
    -- Close button
    self.CloseButton = BloxHub.Elements.Create:TextButton({
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, -15),
        AnchorPoint = Vector2.new(0, 0.5),
        Text = "×",
        TextSize = 20,
        BackgroundColor3 = BloxHub.Settings.Theme.Error,
        Parent = self.TitleBar
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = self.CloseButton})
    
    -- Content area
    self.Content = BloxHub.Elements.Create:ScrollingFrame({
        Name = "Content",
        Size = UDim2.new(1, -20, 1, -60),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = self.Container
    })
    
    BloxHub.Elements.Create:UIPadding({Parent = self.Content})
    BloxHub.Elements.Create:UIListLayout({Parent = self.Content})
    
    -- Setup interactions
    self:SetupInteractions()
    
    -- Register window
    table.insert(BloxHub.State.Windows, self)
    BloxHub.State.ActiveWindow = self
    
    return self
end

function BloxHub.UI.Window:SetupInteractions()
    -- Close button
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
    
    -- Title bar dragging
    local dragging = false
    local dragInput, dragStart, startPos
    
    self.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.Container.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    self.TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            self.Container.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function BloxHub.UI.Window:CreateTab(name)
    local tab = BloxHub.UI.Tab.new(name, self)
    table.insert(self.Tabs, tab)
    return tab
end

function BloxHub.UI.Window:Destroy()
    for i, window in pairs(BloxHub.State.Windows) do
        if window == self then
            table.remove(BloxHub.State.Windows, i)
            break
        end
    end
    
    if BloxHub.State.ActiveWindow == self then
        BloxHub.State.ActiveWindow = #BloxHub.State.Windows > 0 and BloxHub.State.Windows[1] or nil
    end
    
    self.Container:Destroy()
end

-- Tab Class
BloxHub.UI.Tab = {}
BloxHub.UI.Tab.__index = BloxHub.UI.Tab

function BloxHub.UI.Tab.new(name, parentWindow)
    local self = setmetatable({}, BloxHub.UI.Tab)
    
    self.Name = name
    self.ParentWindow = parentWindow
    self.Elements = {}
    
    -- Create tab container
    self.Container = BloxHub.Elements.Create:Frame({
        Name = name .. "Tab",
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = #parentWindow.Tabs + 1,
        Parent = parentWindow.Content
    })
    
    BloxHub.Elements.Create:UIListLayout({Parent = self.Container})
    
    -- Tab header
    self.Header = BloxHub.Elements.Create:TextLabel({
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 30),
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        BackgroundTransparency = 1,
        Parent = self.Container
    })
    
    return self
end

function BloxHub.UI.Tab:AddButton(name, callback)
    local button = BloxHub.Elements.Create:TextButton({
        Name = name,
        Size = UDim2.new(1, 0, 0, 35),
        Text = name,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = button})
    BloxHub.Elements.Create:UIStroke({Parent = button})
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Highlight})
    end)
    
    button.MouseLeave:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary})
    end)
    
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    table.insert(self.Elements, button)
    return button
end

function BloxHub.UI.Tab:AddToggle(name, defaultValue, callback)
    local toggleFrame = BloxHub.Elements.Create:Frame({
        Name = name .. "Toggle",
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label",
        Size = UDim2.new(0.7, 0, 1, 0),
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Parent = toggleFrame
    })
    
    local toggleButton = BloxHub.Elements.Create:TextButton({
        Name = "Toggle",
        Size = UDim2.new(0, 50, 0, 25),
        Position = UDim2.new(1, -55, 0.5, -12.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = defaultValue and BloxHub.Settings.Theme.Success or BloxHub.Settings.Theme.Secondary,
        Text = "",
        Parent = toggleFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 12), Parent = toggleButton})
    
    local toggleKnob = BloxHub.Elements.Create:Frame({
        Name = "Knob",
        Size = UDim2.new(0, 21, 0, 21),
        Position = UDim2.new(0, defaultValue and 2 or 27, 0.5, -10.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = BloxHub.Settings.Theme.Text,
        Parent = toggleButton
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 10), Parent = toggleKnob})
    
    local state = defaultValue or false
    
    local function updateToggle()
        Tween(toggleButton, {BackgroundColor3 = state and BloxHub.Settings.Theme.Success or BloxHub.Settings.Theme.Secondary})
        Tween(toggleKnob, {Position = UDim2.new(0, state and 27 or 2, 0.5, -10.5)})
        
        if callback then
            callback(state)
        end
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        updateToggle()
    end)
    
    table.insert(self.Elements, toggleFrame)
    return toggleFrame
end

function BloxHub.UI.Tab:AddSlider(name, min, max, defaultValue, callback)
    local sliderFrame = BloxHub.Elements.Create:Frame({
        Name = name .. "Slider",
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 1,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label",
        Size = UDim2.new(1, 0, 0, 20),
        Text = name .. ": " .. defaultValue,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Parent = sliderFrame
    })
    
    local track = BloxHub.Elements.Create:Frame({
        Name = "Track",
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 1, -15),
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        Parent = sliderFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 3), Parent = track})
    
    local fill = BloxHub.Elements.Create:Frame({
        Name = "Fill",
        Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = BloxHub.Settings.Theme.Accent,
        Parent = track
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 3), Parent = fill})
    
    local knob = BloxHub.Elements.Create:Frame({
        Name = "Knob",
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(fill.Size.X.Scale, -8, 0.5, -8),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = BloxHub.Settings.Theme.Text,
        Parent = track
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 8), Parent = knob})
    
    local dragging = false
    local currentValue = defaultValue or min
    
    local function updateSlider(value)
        currentValue = math.clamp(value, min, max)
        local ratio = (currentValue - min) / (max - min)
        
        Tween(fill, {Size = UDim2.new(ratio, 0, 1, 0)})
        Tween(knob, {Position = UDim2.new(ratio, -8, 0.5, -8)})
        
        label.Text = name .. ": " .. Round(currentValue, 2)
        
        if callback then
            callback(currentValue)
        end
    end
    
    local function onInput(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not dragging then
                    connection:Disconnect()
                    return
                end
                
                local relativeX = (input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
                local value = min + (max - min) * math.clamp(relativeX, 0, 1)
                updateSlider(value)
            end)
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end
    
    track.InputBegan:Connect(onInput)
    knob.InputBegan:Connect(onInput)
    
    table.insert(self.Elements, sliderFrame)
    return sliderFrame
end

function BloxHub.UI.Tab:AddKeybind(name, defaultKey, callback)
    local keybindFrame = BloxHub.Elements.Create:Frame({
        Name = name .. "Keybind",
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label",
        Size = UDim2.new(0.7, 0, 1, 0),
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Parent = keybindFrame
    })
    
    local keyButton = BloxHub.Elements.Create:TextButton({
        Name = "KeyButton",
        Size = UDim2.new(0, 80, 0, 25),
        Position = UDim2.new(1, -85, 0.5, -12.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        Text = tostring(defaultKey):gsub("Enum.KeyCode.", ""),
        TextSize = 12,
        Parent = keybindFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = keyButton})
    BloxHub.Elements.Create:UIStroke({Parent = keyButton})
    
    local currentKey = defaultKey
    local listening = false
    
    local function setKey(key)
        currentKey = key
        keyButton.Text = tostring(key):gsub("Enum.KeyCode.", "")
        listening = false
        Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary})
        
        if callback then
            callback(key)
        end
    end
    
    keyButton.MouseButton1Click:Connect(function()
        if not listening then
            listening = true
            keyButton.Text = "..."
            Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Accent})
            
            BloxHub.State.InputListening = true
            BloxHub.State.CurrentKeybind = setKey
        end
    end)
    
    -- Right click to set to mouse button
    keyButton.MouseButton2Click:Connect(function()
        setKey(Enum.KeyCode.MouseButton2)
    end)
    
    table.insert(self.Elements, keybindFrame)
    return keybindFrame
end

function BloxHub.UI.Tab:AddDropdown(name, options, callback)
    local dropdownFrame = BloxHub.Elements.Create:Frame({
        Name = name .. "Dropdown",
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label",
        Size = UDim2.new(1, 0, 0, 15),
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Parent = dropdownFrame
    })
    
    local dropdownButton = BloxHub.Elements.Create:TextButton({
        Name = "DropdownButton",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        Text = options[1] or "Select...",
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = dropdownFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = dropdownButton})
    BloxHub.Elements.Create:UIPadding({
        PaddingLeft = UDim.new(0, 10),
        Parent = dropdownButton
    })
    
    local dropdownArrow = BloxHub.Elements.Create:TextLabel({
        Name = "Arrow",
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -25, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = BloxHub.Settings.Theme.Text,
        Parent = dropdownButton
    })
    
    local dropdownList = BloxHub.Elements.Create:ScrollingFrame({
        Name = "DropdownList",
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 1, 5),
        BackgroundColor3 = BloxHub.Settings.Theme.Background,
        Visible = false,
        ClipsDescendants = true,
        Parent = dropdownFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = dropdownList})
    BloxHub.Elements.Create:UIStroke({Parent = dropdownList})
    BloxHub.Elements.Create:UIListLayout({Parent = dropdownList})
    
    local isOpen = false
    local selectedOption = options[1]
    
    local function toggleDropdown()
        isOpen = not isOpen
        dropdownList.Visible = isOpen
        
        if isOpen then
            Tween(dropdownList, {Size = UDim2.new(1, 0, 0, math.min(#options * 30, 150))})
            Tween(dropdownArrow, {Rotation = 180})
        else
            Tween(dropdownList, {Size = UDim2.new(1, 0, 0, 0)})
            Tween(dropdownArrow, {Rotation = 0})
        end
    end
    
    local function selectOption(option)
        selectedOption = option
        dropdownButton.Text = option
        toggleDropdown()
        
        if callback then
            callback(option)
        end
    end
    
    -- Populate dropdown options
    for i, option in ipairs(options) do
        local optionButton = BloxHub.Elements.Create:TextButton({
            Name = option,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
            BackgroundTransparency = 1,
            Text = option,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = i,
            Parent = dropdownList
        })
        
        BloxHub.Elements.Create:UIPadding({
            PaddingLeft = UDim.new(0, 10),
            Parent = optionButton
        })
        
        optionButton.MouseEnter:Connect(function()
            Tween(optionButton, {BackgroundTransparency = 0.8})
        end)
        
        optionButton.MouseLeave:Connect(function()
            Tween(optionButton, {BackgroundTransparency = 1})
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            selectOption(option)
        end)
    end
    
    dropdownButton.MouseButton1Click:Connect(toggleDropdown)
    
    -- Close dropdown when clicking outside
    local dropdownConnection
    dropdownConnection = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and isOpen then
            if not dropdownButton:IsDescendantOf(mouse.Target) and not dropdownList:IsDescendantOf(mouse.Target) then
                toggleDropdown()
            end
        end
    end)
    
    table.insert(self.Elements, dropdownFrame)
    return dropdownFrame
end

function BloxHub.UI.Tab:AddPopup(name, options, callback)
    return self:AddDropdown(name, options, callback)
end

function BloxHub.UI.Tab:AddLabel(text)
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label_" .. text,
        Size = UDim2.new(1, 0, 0, 20),
        Text = text,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        LayoutOrder = #self.Elements + 1,
        Parent = self.Container
    })
    
    table.insert(self.Elements, label)
    return label
end

function BloxHub.UI.Tab:AddTextBox(name, placeholder, callback)
    local textBoxFrame = BloxHub.Elements.Create:Frame({
        Name = name .. "TextBox",
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1,
        Parent = self.Container,
        LayoutOrder = #self.Elements + 1
    })
    
    local label = BloxHub.Elements.Create:TextLabel({
        Name = "Label",
        Size = UDim2.new(1, 0, 0, 15),
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Parent = textBoxFrame
    })
    
    local textBox = BloxHub.Elements.Create:TextBox({
        Name = "TextBox",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
        Text = "",
        PlaceholderText = placeholder or "Enter text...",
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        Parent = textBoxFrame
    })
    
    BloxHub.Elements.Create:UICorner({CornerRadius = UDim.new(0, 6), Parent = textBox})
    BloxHub.Elements.Create:UIPadding({
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = textBox
    })
    
    textBox.FocusLost:Connect(function(enterPressed)
        if callback and (enterPressed or not textBox:IsFocused()) then
            callback(textBox.Text)
        end
    end)
    
    table.insert(self.Elements, textBoxFrame)
    return textBoxFrame
end

-- Global keybind listener
BloxHub.Core.Input:Connect(UserInputService.InputBegan, function(input, processed)
    if processed or not BloxHub.State.InputListening then return end
    
    if BloxHub.State.CurrentKeybind then
        local key = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType == Enum.UserInputType.MouseButton1 and Enum.KeyCode.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and Enum.KeyCode.MouseButton2
        
        if key then
            BloxHub.State.CurrentKeybind(key)
            BloxHub.State.CurrentKeybind = nil
            BloxHub.State.InputListening = false
        end
    end
end)

-- Layout helpers
function BloxHub.UI:CreateGrid(columns, padding)
    return {
        Type = "Grid",
        Columns = columns or 2,
        Padding = padding or 5
    }
end

function BloxHub.UI:CreateVerticalStack(spacing)
    return {
        Type = "VerticalStack",
        Spacing = spacing or 5
    }
end

-- Main API
function BloxHub:CreateWindow(title, config)
    if not BloxHub.Core.ScreenGui then
        BloxHub.Core:Initialize()
    end
    
    return BloxHub.UI.Window.new(title, config)
end

function BloxHub:GetTab(name)
    for _, window in pairs(BloxHub.State.Windows) do
        for _, tab in pairs(window.Tabs) do
            if tab.Name == name then
                return tab
            end
        end
    end
    return nil
end

function BloxHub:CreateTab(name)
    if BloxHub.State.ActiveWindow then
        return BloxHub.State.ActiveWindow:CreateTab(name)
    else
        local window = self:CreateWindow("BloxHub")
        return window:CreateTab(name)
    end
end

function BloxHub:SetTheme(theme)
    for key, value in pairs(theme) do
        if BloxHub.Settings.Theme[key] then
            BloxHub.Settings.Theme[key] = value
        end
    end
    BloxHub.Core:SaveSettings()
end

function BloxHub:GetTheme()
    return BloxHub.Settings.Theme
end

function BloxHub:SaveConfig()
    return BloxHub.Core:SaveSettings()
end

function BloxHub:LoadConfig(config)
    if config then
        BloxHub.Settings = config
        BloxHub.Core:SaveSettings()
    else
        BloxHub.Core:LoadSettings()
    end
end

-- Create example GUI (6-tile layout as mentioned in PRD)
function BloxHub:CreateExampleGUI()
    local window = self:CreateWindow("BloxHub - Example", {Resizable = true})
    
    local mainTab = window:CreateTab("Main Features")
    
    -- Example components
    mainTab:AddButton("ESP", function()
        print("ESP activated!")
    end)
    
    mainTab:AddToggle("Enable Chams", false, function(state)
        print("Chams:", state)
    end)
    
    mainTab:AddSlider("Aimbot FOV", 1, 120, 60, function(value)
        print("FOV set to:", value)
    end)
    
    mainTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key)
        print("Aimbot keybind set to:", key)
    end)
    
    mainTab:AddDropdown("Target Selection", {"Head", "Torso", "Closest"}, function(option)
        print("Target selection:", option)
    end)
    
    mainTab:AddTextBox("Player Name", "Enter username", function(text)
        print("Player name:", text)
    end)
    
    local settingsTab = window:CreateTab("Settings")
    
    settingsTab:AddLabel("UI Settings")
    settingsTab:AddToggle("Show Watermark", true, function(state)
        print("Watermark:", state)
    end)
    
    settingsTab:AddSlider("UI Transparency", 0, 1, 0, function(value)
        window.Container.Background
