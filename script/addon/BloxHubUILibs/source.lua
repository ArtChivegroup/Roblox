--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║           BloxHub GUI Framework v2.0                      ║
    ║           Universal Roblox GUI System                     ║
    ║           Author: BloxHub                                 ║
    ║           Single-File Modular Component System            ║
    ╚═══════════════════════════════════════════════════════════╝
]]

local BloxHub = {
    Version = "2.0.0",
    
    Core = {
        Initialized = false,
        ScreenGui = nil,
        MainContainer = nil
    },
    
    Elements = {},
    
    Settings = {
        Theme = {
            Background = Color3.fromRGB(15, 15, 15),
            Primary = Color3.fromRGB(25, 25, 30),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(0, 120, 255),
            AccentHover = Color3.fromRGB(0, 162, 255),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 180, 190),
            Success = Color3.fromRGB(100, 255, 100),
            Warning = Color3.fromRGB(255, 255, 100),
            Error = Color3.fromRGB(255, 100, 100)
        },
        Font = Enum.Font.Gotham,
        FontBold = Enum.Font.GothamBold,
        FontSemibold = Enum.Font.GothamSemibold,
        CornerRadius = {
            Large = 12,
            Medium = 8,
            Small = 6
        },
        Animation = {
            Speed = 0.25,
            Style = Enum.EasingStyle.Quad,
            Direction = Enum.EasingDirection.Out
        }
    },
    
    State = {
        Windows = {},
        ActiveHotkeyListener = nil,
        DraggingElement = nil,
        SavedConfigs = {}
    },
    
    Input = {
        Connections = {}
    }
}

-- ═══════════════════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════════════════
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ═══════════════════════════════════════════════════════════
-- CORE UTILITIES
-- ═══════════════════════════════════════════════════════════

local function Tween(instance, properties, duration, style, direction)
    duration = duration or BloxHub.Settings.Animation.Speed
    style = style or BloxHub.Settings.Animation.Style
    direction = direction or BloxHub.Settings.Animation.Direction
    
    local tweenInfo = TweenInfo.new(duration, style, direction)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

local function MakeDraggable(frame, dragHandle)
    local dragging = false
    local dragInput, mousePos, framePos
    
    dragHandle = dragHandle or frame
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            Tween(frame, {
                Position = UDim2.new(
                    framePos.X.Scale,
                    framePos.X.Offset + delta.X,
                    framePos.Y.Scale,
                    framePos.Y.Offset + delta.Y
                )
            }, 0.1)
        end
    end)
end

local function CreateUICorner(radius, parent)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or BloxHub.Settings.CornerRadius.Medium)
    corner.Parent = parent
    return corner
end

local function CreateUIPadding(left, right, top, bottom, parent)
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, left or 0)
    padding.PaddingRight = UDim.new(0, right or 0)
    padding.PaddingTop = UDim.new(0, top or 0)
    padding.PaddingBottom = UDim.new(0, bottom or 0)
    padding.Parent = parent
    return padding
end

local function GetKeyName(keyCode, inputType)
    if inputType == Enum.UserInputType.MouseButton1 then
        return "Mouse1"
    elseif inputType == Enum.UserInputType.MouseButton2 then
        return "Mouse2"
    elseif inputType == Enum.UserInputType.MouseButton3 then
        return "Mouse3"
    else
        return keyCode.Name:gsub("Enum.KeyCode.", "")
    end
end

-- ═══════════════════════════════════════════════════════════
-- CORE INITIALIZATION
-- ═══════════════════════════════════════════════════════════

function BloxHub:Init()
    if self.Core.Initialized then
        return self
    end
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BloxHubFramework_" .. HttpService:GenerateGUID(false)
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 999
    
    -- Parent to appropriate location
    if gethui then
        screenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(screenGui)
        screenGui.Parent = game:GetService("CoreGui")
    else
        screenGui.Parent = game:GetService("CoreGui")
    end
    
    self.Core.ScreenGui = screenGui
    self.Core.Initialized = true
    
    -- Setup input handling
    self:SetupInputHandling()
    
    -- Load saved config
    self:LoadConfig()
    
    return self
end

function BloxHub:SetupInputHandling()
    local connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        -- Handle hotkey listening mode
        if self.State.ActiveHotkeyListener then
            local keyName = GetKeyName(input.KeyCode, input.UserInputType)
            local callback = self.State.ActiveHotkeyListener.Callback
            local button = self.State.ActiveHotkeyListener.Button
            
            if button then
                button.Text = keyName
            end
            
            if callback then
                callback(input.KeyCode, input.UserInputType, keyName)
            end
            
            self.State.ActiveHotkeyListener = nil
            return
        end
        
        -- Handle registered hotkeys
        for _, window in pairs(self.State.Windows) do
            if window.Hotkeys then
                for _, hotkey in pairs(window.Hotkeys) do
                    if hotkey.Enabled and 
                       ((hotkey.KeyCode and input.KeyCode == hotkey.KeyCode) or
                        (hotkey.InputType and input.UserInputType == hotkey.InputType)) then
                        if hotkey.Callback then
                            hotkey.Callback()
                        end
                    end
                end
            end
        end
    end)
    
    table.insert(self.Input.Connections, connection)
