local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local localPlayer = Players.LocalPlayer
while not localPlayer do
    task.wait()
    localPlayer = Players.LocalPlayer
end
local OBBY_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/wallhop_pro.lua"
local BRAINROTS_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/wallhop_brainrot.lua"
local LUCKYBLOCK_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/lucky_block.lua"
local COLORORDIE_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/color_or_die.lua"
local MM2_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/mm2_hub.lua"
local FLING_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/fling_gui.lua"
local CANDY_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/candy_chocolate.lua"
local JETPACK_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/jetpack_hub.lua"
local CROSSRIVERS_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/cross_rivers.lua"
local SHARP_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/sharp_hub.lua"
local JUMPSKY_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/jump_sky.lua"
local HOSPITAL_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/hospital_hub.lua"
local BRAINROTHEAD_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/brainrot_head_hub.lua"
local GLIDELUCKYBLOCK_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/glide_lucky_block_hub.lua"
local TELEPORT_URL = "https://raw.githubusercontent.com/sqwssd/RobloxScripts/main/teleport_gui.lua"
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
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Sqwss Hub | Game Launcher",
    SubTitle = "by sqwss",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift
})
local Tabs = {
    Launcher = Window:AddTab({ Title = "Games", Icon = "gamepad" }),
    About = Window:AddTab({ Title = "About", Icon = "info" })
}
local function addGameLauncher(name, desc, placeIds, url)
    local isCurrent = false
    for _, id in ipairs(placeIds) do
        if game.PlaceId == id then
            isCurrent = true
            break
        end
    end
    local titleText = name
    if isCurrent then
        titleText = "★ " .. name .. " (Current Game)"
    end
    Tabs.Launcher:AddParagraph({
        Title = titleText,
        Content = desc
    })
    Tabs.Launcher:AddButton({
        Title = "Load " .. name,
        Description = "Injects the premium script for " .. name,
        Callback = function()
            Fluent:Destroy()
            loadstring(game:HttpGet(url))()
        end
    })
end
-- Populate launcher
addGameLauncher("Become a Wallhop Pro Obby", "Auto Pass 94 Stages, Stage Teleport, WalkSpeed, JumpPower, InfJump.", {74171266895367}, OBBY_URL)
addGameLauncher("Wall Hop for Brainrots!", "Fly, Platform Spawner, Infinite Jump, Auto Sell, Auto Rebirth, Smart Platforms Teleports.", {138154148141430}, BRAINROTS_URL)
addGameLauncher("Kick a Lucky Block", "Fly, Platform Spawner, Infinite Jump, Speed, Auto Sell, Auto Rebirth.", {89469502395769}, LUCKYBLOCK_URL)
addGameLauncher("Color or Die 🎨", "Item ESP (Paint, Brushes, Tools), Monster Highlight, Teleports, Speed, Jump, Fly, Noclip.", {12931609417}, COLORORDIE_URL)
addGameLauncher("Murder Mystery 2 ⚔️", "ESP (Murderer, Sheriff, Dropped Gun), Teleports, Auto-Hit Murderer (Silent Aim), Kill All.", {142823291}, MM2_URL)
addGameLauncher("Universal Fling Tool 🌀", "Select players from an auto-updating list and fling them out of the map.", {}, FLING_URL)
addGameLauncher("Candy & Chocolate 🍬", "Speed modifier, Jump Power modifier, Dynamic teleports to Stages 1-15, Auto Rebirth, Auto Claim Gifts.", {95082159892680}, CANDY_URL)
addGameLauncher("+1 Jetpack for Brainrots 🚀", "Auto Collect Flying Coins, Auto Collect Tycoon Cash, Auto Upgrades (Base, Slots, Backpack), Auto Rebirth, Fly, Teleports.", {80234914611737}, JETPACK_URL)
addGameLauncher("Cross Rivers for Brainrots! 🌊", "Auto Grab & Sell Brainrots (Teleport Farm), Auto Buy Pads, Auto Rebirth, Auto Slap Bat Aura, Fly, Teleports.", {71213902019049}, CROSSRIVERS_URL)
addGameLauncher("[🌴] SHARP ⚔️", "Silent Aim (Head/Torso/Random), Chams/2D Boxes/Tracers ESP, Auto Grab & Deliver Flags (Flag Farm), Speed, Jump, Fly, Bhop.", {113506071094099, 105834187369271}, SHARP_URL)
addGameLauncher("Jump to Sky for Brainrots! 🌥️", "Teleport to Floor 1-10, Teleport to Base, Auto Farm (vacuum spawned brainrots), WalkSpeed, JumpPower, Fly, Noclip.", {78138186882190}, JUMPSKY_URL)
addGameLauncher("The Animal Hospital 🏥", "Auto Solve Heartbeat Minigames, Universal Entity ESP (highlight players/ghosts/NPCs), Room Teleports, Speed, Jump, Fly.", {104522435597696}, HOSPITAL_URL)
addGameLauncher("[🇺🇸] Inside Brainrot Head 🧠", "Teleport Inside Head, Auto Teleport to Base on Grab, Auto Vacuum Spawned Items, Auto Respawn, Auto Tycoon Collect/Rebirth, Fly.", {105633123928294}, BRAINROTHEAD_URL)
addGameLauncher("[NEW] Glide a Lucky Block 🛹", "Auto Throw Training, Auto Weight Training, Auto Sell, Auto Rebirth, Auto Claim Rewards, Zone Teleports, Fly.", {112407765979827}, GLIDELUCKYBLOCK_URL)
addGameLauncher("Universal Teleport Tool 🌀", "Teleport to players from an auto-updating list, set custom coordinates, save waypoints, and noclip.", {}, TELEPORT_URL)
-- About Info
Tabs.About:AddParagraph({
    Title = "SQWSS HUB Launcher",
    Content = "Developer / Creator: sqwss\n\nA collection of premium custom scripts for Roblox obby and tycoon games.\n\nAll features optimized for speed, safety, and compatibility."
})
