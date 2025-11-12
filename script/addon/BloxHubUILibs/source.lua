local BloxHub = {
    UI = {},
    Settings = {
        IconEnabled = true,
        Hotkeys = {
            ToggleGUI = Enum.KeyCode.LeftAlt,
            ESP = Enum.KeyCode.E,
            Aimbot = "MouseButton2"
        },
        Theme = {
            Primary = Color3.fromRGB(45, 45, 55),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(88, 101, 242),
            AccentHover = Color3.fromRGB(108, 121, 255),
            Success = Color3.fromRGB(67, 181, 129),
            Warning = Color3.fromRGB(250, 166, 26),
            Danger = Color3.fromRGB(237, 66, 69),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 180, 190),
            Border = Color3.fromRGB(60, 60, 75)
        }
    },
    State = {
        GUIVisible = true,
        ListeningHotkey = nil,
        IconPosition = UDim2.new(0.5, -50, 0.1, 0),
        CurrentTab = "main"
    },
    Features = {
        ESP = false,
        Chams = false,
        Aimbot = false,
        NoRecoil = false,
        Visuals = false
    },
    Sliders = {},
    Tabs = {}
}

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Utility Functions
local function CreateTween(instance, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(
        duration or 0.3,
        style or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

local function MakeDraggable(frame, dragHandle)
    local dragging = false
    local dragInput, mousePos, framePos
    
    dragHandle = dragHandle or frame
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            CreateTween(frame, {
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

-- Notification System
function BloxHub:Notify(title, message, duration, notifType)
    duration = duration or 3
    notifType = notifType or "info" -- info, success, warning, error
    
    local NotifContainer = self.UI.NotifContainer
    if not NotifContainer then
        NotifContainer = Instance.new("Frame")
        NotifContainer.Name = "NotificationContainer"
        NotifContainer.Size = UDim2.new(0, 300, 1, 0)
        NotifContainer.Position = UDim2.new(1, -310, 0, 10)
        NotifContainer.BackgroundTransparency = 1
        NotifContainer.Parent = self.UI.ScreenGui
        
        local ListLayout = Instance.new("UIListLayout")
        ListLayout.Padding = UDim.new(0, 10)
        ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        ListLayout.Parent = NotifContainer
        
        self.UI.NotifContainer = NotifContainer
    end
    
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(1, 0, 0, 0)
    Notif.BackgroundColor3 = self.Settings.Theme.Secondary
    Notif.BorderSizePixel = 0
    Notif.ClipsDescendants = true
    Notif.Parent = NotifContainer
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Notif
    
    local ColorBar = Instance.new("Frame")
    ColorBar.Size = UDim2.new(0, 4, 1, 0)
    ColorBar.BorderSizePixel = 0
    ColorBar.Parent = Notif
    
    local colors = {
        info = self.Settings.Theme.Accent,
        success = self.Settings.Theme.Success,
        warning = self.Settings.Theme.Warning,
        error = self.Settings.Theme.Danger
    }
    ColorBar.BackgroundColor3 = colors[notifType] or colors.info
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -50, 0, 20)
    Title.Position = UDim2.new(0, 15, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextTruncate = Enum.TextTruncate.AtEnd
    Title.Parent = Notif
    
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.new(1, -50, 0, 35)
    Message.Position = UDim2.new(0, 15, 0, 28)
    Message.BackgroundTransparency = 1
    Message.Text = message
    Message.TextColor3 = self.Settings.Theme.TextDim
    Message.TextSize = 12
    Message.Font = Enum.Font.Gotham
    Message.TextXAlignment = Enum.TextXAlignment.Left
    Message.TextYAlignment = Enum.TextYAlignment.Top
    Message.TextWrapped = true
    Message.Parent = Notif
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 20, 0, 20)
    CloseBtn.Position = UDim2.new(1, -28, 0, 8)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = self.Settings.Theme.TextDim
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = Notif
    
    -- Animate in
    CreateTween(Notif, {Size = UDim2.new(1, 0, 0, 70)}, 0.3, Enum.EasingStyle.Back)
    
    local function closeNotif()
        CreateTween(Notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
        task.wait(0.2)
        Notif:Destroy()
    end
    
    CloseBtn.MouseButton1Click:Connect(closeNotif)
    
    task.delay(duration, function()
        if Notif and Notif.Parent then
            closeNotif()
        end
    end)
end

-- UI Creation Functions
function BloxHub:CreateScreenGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BloxHubGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    self.UI.ScreenGui = ScreenGui
    return ScreenGui
end

function BloxHub:CreateMainFrame()
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 520, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
    MainFrame.BackgroundColor3 = self.Settings.Theme.Primary
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = self.UI.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Subtle gradient overlay
    local Gradient = Instance.new("Frame")
    Gradient.Size = UDim2.new(1, 0, 0.3, 0)
    Gradient.BackgroundTransparency = 0.9
    Gradient.BackgroundColor3 = self.Settings.Theme.Accent
    Gradient.BorderSizePixel = 0
    Gradient.ZIndex = 0
    Gradient.Parent = MainFrame
    
    local GradientCorner = Instance.new("UICorner")
    GradientCorner.CornerRadius = UDim.new(0, 12)
    GradientCorner.Parent = Gradient
    
    self.UI.MainFrame = MainFrame
    return MainFrame
end

function BloxHub:CreateHeader()
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 55)
    Header.BackgroundColor3 = self.Settings.Theme.Secondary
    Header.BorderSizePixel = 0
    Header.Parent = self.UI.MainFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Header
    
    -- Logo/Icon
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(0, 40, 0, 40)
    Logo.Position = UDim2.new(0, 15, 0.5, -20)
    Logo.BackgroundTransparency = 1
    Logo.Text = "🧩"
    Logo.TextSize = 24
    Logo.Font = Enum.Font.Gotham
    Logo.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Position = UDim2.new(0, 60, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "BloxHub"
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 20
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(0, 200, 0, 15)
    Subtitle.Position = UDim2.new(0, 60, 0, 30)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Universal Executor"
    Subtitle.TextColor3 = self.Settings.Theme.TextDim
    Subtitle.TextSize = 11
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = Header
    
    -- Button Container
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Size = UDim2.new(0, 100, 0, 40)
    ButtonContainer.Position = UDim2.new(1, -110, 0.5, -20)
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = Header
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Size = UDim2.new(0, 40, 0, 40)
    CloseBtn.Position = UDim2.new(1, -40, 0, 0)
    CloseBtn.BackgroundColor3 = self.Settings.Theme.Primary
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = self.Settings.Theme.Text
    CloseBtn.TextSize = 16
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = ButtonContainer
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 8)
    CloseBtnCorner.Parent = CloseBtn
    
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.Size = UDim2.new(0, 40, 0, 40)
    MinimizeBtn.Position = UDim2.new(1, -90, 0, 0)
    MinimizeBtn.BackgroundColor3 = self.Settings.Theme.Primary
    MinimizeBtn.Text = "─"
    MinimizeBtn.TextColor3 = self.Settings.Theme.Text
    MinimizeBtn.TextSize = 18
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.Parent = ButtonContainer
    
    local MinBtnCorner = Instance.new("UICorner")
    MinBtnCorner.CornerRadius = UDim.new(0, 8)
    MinBtnCorner.Parent = MinimizeBtn
    
    CloseBtn.MouseButton1Click:Connect(function()
        CreateTween(CloseBtn, {BackgroundColor3 = self.Settings.Theme.Danger}, 0.1)
        task.wait(0.1)
        self.UI.ScreenGui:Destroy()
        self:Notify("BloxHub", "GUI Closed", 2, "info")
    end)
    
    MinimizeBtn.MouseButton1Click:Connect(function()
        self:ToggleGUI()
    end)
    
    CloseBtn.MouseEnter:Connect(function()
        CreateTween(CloseBtn, {BackgroundColor3 = self.Settings.Theme.Danger}, 0.2)
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        CreateTween(CloseBtn, {BackgroundColor3 = self.Settings.Theme.Primary}, 0.2)
    end)
    
    MinimizeBtn.MouseEnter:Connect(function()
        CreateTween(MinimizeBtn, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
    end)
    
    MinimizeBtn.MouseLeave:Connect(function()
        CreateTween(MinimizeBtn, {BackgroundColor3 = self.Settings.Theme.Primary}, 0.2)
    end)
    
    MakeDraggable(self.UI.MainFrame, Header)
    
    self.UI.Header = Header
end

function BloxHub:CreateGridMenu()
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "GridContainer"
    Container.Size = UDim2.new(1, -40, 1, -75)
    Container.Position = UDim2.new(0, 20, 0, 65)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 6
    Container.ScrollBarImageColor3 = self.Settings.Theme.Accent
    Container.BorderSizePixel = 0
    Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    Container.Parent = self.UI.MainFrame
    
    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.CellSize = UDim2.new(0, 150, 0, 105)
    GridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
    GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    GridLayout.Parent = Container
    
    -- Auto-resize canvas
    GridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Container.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 10)
    end)
    
    local features = {
        {Name = "ESP", Icon = "👁️", Color = Color3.fromRGB(255, 100, 100), Desc = "Player ESP"},
        {Name = "Chams", Icon = "🎨", Color = Color3.fromRGB(100, 255, 100), Desc = "Wall Chams"},
        {Name = "Aimbot", Icon = "🎯", Color = Color3.fromRGB(100, 100, 255), Desc = "Auto Aim"},
        {Name = "Recoil", Icon = "🔫", Color = Color3.fromRGB(255, 255, 100), Desc = "No Recoil"},
        {Name = "Visuals", Icon = "✨", Color = Color3.fromRGB(255, 100, 255), Desc = "Visual Effects"},
        {Name = "Settings", Icon = "⚙️", Color = Color3.fromRGB(150, 150, 150), Desc = "Configuration"}
    }
    
    for i, feature in ipairs(features) do
        self:CreateFeatureTile(Container, feature, i)
    end
    
    self.UI.GridContainer = Container
end

function BloxHub:CreateFeatureTile(parent, feature, order)
    local Tile = Instance.new("TextButton")
    Tile.Name = feature.Name
    Tile.LayoutOrder = order
    Tile.BackgroundColor3 = self.Settings.Theme.Secondary
    Tile.BorderSizePixel = 0
    Tile.Text = ""
    Tile.AutoButtonColor = false
    Tile.ClipsDescendants = true
    Tile.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Tile
    
    -- Border effect
    local Border = Instance.new("UIStroke")
    Border.Color = self.Settings.Theme.Border
    Border.Thickness = 1
    Border.Transparency = 0.5
    Border.Parent = Tile
    
    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Size = UDim2.new(1, 0, 0.45, 0)
    Icon.Position = UDim2.new(0, 0, 0, 8)
    Icon.BackgroundTransparency = 1
    Icon.Text = feature.Icon
    Icon.TextSize = 36
    Icon.Font = Enum.Font.Gotham
    Icon.Parent = Tile
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -10, 0, 20)
    Label.Position = UDim2.new(0, 5, 0.5, -5)
    Label.BackgroundTransparency = 1
    Label.Text = feature.Name
    Label.TextColor3 = self.Settings.Theme.Text
    Label.TextSize = 15
    Label.Font = Enum.Font.GothamBold
    Label.Parent = Tile
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -10, 0, 15)
    Desc.Position = UDim2.new(0, 5, 0.5, 18)
    Desc.BackgroundTransparency = 1
    Desc.Text = feature.Desc
    Desc.TextColor3 = self.Settings.Theme.TextDim
    Desc.TextSize = 11
    Desc.Font = Enum.Font.Gotham
    Desc.Parent = Tile
    
    local StatusIndicator = Instance.new("Frame")
    StatusIndicator.Name = "Status"
    StatusIndicator.Size = UDim2.new(0, 10, 0, 10)
    StatusIndicator.Position = UDim2.new(1, -15, 0, 8)
    StatusIndicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    StatusIndicator.BorderSizePixel = 0
    StatusIndicator.Parent = Tile
    
    local StatusCorner = Instance.new("UICorner")
    StatusCorner.CornerRadius = UDim.new(1, 0)
    StatusCorner.Parent = StatusIndicator
    
    -- Ripple effect container
    local RippleContainer = Instance.new("Frame")
    RippleContainer.Size = UDim2.new(1, 0, 1, 0)
    RippleContainer.BackgroundTransparency = 1
    RippleContainer.ClipsDescendants = true
    RippleContainer.ZIndex = 2
    RippleContainer.Parent = Tile
    
    local RippleCorner = Instance.new("UICorner")
    RippleCorner.CornerRadius = UDim.new(0, 10)
    RippleCorner.Parent = RippleContainer
    
    Tile.MouseButton1Click:Connect(function()
        -- Ripple effect
        local Ripple = Instance.new("Frame")
        Ripple.Size = UDim2.new(0, 0, 0, 0)
        Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        Ripple.BackgroundColor3 = self.Settings.Theme.Accent
        Ripple.BackgroundTransparency = 0.5
        Ripple.BorderSizePixel = 0
        Ripple.Parent = RippleContainer
        
        local RippleCorner = Instance.new("UICorner")
        RippleCorner.CornerRadius = UDim.new(1, 0)
        RippleCorner.Parent = Ripple
        
        CreateTween(Ripple, {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        }, 0.5)
        
        task.delay(0.5, function()
            Ripple:Destroy()
        end)
        
        if feature.Name == "Settings" then
            self:OpenSettings()
        else
            self.Features[feature.Name] = not self.Features[feature.Name]
            local newColor = self.Features[feature.Name] and feature.Color or Color3.fromRGB(100, 100, 100)
            CreateTween(StatusIndicator, {BackgroundColor3 = newColor}, 0.3)
            
            local status = self.Features[feature.Name] and "enabled" or "disabled"
            self:Notify(feature.Name, feature.Name .. " has been " .. status, 2, 
                self.Features[feature.Name] and "success" or "info")
            
            print("[BloxHub] " .. feature.Name .. " toggled: " .. tostring(self.Features[feature.Name]))
        end
    end)
    
    Tile.MouseEnter:Connect(function()
        CreateTween(Tile, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
        CreateTween(Border, {Transparency = 0}, 0.2)
        CreateTween(Tile, {Size = UDim2.new(0, 155, 0, 110)}, 0.2, Enum.EasingStyle.Back)
    end)
    
    Tile.MouseLeave:Connect(function()
        CreateTween(Tile, {BackgroundColor3 = self.Settings.Theme.Secondary}, 0.2)
        CreateTween(Border, {Transparency = 0.5}, 0.2)
        CreateTween(Tile, {Size = UDim2.new(0, 150, 0, 105)}, 0.2, Enum.EasingStyle.Back)
    end)
end

function BloxHub:CreateIconToggle()
    local Icon = Instance.new("TextButton")
    Icon.Name = "IconToggle"
    Icon.Size = UDim2.new(0, 110, 0, 45)
    Icon.Position = self.State.IconPosition
    Icon.BackgroundColor3 = self.Settings.Theme.Accent
    Icon.Text = "🧩 BloxHub"
    Icon.TextColor3 = self.Settings.Theme.Text
    Icon.TextSize = 14
    Icon.Font = Enum.Font.GothamBold
    Icon.Visible = false
    Icon.Parent = self.UI.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Icon
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Settings.Theme.AccentHover
    UIStroke.Thickness = 2
    UIStroke.Parent = Icon
    
    Icon.MouseButton1Click:Connect(function()
        self:ToggleGUI()
    end)
    
    Icon.MouseEnter:Connect(function()
        CreateTween(Icon, {BackgroundColor3 = self.Settings.Theme.AccentHover}, 0.2)
        CreateTween(Icon, {Size = UDim2.new(0, 115, 0, 48)}, 0.2, Enum.EasingStyle.Back)
    end)
    
    Icon.MouseLeave:Connect(function()
        CreateTween(Icon, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
        CreateTween(Icon, {Size = UDim2.new(0, 110, 0, 45)}, 0.2, Enum.EasingStyle.Back)
    end)
    
    MakeDraggable(Icon)
    
    self.UI.IconToggle = Icon
end

function BloxHub:OpenSettings()
    if self.UI.SettingsPanel then
        self.UI.SettingsPanel:Destroy()
    end
    
    self.State.CurrentTab = "settings"
    
    local SettingsPanel = Instance.new("Frame")
    SettingsPanel.Name = "SettingsPanel"
    SettingsPanel.Size = UDim2.new(1, -40, 1, -75)
    SettingsPanel.Position = UDim2.new(0, 20, 0, 65)
    SettingsPanel.BackgroundColor3 = self.Settings.Theme.Secondary
    SettingsPanel.BorderSizePixel = 0
    SettingsPanel.Parent = self.UI.MainFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = SettingsPanel
    
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = self.Settings.Theme.Primary
    Header.BorderSizePixel = 0
    Header.Parent = SettingsPanel
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 10)
    HeaderCorner.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚙️ Settings"
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local BackBtn = Instance.new("TextButton")
    BackBtn.Size = UDim2.new(0, 85, 0, 32)
    BackBtn.Position = UDim2.new(1, -95, 0.5, -16)
    BackBtn.BackgroundColor3 = self.Settings.Theme.Accent
    BackBtn.Text = "← Back"
    BackBtn.TextColor3 = self.Settings.Theme.Text
    BackBtn.TextSize = 13
    BackBtn.Font = Enum.Font.GothamSemibold
    BackBtn.Parent = Header
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = BackBtn
    
    BackBtn.MouseButton1Click:Connect(function()
        SettingsPanel:Destroy()
        self.UI.SettingsPanel = nil
        self.State.CurrentTab = "main"
    end)
    
    BackBtn.MouseEnter:Connect(function()
        CreateTween(BackBtn, {BackgroundColor3 = self.Settings.Theme.AccentHover}, 0.2)
    end)
    
    BackBtn.MouseLeave:Connect(function()
        CreateTween(BackBtn, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
    end)
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, -20, 1, -70)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 60)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.ScrollBarThickness = 5
    ScrollFrame.ScrollBarImageColor3 = self.Settings.Theme.Accent
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollFrame.Parent = SettingsPanel
    
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 12)
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Parent = ScrollFrame
    
    ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    self:CreateHotkeySettings(ScrollFrame)
    self:CreateToggleSettings(ScrollFrame)
    self:CreateSliderSettings(ScrollFrame)
    
    self.UI.SettingsPanel = SettingsPanel
