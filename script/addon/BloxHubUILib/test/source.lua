--[[ 1
    ╔═══════════════════════════════════════════════════════════╗
    ║           BloxHub GUI Framework v3.0                      ║
    ║           Universal Roblox GUI System                     ║
    ║           Author: BloxHub                                 ║
    ║           Pure Roblox Engine UI Components                ║
    ║           Cross-Device Compatible (PC/Mobile/Console)     ║
    ╚═══════════════════════════════════════════════════════════╝
]]

local BloxHub = {
    Version = "3.0.0",
    
    Core = {
        Initialized = false,
        ScreenGui = nil,
        MainContainer = nil,
        UIScale = nil
    },
    
    Elements = {},
    
    Settings = {
        Theme = {
            Background = Color3.fromRGB(12, 12, 16),
            BackgroundGradient = Color3.fromRGB(18, 18, 24),
            Primary = Color3.fromRGB(22, 22, 28),
            PrimaryGradient = Color3.fromRGB(28, 28, 36),
            Secondary = Color3.fromRGB(32, 32, 42),
            SecondaryGradient = Color3.fromRGB(42, 42, 54),
            Accent = Color3.fromRGB(88, 101, 242),
            AccentGradient = Color3.fromRGB(108, 121, 255),
            AccentHover = Color3.fromRGB(118, 131, 255),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(148, 155, 164),
            Success = Color3.fromRGB(87, 242, 135),
            Warning = Color3.fromRGB(254, 231, 92),
            Error = Color3.fromRGB(237, 66, 69),
            Border = Color3.fromRGB(48, 48, 58),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Font = Enum.Font.GothamMedium,
        FontBold = Enum.Font.GothamBold,
        FontSemibold = Enum.Font.GothamSemibold,
        CornerRadius = {
            Large = 12,
            Medium = 8,
            Small = 6,
            XSmall = 4
        },
        Animation = {
            Speed = 0.2,
            FastSpeed = 0.1,
            Style = Enum.EasingStyle.Quint,
            Direction = Enum.EasingDirection.Out
        },
        UI = {
            StrokeEnabled = true,
            GradientEnabled = true,
            ShadowEnabled = true,
            ResponsiveScale = true
        }
    },
    
    State = {
        Windows = {},
        ActiveHotkeyListener = nil,
        DraggingElement = nil,
        SavedConfigs = {},
        Notifications = {}
    },
    
    Input = {
        Connections = {}
    },
    
    Device = {
        IsMobile = false,
        IsTablet = false,
        IsConsole = false,
        IsDesktop = true,
        TouchEnabled = false
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
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ═══════════════════════════════════════════════════════════
-- DEVICE DETECTION
-- ═══════════════════════════════════════════════════════════
local function DetectDevice()
    local touchEnabled = UserInputService.TouchEnabled
    local keyboardEnabled = UserInputService.KeyboardEnabled
    local gamepadEnabled = UserInputService.GamepadEnabled
    local mouseEnabled = UserInputService.MouseEnabled
    
    BloxHub.Device.TouchEnabled = touchEnabled
    BloxHub.Device.IsMobile = touchEnabled and not keyboardEnabled and not mouseEnabled
    BloxHub.Device.IsTablet = touchEnabled and (keyboardEnabled or mouseEnabled)
    BloxHub.Device.IsConsole = gamepadEnabled and not keyboardEnabled and not mouseEnabled
    BloxHub.Device.IsDesktop = keyboardEnabled and mouseEnabled and not touchEnabled
end
DetectDevice()

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
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
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

-- ═══════════════════════════════════════════════════════════
-- MODERN UI COMPONENTS (Roblox Engine Native)
-- ═══════════════════════════════════════════════════════════

local function CreateUIStroke(parent, color, thickness, transparency)
    if not BloxHub.Settings.UI.StrokeEnabled then return nil end
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or BloxHub.Settings.Theme.Border
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0.5
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Parent = parent
    return stroke
end

local function CreateUIGradient(parent, color1, color2, rotation)
    if not BloxHub.Settings.UI.GradientEnabled then return nil end
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1 or Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, color2 or Color3.fromRGB(220, 220, 220))
    })
    gradient.Rotation = rotation or 90
    gradient.Parent = parent
    return gradient
end

local function CreateShadow(parent, offset, transparency)
    if not BloxHub.Settings.UI.ShadowEnabled then return nil end
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 8, 1, 8)
    shadow.Position = UDim2.new(0, -4, 0, offset or 4)
    shadow.BackgroundColor3 = BloxHub.Settings.Theme.Shadow
    shadow.BackgroundTransparency = transparency or 0.6
    shadow.BorderSizePixel = 0
    shadow.ZIndex = parent.ZIndex - 1
    CreateUICorner(BloxHub.Settings.CornerRadius.Large + 2, shadow)
    shadow.Parent = parent.Parent
    return shadow
