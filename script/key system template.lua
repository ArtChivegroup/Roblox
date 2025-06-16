--// BloxHub Key System Template Final by DimasHop

-- SERVICES
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- CONFIG
local keyURL = "https://raw.githubusercontent.com/ArtChivegroup/Jinx/main/Jinx/files/Sync"
local getKeyPage = "https://bloxhub.work.gd/keyblox.html"

-- VARIABLES
local validKey = nil
local uiVisible = true

-- FUNCTIONS
local function fetchKey()
    local success, response = pcall(function()
        return game:HttpGet(keyURL)
    end)
    if success then
        return string.match(response, "%S+")
    else
        warn("Failed to fetch key!")
        return nil
    end
end

local function createUI()
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "BloxHubKeySystem"

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
    KeyBox.TextSize = 18
    KeyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.ClearTextOnFocus = false

    local UICornerKey = Instance.new("UICorner", KeyBox)
    UICornerKey.CornerRadius = UDim.new(0, 5)

    local Submit = Instance.new("TextButton", Frame)
    Submit.Size = UDim2.new(0.8, 0, 0, 40)
    Submit.Position = UDim2.new(0.1, 0, 0.58, 0)
    Submit.Text = "✅ Submit Key"
    Submit.TextSize = 18
    Submit.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Submit.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerSubmit = Instance.new("UICorner", Submit)
    UICornerSubmit.CornerRadius = UDim.new(0, 5)

    local GetKeyBrowser = Instance.new("TextButton", Frame)
    GetKeyBrowser.Size = UDim2.new(0.35, 0, 0, 30)
    GetKeyBrowser.Position = UDim2.new(0.1, 0, 0.82, 0)
    GetKeyBrowser.Text = "🌐 Open in Browser"
    GetKeyBrowser.TextSize = 14
    GetKeyBrowser.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GetKeyBrowser.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerBrowser = Instance.new("UICorner", GetKeyBrowser)
    UICornerBrowser.CornerRadius = UDim.new(0, 5)

    local GetKeyClipboard = Instance.new("TextButton", Frame)
    GetKeyClipboard.Size = UDim2.new(0.35, 0, 0, 30)
    GetKeyClipboard.Position = UDim2.new(0.55, 0, 0.82, 0)
    GetKeyClipboard.Text = "📋 Copy to Clipboard"
    GetKeyClipboard.TextSize = 14
    GetKeyClipboard.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GetKeyClipboard.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICornerClipboard = Instance.new("UICorner", GetKeyClipboard)
    UICornerClipboard.CornerRadius = UDim.new(0, 5)

    local Minimize = Instance.new("TextButton", Frame)
    Minimize.Size = UDim2.new(0, 25, 0, 25)
    Minimize.Position = UDim2.new(1, -60, 0, 10)
    Minimize.Text = "-"
    Minimize.TextSize = 18
    Minimize.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Exit = Instance.new("TextButton", Frame)
    Exit.Size = UDim2.new(0, 25, 0, 25)
    Exit.Position = UDim2.new(1, -30, 0, 10)
    Exit.Text = "X"
    Exit.TextSize = 18
    Exit.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    Exit.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Minimize / Expand
    Minimize.MouseButton1Click:Connect(function()
        uiVisible = not uiVisible
        Frame.Visible = uiVisible
    end)

    -- Exit UI
    Exit.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Open key page in browser
    GetKeyBrowser.MouseButton1Click:Connect(function()
        StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Key System",
            Text = "Opening key page in browser...",
            Duration = 5
        })

        if syn and syn.request then
            syn.request({Url = getKeyPage, Method = "GET"})
        elseif KRNL_LOADED then
            KRNL_LOADED:OpenURL(getKeyPage)
        elseif getgenv().http_request then
            getgenv().http_request({Url = getKeyPage, Method = "GET"})
        elseif request then
            request({Url = getKeyPage, Method = "GET"})
        else
            setclipboard(getKeyPage)
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "Browser not supported. Link copied to clipboard!",
                Duration = 5
            })
        end
    end)

    -- Copy key link to clipboard
    GetKeyClipboard.MouseButton1Click:Connect(function()
        setclipboard(getKeyPage)
        StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Key System",
            Text = "Link copied to clipboard!",
            Duration = 5
        })
    end)

    -- Submit key
    Submit.MouseButton1Click:Connect(function()
        local inputKey = KeyBox.Text
        local currentKey = fetchKey()
        if inputKey == currentKey then
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "✅ Key Verified!",
                Duration = 3
            })
            wait(1)
            ScreenGui:Destroy()
            -- ✅ INSERT YOUR SCRIPT HERE
            loadstring(game:HttpGet("YOUR SCRIPT URL HERE"))()
        else
            StarterGui:SetCore("SendNotification", {
                Title = "BloxHub Key System",
                Text = "❌ Invalid Key!",
                Duration = 3
            })
        end
    end)
end

-- EXECUTE
createUI()