end

function BloxHub:CreateHotkeySettings(parent)
    local HotkeySection = Instance.new("Frame")
    HotkeySection.Size = UDim2.new(1, 0, 0, 160)
    HotkeySection.BackgroundColor3 = self.Settings.Theme.Primary
    HotkeySection.BorderSizePixel = 0
    HotkeySection.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = HotkeySection
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.5
    UIStroke.Parent = HotkeySection
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 28)
    Title.Position = UDim2.new(0, 12, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = "⌨️ Hotkeys"
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 15
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = HotkeySection
    
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -24, 0, 1)
    Divider.Position = UDim2.new(0, 12, 0, 38)
    Divider.BackgroundColor3 = self.Settings.Theme.Border
    Divider.BorderSizePixel = 0
    Divider.Parent = HotkeySection
    
    local yPos = 48
    for name, key in pairs(self.Settings.Hotkeys) do
        self:CreateHotkeyButton(HotkeySection, name, key, yPos)
        yPos = yPos + 36
    end
end

function BloxHub:CreateHotkeyButton(parent, name, key, yPos)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -24, 0, 30)
    Container.Position = UDim2.new(0, 12, 0, yPos)
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, -5, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ":"
    Label.TextColor3 = self.Settings.Theme.TextDim
    Label.TextSize = 13
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.5, -5, 1, 0)
    Button.Position = UDim2.new(0.5, 5, 0, 0)
    Button.BackgroundColor3 = self.Settings.Theme.Secondary
    Button.Text = tostring(key):gsub("Enum.KeyCode.", "")
    Button.TextColor3 = self.Settings.Theme.Text
    Button.TextSize = 12
    Button.Font = Enum.Font.GothamSemibold
    Button.AutoButtonColor = false
    Button.Parent = Container
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Button
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.7
    UIStroke.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        Button.Text = "Press any key..."
        CreateTween(Button, {BackgroundColor3 = self.Settings.Theme.Accent}, 0.2)
        self.State.ListeningHotkey = {Button = Button, Name = name, Stroke = UIStroke}
    end)
    
    Button.MouseEnter:Connect(function()
        if not self.State.ListeningHotkey or self.State.ListeningHotkey.Button ~= Button then
            CreateTween(UIStroke, {Transparency = 0.3}, 0.2)
        end
    end)
    
    Button.MouseLeave:Connect(function()
        if not self.State.ListeningHotkey or self.State.ListeningHotkey.Button ~= Button then
            CreateTween(UIStroke, {Transparency = 0.7}, 0.2)
        end
    end)