end

local function CreateAccentLine(parent, position)
    local line = Instance.new("Frame")
    line.Name = "AccentLine"
    line.Size = UDim2.new(1, 0, 0, 2)
    line.Position = position or UDim2.new(0, 0, 0, 0)
    line.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    line.BorderSizePixel = 0
    line.Parent = parent
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, BloxHub.Settings.Theme.Accent),
        ColorSequenceKeypoint.new(0.5, BloxHub.Settings.Theme.AccentGradient),
        ColorSequenceKeypoint.new(1, BloxHub.Settings.Theme.Accent)
    })
    gradient.Rotation = 0
    gradient.Parent = line
    
    return line
end

local function GetAdaptiveSize(baseWidth, baseHeight)
    if BloxHub.Device.IsMobile then
        local viewportSize = Camera.ViewportSize
        return UDim2.new(0.95, 0, 0, math.min(baseHeight * 1.1, viewportSize.Y * 0.85))
    elseif BloxHub.Device.IsTablet then
        return UDim2.new(0, baseWidth * 1.15, 0, baseHeight * 1.1)
    else
        return UDim2.new(0, baseWidth, 0, baseHeight)
    end
end

local function GetMousePosition()
    return UserInputService:GetMouseLocation()
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
    
    -- Calculate adaptive size based on device
    local baseWidth = config.Size and config.Size.X.Offset or 550
    local baseHeight = config.Size and config.Size.Y.Offset or 450
    local adaptiveSize = GetAdaptiveSize(baseWidth, baseHeight)
    
    local window = {
        Title = title or "BloxHub Window",
        Size = adaptiveSize,
        Position = config.Position or UDim2.new(0.5, 0, 0.5, 0),
        Resizable = config.Resizable or false,
        Visible = config.Visible ~= false,
        Tabs = {},
        CurrentTab = nil,
        Elements = {},
        Hotkeys = {},
        ID = HttpService:GenerateGUID(false)
    }
    
    -- Main container with AnchorPoint centering
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "Window_" .. window.ID
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Size = window.Size
    mainFrame.Position = window.Position
    mainFrame.BackgroundColor3 = self.Settings.Theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Visible = window.Visible
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Large, mainFrame)
    CreateUIStroke(mainFrame, self.Settings.Theme.Border, 1, 0.6)
    
    -- Background gradient
    local bgGradient = Instance.new("UIGradient")
    bgGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, self.Settings.Theme.Background),
        ColorSequenceKeypoint.new(1, self.Settings.Theme.BackgroundGradient)
    })
    bgGradient.Rotation = 135
    bgGradient.Parent = mainFrame
    
    -- Modern shadow (using Frame instead of placeholder image)
    local shadowFrame = Instance.new("Frame")
    shadowFrame.Name = "Shadow"
    shadowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    shadowFrame.Size = UDim2.new(1, 16, 1, 16)
    shadowFrame.Position = UDim2.new(0.5, 0, 0.5, 6)
    shadowFrame.BackgroundColor3 = self.Settings.Theme.Shadow
    shadowFrame.BackgroundTransparency = 0.5
    shadowFrame.BorderSizePixel = 0
    shadowFrame.ZIndex = -1
    CreateUICorner(self.Settings.CornerRadius.Large + 4, shadowFrame)
    shadowFrame.Parent = self.Core.ScreenGui
    
    -- Header with gradient
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 44)
    header.BackgroundColor3 = self.Settings.Theme.Background
    header.BackgroundTransparency = 1
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    -- Logo Shape (Accent Square)
    local logoContainer = Instance.new("Frame")
    logoContainer.Name = "Logo"
    logoContainer.Size = UDim2.new(0, 24, 0, 24)
    logoContainer.Position = UDim2.new(0, 14, 0.5, -12)
    logoContainer.BackgroundColor3 = self.Settings.Theme.AccentGradient
    logoContainer.BorderSizePixel = 0
    logoContainer.Parent = header
    CreateUICorner(6, logoContainer)
    
    local logoDot = Instance.new("Frame")
    logoDot.Size = UDim2.new(0, 8, 0, 8)
    logoDot.Position = UDim2.new(0.5, -4, 0.5, -4)
    logoDot.BackgroundColor3 = Color3.new(1,1,1)
    logoDot.BackgroundTransparency = 0.2
    logoDot.BorderSizePixel = 0
    logoDot.Parent = logoContainer
    CreateUICorner(4, logoDot)
    
    -- Accent Line (Bottom of Header)
    CreateAccentLine(header, UDim2.new(0, 0, 1, -1))
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -90, 1, 0)
    titleLabel.Position = UDim2.new(0, 48, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = window.Title
    titleLabel.TextColor3 = self.Settings.Theme.Text
    titleLabel.TextSize = BloxHub.Device.IsMobile and 16 or 17
    titleLabel.Font = self.Settings.FontBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    -- Minimize Button (Clean Shape)
    local btnSize = BloxHub.Device.IsMobile and 32 or 28
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "Minimize"
    minimizeBtn.Size = UDim2.new(0, btnSize, 0, btnSize)
    minimizeBtn.Position = UDim2.new(1, -btnSize - 12, 0.5, -btnSize/2)
    minimizeBtn.BackgroundColor3 = self.Settings.Theme.Secondary
    minimizeBtn.BackgroundTransparency = 0.5
    minimizeBtn.Text = ""
    minimizeBtn.AutoButtonColor = false
    minimizeBtn.Parent = header
    
    CreateUICorner(8, minimizeBtn)
    local minStroke = CreateUIStroke(minimizeBtn, self.Settings.Theme.Border, 1, 0.5)

    -- Minimize Icon (Line)
    local minIcon = Instance.new("Frame")
    minIcon.Size = UDim2.new(0, 12, 0, 2)
    minIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    minIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    minIcon.BackgroundColor3 = self.Settings.Theme.TextDim
    minIcon.BorderSizePixel = 0
    minIcon.Parent = minimizeBtn
    CreateUICorner(2, minIcon)
    
    minimizeBtn.MouseButton1Click:Connect(function()
        window:Toggle()
    end)
    
    minimizeBtn.MouseEnter:Connect(function()
        Tween(minimizeBtn, {BackgroundColor3 = self.Settings.Theme.Accent, BackgroundTransparency = 0}, 0.2)
        Tween(minIcon, {BackgroundColor3 = self.Settings.Theme.Text}, 0.2)
        if minStroke then minStroke.Transparency = 1 end
    end)
    
    minimizeBtn.MouseLeave:Connect(function()
        Tween(minimizeBtn, {BackgroundColor3 = self.Settings.Theme.Secondary, BackgroundTransparency = 0.5}, 0.2)
        Tween(minIcon, {BackgroundColor3 = self.Settings.Theme.TextDim}, 0.2)
        if minStroke then minStroke.Transparency = 0.5 end
    end)
    
    -- Tab container (adjusted for new header height)
    local tabContainer = Instance.new("ScrollingFrame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, -24, 0, 40)
    tabContainer.Position = UDim2.new(0, 12, 0, 58)
    tabContainer.BackgroundTransparency = 1
    tabContainer.ScrollBarThickness = 0
    tabContainer.ScrollingDirection = Enum.ScrollingDirection.X
    tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContainer.AutomaticCanvasSize = Enum.AutomaticSize.X
    tabContainer.Parent = mainFrame
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tabLayout.Parent = tabContainer
    
    -- Content container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -24, 1, -115)
    contentContainer.Position = UDim2.new(0, 12, 0, 105)
    contentContainer.BackgroundColor3 = self.Settings.Theme.Primary
    contentContainer.BackgroundTransparency = 0.3
    contentContainer.BorderSizePixel = 0
    contentContainer.Parent = mainFrame
    
    CreateUICorner(self.Settings.CornerRadius.Medium, contentContainer)
    CreateUIStroke(contentContainer, self.Settings.Theme.Border, 1, 0.8)
    
    MakeDraggable(mainFrame, header)
    
    window.Frame = mainFrame
    window.Header = header
    window.Shadow = shadowFrame
    window.TabContainer = tabContainer
    window.ContentContainer = contentContainer
    
    -- Window methods
    function window:Toggle()
        self.Visible = not self.Visible
        self.Frame.Visible = self.Visible
        if self.Shadow then
            self.Shadow.Visible = self.Visible
        end
    end
    
    function window:Show()
        self.Visible = true
        self.Frame.Visible = true
        if self.Shadow then self.Shadow.Visible = true end
    end
    
    function window:Hide()
        self.Visible = false
        self.Frame.Visible = false
        if self.Shadow then self.Shadow.Visible = false end
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
    
    -- Tab button with modern styling
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = "Tab_" .. tabName
    tabBtn.Size = UDim2.new(0, BloxHub.Device.IsMobile and 90 or 110, 0, 32)
    tabBtn.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    tabBtn.Text = tabName
    tabBtn.TextColor3 = BloxHub.Settings.Theme.TextDim
    tabBtn.TextSize = BloxHub.Device.IsMobile and 12 or 13
    tabBtn.Font = BloxHub.Settings.FontSemibold
    tabBtn.AutoButtonColor = false
    tabBtn.Parent = window.TabContainer
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, tabBtn)
    local tabStroke = CreateUIStroke(tabBtn, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    -- Active indicator bar (hidden by default)
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0.6, 0, 0, 2)
    indicator.Position = UDim2.new(0.2, 0, 1, -4)
    indicator.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    CreateUICorner(2, indicator)
    indicator.Parent = tabBtn
    
    -- Content frame with padding
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "TabContent_" .. tabName
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ScrollBarThickness = 3
    contentFrame.ScrollBarImageColor3 = BloxHub.Settings.Theme.Accent
    contentFrame.ScrollBarImageTransparency = 0.3
    contentFrame.BorderSizePixel = 0
    contentFrame.Visible = false
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    contentFrame.Parent = window.ContentContainer
    
    CreateUIPadding(8, 8, 8, 8, contentFrame)
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 6)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = contentFrame
    
    tab.Button = tabBtn
    tab.Indicator = indicator
    tab.Container = contentFrame
    
    tabBtn.MouseButton1Click:Connect(function()
        tab:Activate()
    end)
    
    tabBtn.MouseEnter:Connect(function()
        if not tab.Active then
            Tween(tabBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.15)
        end
    end)
    
    tabBtn.MouseLeave:Connect(function()
        if not tab.Active then
            Tween(tabBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.15)
        end
    end)
    
    function tab:Activate()
        for _, otherTab in pairs(self.Window.Tabs) do
            otherTab.Active = false
            otherTab.Container.Visible = false
            otherTab.Indicator.Visible = false
            Tween(otherTab.Button, {
                BackgroundColor3 = BloxHub.Settings.Theme.Secondary,
                TextColor3 = BloxHub.Settings.Theme.TextDim
            }, 0.15)
        end
        
        self.Active = true
        self.Container.Visible = true
        self.Indicator.Visible = true
        self.Window.CurrentTab = self
        Tween(self.Button, {
            BackgroundColor3 = BloxHub.Settings.Theme.Accent,
            TextColor3 = BloxHub.Settings.Theme.Text
        }, 0.15)
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
    button.Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 42 or 38)
    button.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    button.Text = text
    button.TextColor3 = BloxHub.Settings.Theme.Text
    button.TextSize = BloxHub.Device.IsMobile and 13 or 14
    button.Font = BloxHub.Settings.FontSemibold
    button.AutoButtonColor = false
    button.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, button)
    CreateUIStroke(button, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    button.MouseButton1Click:Connect(function()
        -- Click animation
        Tween(button, {Size = UDim2.new(1, -4, 0, BloxHub.Device.IsMobile and 40 or 36)}, 0.05)
        task.delay(0.05, function()
            Tween(button, {Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 42 or 38)}, 0.1)
        end)
        if callback then
            callback()
        end
    end)
    
    button.MouseEnter:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.15)
    end)
    
    button.MouseLeave:Connect(function()
        Tween(button, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.15)
    end)
    
    return button