end

-- ═══════════════════════════════════════════════════════════
-- WINDOW API
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateWindow(title, config)
    config = config or {}
    
    local window = {
        Title = title or "BloxHub Window",
        Size = config.Size or UDim2.new(0, 520, 0, 420),
        Position = config.Position or UDim2.new(0.5, -260, 0.5, -210),
        Resizable = config.Resizable or false,
        Visible = config.Visible ~= false,
        Tabs = {},
        CurrentTab = nil,
        Elements = {},
        Hotkeys = {},
        ID = HttpService:GenerateGUID(false)
    }
    
    -- Main container
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "Window_" .. window.ID
    mainFrame.Size = window.Size
    mainFrame.Position = window.Position
    mainFrame.BackgroundColor3 = self.Settings.Theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Visible = window.Visible
    mainFrame.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Large, mainFrame)
    
    -- Shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.Position = UDim2.new(0, -15, 0, -15)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ZIndex = -1
    shadow.Parent = mainFrame
    
    -- Header
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 45)
    header.BackgroundColor3 = self.Settings.Theme.Primary
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    CreateUICorner(self.Settings.CornerRadius.Large, header)
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = window.Title
    titleLabel.TextColor3 = self.Settings.Theme.Text
    titleLabel.TextSize = 18
    titleLabel.Font = self.Settings.FontBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeBtn"
    minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
    minimizeBtn.Position = UDim2.new(1, -45, 0.5, -17.5)
    minimizeBtn.BackgroundColor3 = self.Settings.Theme.Secondary
    minimizeBtn.Text = "—"
    minimizeBtn.TextColor3 = self.Settings.Theme.Text
    minimizeBtn.TextSize = 16
    minimizeBtn.Font = self.Settings.FontBold
    minimizeBtn.Parent = header
    
    CreateUICorner(self.Settings.CornerRadius.Small, minimizeBtn)
    
    minimizeBtn.MouseButton1Click:Connect(function()
        window:Toggle()
    end)
    
    minimizeBtn.MouseEnter:Connect(function()
        Tween(minimizeBtn, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
    end)
    
    minimizeBtn.MouseLeave:Connect(function()
        Tween(minimizeBtn, {BackgroundColor3 = self.Settings.Theme.Secondary}, 0.2)
    end)
    
    -- Tab container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, -20, 0, 35)
    tabContainer.Position = UDim2.new(0, 10, 0, 55)
    tabContainer.BackgroundTransparency = 1
    tabContainer.Parent = mainFrame
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Parent = tabContainer
    
    -- Content container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -20, 1, -110)
    contentContainer.Position = UDim2.new(0, 10, 0, 100)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Parent = mainFrame
    
    MakeDraggable(mainFrame, header)
    
    window.Frame = mainFrame
    window.Header = header
    window.TabContainer = tabContainer
    window.ContentContainer = contentContainer
    
    -- Window methods
    function window:Toggle()
        self.Visible = not self.Visible
        self.Frame.Visible = self.Visible
    end
    
    function window:Show()
        self.Visible = true
        self.Frame.Visible = true
    end
    
    function window:Hide()
        self.Visible = false
        self.Frame.Visible = false
    end
    
    function window:SetTitle(newTitle)
        self.Title = newTitle
        titleLabel.Text = newTitle
    end
    
    function window:CreateTab(tabName)
        return BloxHub.Elements:CreateTab(self, tabName)
    end
    
    function window:CreatePopup(title, options)
        return BloxHub.Elements:CreatePopup(self, title, options)
    end
    
    function window:RegisterHotkey(name, keyCode, callback)
        self.Hotkeys[name] = {
            KeyCode = keyCode,
            Callback = callback,
            Enabled = true
        }
    end
    
    self.State.Windows[window.ID] = window
    
    return window
end

-- ═══════════════════════════════════════════════════════════
-- ELEMENTS API
-- ═══════════════════════════════════════════════════════════