end

function BloxHub:CreateToggleSettings(parent)
    local ToggleSection = Instance.new("Frame")
    ToggleSection.Size = UDim2.new(1, 0, 0, 95)
    ToggleSection.BackgroundColor3 = self.Settings.Theme.Primary
    ToggleSection.BorderSizePixel = 0
    ToggleSection.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = ToggleSection
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.5
    UIStroke.Parent = ToggleSection
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 28)
    Title.Position = UDim2.new(0, 12, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = "🎨 Display Options"
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 15
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = ToggleSection
    
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -24, 0, 1)
    Divider.Position = UDim2.new(0, 12, 0, 38)
    Divider.BackgroundColor3 = self.Settings.Theme.Border
    Divider.BorderSizePixel = 0
    Divider.Parent = ToggleSection
    
    local IconToggle = self:CreateToggleSwitch(ToggleSection, "Icon Toggle Mode", self.Settings.IconEnabled, 48)
    IconToggle.Changed:Connect(function()
        self.Settings.IconEnabled = IconToggle.Value
        self:Notify("Settings", "Icon toggle " .. (IconToggle.Value and "enabled" or "disabled"), 2, "info")
    end)
end

function BloxHub:CreateToggleSwitch(parent, label, defaultValue, yPos)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -24, 0, 35)
    Container.Position = UDim2.new(0, 12, 0, yPos)
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.65, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = label
    Label.TextColor3 = self.Settings.Theme.TextDim
    Label.TextSize = 13
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 54, 0, 28)
    Switch.Position = UDim2.new(1, -54, 0.5, -14)
    Switch.BackgroundColor3 = defaultValue and self.Settings.Theme.Accent or Color3.fromRGB(60, 60, 70)
    Switch.Text = ""
    Switch.AutoButtonColor = false
    Switch.Parent = Container
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 22, 0, 22)
    Knob.Position = defaultValue and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = Switch
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local KnobShadow = Instance.new("UIStroke")
    KnobShadow.Color = Color3.fromRGB(0, 0, 0)
    KnobShadow.Thickness = 0
    KnobShadow.Transparency = 0.8
    KnobShadow.Parent = Knob
    
    local toggleValue = defaultValue
    
    Switch.MouseButton1Click:Connect(function()
        toggleValue = not toggleValue
        
        CreateTween(Switch, {
            BackgroundColor3 = toggleValue and self.Settings.Theme.Accent or Color3.fromRGB(60, 60, 70)
        }, 0.2)
        
        CreateTween(Knob, {
            Position = toggleValue and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
        }, 0.2, Enum.EasingStyle.Quad)
        
        Container.Value = toggleValue
        if Container.Changed then
            Container.Changed:Fire()
        end
    end)
    
    Switch.MouseEnter:Connect(function()
        CreateTween(Knob, {Size = UDim2.new(0, 24, 0, 24)}, 0.15, Enum.EasingStyle.Back)
    end)
    
    Switch.MouseLeave:Connect(function()
        CreateTween(Knob, {Size = UDim2.new(0, 22, 0, 22)}, 0.15)
    end)
    
    local ChangedEvent = Instance.new("BindableEvent")
    Container.Changed = ChangedEvent.Event
    Container.Value = toggleValue
    
    return Container