end

function BloxHub.Elements:CreateToggle(tab, text, default, callback)
    local toggleState = default or false
    
    local container = Instance.new("Frame")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 42 or 38)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    CreateUIStroke(container, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -65, 1, 0)
    label.Position = UDim2.new(0, 14, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = BloxHub.Device.IsMobile and 13 or 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Modern pill switch
    local switch = Instance.new("TextButton")
    switch.Size = UDim2.new(0, 48, 0, 24)
    switch.Position = UDim2.new(1, -56, 0.5, -12)
    switch.BackgroundColor3 = toggleState and BloxHub.Settings.Theme.Accent or BloxHub.Settings.Theme.Primary
    switch.Text = ""
    switch.AutoButtonColor = false
    switch.Parent = container
    
    CreateUICorner(12, switch)
    local switchStroke = CreateUIStroke(switch, toggleState and BloxHub.Settings.Theme.AccentGradient or BloxHub.Settings.Theme.Border, 1, 0.5)
    
    -- Knob with shadow effect
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = toggleState and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = switch
    
    CreateUICorner(10, knob)
    
    -- Knob shadow
    local knobShadow = Instance.new("Frame")
    knobShadow.Size = UDim2.new(1, 2, 1, 2)
    knobShadow.Position = UDim2.new(0, -1, 0, 1)
    knobShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    knobShadow.BackgroundTransparency = 0.8
    knobShadow.ZIndex = knob.ZIndex - 1
    CreateUICorner(10, knobShadow)
    knobShadow.Parent = switch
    
    local function setToggleState(state)
        toggleState = state
        
        Tween(switch, {
            BackgroundColor3 = toggleState and BloxHub.Settings.Theme.Accent or BloxHub.Settings.Theme.Primary
        }, 0.15)
        
        if switchStroke then
            Tween(switchStroke, {
                Color = toggleState and BloxHub.Settings.Theme.AccentGradient or BloxHub.Settings.Theme.Border
            }, 0.15)
        end
        
        Tween(knob, {
            Position = toggleState and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
        }, 0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        if callback then
            pcall(callback, toggleState)
        end
    end
    
    switch.MouseButton1Click:Connect(function()
        setToggleState(not toggleState)
    end)
    
    -- Make container clickable too (behind label)
    local containerBtn = Instance.new("TextButton")
    containerBtn.Size = UDim2.new(1, -60, 1, 0)
    containerBtn.BackgroundTransparency = 1
    containerBtn.Text = ""
    containerBtn.ZIndex = 1
    containerBtn.Parent = container
    
    -- Ensure label is on top
    label.ZIndex = 2
    
    containerBtn.MouseButton1Click:Connect(function()
        setToggleState(not toggleState)
    end)
    
    container.MouseEnter:Connect(function()
        Tween(container, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.15)
    end)
    
    container.MouseLeave:Connect(function()
        Tween(container, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.2)
    end)
    
    return {
        Container = container,
        GetValue = function() return toggleState end,
        SetValue = function(_, value)
            setToggleState(value)
        end
    }
end

function BloxHub.Elements:CreateSlider(tab, text, min, max, default, callback)
    local sliderValue = default or min
    
    local container = Instance.new("Frame")
    container.Name = "Slider_" .. text
    container.Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 56 or 52)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    CreateUIStroke(container, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 0, 22)
    label.Position = UDim2.new(0, 14, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = BloxHub.Device.IsMobile and 13 or 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Value display with background
    local valueFrame = Instance.new("Frame")
    valueFrame.Size = UDim2.new(0, 50, 0, 22)
    valueFrame.Position = UDim2.new(1, -60, 0, 6)
    valueFrame.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    valueFrame.BorderSizePixel = 0
    valueFrame.Parent = container
    CreateUICorner(4, valueFrame)
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(sliderValue)
    valueLabel.TextColor3 = BloxHub.Settings.Theme.Text
    valueLabel.TextSize = 12
    valueLabel.Font = BloxHub.Settings.FontBold
    valueLabel.Parent = valueFrame
    
    -- Slider track
    local sliderBack = Instance.new("Frame")
    sliderBack.Size = UDim2.new(1, -28, 0, 6)
    sliderBack.Position = UDim2.new(0, 14, 1, -18)
    sliderBack.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    sliderBack.BorderSizePixel = 0
    sliderBack.Parent = container
    
    CreateUICorner(3, sliderBack)
    
    -- Slider fill with gradient
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((sliderValue - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBack
    
    CreateUICorner(3, sliderFill)
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, BloxHub.Settings.Theme.Accent),
        ColorSequenceKeypoint.new(1, BloxHub.Settings.Theme.AccentGradient)
    })
    fillGradient.Rotation = 0
    fillGradient.Parent = sliderFill
    
    -- Slider knob
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new((sliderValue - min) / (max - min), 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 2
    knob.Parent = sliderBack
    
    CreateUICorner(8, knob)
    CreateUIStroke(knob, BloxHub.Settings.Theme.Accent, 2, 0)
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(1, 20, 1, 16)
    sliderButton.Position = UDim2.new(0, -10, 0, -8)
    sliderButton.BackgroundTransparency = 1
    sliderButton.Text = ""
    sliderButton.Parent = sliderBack
    
    local dragging = false
    
    local function updateSlider(x)
        local relativeX = math.clamp((x - sliderBack.AbsolutePosition.X) / sliderBack.AbsoluteSize.X, 0, 1)
        sliderValue = min + (max - min) * relativeX
        sliderValue = math.floor(sliderValue + 0.5)

        valueLabel.Text = tostring(sliderValue)
        Tween(sliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.03)
        Tween(knob, {Position = UDim2.new(relativeX, 0, 0.5, 0)}, 0.03)
        
        if callback then
            pcall(callback, sliderValue)
        end
    end

    -- Mouse/Touch input handling using UserInputService
    sliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input.Position.X)
        end
    end)
    
    sliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement or 
               input.UserInputType == Enum.UserInputType.Touch then
                updateSlider(input.Position.X)
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return {
        Container = container,
        GetValue = function() return sliderValue end,
        SetValue = function(_, value)
            sliderValue = math.clamp(value, min, max)
            valueLabel.Text = tostring(sliderValue)
            local relativeX = (sliderValue - min) / (max - min)
            sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
            knob.Position = UDim2.new(relativeX, 0, 0.5, 0)
        end
    }
