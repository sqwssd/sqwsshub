local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local OBBY_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/wallhop_pro.lua"
local BRAINROTS_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/wallhop_brainrot.lua"
local LUCKYBLOCK_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/lucky_block.lua"
local COLORORDIE_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/color_or_die.lua"
local function cleanupAll()
    local names = {"SqwssHub", "ObbyHub", "MinimalistHub"}
    for _, name in ipairs(names) do
        if CoreGui:FindFirstChild(name) then CoreGui[name]:Destroy() end
        if localPlayer:WaitForChild("PlayerGui"):FindFirstChild(name) then 
            localPlayer.PlayerGui[name]:Destroy() 
        end
    end
end
cleanupAll()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SqwssHub"
ScreenGui.ResetOnSpawn = false
local parent = (game:GetService("RunService"):IsStudio() or not pcall(function() local x = CoreGui.Name end)) and localPlayer:WaitForChild("PlayerGui") or CoreGui
ScreenGui.Parent = parent
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 46, 0, 46)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -23)
ToggleButton.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "★"
ToggleButton.TextColor3 = Color3.fromRGB(240, 240, 245)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 22
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui
local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(0.5, 0)
TBCorner.Parent = ToggleButton
local TBStroke = Instance.new("UIStroke")
TBStroke.Color = Color3.fromRGB(48, 50, 60)
TBStroke.Thickness = 1.5
TBStroke.Parent = ToggleButton
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 460, 0, 320)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(40, 42, 52)
MainStroke.Thickness = 1.2
MainStroke.Parent = MainFrame
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame
local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 10)
SidebarCorner.Parent = Sidebar
local SidebarPatch = Instance.new("Frame")
SidebarPatch.Size = UDim2.new(0, 15, 1, 0)
SidebarPatch.Position = UDim2.new(1, -15, 0, 0)
SidebarPatch.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
SidebarPatch.BorderSizePixel = 0
SidebarPatch.Parent = Sidebar
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(0, 1, 1, 0)
Separator.Position = UDim2.new(1, 0, 0, 0)
Separator.BackgroundColor3 = Color3.fromRGB(40, 42, 52)
Separator.BorderSizePixel = 0
Separator.Parent = Sidebar
local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(1, 0, 0, 50)
Logo.BackgroundTransparency = 1
Logo.Text = "SQWSS HUB"
Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 14
Logo.Parent = Sidebar
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 1, -55)
TabContainer.Position = UDim2.new(0, 0, 0, 50)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = Sidebar
local TabList = Instance.new("UIListLayout")
TabList.Parent = TabContainer
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 4)
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -145, 1, -15)
ContentArea.Position = UDim2.new(0, 137, 0, 10)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame
local dragToggle = nil
local dragStart = nil
local startPos = nil
local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(MainFrame, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Position = position}):Play()
end
MainFrame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not UserInputService:GetFocusedTextBox() then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateInput(input)
    end
end)
local tabs = {}
local function createTab(tabName, displayName)
    local Page = Instance.new("Frame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = ContentArea
    
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, -12, 0, 30)
    TabButton.Position = UDim2.new(0, 6, 0, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(30, 31, 39)
    TabButton.BackgroundTransparency = 1
    TabButton.Text = "   " .. displayName
    TabButton.TextColor3 = Color3.fromRGB(150, 153, 162)
    TabButton.Font = Enum.Font.GothamMedium
    TabButton.TextSize = 11
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.Parent = TabContainer
    
    local TabButtonCorner = Instance.new("UICorner")
    TabButtonCorner.CornerRadius = UDim.new(0, 5)
    TabButtonCorner.Parent = TabButton
    
    local ActiveBar = Instance.new("Frame")
    ActiveBar.Size = UDim2.new(0, 3, 0.6, 0)
    ActiveBar.Position = UDim2.new(0, 4, 0.2, 0)
    ActiveBar.BackgroundColor3 = Color3.fromRGB(66, 133, 244)
    ActiveBar.BorderSizePixel = 0
    ActiveBar.Visible = false
    ActiveBar.Parent = TabButton
    
    tabs[tabName] = {Page = Page, Button = TabButton, ActiveBar = ActiveBar}
    
    TabButton.MouseButton1Click:Connect(function()
        for name, data in pairs(tabs) do
            data.Page.Visible = false
            data.Button.TextColor3 = Color3.fromRGB(150, 153, 162)
            data.Button.BackgroundTransparency = 1
            data.ActiveBar.Visible = false
        end
        Page.Visible = true
        TabButton.TextColor3 = Color3.fromRGB(66, 133, 244)
        TabButton.BackgroundTransparency = 0
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 31, 39)
        ActiveBar.Visible = true
    end)