end

function BloxHub:CreateSliderSettings(parent)
    local SliderSection = Instance.new("Frame")
    SliderSection.Size = UDim2.new(1, 0, 0, 200)
    SliderSection.BackgroundColor3 = self.Settings.Theme.Primary
    SliderSection.BorderSizePixel = 0
    SliderSection.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = SliderSection
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = self.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.5
    UIStroke.Parent = SliderSection
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 28)
    Title.Position = UDim2.new(0, 12, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = "🎚️ Advanced Settings"
    Title.TextColor3 = self.Settings.Theme.Text
    Title.TextSize = 15
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = SliderSection
    
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -24, 0, 1)
    Divider.Position = UDim2.new(0, 12, 0, 38)
    Divider.BackgroundColor3 = self.Settings.Theme.Border
    Divider.BorderSizePixel = 0
    Divider.Parent = SliderSection
    
    -- Example sliders
    self:CreateSlider(SliderSection, "FOV", 60, 120, 90, 48, function(value)
        print("FOV changed to:", value)
    end)
    
    self:CreateSlider(SliderSection, "Smoothness", 0, 100, 50, 98, function(value)
        print("Smoothness changed to:", value)
    end)
    
    self:CreateSlider(SliderSection, "Distance", 100, 1000, 500, 148, function(value)
        print("Distance changed to:", value)
    end)