end

function BloxHub.Elements:CreateKeybind(tab, text, defaultKey, callback)
    local currentKey = defaultKey
    local currentInputType = nil
    local listening = false
    
    local container = Instance.new("Frame")
    container.Name = "Keybind_" .. text
    container.Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 42 or 38)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    CreateUIStroke(container, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.Position = UDim2.new(0, 14, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = BloxHub.Device.IsMobile and 13 or 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local keyButton = Instance.new("TextButton")
    keyButton.Size = UDim2.new(0.45, -18, 0, 28)
    keyButton.Position = UDim2.new(0.55, 4, 0.5, -14)
    keyButton.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    keyButton.Text = GetKeyName(currentKey, currentInputType)
    keyButton.TextColor3 = BloxHub.Settings.Theme.TextDim
    keyButton.TextSize = 12
    keyButton.Font = BloxHub.Settings.FontBold
    keyButton.AutoButtonColor = false
    keyButton.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.XSmall, keyButton)
    local keyStroke = CreateUIStroke(keyButton, BloxHub.Settings.Theme.Border, 1, 0.6)
    
    keyButton.MouseButton1Click:Connect(function()
        if BloxHub.State.ActiveHotkeyListener then return end
        listening = true
        keyButton.Text = "..."
        keyButton.TextColor3 = BloxHub.Settings.Theme.Accent
        if keyStroke then keyStroke.Color = BloxHub.Settings.Theme.Accent end
        
        BloxHub.State.ActiveHotkeyListener = {
            Button = keyButton,
            Callback = function(keyCode, inputType, keyName)
                currentKey = keyCode
                currentInputType = inputType
                listening = false
                keyButton.TextColor3 = BloxHub.Settings.Theme.TextDim
                if keyStroke then keyStroke.Color = BloxHub.Settings.Theme.Border end
                if callback then
                    pcall(callback, keyCode, inputType, keyName)
                end
            end
        }
    end)
    
    keyButton.MouseEnter:Connect(function()
        if not listening then
            Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.15)
            keyButton.TextColor3 = BloxHub.Settings.Theme.Text
        end
    end)
    
    keyButton.MouseLeave:Connect(function()
        if not listening then
            Tween(keyButton, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.15)
            keyButton.TextColor3 = BloxHub.Settings.Theme.TextDim
        end
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
    
    -- Main component container
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    
    -- Label
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
    
    -- Dropdown button
    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Name = "DropdownButton"
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
    
    -- Options container (initially hidden)
    local optionsContainer = Instance.new("Frame")
    optionsContainer.Name = "DropdownOptions"
    optionsContainer.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    optionsContainer.BorderSizePixel = 0
    optionsContainer.Visible = false
    optionsContainer.ClipsDescendants = true
    optionsContainer.ZIndex = 5000 -- ZIndex sangat tinggi agar selalu di depan
    
    --- PERUBAIKAN KUNCI 1: Parent diatur ke ScreenGui utama ---
    optionsContainer.Parent = BloxHub.Core.ScreenGui
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, optionsContainer)
    
    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsLayout.Parent = optionsContainer
    
    CreateUIPadding(4, 4, 4, 4, optionsContainer)

    local optionObjects = {}
    
    local function createOptions()
        for _, obj in pairs(optionObjects) do obj:Destroy() end
        table.clear(optionObjects)
        
        local totalHeight = 8
        
        for i, option in ipairs(options) do
            local optionBg = Instance.new("TextButton")
            optionBg.Name = "Option_" .. i
            optionBg.Size = UDim2.new(1, 0, 0, 22)
            optionBg.BackgroundColor3 = BloxHub.Settings.Theme.Primary
            optionBg.Text = ""
            optionBg.AutoButtonColor = false
            optionBg.LayoutOrder = i
            optionBg.ZIndex = 5001
            optionBg.Parent = optionsContainer
            
            CreateUICorner(BloxHub.Settings.CornerRadius.Small, optionBg)
            
            local optionText = Instance.new("TextLabel")
            optionText.Name = "OptionText"
            optionText.Size = UDim2.new(1, -15, 1, 0)
            optionText.Position = UDim2.new(0, 10, 0, 0)
            optionText.BackgroundTransparency = 1
            optionText.Text = option
            optionText.TextColor3 = BloxHub.Settings.Theme.Text
            optionText.TextSize = 12
            optionText.Font = BloxHub.Settings.Font
            optionText.TextXAlignment = Enum.TextXAlignment.Left
            optionText.ZIndex = 5002
            optionText.Parent = optionBg
            
            local selectedIndicator = Instance.new("Frame")
            selectedIndicator.Name = "SelectedIndicator"
            selectedIndicator.Size = UDim2.new(0, 3, 1, 0)
            selectedIndicator.BackgroundColor3 = BloxHub.Settings.Theme.Accent
            selectedIndicator.BorderSizePixel = 0
            selectedIndicator.Visible = (option == selectedOption)
            selectedIndicator.ZIndex = 5003
            selectedIndicator.Parent = optionBg
            
            optionBg.MouseButton1Click:Connect(function()
                selectedOption = option
                dropdownBtn.Text = option .. "  ⌵"
                expanded = false
                optionsContainer.Visible = false
                
                for _, obj in pairs(optionObjects) do
                    local indicator = obj:FindFirstChild("SelectedIndicator")
                    if indicator then
                        indicator.Visible = (obj.OptionText.Text == option)
                    end
                end
                
                if callback then pcall(callback, option) end
            end)
            
            optionBg.MouseEnter:Connect(function() Tween(optionBg, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.15) end)
            optionBg.MouseLeave:Connect(function() Tween(optionBg, {BackgroundColor3 = BloxHub.Settings.Theme.Primary}, 0.15) end)
            
            table.insert(optionObjects, optionBg)
            totalHeight = totalHeight + 22 + 2
        end
        
        optionsContainer.Size = UDim2.fromOffset(dropdownBtn.AbsoluteSize.X, totalHeight)
    end
    
    createOptions()
    
    dropdownBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        
        if expanded then
            --- PERUBAIKAN KUNCI 2: Menggunakan posisi absolut secara langsung ---
            local btnPos = dropdownBtn.AbsolutePosition
            local btnSize = dropdownBtn.AbsoluteSize
            
            -- Atur ukuran dan posisi container berdasarkan posisi tombol di layar
            optionsContainer.Size = UDim2.fromOffset(btnSize.X, optionsContainer.AbsoluteSize.Y)
            optionsContainer.Position = UDim2.fromOffset(btnPos.X, btnPos.Y + btnSize.Y + 5)
            
            dropdownBtn.Text = selectedOption .. "  ʌ"
            optionsContainer.Visible = true
        else
            dropdownBtn.Text = selectedOption .. "  ⌵"
            optionsContainer.Visible = false
        end
    end)
    
    dropdownBtn.MouseEnter:Connect(function() Tween(dropdownBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2) end)
    dropdownBtn.MouseLeave:Connect(function() Tween(dropdownBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Secondary}, 0.2) end)
    
    local function closeDropdown()
        expanded = false
        optionsContainer.Visible = false
        dropdownBtn.Text = selectedOption .. "  ⌵"
    end
    
    -- Menutup dropdown jika tab diganti
    tab.Window.Frame.Changed:Connect(function(prop)
        if prop == "Visible" and not tab.Window.Frame.Visible then
            closeDropdown()
        end
    end)

    return {
        Container = container,
        GetValue = function() return selectedOption end,
        SetValue = function(_, value)
            if table.find(options, value) then
                selectedOption = value
                dropdownBtn.Text = value .. "  ⌵"
                for _, obj in pairs(optionObjects) do
                    local indicator = obj:FindFirstChild("SelectedIndicator")
                    if indicator then
                        indicator.Visible = (obj.OptionText.Text == value)
                    end
                end
            end
        end,
        Refresh = function(newOptions)
            options = newOptions or options
            createOptions()
        end
    }