function BloxHub.Elements:CreateTab(window, tabName)
    local tab = {
        Name = tabName,
        Window = window,
        Active = false,
        Elements = {},
        Container = nil
    }
    
    -- Tab button
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = "Tab_" .. tabName
    tabBtn.Size = UDim2.new(0, 100, 1, 0)
    tabBtn.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    tabBtn.Text = tabName
    tabBtn.TextColor3 = BloxHub.Settings.Theme.Text
    tabBtn.TextSize = 14
    tabBtn.Font = BloxHub.Settings.FontSemibold
    tabBtn.AutoButtonColor = false
    tabBtn.Parent = window.TabContainer
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, tabBtn)
    
    -- Content frame
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "TabContent_" .. tabName
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ScrollBarThickness = 4
    contentFrame.ScrollBarImageColor3 = BloxHub.Settings.Theme.Accent
    contentFrame.BorderSizePixel = 0
    contentFrame.Visible = false
    contentFrame.Parent = window.ContentContainer
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = contentFrame
    
    tab.Button = tabBtn
    tab.Container = contentFrame
    
    tabBtn.MouseButton1Click:Connect(function()
        tab:Activate()
    end)
    
    tabBtn.MouseEnter:Connect(function()
        if not tab.Active then
            Tween(tabBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.2)
        end
    end)
    
    tabBtn.MouseLeave:Connect(function()
        if not tab.Active then
            Tween(tabBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.2)
        end
    end)
    
    function tab:Activate()
        for _, otherTab in pairs(self.Window.Tabs) do
            otherTab.Active = false
            otherTab.Container.Visible = false
            Tween(otherTab.Button, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.2)
        end
        
        self.Active = true
        self.Container.Visible = true
        self.Window.CurrentTab = self
        Tween(self.Button, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
    end
    
    function tab:AddButton(text, callback)
        return BloxHub.Elements:CreateButton(self, text, callback)
    end
    
    function tab:AddToggle(text, default, callback)
        return BloxHub.Elements:CreateToggle(self, text, default, callback)
    end
    
    function tab:AddSlider(text, min, max, default, callback)
        return BloxHub.Elements:CreateSlider(self, text, min, max, default, callback)
    end
    
    function tab:AddKeybind(text, defaultKey, callback)
        return BloxHub.Elements:CreateKeybind(self, text, defaultKey, callback)
    end
    
    function tab:AddDropdown(text, options, callback)
        return BloxHub.Elements:CreateDropdown(self, text, options, callback)
    end
    
    function tab:AddTextBox(text, placeholder, callback)
        return BloxHub.Elements:CreateTextBox(self, text, placeholder, callback)
    end
    
    function tab:AddLabel(text, config)
        return BloxHub.Elements:CreateLabel(self, text, config)
    end
    
    function tab:AddDivider()
        return BloxHub.Elements:CreateDivider(self)
    end
    
    table.insert(window.Tabs, tab)
    
    if #window.Tabs == 1 then
        tab:Activate()
    end
    
    return tab
end

function BloxHub.Elements:CreateButton(tab, text, callback)
    local button = Instance.new("TextButton")
    button.Name = "Button_" .. text
    button.Size = UDim2.new(1, 0, 0, 35)
    button.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    button.Text = text
    button.TextColor3 = BloxHub.Settings.Theme.Text
    button.TextSize = 14
    button.Font = BloxHub.Settings.FontSemibold
    button.AutoButtonColor = false
    button.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, button)
    
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    button.MouseEnter:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
    end)
    
    button.MouseLeave:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.2)
    end)
    
    return button
end

function BloxHub.Elements:CreateToggle(tab, text, default, callback)
    local toggleState = default or false
    
    local container = Instance.new("Frame")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local switch = Instance.new("TextButton")
    switch.Size = UDim2.new(0, 45, 0, 22)
    switch.Position = UDim2.new(1, -52, 0.5, -11)
    switch.BackgroundColor3 = toggleState and BloxHub.Settings.Theme.Accent or BloxHub.Settings.Theme.Secondary
    switch.Text = ""
    switch.AutoButtonColor = false
    switch.Parent = container
    
    CreateUICorner(999, switch)
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = toggleState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = switch
    
    CreateUICorner(999, knob)
    
    switch.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        
        Tween(switch, {
            BackgroundColor3 = toggleState and BloxHub.Settings.Theme.Accent or BloxHub.Settings.Theme.Secondary
        }, 0.2)
        
        Tween(knob, {
            Position = toggleState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        }, 0.2)
        
        if callback then
            callback(toggleState)
        end
    end)
    
    container.MouseEnter:Connect(function()
        Tween(container, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.2)
    end)
    
    container.MouseLeave:Connect(function()
        Tween(container, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.2)
    end)
    
    return {
        Container = container,
        GetValue = function() return toggleState end,
        SetValue = function(_, value)
            toggleState = value
            switch.BackgroundColor3 = toggleState and BloxHub.Settings.Theme.Accent or BloxHub.Settings.Theme.Secondary
            knob.Position = toggleState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        end
    }
end