end

function BloxHub:CreateSlider(parent, name, min, max, default, yPos, callback)
    local Container = Instance.new("Frame")
    Container.Name = name .. "Slider"
    Container.Size = UDim2.new(1, -24, 0, 45)
    Container.Position = UDim2.new(0, 12, 0, yPos)
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = self.Settings.Theme.TextDim
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.4, 0, 0, 20)
    ValueLabel.Position = UDim2.new(0.6, 0, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = self.Settings.Theme.Accent
    ValueLabel.TextSize = 13
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Container
    
    local SliderBack = Instance.new("Frame")
    SliderBack.Size = UDim2.new(1, 0, 0, 8)
    SliderBack.Position = UDim2.new(0, 0, 0, 28)
    SliderBack.BackgroundColor3 = self.Settings.Theme.Secondary
    SliderBack.BorderSizePixel = 0
    SliderBack.Parent = Container
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(1, 0)
    SliderCorner.Parent = SliderBack
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = self.Settings.Theme.Accent
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBack
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, 0, 1, 10)
    SliderButton.Position = UDim2.new(0, 0, 0, -5)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    SliderButton.Parent = SliderBack
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 18, 0, 18)
    Knob.Position = UDim2.new((default - min) / (max - min), -9, 0.5, -9)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.ZIndex = 2
    Knob.Parent = SliderBack
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local KnobStroke = Instance.new("UIStroke")
    KnobStroke.Color = self.Settings.Theme.Accent
    KnobStroke.Thickness = 2
    KnobStroke.Parent = Knob
    
    local dragging = false
    local currentValue = default
    
    local function updateSlider(input)
        local relativeX = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * relativeX)
        
        if value ~= currentValue then
            currentValue = value
            ValueLabel.Text = tostring(value)
            
            CreateTween(SliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.1)
            CreateTween(Knob, {Position = UDim2.new(relativeX, -9, 0.5, -9)}, 0.1)
            
            if callback then
                callback(value)
            end
        end
    end
    
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            CreateTween(Knob, {Size = UDim2.new(0, 20, 0, 20)}, 0.15, Enum.EasingStyle.Back)
            updateSlider(input)
        end
    end)
    
    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            CreateTween(Knob, {Size = UDim2.new(0, 18, 0, 18)}, 0.15)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    self.Sliders[name] = {
        Container = Container,
        GetValue = function() return currentValue end,
        SetValue = function(value)
            local clampedValue = math.clamp(value, min, max)
            local relativeX = (clampedValue - min) / (max - min)
            currentValue = clampedValue
            ValueLabel.Text = tostring(clampedValue)
            SliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
            Knob.Position = UDim2.new(relativeX, -9, 0.5, -9)
        end
    }
    
    return Container