end
createTab("Games", "Select Game")
createTab("About", "Info")
tabs["Games"].Page.Visible = true
tabs["Games"].Button.TextColor3 = Color3.fromRGB(66, 133, 244)
tabs["Games"].Button.BackgroundTransparency = 0
tabs["Games"].Button.BackgroundColor3 = Color3.fromRGB(30, 31, 39)
tabs["Games"].ActiveBar.Visible = true
local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(1, -10, 0, 32)
SearchBar.Position = UDim2.new(0, 0, 0, 0)
SearchBar.BackgroundColor3 = Color3.fromRGB(18, 19, 24)
SearchBar.BorderSizePixel = 0
SearchBar.PlaceholderText = "Search games..."
SearchBar.Text = ""
SearchBar.TextColor3 = Color3.fromRGB(240, 240, 245)
SearchBar.PlaceholderColor3 = Color3.fromRGB(100, 102, 110)
SearchBar.Font = Enum.Font.GothamMedium
SearchBar.TextSize = 12
SearchBar.Parent = tabs["Games"].Page
local SBCorner = Instance.new("UICorner")
SBCorner.CornerRadius = UDim.new(0, 6)
SBCorner.Parent = SearchBar
local SBSearchIcon = Instance.new("TextLabel")
SBSearchIcon.Size = UDim2.new(0, 30, 1, 0)
SBSearchIcon.Position = UDim2.new(1, -30, 0, 0)
SBSearchIcon.BackgroundTransparency = 1
SBSearchIcon.Text = "🔍"
SBSearchIcon.TextColor3 = Color3.fromRGB(120, 122, 130)
SBSearchIcon.Font = Enum.Font.GothamMedium
SBSearchIcon.TextSize = 12
SBSearchIcon.Parent = SearchBar
local GameScroll = Instance.new("ScrollingFrame")
GameScroll.Size = UDim2.new(1, 0, 1, -40)
GameScroll.Position = UDim2.new(0, 0, 0, 40)
GameScroll.BackgroundTransparency = 1
GameScroll.BorderSizePixel = 0
GameScroll.ScrollBarThickness = 3
GameScroll.ScrollBarImageColor3 = Color3.fromRGB(66, 133, 244)
GameScroll.Parent = tabs["Games"].Page
local GameScrollList = Instance.new("UIListLayout")
GameScrollList.Parent = GameScroll
GameScrollList.SortOrder = Enum.SortOrder.LayoutOrder
GameScrollList.Padding = UDim.new(0, 6)
local AboutTitle = Instance.new("TextLabel")
AboutTitle.Size = UDim2.new(1, 0, 0, 30)
AboutTitle.BackgroundTransparency = 1
AboutTitle.Text = "SQWSS HUB"
AboutTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AboutTitle.Font = Enum.Font.GothamBold
AboutTitle.TextSize = 18
AboutTitle.TextXAlignment = Enum.TextXAlignment.Left
AboutTitle.Parent = tabs["About"].Page
local AboutText = Instance.new("TextLabel")
AboutText.Size = UDim2.new(1, 0, 1, -40)
AboutText.Position = UDim2.new(0, 0, 0, 35)
AboutText.BackgroundTransparency = 1
AboutText.Text = "Developer / Creator:\nsqwss\n\nA collection of premium custom scripts for Roblox obby and tycoon games.\n\nAll features optimized for speed, safety, and compatibility."
AboutText.TextColor3 = Color3.fromRGB(180, 182, 190)
AboutText.Font = Enum.Font.GothamMedium
AboutText.TextSize = 13
AboutText.TextXAlignment = Enum.TextXAlignment.Left
AboutText.TextYAlignment = Enum.TextYAlignment.Top
AboutText.Parent = tabs["About"].Page
local cards = {}
local function addGameCard(gameName, desc, placeIds, url)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 64)
    Frame.BackgroundColor3 = Color3.fromRGB(26, 27, 34)
    Frame.BorderSizePixel = 0
    Frame.Parent = GameScroll
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.7, 0, 0, 26)
    Title.Position = UDim2.new(0, 10, 0, 4)
    Title.BackgroundTransparency = 1
    Title.Text = gameName
    Title.TextColor3 = Color3.fromRGB(240, 240, 245)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 12.5
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame
    
    local Description = Instance.new("TextLabel")
    Description.Size = UDim2.new(0.7, 0, 0, 30)
    Description.Position = UDim2.new(0, 10, 0, 26)
    Description.BackgroundTransparency = 1
    Description.Text = desc
    Description.TextColor3 = Color3.fromRGB(140, 142, 150)
    Description.Font = Enum.Font.GothamMedium
    Description.TextSize = 10
    Description.TextWrapped = true
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextYAlignment = Enum.TextYAlignment.Top
    Description.Parent = Frame
    
    local ExecBtn = Instance.new("TextButton")
    ExecBtn.Size = UDim2.new(0, 80, 0, 28)
    ExecBtn.Position = UDim2.new(1, -90, 0.5, -14)
    ExecBtn.BackgroundColor3 = Color3.fromRGB(66, 133, 244)
    ExecBtn.Text = "LOAD"
    ExecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecBtn.Font = Enum.Font.GothamBold
    ExecBtn.TextSize = 11
    ExecBtn.Parent = Frame
    
    local ECorner = Instance.new("UICorner")
    ECorner.CornerRadius = UDim.new(0, 4)
    ECorner.Parent = ExecBtn
    
    local isCurrent = false
    for _, id in ipairs(placeIds) do
        if game.PlaceId == id then
            isCurrent = true
            break
        end
    end
    
    if isCurrent then
        Frame.BackgroundColor3 = Color3.fromRGB(34, 38, 52)
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Color3.fromRGB(66, 133, 244)
        Stroke.Thickness = 1
        Stroke.Parent = Frame
        
        Title.TextColor3 = Color3.fromRGB(66, 133, 244)
        Title.Text = "★ " .. gameName
    end
    
    ExecBtn.MouseButton1Click:Connect(function()
        cleanupAll()
        loadstring(game:HttpGet(url))()
    end)
    
    table.insert(cards, {Frame = Frame, Title = gameName})