function BloxHub.Elements:CreateSlider(tab, text, min, max, default, callback)
    local sliderValue = default or min
    
    local container = Instance.new("Frame")
    container.Name = "Slider_" .. text
    container.Size = UDim2.new(1, 0, 0, 50)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0.3, -12, 0, 20)
    valueLabel.Position = UDim2.new(0.7, 0, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(sliderValue)
    valueLabel.TextColor3 = BloxHub.Settings.Theme.Accent
    valueLabel.TextSize = 14
    valueLabel.Font = BloxHub.Settings.FontBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = container
    
    local sliderBack = Instance.new("Frame")
    sliderBack.Size = UDim2.new(1, -24, 0, 4)
    sliderBack.Position = UDim2.new(0, 12, 1, -15)
    sliderBack.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    sliderBack.BorderSizePixel = 0
    sliderBack.Parent = container
    
    CreateUICorner(999, sliderBack)
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((sliderValue - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBack
    
    CreateUICorner(999, sliderFill)
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(1, 0, 1, 0)
    sliderButton.BackgroundTransparency = 1
    sliderButton.Text = ""
    sliderButton.Parent = sliderBack
    
    local dragging = false
    
    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    sliderButton.MouseMoved:Connect(function(x)
        if dragging then
            local relativeX = math.clamp((x - sliderBack.AbsolutePosition.X) / sliderBack.AbsoluteSize.X, 0, 1)
            sliderValue = math.floor(min + (max - min) * relativeX)
            
            valueLabel.Text = tostring(sliderValue)
            Tween(sliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.1)
            
            if callback then
                callback(sliderValue)
            end
        end
    end)
    
    return {
        Container = container,
        GetValue = function() return sliderValue end,
        SetValue = function(_, value)
            sliderValue = math.clamp(value, min, max)
            valueLabel.Text = tostring(sliderValue)
            sliderFill.Size = UDim2.new((sliderValue - min) / (max - min), 0, 1, 0)
        end
    }
end

function BloxHub.Elements:CreateKeybind(tab, text, defaultKey, callback)
    local currentKey = defaultKey
    local currentInputType = nil
    
    local container = Instance.new("Frame")
    container.Name = "Keybind_" .. text
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local keyButton = Instance.new("TextButton")
    keyButton.Size = UDim2.new(0.4, -12, 0, 28)
    keyButton.Position = UDim2.new(0.6, 0, 0.5, -14)
    keyButton.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    keyButton.Text = GetKeyName(currentKey, currentInputType)
    keyButton.TextColor3 = BloxHub.Settings.Theme.Text
    keyButton.TextSize = 12
    keyButton.Font = BloxHub.Settings.FontSemibold
    keyButton.AutoButtonColor = false
    keyButton.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, keyButton)
    
    keyButton.MouseButton1Click:Connect(function()
        keyButton.Text = "..."
        BloxHub.State.ActiveHotkeyListener = {
            Button = keyButton,
            Callback = function(keyCode, inputType, keyName)
                currentKey = keyCode
                currentInputType = inputType
                if callback then
                    callback(keyCode, inputType, keyName)
                end
            end
        }
    end)
    
    keyButton.MouseEnter:Connect(function()
        Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
    end)
    
    keyButton.MouseLeave:Connect(function()
        Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.2)
    end)
    
    return {
        Container = container,
        GetKey = function() return currentKey, currentInputType end,
        SetKey = function(_, keyCode, inputType)
            currentKey = keyCode
            currentInputType = inputType
            keyButton.Text = GetKeyName(keyCode, inputType)
        end
    }
end

function BloxHub.Elements:CreateDropdown(tab, text, options, callback)
    local selectedOption = options[1] or "None"
    local expanded = false
    
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Size = UDim2.new(0.5, -12, 0, 28)
    dropdownBtn.Position = UDim2.new(0.5, 0, 0.5, -14)
    dropdownBtn.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    dropdownBtn.Text = selectedOption .. " ▼"
    dropdownBtn.TextColor3 = BloxHub.Settings.Theme.Text
    dropdownBtn.TextSize = 12
    dropdownBtn.Font = BloxHub.Settings.FontSemibold
    dropdownBtn.AutoButtonColor = false
    dropdownBtn.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, dropdownBtn)
    
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(0.5, -12, 0, #options * 30)
    optionsFrame.Position = UDim2.new(0.5, 0, 1, 5)
    optionsFrame.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    optionsFrame.BorderSizePixel = 0
    optionsFrame.Visible = false
    optionsFrame.ZIndex = 10
    optionsFrame.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, optionsFrame)
    
    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.Parent = optionsFrame
    
    for _, option in ipairs(options) do
        local optionBtn = Instance.new("TextButton")
        optionBtn.Size = UDim2.new(1, -4, 0, 28)
        optionBtn.Position = UDim2.new(0, 2, 0, 0)
        optionBtn.BackgroundColor3 = BloxHub.Settings.Theme.Primary
        optionBtn.Text = option
        optionBtn.TextColor3 = BloxHub.Settings.Theme.Text
        optionBtn.TextSize = 12
        optionBtn.Font = BloxHub.Settings.Font
        optionBtn.AutoButtonColor = false
        optionBtn.Parent = optionsFrame
        
        CreateUICorner(BloxHub.Settings.CornerRadius.Small, optionBtn)
        
        optionBtn.MouseButton1Click:Connect(function()
            selectedOption = option
            dropdownBtn.Text = option .. " ▼"
            expanded = false
            optionsFrame.Visible = false
            
            if callback then
                callback(option)
            end
        end)
        
        optionBtn.MouseEnter:Connect(function()
            Tween(optionBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.15)
        end)
        
        optionBtn.MouseLeave:Connect(function()
            Tween(optionBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.15)
        end)
    end
    
    dropdownBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        optionsFrame.Visible = expanded
        
        if expanded then
            Tween(container, {Size = UDim2.new(1, 0, 0, 35 + optionsFrame.Size.Y.Offset + 5)}, 0.2)
        else
            Tween(container, {Size = UDim2.new(1, 0, 0, 35)}, 0.2)
        end
    end)
    
    return {
        Container = container,
        GetValue = function() return selectedOption end,
        SetValue = function(_, value)
            if table.find(options, value) then
                selectedOption = value
                dropdownBtn.Text = value .. " ▼"
            end
        end
    }