end

function BloxHub:ToggleGUI()
    self.State.GUIVisible = not self.State.GUIVisible
    
    if self.State.GUIVisible then
        self.UI.MainFrame.Visible = true
        self.UI.IconToggle.Visible = false
        CreateTween(self.UI.MainFrame, {Size = UDim2.new(0, 520, 0, 420)}, 0.35, Enum.EasingStyle.Back)
        CreateTween(self.UI.MainFrame, {BackgroundTransparency = 0}, 0.2)
    else
        CreateTween(self.UI.MainFrame, {Size = UDim2.new(0, 520, 0, 0)}, 0.3, Enum.EasingStyle.Back)
        CreateTween(self.UI.MainFrame, {BackgroundTransparency = 1}, 0.2)
        task.wait(0.3)
        self.UI.MainFrame.Visible = false
        if self.Settings.IconEnabled then
            self.UI.IconToggle.Visible = true
        end
    end
end

function BloxHub:SetupInputHandling()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        -- Hotkey listening mode
        if self.State.ListeningHotkey then
            local keyName = input.KeyCode.Name
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                keyName = "MouseButton1"
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                keyName = "MouseButton2"
            elseif input.KeyCode == Enum.KeyCode.Escape then
                self.State.ListeningHotkey.Button.Text = tostring(self.Settings.Hotkeys[self.State.ListeningHotkey.Name]):gsub("Enum.KeyCode.", "")
                CreateTween(self.State.ListeningHotkey.Button, {BackgroundColor3 = self.Settings.Theme.Secondary}, 0.2)
                self.State.ListeningHotkey = nil
                return
            end
            
            self.Settings.Hotkeys[self.State.ListeningHotkey.Name] = input.KeyCode
            self.State.ListeningHotkey.Button.Text = keyName
            CreateTween(self.State.ListeningHotkey.Button, {BackgroundColor3 = self.Settings.Theme.Secondary}, 0.2)
            
            self:Notify("Hotkey Updated", self.State.ListeningHotkey.Name .. " set to " .. keyName, 2, "success")
            
            self.State.ListeningHotkey = nil
            return
        end
        
        -- Normal hotkey detection
        if input.KeyCode == self.Settings.Hotkeys.ToggleGUI then
            self:ToggleGUI()
        elseif input.KeyCode == self.Settings.Hotkeys.ESP then
            self.Features.ESP = not self.Features.ESP
            self:Notify("ESP", "ESP " .. (self.Features.ESP and "enabled" or "disabled"), 2, 
                self.Features.ESP and "success" or "info")
        end
        
        -- Mouse button detection
        if input.UserInputType == Enum.UserInputType.MouseButton2 and self.Settings.Hotkeys.Aimbot == "MouseButton2" then
            if not gameProcessed then
                self.Features.Aimbot = not self.Features.Aimbot
                self:Notify("Aimbot", "Aimbot " .. (self.Features.Aimbot and "enabled" or "disabled"), 2, 
                    self.Features.Aimbot and "success" or "info")
            end
        end
    end)