end
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local q = string.lower(SearchBar.Text)
    for _, card in ipairs(cards) do
        if string.find(string.lower(card.Title), q) then
            card.Frame.Visible = true
        else
            card.Frame.Visible = false
        end
    end
end)
addGameCard("Become a Wallhop Pro Obby", "Auto Pass 94 Stages, Stage Teleport, WalkSpeed, JumpPower, InfJump.", {74171266895367}, OBBY_URL)
addGameCard("Wall Hop for Brainrots!", "Fly, Platform Spawner, Infinite Jump, Auto Sell, Auto Rebirth, Smart Platforms Teleports.", {138154148141430}, BRAINROTS_URL)
addGameCard("Kick a Lucky Block", "Fly, Platform Spawner, Infinite Jump, Speed, Auto Sell, Auto Rebirth.", {89469502395769}, LUCKYBLOCK_URL)
addGameCard("Color or Die 🎨", "Item ESP (Paint, Brushes, Tools), Monster Highlight, Teleports, Speed, Jump, Fly, Noclip.", {12931609417}, COLORORDIE_URL)
local guiVisible = true
local function toggleGui()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    ToggleButton.Text = guiVisible and "★" or "☰"
end
ToggleButton.MouseButton1Click:Connect(toggleGui)
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed then
        if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.RightShift then
            toggleGui()
        end
    end
end)