end

function BloxHub.Elements:CreateTextBox(tab, text, placeholder, callback)
    local container = Instance.new("Frame")
    container.Name = "TextBox_" .. text
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.65, -12, 0, 28)
    textBox.Position = UDim2.new(0.35, 0, 0.5, -14)
    textBox.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    textBox.PlaceholderText = placeholder or "Enter text..."
    textBox.Text = ""
    textBox.TextColor3 = BloxHub.Settings.Theme.Text
    textBox.PlaceholderColor3 = BloxHub.Settings.Theme.TextDim
    textBox.TextSize = 12
    textBox.Font = BloxHub.Settings.Font
    textBox.ClearTextOnFocus = false
    textBox.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, textBox)
    CreateUIPadding(8, 8, 0, 0, textBox)
    
    textBox.FocusLost:Connect(function(enterPressed)
        if callback then
            callback(textBox.Text, enterPressed)
        end
    end)
    
    return {
        Container = container,
        GetValue = function() return textBox.Text end,
        SetValue = function(_, value)
            textBox.Text = value
        end
    }
end

function BloxHub.Elements:CreateLabel(tab, text, config)
    config = config or {}
    
    local label = Instance.new("TextLabel")
    label.Name = "Label_" .. text
    label.Size = UDim2.new(1, 0, 0, config.Height or 25)
    label.BackgroundTransparency = config.Background and 0 or 1
    label.BackgroundColor3 = config.BackgroundColor or BloxHub.Settings.Theme.Primary
    label.Text = text
    label.TextColor3 = config.TextColor or BloxHub.Settings.Theme.Text
    label.TextSize = config.TextSize or 14
    label.Font = config.Bold and BloxHub.Settings.FontBold or BloxHub.Settings.Font
    label.TextXAlignment = config.TextXAlignment or Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = tab.Container
    
    if not config.Background then
        CreateUICorner(BloxHub.Settings.CornerRadius.Small, label)
    end
    
    if config.Background then
        CreateUIPadding(12, 12, 5, 5, label)
    end
    
    return label
end

function BloxHub.Elements:CreateDivider(tab)
    local divider = Instance.new("Frame")
    divider.Name = "Divider"
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    divider.BorderSizePixel = 0
    divider.Parent = tab.Container
    
    return divider
end