end

function BloxHub:SaveSettings()
    local settings = {
        IconEnabled = self.Settings.IconEnabled,
        Hotkeys = {},
        IconPosition = {
            Scale = {self.UI.IconToggle.Position.X.Scale, self.UI.IconToggle.Position.Y.Scale},
            Offset = {self.UI.IconToggle.Position.X.Offset, self.UI.IconToggle.Position.Y.Offset}
        }
    }
    
    for k, v in pairs(self.Settings.Hotkeys) do
        settings.Hotkeys[k] = tostring(v)
    end
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(settings)
    end)
    
    if success then
        if writefile then
            writefile("BloxHubSettings.json", encoded)
            print("[BloxHub] Settings saved")
        elseif setclipboard then
            setclipboard(encoded)
            self:Notify("Settings", "Settings copied to clipboard", 3, "info")
        end
    end
end

function BloxHub:LoadSettings()
    if readfile and isfile and isfile("BloxHubSettings.json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("BloxHubSettings.json"))
        end)
        
        if success and data then
            self.Settings.IconEnabled = data.IconEnabled or true
            
            if data.Hotkeys then
                for k, v in pairs(data.Hotkeys) do
                    local keyCode = Enum.KeyCode[v:gsub("Enum.KeyCode.", "")]
                    if keyCode then
                        self.Settings.Hotkeys[k] = keyCode
                    else
                        self.Settings.Hotkeys[k] = v
                    end
                end
            end
            
            if data.IconPosition then
                self.State.IconPosition = UDim2.new(
                    data.IconPosition.Scale[1], data.IconPosition.Offset[1],
                    data.IconPosition.Scale[2], data.IconPosition.Offset[2]
                )
            end
            
            print("[BloxHub] Settings loaded")
            return true
        end
    end
    return false