end

function BloxHub.Elements:CreateTextBox(tab, text, placeholder, callback)
    local container = Instance.new("Frame")
    container.Name = "TextBox_" .. text
    container.Size = UDim2.new(1, 0, 0, BloxHub.Device.IsMobile and 42 or 38)
    container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    container.BorderSizePixel = 0
    container.Parent = tab.Container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.Small, container)
    CreateUIStroke(container, BloxHub.Settings.Theme.Border, 1, 0.7)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0, 14, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BloxHub.Settings.Theme.Text
    label.TextSize = BloxHub.Device.IsMobile and 13 or 14
    label.Font = BloxHub.Settings.Font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.65, -18, 0, 28)
    textBox.Position = UDim2.new(0.35, 4, 0.5, -14)
    textBox.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    textBox.PlaceholderText = placeholder or "Enter text..."
    textBox.Text = ""
    textBox.TextColor3 = BloxHub.Settings.Theme.Text
    textBox.PlaceholderColor3 = BloxHub.Settings.Theme.TextDim
    textBox.TextSize = 12
    textBox.Font = BloxHub.Settings.Font
    textBox.ClearTextOnFocus = false
    textBox.Parent = container
    
    CreateUICorner(BloxHub.Settings.CornerRadius.XSmall, textBox)
    CreateUIStroke(textBox, BloxHub.Settings.Theme.Border, 1, 0.6)
    CreateUIPadding(10, 10, 0, 0, textBox)
    
    textBox.Focused:Connect(function()
        local stroke = textBox:FindFirstChildOfClass("UIStroke")
        if stroke then
            Tween(stroke, {Color = BloxHub.Settings.Theme.Accent}, 0.15)
        end
    end)
    
    textBox.FocusLost:Connect(function(enterPressed)
        local stroke = textBox:FindFirstChildOfClass("UIStroke")
        if stroke then
            Tween(stroke, {Color = BloxHub.Settings.Theme.Border}, 0.15)
        end
        if callback then
            pcall(callback, textBox.Text, enterPressed)
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
    
    local container = Instance.new("Frame")
    container.Name = "Label_" .. text
    container.Size = UDim2.new(1, 0, 0, config.Height or (BloxHub.Device.IsMobile and 28 or 26))
    container.BackgroundTransparency = 1
    container.Parent = tab.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, config.Bold and 10 or 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = config.TextColor or (config.Bold and BloxHub.Settings.Theme.Text or BloxHub.Settings.Theme.TextDim)
    label.TextSize = config.TextSize or (config.Bold and 14 or 13)
    label.Font = config.Bold and BloxHub.Settings.FontBold or BloxHub.Settings.Font
    label.TextXAlignment = config.TextXAlignment or Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = container

    if config.Bold then
        -- Vertical Accent Bar for Bold Labels
        local accentBar = Instance.new("Frame")
        accentBar.Size = UDim2.new(0, 3, 0, 14)
        accentBar.Position = UDim2.new(0, 0, 0.5, -7)
        accentBar.BackgroundColor3 = BloxHub.Settings.Theme.Accent
        accentBar.BorderSizePixel = 0
        accentBar.Parent = container
        CreateUICorner(2, accentBar)
    end
    
    return container
end

function BloxHub.Elements:CreateDivider(tab)
    local container = Instance.new("Frame")
    container.Name = "Divider"
    container.Size = UDim2.new(1, 0, 0, 12)
    container.BackgroundTransparency = 1
    container.Parent = tab.Container
    
    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.Position = UDim2.new(0, 0, 0.5, 0)
    divider.BackgroundColor3 = BloxHub.Settings.Theme.Border
    divider.BackgroundTransparency = 0.5
    divider.BorderSizePixel = 0
    divider.Parent = container
    
    return container
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
                pcall(callback)
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
    gridLayout.StartCorner = Enum.StartCorner.TopLeft
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.Parent = parent
    
    return gridLayout
end

function BloxHub:CreateVerticalStack(parent, padding)
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, padding or 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.FillDirection = Enum.FillDirection.Vertical
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
            pcall(writefile, "BloxHub_" .. configName .. ".json", encoded)
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
            self.Settings.Theme[key] = Color3.new(value.r, value.g, value.b)
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
    icon.Visible = not window.Visible and config.ShowOnMinimize
    icon.ZIndex = 200
    icon.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Medium, icon)
    
    icon.MouseButton1Click:Connect(function()
        window:Toggle()
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
    notification.Position = UDim2.new(1, 10, 0.9, 0) -- Start off-screen
    notification.BackgroundColor3 = self.Settings.Theme.Primary
    notification.BorderSizePixel = 0
    notification.ZIndex = 300
    notification.Parent = self.Core.ScreenGui
    
    CreateUICorner(self.Settings.CornerRadius.Medium, notification)
    
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.BackgroundColor3 = notifColors[notifType] or notifColors.Info
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
    Tween(notification, {Position = UDim2.new(1, -310, 0.9, 0)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    
    -- Auto remove after duration
    task.delay(duration, function()
        if not notification or not notification.Parent then return end
        Tween(notification, {Position = UDim2.new(1, 10, 0.9, 0)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        task.wait(0.3)
        if notification and notification.Parent then
            notification:Destroy()
        end
    end)
    
    return notification
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


--1
-- Return framework for external use
return BloxHub