function BloxHub.Elements:CreatePopup(window, title, options)
    local popup = {
        Title = title,
        Options = options or {},
        Visible = false
    }
    
    local overlay = Instance.new("Frame")
    overlay.Name = "PopupOverlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.5
    overlay.BorderSizePixel = 0
    overlay.Visible = false
    overlay.ZIndex = 100
    overlay.Parent = BloxHub.Core.ScreenGui
    
    local popupFrame = Instance.new("Frame")
    popupFrame.Name = "Popup_" .. title
    popupFrame.Size = UDim2.new(0, 300, 0, 200)
    popupFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    popupFrame.BackgroundColor3 = BloxHub.Settings.Theme.Background
    popupFrame.BorderSizePixel = 0
    popupFrame.ZIndex = 101
    popupFrame.Parent = overlay
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Large, popupFrame)
    
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    header.BorderSizePixel = 0
    header.ZIndex = 102
    header.Parent = popupFrame
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Large, header)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = BloxHub.Settings.Theme.Text
    titleLabel.TextSize = 16
    titleLabel.Font = BloxHub.Settings.FontBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = header
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
    closeBtn.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    closeBtn.Text = "×"
    closeBtn.TextColor3 = BloxHub.Settings.Theme.Text
    closeBtn.TextSize = 20
    closeBtn.Font = BloxHub.Settings.FontBold
    closeBtn.ZIndex = 102
    closeBtn.Parent = header
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, closeBtn)
    
    closeBtn.MouseButton1Click:Connect(function()
        popup:Hide()
    end)
    
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ScrollBarThickness = 4
    contentFrame.ScrollBarImageColor3 = BloxHub.Settings.Theme.Accent
    contentFrame.BorderSizePixel = 0
    contentFrame.ZIndex = 102
    contentFrame.Parent = popupFrame
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = contentFrame
    
    popup.Overlay = overlay
    popup.Frame = popupFrame
    popup.Content = contentFrame
    
    function popup:Show()
        self.Visible = true
        self.Overlay.Visible = true
    end
    
    function popup:Hide()
        self.Visible = false
        self.Overlay.Visible = false
    end
    
    function popup:AddButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.BackgroundColor3 = BloxHub.Settings.Theme.Primary
        btn.Text = text
        btn.TextColor3 = BloxHub.Settings.Theme.Text
        btn.TextSize = 14
        btn.Font = BloxHub.Settings.FontSemibold
        btn.AutoButtonColor = false
        btn.ZIndex = 102
        btn.Parent = self.Content
        
        CreateUICorner(BloxHub.Settings.CornerRadius.Small, btn)
        
        btn.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)
        
        btn.MouseEnter:Connect(function()
            Tween(btn, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
        end)
        
        btn.MouseLeave:Connect(function()
            Tween(btn, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.2)
        end)
        
        return btn
    end
    
    function popup:AddLabel(text)
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 25)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = BloxHub.Settings.Theme.Text
        lbl.TextSize = 13
        lbl.Font = BloxHub.Settings.Font
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextWrapped = true
        lbl.ZIndex = 102
        lbl.Parent = self.Content
        
        return lbl
    end
    
    return popup
end

-- ═══════════════════════════════════════════════════════════
-- LAYOUT UTILITIES
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateGrid(parent, columns, cellSize, padding)
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellSize = cellSize or UDim2.new(0, 140, 0, 100)
    gridLayout.CellPadding = padding or UDim2.new(0, 10, 0, 10)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = parent
    
    return gridLayout
end

function BloxHub:CreateVerticalStack(parent, padding)
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, padding or 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = parent
    
    return listLayout
end

function BloxHub:CreateHorizontalStack(parent, padding)
    local listLayout = Instance.new("UIListLayout")
    listLayout.FillDirection = Enum.FillDirection.Horizontal
    listLayout.Padding = UDim.new(0, padding or 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = parent
    
    return listLayout
end

-- ═══════════════════════════════════════════════════════════
-- THEME & CUSTOMIZATION
-- ═══════════════════════════════════════════════════════════

function BloxHub:SetTheme(themeName)
    local themes = {
        Dark = {
            Background = Color3.fromRGB(15, 15, 15),
            Primary = Color3.fromRGB(25, 25, 30),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(0, 120, 255),
            AccentHover = Color3.fromRGB(0, 162, 255),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 180, 190)
        },
        Light = {
            Background = Color3.fromRGB(240, 240, 245),
            Primary = Color3.fromRGB(255, 255, 255),
            Secondary = Color3.fromRGB(230, 230, 240),
            Accent = Color3.fromRGB(0, 120, 255),
            AccentHover = Color3.fromRGB(0, 162, 255),
            Text = Color3.fromRGB(20, 20, 30),
            TextDim = Color3.fromRGB(100, 100, 110)
        },
        Purple = {
            Background = Color3.fromRGB(20, 15, 30),
            Primary = Color3.fromRGB(30, 25, 45),
            Secondary = Color3.fromRGB(45, 35, 60),
            Accent = Color3.fromRGB(138, 43, 226),
            AccentHover = Color3.fromRGB(158, 63, 246),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 170, 200)
        },
        Green = {
            Background = Color3.fromRGB(10, 20, 15),
            Primary = Color3.fromRGB(20, 30, 25),
            Secondary = Color3.fromRGB(30, 45, 35),
            Accent = Color3.fromRGB(46, 204, 113),
            AccentHover = Color3.fromRGB(66, 224, 133),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(170, 200, 180)
        }
    }
    
    local selectedTheme = themes[themeName] or themes.Dark
    
    for key, value in pairs(selectedTheme) do
        self.Settings.Theme[key] = value
    end
    
    -- Update all existing windows
    for _, window in pairs(self.State.Windows) do
        if window.Frame then
            window.Frame.BackgroundColor3 = self.Settings.Theme.Background
            window.Header.BackgroundColor3 = self.Settings.Theme.Primary
        end
    end