end

function BloxHub:Initialize()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("🧩 BloxHub GUI Executor v1.0")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    self:LoadSettings()
    self:CreateScreenGui()
    self:CreateMainFrame()
    self:CreateHeader()
    self:CreateGridMenu()
    self:CreateIconToggle()
    self:SetupInputHandling()
    
    self:Notify("BloxHub", "Successfully loaded!", 3, "success")
    
    print("[BloxHub] Hotkey to toggle: " .. tostring(self.Settings.Hotkeys.ToggleGUI):gsub("Enum.KeyCode.", ""))
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    -- Auto-save on close
    game:GetService("Players").LocalPlayer.AncestryChanged:Connect(function()
        self:SaveSettings()
    end)
    
    return self
end

-- Public API for extensibility
function BloxHub:CreateButton(name, callback)
    if not name or not callback then
        warn("[BloxHub API] CreateButton requires name and callback")
        return
    end
    
    local feature = {
        Name = name,
        Icon = "⚡",
        Color = Color3.fromRGB(100, 200, 255),
        Desc = "Custom Feature"
    }
    
    local container = self.UI.GridContainer
    if container then
        local count = #container:GetChildren()
        self:CreateFeatureTile(container, feature, count)
        print("[BloxHub API] Button created:", name)
    end
end

function BloxHub:CreateSliderAPI(name, min, max, default, callback)
    if not name or not min or not max or not default or not callback then
        warn("[BloxHub API] CreateSlider requires all parameters")
        return
    end
    
    print("[BloxHub API] Slider created:", name, min, max, default)
    
    -- Return slider object for external control
    return {
        GetValue = function()
            return self.Sliders[name] and self.Sliders[name].GetValue() or default
        end,
        SetValue = function(value)
            if self.Sliders[name] then
                self.Sliders[name].SetValue(value)
            end
        end
    }
end

-- Initialize and return
return BloxHub:Initialize()