end

function BloxHub:CustomizeTheme(customColors)
    for key, value in pairs(customColors) do
        if self.Settings.Theme[key] then
            self.Settings.Theme[key] = value
        end
    end
end

-- ═══════════════════════════════════════════════════════════
-- CONFIG PERSISTENCE
-- ═══════════════════════════════════════════════════════════

function BloxHub:SaveConfig(configName)
    configName = configName or "default"
    
    local config = {
        Theme = self.Settings.Theme,
        Windows = {}
    }
    
    for id, window in pairs(self.State.Windows) do
        config.Windows[id] = {
            Title = window.Title,
            Position = window.Frame.Position,
            Size = window.Frame.Size,
            Visible = window.Visible,
            Hotkeys = window.Hotkeys
        }
    end
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(config)
    end)
    
    if success then
        if writefile then
            writefile("BloxHub_" .. configName .. ".json", encoded)
        end
        self.State.SavedConfigs[configName] = config
    end
    
    return success
end

function BloxHub:LoadConfig(configName)
    configName = configName or "default"
    
    local config = nil
    
    if readfile and isfile and isfile("BloxHub_" .. configName .. ".json") then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile("BloxHub_" .. configName .. ".json"))
        end)
        
        if success then
            config = result
        end
    end
    
    if not config and self.State.SavedConfigs[configName] then
        config = self.State.SavedConfigs[configName]
    end
    
    if config and config.Theme then
        for key, value in pairs(config.Theme) do
            self.Settings.Theme[key] = value
        end
    end
    
    return config
end

-- ═══════════════════════════════════════════════════════════
-- FLOATING ICON TOGGLE
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateFloatingIcon(window, config)
    config = config or {}
    
    local icon = Instance.new("TextButton")
    icon.Name = "FloatingIcon"
    icon.Size = config.Size or UDim2.new(0, 100, 0, 40)
    icon.Position = config.Position or UDim2.new(0.5, -50, 0.05, 0)
    icon.BackgroundColor3 = self.Settings.Theme.Accent
    icon.Text = config.Text or "🧩 " .. window.Title
    icon.TextColor3 = self.Settings.Theme.Text
    icon.TextSize = 14
    icon.Font = self.Settings.FontBold
    icon.Visible = false
    icon.ZIndex = 200
    icon.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Medium, icon)
    
    icon.MouseButton1Click:Connect(function()
        window:Toggle()
        icon.Visible = not window.Visible
    end)
    
    icon.MouseEnter:Connect(function()
        Tween(icon, {BackgroundColor3 = self.Settings.Theme.AccentHover}, 0.2)
    end)
    
    icon.MouseLeave:Connect(function()
        Tween(icon, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
    end)
    
    MakeDraggable(icon)
    
    window.FloatingIcon = icon
    
    -- Add minimize functionality to window
    local originalToggle = window.Toggle
    window.Toggle = function(self)
        originalToggle(self)
        if icon and config.ShowOnMinimize then
            icon.Visible = not self.Visible
        end
    end
    
    return icon
end

-- ═══════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════

function BloxHub:Notify(title, message, duration, notifType)
    duration = duration or 3
    notifType = notifType or "Info"
    
    local notifColors = {
        Info = self.Settings.Theme.Accent,
        Success = self.Settings.Theme.Success,
        Warning = self.Settings.Theme.Warning,
        Error = self.Settings.Theme.Error
    }
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 300, 0, 80)
    notification.Position = UDim2.new(1, -320, 1, 20)
    notification.BackgroundColor3 = self.Settings.Theme.Primary
    notification.BorderSizePixel = 0
    notification.ZIndex = 300
    notification.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Medium, notification)
    
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.BackgroundColor3 = notifColors[notifType]
    accent.BorderSizePixel = 0
    accent.Parent = notification
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 15, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = self.Settings.Theme.Text
    titleLabel.TextSize = 15
    titleLabel.Font = self.Settings.FontBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 1, -35)
    messageLabel.Position = UDim2.new(0, 15, 0, 33)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = self.Settings.Theme.TextDim
    messageLabel.TextSize = 13
    messageLabel.Font = self.Settings.Font
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextWrapped = true
    messageLabel.Parent = notification
    
    -- Slide in animation
    Tween(notification, {Position = UDim2.new(1, -320, 1, -100)}, 0.4, Enum.EasingStyle.Back)
    
    -- Auto remove after duration
    task.delay(duration, function()
        Tween(notification, {Position = UDim2.new(1, -320, 1, 20)}, 0.3)
        task.wait(0.3)
        notification:Destroy()
    end)
    
    return notification
end

-- ═══════════════════════════════════════════════════════════
-- CLEANUP
-- ═══════════════════════════════════════════════════════════

function BloxHub:Destroy()
    for _, connection in pairs(self.Input.Connections) do
        connection:Disconnect()
    end
    
    if self.Core.ScreenGui then
        self.Core.ScreenGui:Destroy()
    end
    
    self.State.Windows = {}
    self.Core.Initialized = false
end

-- ═══════════════════════════════════════════════════════════
-- EXAMPLE USAGE & DEFAULT DEMO
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateExampleGUI()
    -- Create main window
    local mainWindow = self:CreateWindow("BloxHub Framework", {
        Size = UDim2.new(0, 520, 0, 420),
        Visible = true
    })
    
    -- Create tabs
    local featuresTab = mainWindow:CreateTab("Features")
    local visualsTab = mainWindow:CreateTab("Visuals")
    local settingsTab = mainWindow:CreateTab("Settings")
    
    -- Features Tab
    featuresTab:AddLabel("Combat Features", {Bold = true, Height = 30})
    featuresTab:AddToggle("Enable Aimbot", false, function(state)
        print("Aimbot:", state)
    end)
    featuresTab:AddSlider("Aimbot FOV", 1, 100, 60, function(value)
        print("FOV:", value)
    end)
    featuresTab:AddKeybind("Aimbot Hotkey", Enum.KeyCode.E, function(key, inputType, name)
        print("Aimbot key set to:", name)
    end)
    
    featuresTab:AddDivider()
    featuresTab:AddLabel("Movement", {Bold = true, Height = 30})
    featuresTab:AddToggle("Speed Hack", false, function(state)
        print("Speed:", state)
    end)
    featuresTab:AddSlider("Speed Multiplier", 1, 5, 2, function(value)
        print("Speed Multiplier:", value)
    end)
    
    -- Visuals Tab
    visualsTab:AddLabel("ESP Settings", {Bold = true, Height = 30})
    visualsTab:AddToggle("Enable ESP", false, function(state)
        print("ESP:", state)
    end)
    visualsTab:AddToggle("Show Names", true, function(state)
        print("Show Names:", state)
    end)
    visualsTab:AddToggle("Show Distance", true, function(state)
        print("Show Distance:", state)
    end)
    visualsTab:AddDropdown("ESP Type", {"Box", "Outline", "Filled", "3D"}, function(option)
        print("ESP Type:", option)
    end)
    
    visualsTab:AddDivider()
    visualsTab:AddLabel("Chams", {Bold = true, Height = 30})
    visualsTab:AddToggle("Enable Chams", false, function(state)
        print("Chams:", state)
    end)
    
    -- Settings Tab
    settingsTab:AddLabel("UI Settings", {Bold = true, Height = 30})
    settingsTab:AddDropdown("Theme", {"Dark", "Light", "Purple", "Green"}, function(theme)
        BloxHub:SetTheme(theme)
    end)
    settingsTab:AddButton("Save Config", function()
        BloxHub:SaveConfig("default")
        BloxHub:Notify("Config Saved", "Your configuration has been saved successfully!", 3, "Success")
    end)
    settingsTab:AddButton("Load Config", function()
        BloxHub:LoadConfig("default")
        BloxHub:Notify("Config Loaded", "Configuration loaded from file!", 3, "Info")
    end)
    
    settingsTab:AddDivider()
    settingsTab:AddLabel("About", {Bold = true, Height = 30})
    settingsTab:AddLabel("BloxHub Framework v" .. self.Version)
    settingsTab:AddLabel("Universal Roblox GUI System")
    settingsTab:AddTextBox("Custom Script", "Paste script here...", function(text, enterPressed)
        if enterPressed then
            print("Executing:", text)
        end
    end)
    
    -- Create floating icon
    self:CreateFloatingIcon(mainWindow, {
        Text = "🧩 BloxHub",
        ShowOnMinimize = true
    })
    
    -- Register toggle hotkey
    mainWindow:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
        mainWindow:Toggle()
    end)
    
    return mainWindow
end

-- ═══════════════════════════════════════════════════════════
-- INITIALIZATION & RETURN
-- ═══════════════════════════════════════════════════════════

-- Auto-initialize
BloxHub:Init()

-- Show welcome notification
BloxHub:Notify(
    "BloxHub Framework Loaded",
    "Press RightShift to toggle GUI | Version " .. BloxHub.Version,
    4,
    "Success"
)

-- Create example GUI (comment this out in production)
BloxHub:CreateExampleGUI()

-- Return framework for external use
return BloxHub
