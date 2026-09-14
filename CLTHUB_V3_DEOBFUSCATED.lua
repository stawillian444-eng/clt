--[[
  CLTHUB V3 - DEOBFUSCATED (best-effort)
  =====================================
Desobfuscated by @zxbest9
Please give me credit.

Faz o L tripa
]]

if not game:IsLoaded() then game.Loaded:Wait() end


getgenv = getgenv or function() return _G end
getrenv = getrenv or function() return getfenv(0) end
cloneref = cloneref or function(inst) return inst end
clonefunction = clonefunction or function(v182) return v182 end

local function safeGetService(v1261)
  local ok, svc = pcall(function() return game:GetService(v1261) end)
  if ok and svc then return svc end
  return nil
end

local PlayersService = safeGetService("Players") or game:GetService("Players")
local LocalPlayer = PlayersService.LocalPlayer or (PlayersService:GetPropertyChangedSignal("LocalPlayer"):Wait() and PlayersService.LocalPlayer)
UIS = safeGetService("UserInputService") or game:GetService("UserInputService")
RunService = safeGetService("RunService") or game:GetService("RunService")
Stats = safeGetService("Stats") or game:GetService("Stats")
TweenService = safeGetService("TweenService") or game:GetService("TweenService")
HttpService = safeGetService("HttpService") or game:GetService("HttpService")
ReplicatedStorage = safeGetService("ReplicatedStorage") or game:GetService("ReplicatedStorage")
Workspace = safeGetService("Workspace") or game:GetService("Workspace")
Lighting = safeGetService("Lighting") or game:GetService("Lighting")
TeleportService = safeGetService("TeleportService") or game:GetService("TeleportService")
CoreGui = safeGetService("CoreGui")
VirtualInputManager = safeGetService("VirtualInputManager")


function getUIContainer()
  if typeof(gethui) == "function" then
  local ok, guiParent = pcall(gethui)
  if ok and guiParent then return guiParent end
  end
  if CoreGui then
  local v1206 = pcall(function()
  local tmpInst = Instance.new("Folder")
  tmpInst.Parent = CoreGui
  tmpInst:Destroy()
  end)
  if v1206 then return CoreGui end
  end
  return CoreGui
end


local httpRequest = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or function(...) return {StatusCode = 500, Body = ""} end
getgenv().request = httpRequest
getgenv().http_request = httpRequest


local setClip = setclipboard or toclipboard or (syn and syn.write_clipboard) or function(...) end
getgenv().setclipboard = setClip
getgenv().toclipboard = setClip


local v1245 = queue_on_teleport or (syn and syn.queue_on_teleport) or queueonteleport or (fluxus and fluxus.queue_on_teleport) or function(...) end
getgenv().queue_on_teleport = v1245


if not firetouchinterest then
  getgenv().firetouchinterest = function(v941, v942, v1285)
  if not v941 or not v942 then return end
  pcall(function()
  if typeof(firetouch) == "function" then
  firetouch(v941, v942, v1285 or 0)
  end
  end)
  end
end


pcall(function()
  local v990 = setfpscap or set_fps_cap
  if v990 then v990(999) end
end)


function makeOneWay(v376)
  if not v376 then return end
  local v737
  local v574 = nil
  v737 = game:GetService("RunService").Stepped:Connect(function()
  if not v376 or not v376.Parent then
  if v737 then v737:Disconnect() end
  return
  end
  local character = game.Players.LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v357 = v22.Position.Y
  if not v574 then v574 = v357 end

  local v857 = v357 - v574
  local v1175 = (v22.AssemblyLinearVelocity.Y > 1) or (v857 > 0.01 and v857 < 5)

  if v1175 then
  v376.CanCollide = false
  else
  if v357 > v376.Position.Y + 0.1 then
  v376.CanCollide = true
  else
  v376.CanCollide = false
  end
  end

  v574 = v357
  end
  end)
end


if typeof(getgenv) == "function" and not getgenv()["LPH_NO_" .. "VIRTUALIZE"] then
  getgenv()["LPH_NO_" .. "VIRTUALIZE"] = function(v182) return v182 end
end


_G.__CLTHUBBootT0 = _G.__CLTHUBBootT0 or os.clock()
function bootMark(v81)
  if _G.CLTHUB_BOOT_DEBUG then
  print(("[CLTHUB boot] %7.0f ms  %s"):format((os.clock() - _G.__CLTHUBBootT0) * 1000, tostring(v81)))
  end
end
bootMark("script start")

_G.__CLTHUBLazyQ = _G.__CLTHUBLazyQ or {}
function LazyInit(v30, v182)
  table.insert(_G.__CLTHUBLazyQ, { name = v30, fn = v182 })
end
task.defer(LPH_NO_VIRTUALIZE(function()
  while true do
  if #_G.__CLTHUBLazyQ > 0 then
  local v61 = table.remove(_G.__CLTHUBLazyQ, 1)
  local ok, v1110 = pcall(v61.fn)
  if not ok then warn("[CLTHUB Lazy]", v61.name, v1110) end
  task.wait(0.08)
  else
  task.wait(0.5)
  end
  end
end))


_G._CLTHUBPanelVis = _G._CLTHUBPanelVis or {}

_G.lazyUIs = {}
_G.addLazyUI = function(v409, v337, v912, v214)
  if v409 then
  if v912 then
  v409.Enabled = false
  else
  v409.Visible = false
  end
  table.insert(_G.lazyUIs, {element = v409, targetVis = v337, isScreenGui = v912, cancelled = false, panelName = v214})
  end
end
_G.cancelLazyUI = function(v409)
  for idx, v61 in ipairs(_G.lazyUIs) do
  if v61.element == v409 then
  v61.cancelled = true
  break
  end
  end
end
task.delay(4.0, function()
  for idx, v61 in ipairs(_G.lazyUIs) do
  if v61.element and not v61.cancelled then
  local v393
  if v61.panelName then

  local v324 = _G._CLTHUBPanelVis[v61.panelName]
  if v324 ~= nil then
  v393 = v324
  elseif Config and Config.Visibilities then
  local v967 = Config.Visibilities[v61.panelName]
  if v967 ~= nil then v393 = v967 else v393 = true end
  else
  v393 = v61.targetVis
  end
  else
  v393 = v61.targetVis
  end
  if v61.isScreenGui then
  pcall(function() v61.element.Enabled = v393 end)
  elseif v61.element.Parent then
  pcall(function() v61.element.Visible = v393 end)
  end
  end
  end
end)

player = PlayersService.LocalPlayer
playerGui = player:WaitForChild("PlayerGui")
pcall(function() PlayersService.RespawnTime = 0 end)


GlobalUIScaleVal = 1


scaledGuis = setmetatable({}, { __mode = "k" })

function getGlobalScale()
  return GlobalUIScaleVal
end

function updateAllGuisScale(v425)
  GlobalUIScaleVal = v425
  for v98, v154 in pairs(scaledGuis) do
  pcall(function()
  if v98 and v98.Parent and v154 and v154.Parent then
  local v201 = v154:FindFirstChild("CLTHUB_GlobalScale")
  if v201 then
  v201.Scale = v425
  end
  v154.Size = UDim2.new(1 / v425, 0, 1 / v425, 0)
  end
  end)
  end
end

function registerScreenGui(v98)
  local v154 = v98:FindFirstChild("CLTHUB_MasterFrame")
  if not v154 then
  v154 = Instance.new("Frame")
  v154.Name = "CLTHUB_MasterFrame"
  v154.BackgroundTransparency = 1
  v154.BorderSizePixel = 0
  v154.Parent = v98

  local v201 = Instance.new("UIScale")
  v201.Name = "CLTHUB_GlobalScale"
  v201.Parent = v154
  end
  scaledGuis[v98] = v154

  pcall(function()
  local v201 = v154:FindFirstChild("CLTHUB_GlobalScale")
  if v201 then
  v201.Scale = GlobalUIScaleVal
  end
  v154.Size = UDim2.new(1 / GlobalUIScaleVal, 0, 1 / GlobalUIScaleVal, 0)
  end)
  return v154
end


MenuScaleMult = 1
MENU_SCALE_MIN, MENU_SCALE_MAX = 1, 5

function getMenuScaleMult()
  local v87 = MenuScaleMult
  if type(v87) ~= "number" then v87 = 1 end
  return math.clamp(v87, MENU_SCALE_MIN, MENU_SCALE_MAX)
end

function setMenuScale(v26, v1257)
  v26 = math.clamp(tonumber(v26) or 1, MENU_SCALE_MIN, MENU_SCALE_MAX)
  MenuScaleMult = v26
  if not v1257 and Config then
  Config.MenuScale = v26
  if saveConfig then pcall(saveConfig) end
  end
  if recalculateScale then pcall(recalculateScale) end
  return v26
end
_G.setMenuScale = setMenuScale

function recalculateScale()
  local v296 = Workspace.CurrentCamera
  if not v296 then return end
  local v602 = v296.ViewportSize
  local v52 = v602.Y

  local v425 = math.clamp(v52 / 800, 0.65, 1.0)
  updateAllGuisScale(v425 * getMenuScaleMult())
end

function setupCameraListener()
  if cameraConn then pcall(function() cameraConn:Disconnect() end) end
  local v296 = Workspace.CurrentCamera
  if v296 then
  cameraConn = v296:GetPropertyChangedSignal("ViewportSize"):Connect(recalculateScale)
  recalculateScale()
  end
end
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(setupCameraListener)
task.spawn(setupCameraListener)

local v931 = getUIContainer()
local v484 = v931 and v931:FindFirstChild("CLTHUBHub_V3"); if v484 then v484:Destroy() end
gui_sg = Instance.new("ScreenGui"); gui_sg.Name = "CLTHUBHub_V3"; gui_sg.ResetOnSpawn = false; gui_sg.IgnoreGuiInset = true; gui_sg.DisplayOrder = 2147483647; gui_sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() gui_sg.Parent = getUIContainer() end)
gui = registerScreenGui(gui_sg)


ToggleState = {}
function regToggle(v30, v358)
  if not ToggleState[v30] then ToggleState[v30] = {value = v358 or false, listeners = {}} end
end
function getToggle(v30) return ToggleState[v30] and ToggleState[v30].value or false end
function setToggle(v30, v66, v1256)
  regToggle(v30)
  ToggleState[v30].value = v66
  if not v1256 then
  for idx, v182 in ipairs(ToggleState[v30].listeners) do pcall(v182, v66) end
  end
end
function onToggleChanged(v30, v182)
  regToggle(v30); table.insert(ToggleState[v30].listeners, v182)
end


local Config


Themes = {
  Nexus = {
  Background=Color3.fromRGB(18, 18, 24), MainBackground=Color3.fromRGB(18, 18, 24),
  SidebarBg=Color3.fromRGB(18, 18, 24), ContentBg=Color3.fromRGB(18, 18, 24),
  SidebarActive=Color3.fromRGB(15, 15, 20), SidebarActiveText=Color3.fromRGB(238, 238, 245),
  SidebarInactiveText=Color3.fromRGB(150, 150, 165),
  Panel=Color3.fromRGB(15, 15, 20), Row=Color3.fromRGB(15, 15, 20), RowHover=Color3.fromRGB(25, 25, 30),
  Accent=Color3.fromRGB(0, 85, 255), AccentLight=Color3.fromRGB(50, 120, 255),
  Green=Color3.fromRGB(46, 190, 88), Red=Color3.fromRGB(200, 60, 60), Red2=Color3.fromRGB(200, 60, 60),
  Text=Color3.fromRGB(238, 238, 245), Dim=Color3.fromRGB(150, 150, 165), Stroke=Color3.fromRGB(18, 18, 24),
  SoftButton=Color3.fromRGB(15, 15, 20), SoftButtonHover=Color3.fromRGB(25, 25, 30),
  SoftAccent=Color3.fromRGB(15, 15, 20), SoftAccentHover=Color3.fromRGB(25, 25, 30),
  ToggleOn=Color3.fromRGB(0, 85, 255), ToggleOff=Color3.fromRGB(15, 15, 20), ToggleOff2=Color3.fromRGB(15, 15, 20),
  ToggleKnobOn=Color3.fromRGB(238, 238, 245), ToggleKnobOff=Color3.fromRGB(150, 150, 165),
  InputBg=Color3.fromRGB(10, 10, 14), SliderBg=Color3.fromRGB(25, 25, 30), SliderFill=Color3.fromRGB(0, 85, 255),
  BlacklistHover=Color3.fromRGB(200, 60, 60), BlacklistLeave=Color3.fromRGB(15, 15, 20),
  }
}
Theme = {}
for v75, v26 in pairs(Themes.Nexus) do
  Theme[v75] = v26
end

UIFont = {
  Brand = Enum.Font.GothamBold,
  Title = Enum.Font.GothamBold,
  Body = Enum.Font.GothamBold,
  Label = Enum.Font.GothamBold,
  Button = Enum.Font.GothamBold,
  Small = Enum.Font.GothamBold,
}

UITransparency = {
  MainPanel = 0.04,
  Sidebar = 0.02,
  Content = 0.05,
  Panel = 0.06,
  BottomBar = 0.08,
  Button = 0.08,
  MainButton = 0.10,
  Row = 0.14,
  RowAlt = 0.20,
  SoftRow = 0.12,
  Input = 0.10,
  Toggle = 0,
  Hud = 0.20,
  Alert = 0.24,
  Progress = 0.20,
  ConfigPanel = 0.06,
  SidebarTab = 0.12,
  TargetRow = 0.16,
  TargetRowAlt = 0.30,
  Dropdown = 0.04,
  Outline = 0,
  Avatar = 0.18,
  AdminRow = 0.35,
}

function applyTheme(v759)
  local v878 = {}
  for v75, v26 in pairs(Theme) do
  v878[v75] = v26
  end

  local v127 = Themes[v759] or Themes.Nexus
  for v75, v26 in pairs(v127) do
  Theme[v75] = v26
  end


  local function v614(v49, v701)
  if not v49 then return end
  v49.BackgroundColor3 = v701 and v127.MainBackground or v127.Background
  for idx, v24 in ipairs(v49:GetChildren()) do
  if v24:IsA("UIStroke") then
  v24.Color = v24.Name == "CLTHUBBlueOutline" and v127.Accent or v127.Stroke
  elseif v24:IsA("Frame") then
  if v24.Size == UDim2.new(1,-24,0,1) then
  v24.BackgroundColor3 = v127.AccentLight
  elseif v24.BackgroundTransparency == 1 and v24.Size == UDim2.new(1,0,0,42) then
  for idx, v436 in ipairs(v24:GetChildren()) do
  if v436:IsA("TextLabel") then
  if v436.TextSize == 16 or v436.TextSize == 12 then
  v436.TextColor3 = v127.Text
  elseif v436.TextSize == 10 then
  v436.TextColor3 = v127.Dim
  end
  end
  end
  end
  end
  end
  end


  local function v1284()
  if not bottomBar then return end
  bottomBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  for idx, v24 in ipairs(bottomBar:GetChildren()) do
  if v24:IsA("UIStroke") then
  v24.Color = v127.Stroke
  elseif v24:IsA("TextLabel") then
  if v24.Name == "BrandTitle" then
  v24.TextColor3 = v127.Text
  elseif v24.Name == "BrandSep" or v24.Name == "BrandDiscord" then
  v24.TextColor3 = v127.Dim
  end
  elseif v24:IsA("Frame") then
  if v24.Name == "BottomBarDiv" or v24.Size == UDim2.new(0,1,0,36) or v24.Size == UDim2.new(0,1,0,28) then
  v24.BackgroundColor3 = v127.Stroke
  end
  end
  end
  local v1024 = bottomBar:FindFirstChild("TopInfo")
  if v1024 then
  for idx, v24 in ipairs(v1024:GetChildren()) do
  if v24:IsA("TextLabel") then
  if v24.Name == "BrandTitle" then v24.TextColor3 = v127.Text
  elseif v24.Name == "BrandSep" or v24.Name == "BrandDiscord" then v24.TextColor3 = v127.Dim end
  end
  end
  end
  if fpsText then fpsText.TextColor3 = Color3.fromRGB(238, 238, 245) end
  if main then
  local v981 = main:FindFirstChild("Sidebar")
  if v981 then v981.BackgroundColor3 = v127.SidebarBg or Color3.fromRGB(0,0,0) end
  local v844 = main:FindFirstChild("ContentBg")
  if v844 then
  v844.BackgroundColor3 = v127.ContentBg or v127.MainBackground
  end
  end
  if sidebarProfile then
  for idx, v24 in ipairs(sidebarProfile:GetChildren()) do
  if v24:IsA("TextLabel") then
  if v24.Name == "ProfileName" then v24.TextColor3 = v127.Text
  elseif v24.Name == "ProfileHandle" then v24.TextColor3 = v127.Dim end
  end
  end
  end
  if _G.styleSidebarTabs and UI and UI.CurrentTab then pcall(_G.styleSidebarTabs, UI.CurrentTab) end
  end


  local function v1282()
  if not apBG then return end
  apBG.BackgroundTransparency = 1
  for v76, v31 in pairs(apRows) do
  if v31 and v31.Parent then
  v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v31.BackgroundTransparency = 0.15
  for idx, v24 in ipairs(v31:GetChildren()) do
  if v24:IsA("Frame") then
  if v24.Size == UDim2.fromOffset(34,34) then
  v24.BackgroundTransparency = 1
  local v993 = v24:FindFirstChildOfClass("UIStroke")
  if v993 then v993.Transparency = 1 end
  elseif v24.ZIndex == 12 then
  for idx, v39 in ipairs(v24:GetChildren()) do
  if v39:IsA("TextButton") then
  v39.BackgroundTransparency = 1
  end
  end
  end
  elseif v24:IsA("TextLabel") then
  if v24.TextSize == 14 then
  v24.TextColor3 = v127.Text
  elseif v24.TextSize == 10 then
  v24.TextColor3 = v127.Dim
  elseif v24.TextSize == 11 then
  v24.TextColor3 = v127.AccentLight
  end
  end
  end
  end
  end
  end


  pcall(function()
  v614(main, true)
  v1284()
  v1282()
  for idx, v30 in ipairs({"Invisible Steal Panel", "Admin Command Painel", "Command Cooldowns", "Actions", "Steal Panel", "Steal Target"}) do
  v614(panels[v30], false)
  end
  v614(actionSettingsPanel, false)
  v614(tpSpeedSettingsPanel, false)
  end)


  local function v613(v45)
  local v597 = true
  if v45:IsA("GuiObject") or v45:IsA("UIStroke") then

  if mainBody and v45:IsDescendantOf(mainBody) then return end


  if v45 == main or v45 == bottomBar or v45 == apBG then
  v597 = false
  end
  for idx, v23 in ipairs({"Invisible Steal Panel", "Admin Command Painel", "Command Cooldowns", "Actions", "Steal Panel", "Steal Target"}) do
  if v45 == panels[v23] then
  v597 = false
  end
  end
  if v45 == actionSettingsPanel or v45 == tpSpeedSettingsPanel then
  v597 = false
  end

  if v597 then
  local v1083 = {
  Background=true, MainBackground=true, SidebarBg=true, ContentBg=true, SidebarActive=true,
  Panel=true, Row=true, RowHover=true,
  SoftButton=true, SoftButtonHover=true, SoftAccent=true, SoftAccentHover=true,
  ToggleOn=true, ToggleOff=true, ToggleOff2=true, InputBg=true, SliderBg=true,
  BlacklistHover=true, BlacklistLeave=true
  }
  local v758 = {
  Text=true, Dim=true, Accent=true, AccentLight=true, SidebarActiveText=true, SidebarInactiveText=true,
  Green=true, Red=true, Red2=true, Stroke=true,
  ToggleKnobOn=true, ToggleKnobOff=true
  }
  local v1243 = {
  BackgroundColor3 = v1083,
  TextColor3 = v758,
  PlaceholderColor3 = v758,
  Color = v758
  }

  for v335, v1078 in pairs(v1243) do
  pcall(function()
  local v181 = v45[v335]
  if typeof(v181) == "Color3" then

  if v335 == "TextColor3" and v45.Name == "WhiteTextBtn" then
  return
  end
  if v335 == "BackgroundColor3" and v45.Name == "WhiteSliderKnob" then
  return
  end
  for v75, v66 in pairs(v878) do
  if v1078[v75] then
  if (v181.R - v66.R)^2 + (v181.G - v66.G)^2 + (v181.B - v66.B)^2 < 0.0001 then
  v45[v335] = v127[v75]
  break
  end
  end
  end
  end
  end)
  end
  end
  end
  for idx, v24 in ipairs(v45:GetChildren()) do
  v613(v24)
  end
  end

  pcall(function()
  local v98 = playerGui:FindFirstChild("CLTHUBHub_V3")
  if v98 then v613(v98) end
  if _G.updateLogoImage then
  _G.updateLogoImage(v759 ~= "Light")
  end
  end)
  pcall(function()
  local v57 = (gethui and gethui()) or game:GetService("CoreGui")
  local v98 = v57:FindFirstChild("XiPriorityAlertTest")
  if v98 then v613(v98) end
  end)
  for idx, v30 in ipairs({"CLTHUB_RemoteSell", "CLTHUB_StealProgressBar", "XiAdminPanel"}) do
  pcall(function()
  local v945 = playerGui:FindFirstChild(v30)
  if v945 then v613(v945) end
  end)
  end


  local function v874(v45)
  if v45:IsA("TextButton") then
  local v95 = v45.Text
  if v95 == "ON" or v95 == "OFF" or v95 == "ADD" or v95 == "X" or v95 == "▲" or v95 == "▼" then
  if v45.Name == "SyncStateBtn" then
  v45.TextColor3 = Color3.new(1, 1, 1)
  else
  v45.TextColor3 = Color3.new(1, 1, 1)
  end
  elseif v45.Size == UDim2.new(0, 50, 0, 20) then
  v45.TextColor3 = Color3.new(1, 1, 1)
  end
  elseif v45:IsA("Frame") and v45.Name == "WhiteSliderKnob" then
  v45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  end
  for idx, v24 in ipairs(v45:GetChildren()) do
  v874(v24)
  end
  end

  pcall(function()
  local v98 = playerGui:FindFirstChild("CLTHUBHub_V3")
  if v98 then v874(v98) end
  end)

  if Config then
  Config.DarkMode = (v759 == "Dark")
  if saveConfig then saveConfig() end
  end


  if apRows then
  for v76, v31 in pairs(apRows) do
  if v31 and v31.Parent then
  v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v31.BackgroundTransparency = 0.15
  end
  end
  end

  pcall(function() if rebuildActions then rebuildActions() end end)
  pcall(function() if rebuildActionSettings then rebuildActionSettings() end end)
  pcall(function() if rebuildTpSpeedSettings then rebuildTpSpeedSettings() end end)
  pcall(function() if loadTab then loadTab(UI.CurrentTab) end end)
end
_G.applyTheme = applyTheme

UI = {Locked=false, OpenMenuKey=Enum.KeyCode.LeftControl, CurrentTab="MainMenu"}

Keybinds = {
  Kick="Y",Clone="F",["Manual TP"]="T",["Invisible Steal"]="U",
  Proximity="P",["Carpet Boost"]="Q",["Open Menu"]="LeftControl",
  ["Ragdoll Self"]="R",Float="Z",Reset="X",["Auto Buy"]="K",
  ["Click to AP"]="NONE"
}

priorityList = {
  "Headless Horseman",
  "Signore Carapace",
  "Strawberry Elephant",
  "John Pork",
  "Meowl",
  "Griffin",
  "Skibidi Toilet",
  "Arcadragon",
  "Love Love Bear",
  "Elefanto Frigo",
  "Antonio",
  "Dragon Gingerini",
  "Kalika Bros",
  "Dragon Aquanini",
  "La Supreme Combinasion",
  "Digi Narwhal",
  "Fishino Clownino",
  "Kraken",
  "Tirilikalika Tirilikalako",
  "Ginger Gerat",
  "Hydra Bunny",
  "Pancake and Syrup",
  "Hydra Dragon Cannelloni",
  "Dragon Cannelloni",
  "Venuspino",
  "Bunny and Eggy",
  "Rico Dinero",
  "Dug dug dug",
  "Jelly Moby",
  "Ketupat Bros",
  "Duggy Bros",
  "La Casa Boo",
  "Los Hackers",
  "Cerberus",
  "Rosey and Teddy",
  "Foxini Lanternini",
  "Globa Steppa",
  "Spooky and Pumpky",
  "Cooki and Milki",
  "Quackini Snackini",
  "Reinito Sleighito",
  "Popcuru and Fizzuru",
  "Capitano Moby",
  "Burguro and Fryuro",
  "Garama and Madundung",
  "Fragrama and Chocrama",
  "Ketchuru and Musturu",
  "La Secret Combinasion",
  "Tralaledon",
  "Tictac Sahur",
  "Ketupat Kepat",
  "Tang Tang Keletang",
  "Orcaledon",
  "La Ginger Sekolah",
  "Los Spaghettis",
  "Lavadorito Spinito",
  "Swaggy Bros",
  "La Taco Combinasion",
  "Los Primos",
  "Los Chillis",
  "Chillin Chili",
  "Chipso and Queso",
  "Guest 666",
  "Fragola La La La",
  "Los Sekolahs",
  "Los Tacoritas",
  "Los Amigos",
  "Fortunu and Cashuru",
  "Jolly Jolly Sahur",
  "Boppin Bunny",
  "Gym Bros",
  "Festive 67",
  "Celularcini Viciosini",
  "Cloverat Clapat",
  "La Food Combinasion",
  "Hopilikalika Hopilikalako",
  "Celestial Pegasus",
  "Sammyni Fattini",
  "Money Money Bros",
  "Cash or Card",
  "Lovin Rose",
  "Los Jolly Combinasionas",
  "La Romantic Grande",
  "La Easter Grande",
  "Los Hotspotsitos",
  "Rosetti Tualetti",
  "Los Bros",
  "Gobblino Uniciclino",
  "La Extinct Grande",
  "Las Sis",
  "Nacho Spyder",
  "Los Mariachis",
  "Eviledon",
  "La Lucky Grande",
  "Ventoliero Pavonero",
  "Los Puggies",
  "Los Admins",
  "Los Secret Combinasionas",
  "Moby Bros",
  "Noo my Examen",
  "Abyssaloco",
  "Coco and Mango",
  "Los Tangcitos",
  "Gold Gold Gold",
  "La Anniversary Grande",
  "Steakini Fattini",
  "Caylusaurus",
  "Los Tictacs",
  "Spaghetti Tualetti",
  "Grabatron",
  "Examen Bros",
  "Bearito Cabinito",
  "Capitano Americano",
  "Rubrikiko",
  "Rubiko and Kubiko",
  "Sammyni Cakini",
  "Noodle Noodle Poodle",
  "Cangurato Gelato",
  "Pizza and Ranch"
}

actionConfig = {
  ["Proximity"]=true,
  ["Ragdoll Self (R)"]=true,["Rejoin PS"]=true,["Rejoin"]=true,
  ["Kick (Y)"]=true,["Kick To Private"]=true,
}


CONFIG_FILE = "CLTHUB_hub_v3_config.json"
PS_CODE_FILE = "CLTHUB_hub_pscode.txt"
PrivateServerCode = ""

function loadPSCode()
  pcall(function() if typeof(readfile)=="function" and typeof(isfile)=="function" and isfile(PS_CODE_FILE) then PrivateServerCode = readfile(PS_CODE_FILE) end end)
end
function savePSCode()
  pcall(function() if typeof(writefile)=="function" then writefile(PS_CODE_FILE, PrivateServerCode or "") end end)
end
loadPSCode()

Config = {
  positions={},keybinds={},actions={},locked=false,
  DarkMode=false,
  AntiRagdoll=true,InfiniteJump=false,Float=false,
  DarkTheme=false,DarkThemeIntensity=50,
  AutoResetBalloon=false,AutoKickOnSteal=false,KickToPrivateServer=false,CleanErrorGUIs=false,
  LineToBase=false,LineToBrainrot=false,InvisStealAngle=180,SinkSliderValue=8,AutoRotateInvis=false,
  AutoRecoverLagback=true,
  WalkSpeedEnabled=false, WalkSpeedValue=20,
  AutoTPPriority=true, AutoTPHighestGen=false, AutoTPHighestValue=false, FPSBoost=false, FPSBoostUltra=false, FPSCap=0,
  WaitTimeBeforeTP=0, ActionDelay=0.5,
  XRay=false, FOV=70,
  BrainrotESP=false, TimerESP=false, SubspaceMineESP=false, PlayerESP=true, BaseOwnerESP=false, TpTrail=false,
  AutoBuyEnabled=false, AutoBuyRange=17, AutoGrabSpeed=17, AutoBuyKey="K",
  AutoDestroyTurrets=false, AutoUnlockOnSteal=false,
  AutoInvisDuringSteal=false,
  ClickToAP=false, ClickToAPSingleCommand=false,
  ClickToAPRadius=8,
  SpamBaseOwnerCommands={balloon=true, inverse=true, jail=true, jumpscare=true, morph=true, nightvision=true, ragdoll=true, rocket=true, tiny=true},
  SpamBaseOwnerOrder={"balloon", "inverse", "jail", "jumpscare", "morph", "nightvision", "ragdoll", "rocket", "tiny"},
  SpamBaseOwnerSingleCommand=false,
  ProximityAP=false, ShowJobJoiner=true, AntiBeeDisco=false,
  RemoteSellEnabled=false, AdminPanelUI=true,
  StealHighest=true, StealPriority=false, StealNearest=false,
  AutoStealEnabled=false,
  Unwalk=false,
  Visibilities = {
  ["Invisible Steal Panel"] = true,
  ["Admin Command Painel"] = true,
  ["Command Cooldowns"] = true,
  ["Actions"] = true,
  ["Steal Panel"] = true,
  ["Steal Target"] = true,
  },
  TpSettings = {
  Tool="Flying Carpet", TpKey="T", CloneKey="V", CarpetSpeedKey="Q",
  InfiniteJump=false, DelayVal=0.4, CloneDelayVal=0.1,
  RagdollTP=false, FPSWait=false, FlyTP=false, FlyTPSpeed=160, FlyTPCloseSpeed=75,
  GrabbleTP=false, GrabbleTPSpeed=230,
  TpOnLoad=false, MinGenForTp="", MinGenForGrab="",
  BrainrotCarpet=false,
  },
  PriorityList=priorityList,
  RemovedFromPriority={},
}

suffixes = {
  k = 1e3,
  m = 1e6,
  b = 1e9,
  t = 1e12,
  q = 1e15,
  qi = 1e18,
  qd = 1e18,
  qn = 1e18,
  sx = 1e21,
  sp = 1e24,
  oc = 1e27,
  no = 1e30,
  dc = 1e33,
  ud = 1e36,
  dd = 1e39,
  td = 1e42,
  qad = 1e45,
  qid = 1e48,
  sxd = 1e51,
  spd = 1e54,
  ocd = 1e57,
  nod = 1e60,
  vg = 1e63,
}

function parseMinGen(v82)
  if not v82 or type(v82) ~= "string" then return 0 end
  v82 = v82:gsub("%s", ""):lower():gsub("/s$", "")
  if v82 == "" then return 0 end
  local v940, v235 = v82:match("^([%d%.]+)(%a*)$")
  if not v940 then return 0 end
  local v105 = tonumber(v940)
  if not v105 or v105 < 0 then return 0 end
  if v235 ~= "" then
  local v329 = suffixes[v235]
  if v329 then
  return v105 * v329
  end
  end
  return v105
end

function canUseFiles() return typeof(readfile)=="function" and typeof(writefile)=="function" and typeof(isfile)=="function" end
loadConfig = function()
  if not canUseFiles() then return end
  local ok,v55=pcall(function() if isfile(CONFIG_FILE) then return HttpService:JSONDecode(readfile(CONFIG_FILE)) end end)
  if ok and type(v55)=="table" then
  for v75,v26 in pairs(v55) do
  if v75 == "PriorityList" or v75 == "RemovedFromPriority" then
  Config[v75] = v26
  elseif type(v26) == "table" and type(Config[v75]) == "table" then
  for v1265, v1266 in pairs(v26) do
  Config[v75][v1265] = v1266
  end
  else
  Config[v75] = v26
  end
  end
  if type(Config.positions)~="table" then Config.positions={} end
  if type(Config.keybinds)~="table" then Config.keybinds={} end
  if type(Config.actions)~="table" then Config.actions={} end
  if type(Config.RemovedFromPriority)~="table" then Config.RemovedFromPriority={} end
  local v973 = {}
  for idx, v745 in ipairs(Config.RemovedFromPriority) do v973[v745] = true end
  if type(Config.PriorityList)=="table" then
  if #Config.PriorityList == 0 then
  Config.PriorityList = priorityList
  else
  local v952 = {}
  for idx, v30 in ipairs(Config.PriorityList) do
  v952[v30] = true
  end
  for idx, v30 in ipairs(priorityList) do
  if not v952[v30] and not v973[v30] then
  table.insert(Config.PriorityList, v30)
  end
  end
  priorityList = Config.PriorityList
  end
  else
  Config.PriorityList = priorityList
  end

  if type(Config.PriorityList) == "table" then
  local v220 = {}
  local v850 = {}
  for idx, v30 in ipairs(Config.PriorityList) do
  if not v220[v30] then
  v220[v30] = true
  table.insert(v850, v30)
  end
  end
  Config.PriorityList = v850
  end
  end
  autoStealEnabled = Config.AutoStealEnabled == true
  if not type(Config.TpSettings) == "table" then Config.TpSettings = {} end
  Config.TpSettings.BrainrotCarpet = true
  Config.AutoInvisDuringSteal = true
  _G.AutoInvisDuringSteal = true
  Config.AntiRagdoll = true
  Config.InstantClone = true
  Config.PlayerESP = true
  Config.SubspaceMineESP = true
  Config.InfiniteJump = true
end


_CLTHUBSaveDirty = false
_CLTHUBSaveInterval = 0.4
saveConfig = function(v1151)
  if not canUseFiles() then return end
  if not type(Config.TpSettings) == "table" then Config.TpSettings = {} end
  Config.TpSettings.BrainrotCarpet = true
  Config.AutoInvisDuringSteal = true
  _G.AutoInvisDuringSteal = true
  Config.AntiRagdoll = true
  Config.InstantClone = true
  Config.PlayerESP = true
  Config.SubspaceMineESP = true
  Config.InfiniteJump = true
  if v1151 then
  _CLTHUBSaveDirty = false
  task.spawn(function() pcall(function() writefile(CONFIG_FILE, HttpService:JSONEncode(Config)) end) end)
  return
  end
  _CLTHUBSaveDirty = true
end
task.spawn(function()
  while true do
  task.wait(_CLTHUBSaveInterval)
  if _CLTHUBSaveDirty then
  _CLTHUBSaveDirty = false
  pcall(function() writefile(CONFIG_FILE, HttpService:JSONEncode(Config)) end)
  end
  end
end)


do
  local v831 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

  local function v1088(v55)
  v55 = v55:gsub('[^' .. v831 .. '=]', '')
  local v1184 = #v55
  local tmpInst = {}
  local v473 = {}
  for v28 = 1, 64 do v473[v831:sub(v28, v28)] = v28 - 1 end
  local v28 = 1
  while v28 <= v1184 do
  local v837 = v473[v55:sub(v28, v28)]
  local v838 = v473[v55:sub(v28 + 1, v28 + 1)]
  local v965 = v55:sub(v28 + 2, v28 + 2)
  local v966 = v55:sub(v28 + 3, v28 + 3)
  local v1098 = v473[v965]
  local v1099 = v473[v966]
  if not v837 or not v838 then break end
  local v62 = v837 * 262144 + v838 * 4096 + (v1098 or 0) * 64 + (v1099 or 0)
  tmpInst[#tmpInst + 1] = string.char(math.floor(v62 / 65536))
  if v965 ~= "=" then
  tmpInst[#tmpInst + 1] = string.char(math.floor(v62 / 256) % 256)
  end
  if v966 ~= "=" then
  tmpInst[#tmpInst + 1] = string.char(v62 % 256)
  end
  v28 = v28 + 4
  end
  return table.concat(tmpInst)
  end

  _G.importConfig = function(v82)
  if not v82 or v82 == "" then
  return false
  end

  local v234, v580 = pcall(function()
  return HttpService:JSONDecode(v82)
  end)

  if not v234 or type(v580) ~= "table" then
  local v674
  pcall(function() v674 = v1088(v82:gsub("%s", "")) end)
  if v674 then
  v234, v580 = pcall(function() return HttpService:JSONDecode(v674) end)
  end
  end

  if not v234 or type(v580) ~= "table" then
  return false
  end

  for v75, v26 in pairs(v580) do
  Config[v75] = v26
  end

  if type(Config.PriorityList) == "table" then priorityList = Config.PriorityList end

  saveConfig()

  for v75, v26 in pairs(Config.keybinds or {}) do
  if Keybinds[v75] ~= nil and type(v26) == "string" then
  Keybinds[v75] = v26
  if v75 == "Open Menu" and Enum.KeyCode[v26] then
  UI.OpenMenuKey = Enum.KeyCode[v26]
  end
  end
  end

  for v75, v26 in pairs(Config.actions or {}) do
  if actionConfig[v75] ~= nil then
  actionConfig[v75] = v26 and true or false
  end
  end

  if type(Config.locked) == "boolean" then
  UI.Locked = Config.locked
  if _G.updateResizeGrips then pcall(_G.updateResizeGrips) end
  end

  initToggles()


  if setXRay then pcall(setXRay, Config.XRay) end
  if setInfiniteJump then pcall(setInfiniteJump, Config.InfiniteJump) end
  if setCarpetSpeed then pcall(setCarpetSpeed, Config["Carpet Speed"] or Config.CarpetSpeed or false) end

  Config.ProximityAP = false

  Config.AutoBuyEnabled = false
  if setStealMode then
  if Config.StealHighest then pcall(setStealMode, "Highest")
  elseif Config.StealPriority then pcall(setStealMode, "Priority")
  elseif Config.StealNearest then pcall(setStealMode, "Nearest")
  end
  end
  if updateMovementPanelLabels then pcall(updateMovementPanelLabels) end

  rebuildActions()
  rebuildActionSettings()
  loadTab(UI.CurrentTab)

  return true
  end

  _G.exportConfig = function()
  local ok, v82 = pcall(function()
  return HttpService:JSONEncode(Config)
  end)
  if not ok or not v82 then
  return nil
  end
  local v658 = false
  if typeof(setclipboard) == "function" then
  pcall(function() setclipboard(v82); v658 = true end)
  elseif typeof(toclipboard) == "function" then
  pcall(function() toclipboard(v82); v658 = true end)
  end
  if v658 then
  else
  end
  return v82
  end
end
function serializePos(v59)
  return {xs=v59.X.Scale, xo=v59.X.Offset, ys=v59.Y.Scale, yo=v59.Y.Offset}
end


function rememberPosition(v30, v71)
  if not v30 or v30 == "" or not v71 then return end
  Config.positions = Config.positions or {}
  local v43 = tostring(v30)
  local v375 = serializePos(v71.Position)
  Config.positions[v43] = v375
  if v43 == "CLTHUB\nMovement" or v43 == "CLTHUB\nInvisible Steal" then
  Config.positions["CLTHUB\nMovement"] = v375
  Config.positions["CLTHUB\nInvisible Steal"] = v375
  elseif v43 == "CLTHUB\nSteal Painel" or v43 == "CLTHUB\nSteal Panel" then
  Config.positions["CLTHUB\nSteal Painel"] = v375
  Config.positions["CLTHUB\nSteal Panel"] = v375
  elseif v43 == "CLTHUB\nAdmin Command Painel" or v43 == "CLTHUB\nAdmin Command Painel" then
  Config.positions["CLTHUB\nAdmin Command Painel"] = v375
  Config.positions["CLTHUB\nAdmin Command Painel"] = v375
  end
  if saveConfig then pcall(saveConfig) end
end

function applySavedPosition(v30, v71)
  if not v30 or v30 == "" or not v71 then return end
  Config.positions = Config.positions or {}
  local v43 = tostring(v30)
  local v33 = Config.positions[v43]
  if not v33 and (v43 == "CLTHUB\nMovement" or v43 == "CLTHUB\nInvisible Steal") then
  v33 = Config.positions["CLTHUB\nMovement"] or Config.positions["CLTHUB\nInvisible Steal"]
  elseif not v33 and (v43 == "CLTHUB\nSteal Painel" or v43 == "CLTHUB\nSteal Panel") then
  v33 = Config.positions["CLTHUB\nSteal Painel"] or Config.positions["CLTHUB\nSteal Panel"]
  elseif not v33 and (v43 == "CLTHUB\nAdmin Command Painel" or v43 == "CLTHUB\nAdmin Command Painel") then
  v33 = Config.positions["CLTHUB\nAdmin Command Painel"] or Config.positions["CLTHUB\nAdmin Command Painel"]
  end
  if type(v33) == "table" then
  v71.Position = UDim2.new(
  tonumber(v33.xs) or 0,
  tonumber(v33.xo) or 0,
  tonumber(v33.ys) or 0,
  tonumber(v33.yo) or 0
  )
  end
end
function initToggles()
  setToggle("Anti Ragdoll", Config.AntiRagdoll, true)
  setToggle("Auto Reset Balloon", Config.AutoResetBalloon, true)
  setToggle("Infinite Jump", Config.InfiniteJump, true)
  setToggle("Auto Kick", Config.AutoKickOnSteal, true)
  setToggle("Auto Buy", false, true)
  setToggle("Auto Steal", Config.AutoStealEnabled, true)
  setToggle("Steal Highest", Config.StealHighest, true)
  setToggle("Steal Priority", Config.StealPriority, true)
  setToggle("Steal Nearest", Config.StealNearest, true)
  setToggle("Click to AP", Config.ClickToAP, true)
  setToggle("ClickToAP", Config.ClickToAP, true)
  setToggle("Click AP Single Cmd", Config.ClickToAPSingleCommand, true)
  setToggle("ClickToAPSingle", Config.ClickToAPSingleCommand, true)
  setToggle("FPS Boost (normal)", Config.FPSBoost, true)
  setToggle("FPS Boost (normal)", Config.FPSBoost, true)
  setToggle("FPS Boost Ultra", Config.FPSBoostUltra, true)
  setToggle("FPSBoostUltra", Config.FPSBoostUltra, true)
  setToggle("Unlock FPS", Config.UnlockFPS ~= false, true)
  setToggle("XRay", Config.XRay, true)
  setToggle("X-Ray", Config.XRay, true)
  setToggle("Xray", Config.XRay, true)
  setToggle("Proximity", Config.ProximityAP, true)

  setToggle("Player ESP", Config.PlayerESP, true)
  setToggle("Brainrot ESP", Config.BrainrotESP, true)
  setToggle("Timer ESP", Config.TimerESP, true)
  setToggle("Subspace Mine ESP", Config.SubspaceMineESP, true)
  setToggle("Base Owner ESP", Config.BaseOwnerESP, true)
  setToggle("Auto Destroy Turrets", Config.AutoDestroyTurrets, true)
  setToggle("Anti-Bee & Anti-Disco", Config.AntiBeeDisco, true)
  setToggle("AntiBeeDisco", Config.AntiBeeDisco, true)
  setToggle("Admin Panel UI", Config.AdminPanelUI, true)
  setToggle("Admin Painel UI", Config.AdminPanelUI, true)
  setToggle("Auto Invis During Steal", Config.AutoInvisDuringSteal, true)

  setToggle("Unwalk", Config.Unwalk, true)
  setToggle("Stealing ESP", Config.StealingESP, true)
  setToggle("WalkSpeed", Config.WalkSpeedEnabled, true)
  setToggle("Dark Mode", Config.DarkMode, true)
  setToggle("DarkMode", Config.DarkMode, true)
  setToggle("Grabble TP", Config.TpSettings.GrabbleTP or false, true)
end

loadConfig()
if Config.OptionalFeaturesV2 ~= true then
  Config.XRay = false
  Config.BaseOwnerESP = false
  Config.LineToBase = false
  Config.LineToBrainrot = false
  Config.BrainrotESP = false
  Config.AntiBeeDisco = false
  Config.AutoResetBalloon = false
  Config.CleanErrorGUIs = false
  Config.AutoStealEnabled = false
  Config.TpSettings.GrabbleTP = false
  Config.OptionalFeaturesV2 = true
  saveConfig(true)
end
Config.FPSBoostPets = Config.FPSBoost == true
saveConfig()
pcall(function() if updateAllGuisScale then updateAllGuisScale(Config.GlobalUIScale or 1) end end)

if Config.StealNearest or Config.StealMode == "Nearest" then
  Config.StealNearest = false
  Config.StealPriority = true
  Config.StealHighest = false
  Config.StealMode = "Priority"
  saveConfig()
end


for v75,v26 in pairs(Config.keybinds or {}) do if Keybinds[v75]~=nil and type(v26)=="string" then Keybinds[v75]=v26; if v75=="Open Menu" and Enum.KeyCode[v26] then UI.OpenMenuKey=Enum.KeyCode[v26] end end end
for v75,v26 in pairs(Config.actions or {}) do if actionConfig[v75]~=nil then actionConfig[v75]=v26 and true or false end end
if type(Config.locked)=="boolean" then UI.Locked=Config.locked end
initToggles()

do
local v524={}
local v531
local v401
local function v785()
if v531 then return v531 end
local ok,v84=pcall(function()return require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Synchronizer"))end)
if ok then v531=v84 end
return v531
end
local function v1058()
local v308=v785()
if not v308 or type(v308.GetAllChannels)~="function" then return end
local v64=v308.GetAllChannels
v308.GetAllChannels=function(...)
local v83=v64(...)
if not v401 and type(v83)=="table" then v401=v83 end
return v83
end
end
v1058()
_G.XenSyncAll=function()return v401 or v524 end
_G.XenSyncGet=function(v72)
if v72==nil then return nil end
if v401 then
local v68=rawget(v401,v72)
if v68 and type(v68)=="table" and type(v68.Get)=="function" then return v68 end
for v75,v26 in pairs(v401)do if tostring(v75)==v72 and type(v26)=="table" and type(v26.Get)=="function" then return v26 end end
end
if v524[v72]then return v524[v72]end
local v308=v785()
if not v308 or type(v308.GetTableFromChannel)~="function" then return nil end
local ok,v553=pcall(v308.GetTableFromChannel,v308,v72)
if ok and type(v553)=="table" then
local v136=setmetatable({},{
__index=function(idx,v75)
if v75=="Get"then return function(idx,v49)return v553[v49]end end
if v75=="GetTable"then return function()return v553 end end
return v553[v75]
end
})
v524[v72]=v136
return v136
end
return nil
end
_G.v1325=function(v157)
local v34=_G.XenSyncGet(v157)
if not v34 then return nil end
if type(v34.GetTable)=="function" then local ok,tmpInst=pcall(v34.GetTable,v34);if ok then return tmpInst end end
return nil
end
local v516,v793,v796
local function v1056()
if v516 then return true end
local ok=pcall(function()
local v33=game:GetService("ReplicatedStorage"):WaitForChild("Datas", 3)
if not v33 then return end
local v27, v87, tmpInst = v33:WaitForChild("Animals", 3), v33:WaitForChild("Mutations", 3), v33:WaitForChild("Traits", 3)
if v27 then v516=require(v27) end
if v87 then v793=require(v87) end
if tmpInst then v796=require(tmpInst) end
end)
return ok and v516~=nil
end
_G.v1286=function(v132,v199,v292)
if not v1056() then return 0 end
local v93=v516[v132]
if not v93 or not v93.Generation then return 0 end
local v329=1
if v199 and v199~="None" and v199~="" then
local v87=v793[v199]
if v87 and v87.Modifier then v329=v329+v87.Modifier end
end
if type(v292)=="table" then
for idx,v768 in ipairs(v292)do
local tmpInst=v796[v768]
if tmpInst and tmpInst.MultiplierModifier then v329=v329+tmpInst.MultiplierModifier end
end
end
return v93.Generation*v329
end
_G.v1021=setmetatable({GetGeneration=function(idx,v132,v199,v292)return _G.v1286(v132,v199,v292)end},{
__index=function(idx,v75)
local ok,v960=pcall(function()return require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Animals"))end)
if ok and type(v960)=="table" then return rawget(v960,v75) end
return nil
end})
end
_G.stealthGet=function(v62) return _G.XenSyncGet(v62) end
_G.SyncInt={v1310={},v1311=nil}


do
  local v517 = game:GetService("ReplicatedStorage")
  local v926 = v517:WaitForChild("Packages"):WaitForChild("Net")
  local v1150 = debug.getupvalues or getupvalues
  local v1149 = debug.getinfo or getinfo

  local v32, v91, v503

  local function v908(v84)
  return type(v84) == "string" and #v84 == 36
  and v84:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
  end

  local function v1094()
  if v32 and v503 then return true end
  local v251 = game.JobId
  local v27, v29
  local v354, v220 = {}, {}
  for idx, v26 in getgc(true) do
  if typeof(v26) == "function" then
  local ok, v93 = pcall(v1149, v26)
  if ok and v93 and v93.source == "=ReplicatedStorage.Packages.Net.Net" then
  local v373, v1031 = pcall(v1150, v26)
  if v373 and v1031 then
  for idx, v113 in pairs(v1031) do
  if type(v113) == "table" then
  local v150, v315, v1292 = rawget(v113, 1), rawget(v113, 2), rawget(v113, 3)
  if not v27 and type(v150) == "function" and type(v315) == "function" and type(v1292) == "string" then
  v27, v29 = clonefunction(v150), clonefunction(v315)
  end
  for idx, v50 in pairs(v113) do
  if v908(v50) and v50 ~= v251 and not v220[v50] then v220[v50] = true; v354[#v354 + 1] = v50 end
  end
  elseif v908(v113) and v113 ~= v251 and not v220[v113] then
  v220[v113] = true; v354[#v354 + 1] = v113
  end
  end
  end
  end
  end
  end
  if not v27 then return false end
  v32, v91 = v27, v29
  local v1103 = v91("UseItem", v251)
  if #v354 == 1 then v503 = v354[1]; return true end
  for idx, v985 in ipairs(v354) do
  local ok, v52 = pcall(function() return v32(buffer.fromstring(v1103), buffer.fromstring(v985 .. v251)) end)
  if ok and type(v52) == "string" and v926:FindFirstChild("RE/" .. v52) then v503 = v985; return true end
  end
  return false
  end

  local function v742(v1227, v30)
  if not (v32 and v503) and not v1094() then return nil end
  local v251 = game.JobId
  local ok, v52 = pcall(function()
  local v34 = v91(v30, v251)
  return v32(buffer.fromstring(v34), buffer.fromstring(v503 .. v251))
  end)
  if not ok or type(v52) ~= "string" then return nil end
  return v926:FindFirstChild(v1227 .. "/" .. v52)
  end

  _G.Net = {
  RemoteEvent  = function(idx, v30) return v742("RE", v30) end,
  RemoteFunction  = function(idx, v30) return v742("RF", v30) end,
  UnreliableRemoteEvent = function(idx, v30) return v742("URE", v30) end,
  }
  _G.XenNet = _G.Net
end


Decrypted=setmetatable({},{__index=function(v1305,v683)
  if type(v683)~="string" or not _G.Net then return nil end
  local v943,v88=v683:match("^(R[EF])/(.+)$")
  if not v943 then return nil end
  local ok,v83=pcall(function()
  if v943=="RF" then return _G.Net:RemoteFunction(v88) end
  return _G.Net:RemoteEvent(v88)
  end)
  if ok and v83 then rawset(Decrypted,v683,v83) end
  return ok and v83 or nil
end})


ACTION_COOLDOWNS = {ragdoll=30,jail=60,rocket=120,balloon=30,inverse=30,jumpscare=30,tiny=30,morph=30,nightvision=30}
lastActionUse = {}


function _readRealAdminTimer(v47)
  local v167 = playerGui:FindFirstChild("AdminPanel")
  if not v167 then return nil end
  local ok, v457 = pcall(function() return v167.AdminPanel.Content.ScrollingFrame end)
  if not ok or not v457 then return nil end
  local v453 = v457:FindFirstChild(v47)
  if not v453 then return nil end
  local v761 = v453:FindFirstChild("Timer")
  if not v761 or not v761.Visible then return 0 end
  local v105 = tonumber(v761.Text:match("%d+"))
  return v105 or 0
end

function apIsOnCooldown(v47)
  local v36=lastActionUse[v47]
  if v36 and (tick()-v36) < 1.5 then return true end
  local v434 = _readRealAdminTimer(v47)
  if v434 ~= nil then return v434 > 0 end
  local v322=ACTION_COOLDOWNS[v47] or 0; return v36 and v322>0 and (tick()-v36)<v322
end
function apGetRemaining(v47)
  local v434 = _readRealAdminTimer(v47)
  if v434 ~= nil and v434 > 0 then return v434 end
  local v36=lastActionUse[v47]; local v322=ACTION_COOLDOWNS[v47] or 0
  if v36 and (tick()-v36) < 1.5 then return math.max(0, math.floor(v322 - (tick()-v36))) end
  return 0
end
function apStartCooldown(v47) lastActionUse[v47]=tick() end
AP_ALL_COMMANDS={"balloon","rocket","jail","inverse","ragdoll","tiny","jumpscare","morph"}
AP_COMMAND_EMOJIS={balloon="🎈",inverse="🔄",jail="🔒",jumpscare="👻",morph="🎭",nightvision="🌙",ragdoll="🤸",rocket="🚀",tiny="🐜"}
if not Config.ClickToAPCommands then
  Config.ClickToAPCommands = {}
  for idx, v47 in ipairs(AP_ALL_COMMANDS) do Config.ClickToAPCommands[v47] = true end
end
if not Config.AdminPanelButtons then
  Config.AdminPanelButtons = {ragdoll=true, jail=true, rocket=true, balloon=true}
end
if not Config.ClickToAPRadius then
  Config.ClickToAPRadius = 8
end
if not Config.SpamBaseOwnerCommands then
  Config.SpamBaseOwnerCommands = {}
  for idx, v47 in ipairs(AP_ALL_COMMANDS) do Config.SpamBaseOwnerCommands[v47] = true end
end
if not Config.SpamBaseOwnerOrder then
  Config.SpamBaseOwnerOrder = {}
  for v28, v47 in ipairs(AP_ALL_COMMANDS) do Config.SpamBaseOwnerOrder[v28] = v47 end
end
if Config.SpamBaseOwnerSingleCommand == nil then
  Config.SpamBaseOwnerSingleCommand = false
end
setToggle("SpamBaseOwnerSingleCommand", Config.SpamBaseOwnerSingleCommand or false)

_G.apBlacklist = Config.apBlacklist or {}

function isPlayerBlacklisted(player)
  if not player then return false end
  local v76 = player.UserId
  return _G.apBlacklist[v76] == true or _G.apBlacklist[tostring(v76)] == true
end


do
  local v195
  function _G.__getSync()
  if v195 then return v195 end
  local ok, v578 = pcall(function()
  local v957 = ReplicatedStorage:FindFirstChild("Packages")
  return v957 and require(v957:WaitForChild("Synchronizer", 5))
  end)
  if ok then v195 = v578 end
  return v195
  end
end


function getPlotOwner(v25)
  if not v25 then return nil end
  local v225 = _G.__getSync()
  if v225 then
  local v68 = _G.XenSyncGet(v25.Name)
  if v68 then
  local v51 = v68:Get("Owner")
  if v51 then
  if typeof(v51) == "Instance" and v51:IsA("Player") then
  if v51.Parent == PlayersService then
  return v51
  end
  elseif type(v51) == "table" and (v51.Name or v51.name) then
  local v23 = PlayersService:FindFirstChild(tostring(v51.Name or v51.name))
  if v23 then return v23 end
  elseif type(v51) == "number" then
  local v23 = PlayersService:GetPlayerByUserId(v51)
  if v23 then return v23 end
  elseif type(v51) == "string" then
  local v23 = PlayersService:FindFirstChild(v51)
  if v23 then return v23 end
  end
  end
  end
  end
  local v111 = v25:FindFirstChild("PlotSign")
  local v1003 = v111
  and v111:FindFirstChild("SurfaceGui")
  and v111.SurfaceGui:FindFirstChild("Frame")
  and v111.SurfaceGui.Frame:FindFirstChild("TextLabel")
  if v1003 then
  local v655 = v1003.Text
  local v486 = (v655 and v655:match("^(.-)'")) or v655
  if v486 and v486 ~= "" and v486 ~= " " then
  for idx, v23 in ipairs(PlayersService:GetPlayers()) do
  if (v23.DisplayName == v486) or (v23.Name == v486) then
  return v23
  end
  end
  end
  end
  return nil
end

function getPlotAtPosition(v59)
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return nil end
  local v663 = nil
  local v716 = math.huge
  for idx, v25 in ipairs(v53:GetChildren()) do
  local v491
  if v25:IsA("Model") then
  v491 = v25.PrimaryPart and v25.PrimaryPart.Position or v25:GetPivot().Position
  else
  v491 = v25.Position
  end
  if v491 then
  local v872 = math.sqrt((v59.X - v491.X)^2 + (v59.Z - v491.Z)^2)
  if v872 < v716 then
  v716 = v872
  v663 = v25
  end
  end
  end
  if v663 and v716 < 72 then
  return v663
  end
  return nil
end

function getPlayerBaseInfo(player)
  if not player or not player.Character then return nil, nil end
  local v22 = player.Character:FindFirstChild("HumanoidRootPart")
  if not v22 then return nil, nil end
  local v25 = getPlotAtPosition(v22.Position)
  if v25 then
  return v25, getPlotOwner(v25)
  end
  return nil, nil
end


do
  local v542, v920 = nil, 0
  function _G.__getCurrentBaseOwnerId()
  local v60 = os.clock()
  if (v60 - v920) < 0.4 then return v542 end
  v920 = v60
  v542 = nil
  local idx, v51 = getPlayerBaseInfo(LocalPlayer)
  if v51 then v542 = v51.UserId end
  return v542
  end
end


_CLTHUBMorphCache = _CLTHUBMorphCache or {}


_CLTHUBStealSession = _CLTHUBStealSession or {}
PlayersService.PlayerRemoving:Connect(function(player)
  _CLTHUBMorphCache[player.UserId] = nil
  _CLTHUBStealSession[player.UserId] = nil
end)

function getStealingInfo(player)
  if not player or not player.Character then return nil, nil end
  local v22 = player.Character:FindFirstChild("HumanoidRootPart")
  if not v22 then return nil, nil end


  pcall(function()
  if not _CLTHUBAnimalsData then
  local v394 = ReplicatedStorage:FindFirstChild("Datas")
  _CLTHUBAnimalsData = v394 and require(v394:FindFirstChild("Animals"))
  end
  local v10 = _CLTHUBAnimalsData
  if v10 and not _CLTHUBAnimalNames then
  _CLTHUBAnimalNames = {}
  for v72, v93 in pairs(v10) do
  local v685 = (type(v93) == "table" and v93.DisplayName) or tostring(v72)
  _CLTHUBAnimalNames[tostring(v72):lower()] = v685
  _CLTHUBAnimalNames[tostring(v685):lower()] = v685
  end
  end
  end)


  if player:GetAttribute("Stealing") ~= true then

  _CLTHUBStealSession[player.UserId] = nil

  local v476 = _CLTHUBMorphCache[player.UserId]
  if _CLTHUBAnimalNames and (not v476 or (os.clock() - v476.t) > 1) then
  local v575 = {}
  pcall(function()
  for idx, v87 in ipairs(player.Character:GetDescendants()) do
  if (v87:IsA("Model") or v87:IsA("MeshPart")) and _CLTHUBAnimalNames[v87.Name:lower()] then
  v575[v87.Name:lower()] = true
  end
  end
  end)
  _CLTHUBMorphCache[player.UserId] = { t = os.clock(), names = v575 }
  end
  return nil, nil
  end

  local v112 = _CLTHUBStealSession[player.UserId]
  if type(v112) == "string" then
  v112 = { name = v112, locked = true }
  _CLTHUBStealSession[player.UserId] = v112
  end


  if v112 and v112.locked then
  return v112.owner, v112.name
  end


  local v648 = player:GetAttribute("StealingIndex")
  if v648 ~= nil and tostring(v648) ~= "" then
  local v88 = tostring(v648)
  if _CLTHUBAnimalNames then v88 = _CLTHUBAnimalNames[v88:lower()] or v88 end
  local v500 = v112 and v112.owner or nil
  _CLTHUBStealSession[player.UserId] = { name = v88, owner = v500, locked = true }
  return v500, v88
  end

  local v930 = _CLTHUBMorphCache[player.UserId] and _CLTHUBMorphCache[player.UserId].names


  local v543
  pcall(function()
  if _CLTHUBAnimalNames then
  for idx, v87 in ipairs(player.Character:GetDescendants()) do
  if v87:IsA("Model") or v87:IsA("MeshPart") then
  local v43 = v87.Name:lower()
  local v121 = _CLTHUBAnimalNames[v43]
  if v121 and not (v930 and v930[v43]) then
  v543 = v121
  return
  end
  end
  end
  end
  end)
  if v543 then
  local v500 = v112 and v112.owner or nil
  _CLTHUBStealSession[player.UserId] = { name = v543, owner = v500, locked = true }
  return v500, v543
  end


  if v112 and v112.t and (os.clock() - v112.t) < 0.4 then
  return v112.owner, v112.name
  end

  local v910 = false
  local v35 = player.Character:FindFirstChildOfClass("Humanoid")
  local v192 = v35 and v35:FindFirstChildOfClass("Animator")
  if v192 then
  pcall(function()
  for idx, v137 in ipairs(v192:GetPlayingAnimationTracks()) do
  local v569 = v137.Animation and v137.Animation.AnimationId
  if v569 and (v569:find("18537363391") or v569:find("steal") or v569:find("grab")) then
  v910 = true
  break
  end
  end
  end)
  end


  local v53 = Workspace:FindFirstChild("Plots")
  if v53 then
  local v916 = v910 and 12 or 4.5
  local v225
  pcall(function() v225 = _G.__getSync() end)


  local v538, v652, v124 = nil, nil, v916
  local v469, v691 = nil, v916
  for idx, v25 in ipairs(v53:GetChildren()) do
  local v51 = getPlotOwner(v25)
  if v51 == player then continue end

  local v125 = v25:FindFirstChild("AnimalPodiums")
  if v125 then
  local v171
  pcall(function()
  local v68 = v225 and _G.XenSyncGet(v25.Name)
  v171 = v68 and v68:Get("AnimalList")
  end)
  for idx, v725 in ipairs(v125:GetChildren()) do
  local v173 = v725:FindFirstChild("Base")
  local v264 = v173 and v173:FindFirstChild("Spawn")
  if v264 then
  local v92 = (v22.Position - v264.Position).Magnitude
  local v108 = v171 and (v171[v725.Name] or v171[tonumber(v725.Name)])
  if v108 and type(v108) == "table" and v108.Index then
  if v92 < v124 then
  local v204 = tostring(v108.Index)
  pcall(function()
  if _CLTHUBAnimalNames then
  v204 = _CLTHUBAnimalNames[v204:lower()] or v204
  end
  end)
  v124 = v92; v538 = v51; v652 = v204
  end
  elseif v92 < v691 then
  v691 = v92; v469 = v51
  end
  end
  end
  end
  end
  if v538 and (not v469 or v124 <= v691) then

  _CLTHUBStealSession[player.UserId] = { name = v652, owner = v538, locked = false, t = os.clock() }
  return v538, v652
  end
  if v469 then


  local v88 = (v112 and v112.name) or "Brainrot"
  _CLTHUBStealSession[player.UserId] = { name = v88, owner = v469, locked = false, t = os.clock() }
  return v469, v88
  end
  end


  if v112 and v112.name then
  return v112.owner, v112.name
  end
  return nil, "Brainrot"
end


_G.__CLTHUBBootClock = _G.__CLTHUBBootClock or os.clock()
task.spawn(function()
  while true do
  task.wait(1)
  if _G._isTpMoving or (os.clock() - _G.__CLTHUBBootClock) < 10 then continue end
  for idx, v23 in ipairs(PlayersService:GetPlayers()) do
  if v23 ~= LocalPlayer and v23:GetAttribute("Stealing") ~= true then
  pcall(getStealingInfo, v23)
  end
  end
  end
end)

function isOurOverheadBillboard(v42)
  if not v42 or not v42.Name then return true end
  local v62 = v42.Name
  if v62:find("^PlayerESP_") or v62:find("^BrainrotESP_") or v62:find("PlotBeam") then return true end
  if v62 == "Overhead" or v62 == "StealProgressBar" or v62 == "XiAdminPanel" then return true end
  return false
end

_CLTHUBJTCache = _CLTHUBJTCache or {}
function getPlayerJoinerTag(player)
  if not player or not player.Character then return nil end


  local v633 = _CLTHUBJTCache[player.UserId]
  if v633 and (os.clock() - v633.t) < 8 then return v633.tag or nil end
  local v712, v220 = {}, {}
  local function v818(tmpInst)
  if not tmpInst or type(tmpInst) ~= "string" then return end
  tmpInst = tmpInst:gsub("^%s+", ""):gsub("%s+$", "")
  if tmpInst == "" or #tmpInst > 64 then return end
  if tmpInst == player.Name or tmpInst == player.DisplayName then return end
  local v43 = tmpInst:lower()
  if v220[v43] then return end
  v220[v43] = true
  table.insert(v712, tmpInst)
  end
  local function v970(v42)
  if not v42:IsA("BillboardGui") or not v42.Enabled then return end
  if isOurOverheadBillboard(v42) then return end
  for idx, v37 in ipairs(v42:GetDescendants()) do
  if (v37:IsA("TextLabel") or v37:IsA("TextBox")) and v37.Visible ~= false then
  v818(v37.Text)
  end
  end
  end
  for idx, v58 in ipairs(player.Character:GetDescendants()) do
  if v58:IsA("BillboardGui") then v970(v58) end
  end


  local function v969(v456)
  if not v456 then return end
  for idx, v42 in ipairs(v456:GetDescendants()) do
  if v42:IsA("BillboardGui") and v42.Adornee and player.Character
  and v42.Adornee:IsDescendantOf(player.Character) then
  v970(v42)
  end
  end
  end
  pcall(function() v969(playerGui) end)
  pcall(function() v969(typeof(gethui) == "function" and gethui() or game:GetService("CoreGui")) end)
  pcall(function()
  for v1075, v536 in pairs(player:GetAttributes()) do
  if typeof(v536) == "string" and #v536 > 0 and #v536 <= 40 then
  local v318 = v1075:lower()
  if v318:find("hub") or v318:find("script") or v318:find("joiner") or v318:find("executor") or v318:find("tag") then
  v818(v536)
  end
  end
  end
  end)
  local v305 = (#v712 > 0) and table.concat(v712, " · ") or nil
  _CLTHUBJTCache[player.UserId] = { t = os.clock(), tag = v305 or false }
  return v305
end
_G.getPlayerJoinerTag = getPlayerJoinerTag


HUB_BADGES = {

  { pats = {"bad boy"},  badge = "[ BAD BOY ]",  color = Color3.fromRGB(255, 60, 60), allowAP = true },
  { pats = {"good boy", "fmly"}, namePat = "fmly",  badge = "[ FMLY User ]", color = Color3.fromRGB(255, 220, 60) },
  { pats = {"bt user", "bt hub", "bt "},  badge = "[ BT User ]",  color = Color3.fromRGB(170, 80, 255) },
  { pats = {"w user", "wuser", "w hub", "notifier", "wblox", "w /"}, badge = "[ W User ]", color = Color3.fromRGB(255, 220, 60) },
}


_CLTHUBHubCache = _CLTHUBHubCache or {}


function getHubUserBadge(player)
  local v388 = getPlayerJoinerTag(player)
  local v495 = (v388 or ""):lower()
  local v1193 = ((player.Name or "") .. " " .. (player.DisplayName or "")):lower()
  local v195 = _CLTHUBHubCache[player.UserId]
  if not v195 then v195 = {}; _CLTHUBHubCache[player.UserId] = v195 end
  for v28, v244 in ipairs(HUB_BADGES) do
  if not v195[v28] then
  for idx, v1216 in ipairs(v244.pats) do
  if v495:find(v1216, 1, true) then v195[v28] = true break end
  end
  if not v195[v28] and v244.namePat and v1193:find(v244.namePat, 1, true) then v195[v28] = true end
  end
  end
  local v423 = {}
  local v1157 = v195[1]
  for v28, v244 in ipairs(HUB_BADGES) do
  if v195[v28] then

  if not (v1157 and v244.badge == "[ FMLY User ]") then
  v423[#v423 + 1] = v244
  end
  end
  end
  if #v423 == 0 then return nil, nil, v388, nil end
  return v423[1].badge, v423[1].color, v388, v423
end
_G.getHubUserBadge = getHubUserBadge
PlayersService.PlayerRemoving:Connect(function(player) _CLTHUBHubCache[player.UserId] = nil end)

function fireClick(v298)
  if not v298 then return false end
  local ok=pcall(function()
  if typeof(firesignal)=="function" then
  pcall(firesignal, v298.MouseButton1Click)
  pcall(firesignal, v298.MouseButton1Down)
  pcall(firesignal, v298.MouseButton1Up)
  pcall(firesignal, v298.Activated)
  else
  local v150=v298.AbsolutePosition.X+(v298.AbsoluteSize.X/2)
  local v315=v298.AbsolutePosition.Y+(v298.AbsoluteSize.Y/2)+58
  VirtualInputManager:SendMouseButtonEvent(v150,v315,0,true,game,0)
  VirtualInputManager:SendMouseButtonEvent(v150,v315,0,false,game,0)
  end
  end); return ok
end
_G.fireClick=fireClick

function runAdminCommand(v222, v355)

  pcall(function() if v222==LocalPlayer then _G.__CLTHUBSelfCmdT=os.clock() end end)
  if not v222 or not v355 or v355=="" then return false end
  if isPlayerBlacklisted(v222) then
  return false
  end

  if apIsOnCooldown(v355) then return false end
  apStartCooldown(v355)

  local v167=playerGui:FindFirstChild("AdminPanel")
  if not v167 then v167=playerGui:WaitForChild("AdminPanel",3) end
  if not v167 then return false end
  local v513 = v167.Enabled
  v167.Enabled = true


  local v1204,v732=pcall(function() return v167.AdminPanel.Profiles.ScrollingFrame end)
  if not v1204 or not v732 then v167.Enabled=v513; return false end

  local v430=v732:FindFirstChild(v222.Name)
  if not v430 then
  for idx,v24 in ipairs(v732:GetChildren()) do
  if v24:IsA("GuiButton") or v24:IsA("Frame") then
  local v487=v24:FindFirstChildWhichIsA("TextLabel")
  if v487 and (v487.Text==v222.Name or v487.Text==v222.DisplayName) then v430=v24; break end
  end
  end
  end

  if v430 then
  fireClick(v430)
  task.wait(0.01)
  elseif v222 ~= LocalPlayer then

  v167.Enabled=v513
  lastActionUse[v355] = nil
  return false
  end


  local v1202,v457=pcall(function() return v167.AdminPanel.Content.ScrollingFrame end)
  if not v1202 or not v457 then v167.Enabled=v513; return false end
  local v453=v457:FindFirstChild(v355)
  if not v453 then
  v167.Enabled=v513
  lastActionUse[v355] = nil
  return false
  end

  fireClick(v453)


  task.delay(0.15, function()
  pcall(function() if v430 then fireClick(v430) end end)
  if v167 and v167.Parent then v167.Enabled=v513 end
  end)
  return true
end
_G.runAdminCommand=runAdminCommand


function kickPlayer(v992)
  local v895 = false

  if v992 and type(v992) == "string" then
  v895 = true
  end

  if Config.KickToPrivateServer and PrivateServerCode and PrivateServerCode ~= "" and v895 then
  task.delay(0.2, function()
  pcall(function()
  local v224 = game:GetService("ExperienceService")
  v224:LaunchExperience({
  placeId = game.PlaceId,
  linkCode = PrivateServerCode,
  })
  end)
  end)
  return
  end
  pcall(function() game:Shutdown() end)
  pcall(function() LocalPlayer:Kick("\nCLTHUB") end)
end


SharedState = {SelectedPetData=nil, AllAnimalsCache={}, ListNeedsRedraw=true, InitialScanComplete=false, seenUIDs={}, BrainrotNames={}}


local v740 = false
local function v363()
  if v740 then return false end
  local LocalPlayer = game:GetService("Players").LocalPlayer
  local v19 = LocalPlayer.Character
  local v341 = v19 and v19:FindFirstChildOfClass("Humanoid")
  local v621 = v19 and v19:FindFirstChild("HumanoidRootPart")
  if not v19 or not v341 or not v621 then return false end

  v740 = true
  local v1228 = _G.AntiDieDisabled
  _G._CLTHUB_ResetRequested = true
  _G.AntiDieDisabled = true
  _G._isTpMoving = false

  local v692 = false
  local v774
  local v666
  local v741
  local function v325(v1211)
  if v692 then return end
  v692 = true
  if v774 then v774:Disconnect() end
  if v666 then v666:Disconnect() end
  if v741 then v741:Disconnect() end
  _G.AntiDieDisabled = v1228
  _G._CLTHUB_ResetRequested = false
  v740 = false
  task.defer(function()
  local v554 = v1211 or LocalPlayer.Character
  local v281 = v554 and v554:FindFirstChildOfClass("Humanoid")
  local v243 = workspace.CurrentCamera
  if v243 and v281 then
  v243.CameraType = Enum.CameraType.Custom
  v243.CameraSubject = v281
  end
  end)
  end

  v666 = LocalPlayer.CharacterAdded:Connect(v325)

  local function v983(v210)
  if v210:IsA("Sound") then
  v210.Volume = 0
  v210:Stop()
  elseif v210:IsA("BasePart") then
  v210.LocalTransparencyModifier = 1
  end
  end
  pcall(function()
  for idx, v210 in ipairs(v19:GetDescendants()) do v983(v210) end
  v741 = v19.DescendantAdded:Connect(function(v210)
  task.defer(function() pcall(v983, v210) end)
  end)
  local v192 = v341:FindFirstChildOfClass("Animator")
  if v192 then
  for idx, v137 in ipairs(v192:GetPlayingAnimationTracks()) do v137:Stop(0) end
  end
  end)

  local v1298 = workspace.FallenPartsDestroyHeight - 500
  local function v873()
  if LocalPlayer.Character ~= v19 or not v19.Parent then v325(LocalPlayer.Character); return end
  local v78 = v19:FindFirstChild("HumanoidRootPart") or v621
  if v78 and v78.Parent then
  v78.Anchored = false
  v78.CFrame = CFrame.new(v78.Position.X, v1298, v78.Position.Z)
  v78.AssemblyLinearVelocity = Vector3.new(0, -500, 0)
  v78.AssemblyAngularVelocity = Vector3.zero
  end
  end

  pcall(v873)
  pcall(function() v341.BreakJointsOnDeath = true end)
  pcall(function() v341:SetStateEnabled(Enum.HumanoidStateType.Dead, true) end)
  pcall(function() v341.Health = 0 end)
  pcall(function() v341:ChangeState(Enum.HumanoidStateType.Dead) end)
  pcall(function() v19:BreakJoints() end)

  local v1270 = os.clock()
  v774 = game:GetService("RunService").Heartbeat:Connect(function()
  if v692 then return end
  if os.clock() - v1270 > 2 then v325(nil); return end
  pcall(v873)
  end)
  task.delay(6, function() v325(LocalPlayer.Character ~= v19 and LocalPlayer.Character or nil) end)
  return true
end
_G.executeReset = v363
_G.InstantReset = v363


local function v909(v25, v1255)
  local v22 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  if not v22 or not v25 then return false end

  local v699 = v25:FindFirstChild("StealHitbox") or v25:FindFirstChildWhichIsA("BasePart")
  if not v699 then return false end

  local v888 = v699.Size * (v1255 or 0.977)
  local v887 = v699.Position
  local v949 = v22.Position

  return math.abs(v949.X - v887.X) <= (v888.X * 0.5) and
  math.abs(v949.Z - v887.Z) <= (v888.Z * 0.5)
end

local v780 = function()
  task.spawn(function()
  pcall(function()
  local v54 = LocalPlayer.Character
  if not v54 then return end

  local v35 = v54:FindFirstChildOfClass("Humanoid")
  if not v35 then return end

  local v591 =
  LocalPlayer.Backpack:FindFirstChild("Quantum Cloner")
  or v54:FindFirstChild("Quantum Cloner")

  if not v591 then return end

  if v591.Parent == LocalPlayer.Backpack then
  v35:EquipTool(v591)
  end
  task.wait(0.05)
  v591:Activate()
  task.wait(0.0279)

  pcall(function()
  local v1234 = LocalPlayer:WaitForChild("PlayerGui")
  local v1023 = v1234:FindFirstChild("ToolsFrames")
  if not v1023 then return end

  local v963 = v1023:FindFirstChild("QuantumCloner")
  if not v963 then return end

  local v1025 = v963:FindFirstChild("TeleportToClone")
  if not v1025 then return end

  local v842 = getconnections(v1025.MouseButton1Up)
  if v842[1] then
  v842[1]:Fire()
  end
  end)
  end)
  end)
end

function instantClone()
  v780()
end


do
animPlaying = false
tracks = {}
folderConnections = {}
serverGhosts = {}
ghostEnabled = true
invisOriginalLocalTransparency = setmetatable({}, { __mode = "k" })
lagbackCallCount = 0
lagbackWindowStart = 0
lastLagbackTime = 0
errorOrbActive = false
errorOrb = nil
errorOrbConnection = nil

_G.invisibleStealEnabled = false
_G.InvisStealAngle = Config.InvisStealAngle or 225
_G.SinkSliderValue = Config.SinkSliderValue or 7
_G.AutoRecoverLagback = Config.AutoRecoverLagback ~= nil and Config.AutoRecoverLagback or true
_G.AutoInvisDuringSteal = Config.AutoInvisDuringSteal or false

function clearErrorOrb()
  if errorOrb and errorOrb.Parent then errorOrb:Destroy() end
  errorOrb = nil; errorOrbActive = false
  if errorOrbConnection then errorOrbConnection:Disconnect(); errorOrbConnection = nil end
end

function createErrorOrb()
  if errorOrbActive then return end
  errorOrbActive = true
  for idx, v90 in pairs(serverGhosts) do if v90 and v90.Parent then v90:Destroy() end end
  serverGhosts = {}

end

function createServerGhost(v1226)
  if not ghostEnabled or errorOrbActive then return end
  local v60 = tick()
  if v60 - lastLagbackTime < 0.05 then return end
  lastLagbackTime = v60
  if v60 - lagbackWindowStart > 1 then lagbackCallCount = 0; lagbackWindowStart = v60 end
  lagbackCallCount = lagbackCallCount + 1
  if lagbackCallCount >= 7 then createErrorOrb(); return end
  for idx, v131 in pairs(serverGhosts) do if v131 and v131.Parent then v131:Destroy() end end
  serverGhosts = {}
  local v90 = Instance.new("Part")
  v90.Name = "LagbackGhost"; v90.Shape = Enum.PartType.Ball
  v90.Size = Vector3.new(3, 3, 3); v90.Color = Color3.fromRGB(255, 0, 0)
  v90.Material = Enum.Material.Glass; v90.Transparency = 0.3
  v90.CanCollide = false; v90.Anchored = true; v90.CastShadow = false
  v90.Position = v1226 + Vector3.new(0, 5, 0); v90.Parent = Workspace.CurrentCamera
  table.insert(serverGhosts, v90)

end

function clearAllGhosts()
  for idx, v90 in pairs(serverGhosts) do pcall(function() if v90 and v90.Parent then v90:Destroy() end end) end
  serverGhosts = {}; clearErrorOrb(); lagbackCallCount = 0; lastLagbackTime = 0
  pcall(function()
  local v956 = player:FindFirstChild("PlayerGui")
  if v956 then for idx, v300 in pairs(v956:GetChildren()) do if v300.Name == "LagbackNotification" then v300:Destroy() end end end
  end)
  pcall(function() if Workspace.CurrentCamera then for idx, v34 in pairs(Workspace.CurrentCamera:GetChildren()) do if v34.Name == "LagbackGhost" then v34:Destroy() end end end end)
end

function removeFolders()
  local v583 = Workspace:FindFirstChild(player.Name)
  if not v583 then return end
  local v558 = v583:FindFirstChild("DoubleRig")
  if v558 then
  local v499 = v558:FindFirstChild("HumanoidRootPart") or v558:FindFirstChildWhichIsA("BasePart")
  if v499 and ghostEnabled then createServerGhost(v499.Position) end
  v558:Destroy()
  end
  local v859 = v583:FindFirstChild("Constraints")
  if v859 then v859:Destroy() end
  local v208 = v583.ChildAdded:Connect(function(v24)
  if v24.Name == "DoubleRig" then
  task.defer(function()
  local v499 = v24:FindFirstChild("HumanoidRootPart") or v24:FindFirstChildWhichIsA("BasePart")
  if v499 and ghostEnabled then createServerGhost(v499.Position) end
  v24:Destroy()
  end)
  elseif v24.Name == "Constraints" then v24:Destroy() end
  end)
  table.insert(folderConnections, v208)
end

function doClone()
  local v54 = player.Character
  if v54 and v54:FindFirstChild("Humanoid") and v54.Humanoid.Health > 0 then
  hip = v54.Humanoid.HipHeight
  oldRoot = v54:FindFirstChild("HumanoidRootPart")
  if not oldRoot or not oldRoot.Parent then return false end
  for idx, v34 in pairs(oldRoot:GetChildren()) do
  if v34:IsA("Attachment") and (v34.Name:find("Beam") or v34.Name:find("Attach")) then v34:Destroy() end
  end
  for idx, v34 in pairs(oldRoot:GetChildren()) do if v34:IsA("Beam") then v34:Destroy() end end
  local v438 = Instance.new("Model"); v438.Parent = game
  v54.Parent = v438
  clone = oldRoot:Clone()
  clone.Transparency = 1
  clone.LocalTransparencyModifier = 1
  clone.CanCollide = true
  clone.CanTouch = false
  clone.CanQuery = false
  clone.CastShadow = false
  clone.Parent = v54
  oldRoot.Transparency = 1
  oldRoot.LocalTransparencyModifier = 1
  oldRoot.CanCollide = false
  oldRoot.CanTouch = false
  oldRoot.CanQuery = false
  oldRoot.CastShadow = false
  oldRoot.Parent = Workspace.CurrentCamera
  clone.CFrame = oldRoot.CFrame; v54.PrimaryPart = clone
  v54.Parent = Workspace
  for idx, v26 in pairs(v54:GetDescendants()) do
  if v26:IsA("Weld") or v26:IsA("Motor6D") then
  if v26.Part0 == oldRoot then v26.Part0 = clone end
  if v26.Part1 == oldRoot then v26.Part1 = clone end
  end
  end
  v438:Destroy(); return true
  end
  return false
end

function enforceInvisibleCharacter(v54)
  if not v54 then return end
  for idx, v56 in ipairs(v54:GetDescendants()) do
  if v56:IsA("BasePart") then
  if invisOriginalLocalTransparency[v56] == nil then
  invisOriginalLocalTransparency[v56] = {
  localTransparency = v56.LocalTransparencyModifier,
  castShadow = v56.CastShadow,
  }
  end
  v56.LocalTransparencyModifier = 1
  v56.CastShadow = false
  end
  end
end

function restoreInvisibleCharacter()
  for v56, v944 in pairs(invisOriginalLocalTransparency) do
  if v56 and v56.Parent then
  pcall(function()
  v56.LocalTransparencyModifier = v944.localTransparency
  v56.CastShadow = v944.castShadow
  end)
  end
  invisOriginalLocalTransparency[v56] = nil
  end
end

function revertClone()
  local v54 = player.Character
  if not oldRoot or not oldRoot:IsDescendantOf(Workspace) or not v54 or v54.Humanoid.Health <= 0 then return end
  local v438 = Instance.new("Model"); v438.Parent = game
  v54.Parent = v438
  oldRoot.Parent = v54; v54.PrimaryPart = oldRoot
  v54.Parent = Workspace; oldRoot.CanCollide = true
  for idx, v26 in pairs(v54:GetDescendants()) do
  if v26:IsA("Weld") or v26:IsA("Motor6D") then
  if v26.Part0 == clone then v26.Part0 = oldRoot end
  if v26.Part1 == clone then v26.Part1 = oldRoot end
  end
  end
  if clone then local v23 = clone.CFrame; clone:Destroy(); clone = nil; oldRoot.CFrame = v23 end
  oldRoot = nil
  if v54 and v54.Humanoid then v54.Humanoid.HipHeight = hip end
  restoreInvisibleCharacter()
  clearAllGhosts()
end

local v273 = nil
function animationTrickery()
  local v54 = player.Character
  if v54 and v54:FindFirstChild("Humanoid") and v54.Humanoid.Health > 0 then
  local v119 = v54.Humanoid
  local v192 = v119:FindFirstChild("Animator") or Instance.new("Animator", v119)

  if not v273 or v273.Parent ~= v192 then
  local v822 = Instance.new("Animation")
  v822.AnimationId = "http://www.roblox.com/asset/?id=18537363391"
  v273 = v192:LoadAnimation(v822)
  v273.Priority = Enum.AnimationPriority.Action4
  end

  v273:Play(0, 1, 0)
  table.insert(tracks, v273)
  v273.Stopped:Connect(function() if animPlaying then animationTrickery() end end)
  task.delay(0, function()
  v273.TimePosition = 0.7
  task.delay(0.3, function() if v273 then v273:AdjustSpeed(math.huge) end end)
  end)
  end
end

_invisToggleCooldown = 0

function invisTurnOff()
  clearAllGhosts()
  if not animPlaying then return end
  local v54 = player.Character
  local v119 = v54 and v54:FindFirstChildOfClass("Humanoid")
  animPlaying = false; _G.invisibleStealEnabled = false
  setToggle("Invisible Steal", false)
  for idx, tmpInst in pairs(tracks) do pcall(function() tmpInst:Stop(0) end) end
  tracks = {}
  if connection then connection:Disconnect(); connection = nil end
  for idx, v34 in ipairs(folderConnections) do if v34 then v34:Disconnect() end end
  folderConnections = {}
  revertClone(); clearAllGhosts()

  if v119 then
  pcall(function()
  local v192 = v119:FindFirstChildOfClass("Animator")
  if v192 then
  for idx, v137 in ipairs(v192:GetPlayingAnimationTracks()) do
  if v137.Priority == Enum.AnimationPriority.Action4 or v137.Priority == Enum.AnimationPriority.Action3 then
  v137:Stop(0)
  end
  end
  end
  v119:ChangeState(Enum.HumanoidStateType.GettingUp)
  task.defer(function()
  if v119 and v119.Parent then
  v119:ChangeState(Enum.HumanoidStateType.Running)
  end
  end)
  end)
  end
  if _G.updateMovementPanelInvisVisual then pcall(_G.updateMovementPanelInvisVisual, false) end

  pcall(function() setWalkSpeedEnabled(false) end)
  _invisToggleCooldown = tick()
end

function invisTurnOn()
  if animPlaying then return end
  local v54 = player.Character
  if not v54 then return end
  local v119 = v54:FindFirstChildOfClass("Humanoid")
  if not v119 then return end
  animPlaying = true; _G.invisibleStealEnabled = true
  setToggle("Invisible Steal", true)
  if _G.updateMovementPanelInvisVisual then pcall(_G.updateMovementPanelInvisVisual, true) end
  pcall(function() setWalkSpeedEnabled(true) end)
  tracks = {}; removeFolders()
  local v234 = doClone()
  if v234 then
  task.wait(0.05); animationTrickery()
  task.defer(function()
  if _G.resetBrainrotBeam then pcall(_G.resetBrainrotBeam) end
  if _G.resetPlotBeam then pcall(_G.resetPlotBeam) end
  task.wait(0.1)
  if _G.updateBrainrotBeam then pcall(_G.updateBrainrotBeam) end
  if _G.createPlotBeam then pcall(_G.createPlotBeam) end
  end)
  local v477 = nil; local v746 = 5
  connection = RunService.PreSimulation:Connect(function()
  if v54 and v54:FindFirstChild("Humanoid") and v54.Humanoid.Health > 0 and oldRoot then
  enforceInvisibleCharacter(v54)
  local v78 = v54.PrimaryPart or v54:FindFirstChild("HumanoidRootPart")
  if v78 then
  if v746 > 0 then v746 = v746 - 1; v477 = nil
  elseif v477 and ghostEnabled then
  local v854 = oldRoot.Position
  local v1167 = (v854 - v477).Magnitude
  if v1167 > 6 and not _G.RecoveryInProgress and player:GetAttribute("Stealing") then
  v477 = nil; createServerGhost(v854)
  if _G.AutoRecoverLagback and _G._forceInvisToggle then
  _G.RecoveryInProgress = true
  task.spawn(function()
  pcall(_G._forceInvisToggle); task.wait(0.6)
  if player:GetAttribute("Stealing") then
  pcall(_G._forceInvisToggle)
  end
  _G.RecoveryInProgress = false
  end)
  end
  end
  end
  if clone then
  clone.Transparency = 1
  clone.LocalTransparencyModifier = 1
  clone.CanCollide = true
  clone.CanTouch = false
  clone.CanQuery = false
  clone.CastShadow = false
  end
  if oldRoot and oldRoot.Parent then
  local v1254 = _G.InvisStealAngle or (Config and Config.InvisStealAngle) or 180

  local v1248 = (_G.SinkSliderValue or 7) * 0.5
  local v450 = v78.CFrame - Vector3.new(0, v1248, 0)
  oldRoot.CFrame = v450 * CFrame.Angles(math.rad(v1254), 0, 0)
  oldRoot.AssemblyLinearVelocity = v78.AssemblyLinearVelocity; oldRoot.CanCollide = false
  v477 = oldRoot.Position
  end
  end
  end
  end)
  end
end

_G.toggleInvisibleSteal = function()
  if (tick() - _invisToggleCooldown) < 0.3 then return end
  if animPlaying then invisTurnOff() else invisTurnOn() end
end


_G._forceInvisToggle = function()
  if animPlaying then invisTurnOff() else invisTurnOn() end
end

player.CharacterAdded:Connect(function(v331)
  task.wait(0.1)
  if Config then
  setToggle("Click to AP", Config.ClickToAP, true)
  setToggle("ClickToAP", Config.ClickToAP, true)
  end
  clearErrorOrb(); clearAllGhosts(); lagbackCallCount = 0
  pcall(function() for idx, v34 in pairs(Workspace.CurrentCamera:GetChildren()) do if v34:IsA("BasePart") and v34.Name == "HumanoidRootPart" then v34:Destroy() end end end)
  if oldRoot then pcall(function() oldRoot:Destroy() end); oldRoot = nil end
  if clone then pcall(function() clone:Destroy() end); clone = nil end
  animPlaying = false; _G.invisibleStealEnabled = false
  setToggle("Invisible Steal", false)
  if _G.updateMovementPanelInvisVisual then pcall(_G.updateMovementPanelInvisVisual, false) end
  if _G.forceRescanBrainrots then pcall(_G.forceRescanBrainrots) end
  task.wait(0.2)
  local v243 = Workspace.CurrentCamera
  if v243 and v331 then
  local v52 = v331:FindFirstChildOfClass("Humanoid")
  if v52 then v243.CameraSubject = v52; v243.CameraType = Enum.CameraType.Custom end
  end
end)

function setupDeathListener()
  local v68 = player.Character
  if v68 then
  local v52 = v68:FindFirstChildOfClass("Humanoid")
  if v52 then
  v52.Died:Connect(function()
  clearErrorOrb()
  clearAllGhosts()
  lagbackCallCount = 0


  if animPlaying and invisTurnOff then pcall(invisTurnOff) end
  if _G._forceInvisToggle and _G.invisibleStealEnabled then pcall(_G._forceInvisToggle) end
  _G.invisibleStealEnabled = false
  pcall(function() setToggle("Invisible Steal", false) end)
  pcall(function()
  for idx, v34 in pairs(workspace.CurrentCamera:GetChildren()) do
  if v34:IsA("BasePart") and v34.Name == "HumanoidRootPart" then v34:Destroy() end
  end
  end)
  end)
  end
  end
end
setupDeathListener()
player.CharacterAdded:Connect(function(v331)
  _G.invisibleStealEnabled = false
  pcall(function() setToggle("Invisible Steal", false) end)
  task.wait(0.1)
  setupDeathListener()
end)


_G.setupAntiDie = function() end


task.spawn(function()
  local v770 = false
  local v540 = false
  task.wait(1)
  while task.wait(0.15) do
  if Config.AutoInvisDuringSteal == false then
  v770 = false
  v540 = false
  else
  local v328 = player:GetAttribute("Stealing")
  if v328 and not v770 then
  if not _G.invisibleStealEnabled and _G._forceInvisToggle then
  task.defer(function()
  if player:GetAttribute("Stealing") and not _G.invisibleStealEnabled then
  pcall(_G._forceInvisToggle)
  v540 = true
  end
  end)
  end
  end
  if not v328 and v540 and _G.invisibleStealEnabled and _G._forceInvisToggle then
  task.wait(0.3)
  if not player:GetAttribute("Stealing") then
  pcall(_G._forceInvisToggle)
  v540 = false
  end
  end
  v770 = v328
  end
  end
end)
end


FloatState={active=false,platform=nil,followConn=nil}
function removeFloatPlatform() end
function createFloatPlatform() end
function setFloat(v38) end
_G.toggleFloat=function() end


WalkSpeedState = {enabled = false, conn = nil, speed = Config.WalkSpeedValue or 16}
function setWalkSpeedEnabled(v164)
  WalkSpeedState.enabled = v164
  Config.WalkSpeedEnabled = v164
  setToggle("WalkSpeed", v164)
  if _G.updateWalkspeedPanelVisual then pcall(_G.updateWalkspeedPanelVisual, v164) end
  saveConfig()
  if WalkSpeedState.conn then WalkSpeedState.conn:Disconnect(); WalkSpeedState.conn = nil end
  if not v164 then return end
  WalkSpeedState.conn = RunService.Heartbeat:Connect(function(v1119)
  local v54 = player.Character
  if not v54 then return end
  local v119 = v54:FindFirstChildOfClass("Humanoid")
  local v501 = v54:FindFirstChild("HumanoidRootPart")
  if not v119 or not v501 or v119.Health <= 0 then return end
  if v119.MoveDirection.Magnitude > 0 and WalkSpeedState.speed > v119.WalkSpeed then
  local v1112 = WalkSpeedState.speed - v119.WalkSpeed
  v501.CFrame = v501.CFrame + (v119.MoveDirection * v1112 * v1119)
  end
  end)
end
function setWalkSpeedValue(v26)
  v26 = math.clamp(math.floor(v26 + 0.5), 15, 29)
  WalkSpeedState.speed = v26
  Config.WalkSpeedValue = v26
  saveConfig()
  return v26
end
_G.setWalkSpeedEnabled = setWalkSpeedEnabled
_G.setWalkSpeedValue = setWalkSpeedValue


CarpetState={enabled=false,conn=nil}
SPEED_BOOST_TOOL_NAMES = {
  ["Flying Carpet"]=true, ["Carpet"]=true, ["Cloud"]=true,
  ["Witch's Broom"]=true, ["Cupid's Wings"]=true, ["Santa's Sleigh"]=true,
  ["Magic Carpet"]=true, ["Waverider"]=true,
}
function isSpeedBoostTool(v158)
  if not v158 or not v158:IsA("Tool") then return false end
  if SPEED_BOOST_TOOL_NAMES[v158.Name] then return true end
  local v260 = Config.TpSettings and Config.TpSettings.Tool
  return v260 ~= nil and v158.Name == v260
end
function getEquippedTool(character)
  if not character then return nil end
  return character:FindFirstChildWhichIsA("Tool")
end
function equipSpeedBoostToolOnce(v34, v35)
  if not v34 or not v35 then return nil end
  local v260 = Config.TpSettings.Tool or "Flying Carpet"
  if v34:FindFirstChild(v260) then return v260 end
  local v1002 = player.Backpack:FindFirstChild(v260)
  if v1002 then pcall(function() v35:EquipTool(v1002) end); return v260 end
  for v30 in pairs(SPEED_BOOST_TOOL_NAMES) do
  if v34:FindFirstChild(v30) then return v30 end
  local tmpInst = player.Backpack:FindFirstChild(v30)
  if tmpInst then pcall(function() v35:EquipTool(tmpInst) end); return v30 end
  end
  return nil
end
function isCarpetSpeedBlocked()
  if _G._isTpMoving then return true end
  if player:GetAttribute("Stealing") then return true end
  return false
end
_G.isCarpetSpeedBlocked = isCarpetSpeedBlocked
function setCarpetSpeed(v164)
  if v164 and isCarpetSpeedBlocked() then return end
  CarpetState.enabled=v164
  Config["Carpet Speed"]=v164
  setToggle("Carpet Speed",v164)
  saveConfig()
  if CarpetState.conn then CarpetState.conn:Disconnect(); CarpetState.conn=nil end
  if not v164 then return end
  local v34=player.Character
  local v35=v34 and v34:FindFirstChild("Humanoid")
  if v34 and v35 then equipSpeedBoostToolOnce(v34, v35) end
  CarpetState.conn=RunService.Heartbeat:Connect(function()
  local v34=player.Character
  if not v34 then return end
  if isCarpetSpeedBlocked() then
  local v22=v34:FindFirstChild("HumanoidRootPart")
  if v22 then v22.AssemblyLinearVelocity=Vector3.new(0,v22.AssemblyLinearVelocity.Y,0) end
  return
  end
  local v35=v34:FindFirstChild("Humanoid")
  local v22=v34:FindFirstChild("HumanoidRootPart")
  if not v35 or not v22 then return end
  local v362 = getEquippedTool(v34)
  if v362 and not isSpeedBoostTool(v362) then
  v22.AssemblyLinearVelocity=Vector3.new(0, v22.AssemblyLinearVelocity.Y, 0)
  setCarpetSpeed(false)
  return
  end
  if v362 and isSpeedBoostTool(v362) then
  local v711=v35.MoveDirection
  if v711.Magnitude>0 then
  v22.AssemblyLinearVelocity=Vector3.new(v711.X*140,v22.AssemblyLinearVelocity.Y,v711.Z*140)
  else
  v22.AssemblyLinearVelocity=Vector3.new(0,v22.AssemblyLinearVelocity.Y,0)
  end
  end
  end)
end
_G.setCarpetSpeed = setCarpetSpeed

CarpetSpeedToolConn = nil
function stopCarpetSpeedFromToolSwitch(character)
  if not CarpetState.enabled or not character then return end
  local v362 = getEquippedTool(character)
  if v362 and not isSpeedBoostTool(v362) then
  local v22 = character:FindFirstChild("HumanoidRootPart")
  if v22 then v22.AssemblyLinearVelocity = Vector3.new(0, v22.AssemblyLinearVelocity.Y, 0) end
  setCarpetSpeed(false)
  end
end
function bindCarpetSpeedToolWatch(character)
  if CarpetSpeedToolConn then
  pcall(function() CarpetSpeedToolConn:Disconnect() end)
  CarpetSpeedToolConn = nil
  end
  if not character then return end
  CarpetSpeedToolConn = character.ChildAdded:Connect(function(v24)
  if v24:IsA("Tool") then
  task.defer(function() stopCarpetSpeedFromToolSwitch(character) end)
  end
  end)
end
player.CharacterAdded:Connect(function(character)
  bindCarpetSpeedToolWatch(character)
  if CarpetState.enabled then
  task.defer(function()
  local v35 = character:WaitForChild("Humanoid", 10)
  if v35 and CarpetState.enabled then equipSpeedBoostToolOnce(character, v35) end
  end)
  end
end)
if player.Character then bindCarpetSpeedToolWatch(player.Character) end


InfJumpState={enabled=false,conn=nil,lastJump=0}
function setInfiniteJump(v164) InfJumpState.enabled=v164; Config.InfiniteJump=v164; Config.TpSettings.InfiniteJump=v164; setToggle("Infinite Jump",v164); saveConfig()
  if InfJumpState.conn then InfJumpState.conn:Disconnect(); InfJumpState.conn=nil end; if not v164 then return end
  InfJumpState.conn=RunService.Heartbeat:Connect(function() if not UIS:IsKeyDown(Enum.KeyCode.Space) then return end
  local v60=tick(); if v60-InfJumpState.lastJump<0.1 then return end; local v34=player.Character; if not v34 then return end
  local v22=v34:FindFirstChild("HumanoidRootPart"); local v35=v34:FindFirstChild("Humanoid"); if not v22 or not v35 or v35.Health<=0 then return end
  InfJumpState.lastJump=v60; v22.AssemblyLinearVelocity=Vector3.new(v22.AssemblyLinearVelocity.X,55,v22.AssemblyLinearVelocity.Z)
  end)
end


do
  local v403 = {}
  local v205, v226, v534, v533
  local v922 = Vector3.new(0, 0, 0)
  local v1327 = 40
  local v1328 = 25
  local v1321 = 15

  local function v907()
  if not v205 then return false end
  local v158 = v205:FindFirstChildWhichIsA("Tool")
  if not v158 then return false end
  local v22 = v205:FindFirstChild("HumanoidRootPart")
  if v22 then
  for idx, inst in ipairs(v22:GetChildren()) do
  if inst:IsA("BodyVelocity") or inst:IsA("BodyPosition") or inst:IsA("BodyGyro") then
  return true
  end
  end
  end
  return false
  end

  local function v572()
  if _G._isTpMoving or isTeleporting then return false end
  if not v226 then return false end
  local v99 = v226:GetState()
  return v99 == Enum.HumanoidStateType.Physics
  or v99 == Enum.HumanoidStateType.Ragdoll
  or v99 == Enum.HumanoidStateType.FallingDown
  or v99 == Enum.HumanoidStateType.GettingUp
  end

  local function v682()
  pcall(function()
  local v344 = player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule", 10)
  require(v344):GetControls():Enable()
  end)
  end

  local function v548()
  if not v205 then return end
  local v1091 = v907()

  local function v1229(v69)
  for idx, inst in ipairs(v69:GetChildren()) do
  if inst:IsA("BallSocketConstraint") or inst:IsA("NoCollisionConstraint") or inst:IsA("HingeConstraint")
  or (inst:IsA("Attachment") and (inst.Name == "A" or inst.Name == "B")) then
  inst:Destroy()
  elseif inst:IsA("BodyVelocity") or inst:IsA("BodyPosition") or inst:IsA("BodyGyro") then
  if not v1091 then inst:Destroy() end
  elseif inst:IsA("Motor6D") then
  inst.Enabled = true
  elseif inst:IsA("BasePart") then
  for idx, v24 in ipairs(inst:GetChildren()) do
  if v24:IsA("BallSocketConstraint") or v24:IsA("NoCollisionConstraint") or v24:IsA("HingeConstraint") or v24:IsA("Motor6D") then
  if v24:IsA("Motor6D") then
  v24.Enabled = true
  else
  v24:Destroy()
  end
  elseif v24:IsA("Attachment") and (v24.Name == "A" or v24.Name == "B") then
  v24:Destroy()
  end
  end
  end
  end
  end

  pcall(function() v1229(v205) end)

  if v533 then
  for idx, v137 in pairs(v533:GetPlayingAnimationTracks()) do
  local v537 = v137.Animation and v137.Animation.Name:lower() or ""
  if v537:find("rag") or v537:find("fall") or v537:find("hurt") or v537:find("down") then
  v137:Stop(0)
  end
  end
  end
  end

  local function v750(character)
  v205 = character
  v226 = character:WaitForChild("Humanoid", 10)
  v534 = character:WaitForChild("HumanoidRootPart", 10)
  v533 = v226 and v226:WaitForChild("Animator", 10)
  v922 = Vector3.new(0, 0, 0)
  end

  local function v667()
  for idx, v34 in pairs(v403) do
  pcall(function() v34:Disconnect() end)
  end
  v403 = {}
  end

  local function v751()
  v667()
  if not v226 or not v534 then return end

  local function v743()
  local v144 = v205
  and v205:FindFirstChild("HumanoidRootPart")
  if v144 and v144.Parent == v205 then
  v534 = v144
  end
  return v144
  end

  table.insert(v403, v226.StateChanged:Connect(function()
  if (_G.AntiRagdollEnabled or _G.antiKnockbackEnabled) and v572() then
  local v144 = v743()
  if v144 then
  v144.AssemblyLinearVelocity = Vector3.zero
  v144.AssemblyAngularVelocity = Vector3.zero
  end
  if not v907() then
  v226:ChangeState(Enum.HumanoidStateType.Running)
  end
  v548()
  Workspace.CurrentCamera.CameraSubject = v226
  v682()
  end
  end))

  pcall(function()
  local v891 = _G.Net and _G.Net:RemoteEvent("CombatService/ApplyImpulse")
  if v891 then
  table.insert(v403, v891.OnClientEvent:Connect(function()
  if (_G.AntiRagdollEnabled or _G.antiKnockbackEnabled) and v572() then
  local v144 = v743()
  if v144 then
  v144.AssemblyLinearVelocity = Vector3.zero
  v144.AssemblyAngularVelocity = Vector3.zero
  end
  end
  end))
  end
  end)

  table.insert(v403, v205.DescendantAdded:Connect(function()
  if (_G.AntiRagdollEnabled or _G.antiKnockbackEnabled) and v572() then
  v548()
  end
  end))

  table.insert(v403, RunService.Heartbeat:Connect(function()
  if not v205 or not v226 then return end
  local v144 = v743()
  if not v144 then return end

  local v705 = v572()
  local v1188 = v226.MoveDirection.Magnitude
  local v442 = v144.AssemblyLinearVelocity

  if v705 then
  v548()
  v682()

  v144.AssemblyLinearVelocity = Vector3.new(0, math.clamp(v442.Y, -5, 5), 0)
  v144.AssemblyAngularVelocity = Vector3.zero
  pcall(function()
  for idx, v23 in ipairs(v205:GetDescendants()) do
  if v23:IsA("BasePart") then
  v23.AssemblyLinearVelocity = Vector3.new(0, math.clamp(v23.AssemblyLinearVelocity.Y, -5, 5), 0)
  v23.AssemblyAngularVelocity = Vector3.zero
  end
  end
  end)
elseif not _G._isTpMoving and not (FloatState and FloatState.active) and v1188 < 0.1 and (Vector3.new(v442.X, 0, v442.Z).Magnitude > 60 or v442.Y > 100) then

  v144.AssemblyLinearVelocity = Vector3.new(0, math.clamp(v442.Y, -5, 5), 0)
  v144.AssemblyAngularVelocity = Vector3.zero
  end

  v922 = v442
  end))

  v682()
  v548()
  end

  function startAntiRagdoll()
  _G.AntiRagdollEnabled = true
  _G.antiKnockbackEnabled = true
  Config.AntiRagdoll = true; setToggle("Anti Ragdoll", true); saveConfig()
  if player.Character then
  v750(player.Character)
  v751()
  end
  end

  function stopAntiRagdoll()
  _G.AntiRagdollEnabled = false
  _G.antiKnockbackEnabled = false
  Config.AntiRagdoll = false; setToggle("Anti Ragdoll", false); saveConfig()
  v667()
  end

  _G.toggleAntiRagdoll = function(v130)
  if v130 then startAntiRagdoll() else stopAntiRagdoll() end
  end
  _G.enableAntiKnockback = function() startAntiRagdoll() end
  _G.disableAntiKnockback = function() stopAntiRagdoll() end

  player.CharacterAdded:Connect(function(character)
  v667()
  v205 = nil; v226 = nil; v534 = nil; v533 = nil
  local v119 = character:WaitForChild("Humanoid", 10)
  local v501 = character:WaitForChild("HumanoidRootPart", 10)
  if not v119 or not v501 then return end
  task.wait(0.2)
  v750(character)
  if _G.AntiRagdollEnabled or _G.antiKnockbackEnabled then
  v751()
  end
  end)

  if player.Character then
  v750(player.Character)
  if _G.AntiRagdollEnabled or _G.antiKnockbackEnabled then
  v751()
  end
  end
end


do
  local v180 = nil
  local function v535()
  if not Config.DarkTheme then
  if v180 then pcall(function() v180:Destroy() end); v180 = nil end
  return
  end
  if not v180 or not v180.Parent then
  v180 = Instance.new("ColorCorrectionEffect")
  v180.Name = "CLTHUBDarkTheme"
  v180.Parent = Lighting
  end
  local v28 = math.clamp((Config.DarkThemeIntensity or 50) / 100, 0, 1)
  v180.Enabled = true
  v180.Brightness = -0.45 * v28
  v180.Contrast = 0.08 * v28
  v180.Saturation = -0.12 * v28
  end

  task.spawn(function()
  while true do
  task.wait(2)
  if Config.DarkTheme and (not v180 or not v180.Parent or not v180.Enabled) then
  pcall(v535)
  end
  end
  end)
end

function applyUnwalk(character, v38)
  if not character then return end
  local v35 = character:FindFirstChildOfClass("Humanoid")
  local v192 = v35 and v35:FindFirstChildOfClass("Animator")
  local v532 = character:FindFirstChild("Animate")
  if v38 then
  if v532 then v532.Disabled = true end
  if v192 then
  local ok, v1026 = pcall(function() return v192:GetPlayingAnimationTracks() end)
  if ok and v1026 then
  for idx, tmpInst in ipairs(v1026) do pcall(function() tmpInst:Stop(0) end) end
  end
  end
  else
  if v532 then v532.Disabled = false end
  end
end

function setUnwalk(v38) end
_G.setUnwalk = function() end

player.CharacterAdded:Connect(function(character)
  task.spawn(function()
  character:WaitForChild("Humanoid", 10)
  task.wait(0.1)
  if Config.Unwalk then
  for v28 = 1, 6 do
  if not Config.Unwalk or player.Character ~= character then break end
  applyUnwalk(character, true)
  task.wait(0.3)
  end
  end
  end)
end)

function isMyPlot_Instant(v157)
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return false end
  local v25 = v53:FindFirstChild(v157)
  if not v25 then return false end


  local v997 = false
  local v253 = false
  pcall(function()
  local v343 = ReplicatedStorage:FindFirstChild("Packages")
  local v225 = v343 and require(v343:FindFirstChild("Synchronizer"))
  if v225 then
  local v68 = _G.XenSyncGet(v157)
  if v68 then
  local v285 = _G.sProp(v68, "Owner")
  if v285 then
  v997 = true
  if (typeof(v285) == "Instance" and v285 == player) or
  (typeof(v285) == "table" and v285.UserId == player.UserId) or
  (typeof(v285) == "number" and v285 == player.UserId) or
  (typeof(v285) == "string" and (v285:lower() == player.Name:lower() or v285:lower() == player.DisplayName:lower())) then
  v253 = true
  end
  end
  end
  end
  end)
  if v997 then return v253 end


  local v111 = v25:FindFirstChild("PlotSign")
  if v111 then
  local v506 = v111:FindFirstChildWhichIsA("SurfaceGui", true)
  if v506 then
  local v81 = v506:FindFirstChildWhichIsA("TextLabel", true)
  if v81 then
  local v100 = v81.Text:lower()
  if v100:find(player.DisplayName:lower(), 1, true) or v100:find(player.Name:lower(), 1, true) then
  return true
  end
  end
  end
  end


  if v111 then
  local v391 = v111:FindFirstChild("YourBase")
  if v391 and v391:IsA("BillboardGui") and v391.Enabled == true then
  return true
  end
  end

  return false
end
_G.isMyPlot_Instant = isMyPlot_Instant


function getUnlockHRP()
  local v34 = LocalPlayer.Character or player.Character
  if not v34 then return end
  return v34:FindFirstChild("HumanoidRootPart") or v34:FindFirstChild("UpperTorso")
end

function smartInteract() end

function getCurrentUnlockFloor()
  local v22 = getUnlockHRP()
  if not v22 then return 1 end

  local v315 = v22.Position.Y
  if v315 < 12 then
  return 1
  else
  return 2
  end
end


ProximityAPActive=false
proxAPRing = nil

function createProxAPRing()
  local v870 = Workspace:FindFirstChild("XiProxAPRing")
  if v870 then v870:Destroy() end
  local v83 = Instance.new("Part")
  v83.Name = "XiProxAPRing"
  v83.Shape = Enum.PartType.Cylinder
  v83.Anchored = true
  v83.CanCollide = false
  v83.CanTouch = false
  v83.CanQuery = false
  v83.CastShadow = false
  v83.Material = Enum.Material.Neon
  v83.Transparency = 0.7
  v83.Color = Color3.fromRGB(255, 40, 40)
  local v498 = Config.ProximityRange or 15
  v83.Size = Vector3.new(0.2, v498*2, v498*2)
  v83.Parent = Workspace
  proxAPRing = v83
end

function destroyProxAPRing()
  if proxAPRing then proxAPRing:Destroy(); proxAPRing = nil end
  local v50 = Workspace:FindFirstChild("XiProxAPRing")
  if v50 then v50:Destroy() end
end

_proxAPRingFrame=0
RunService.Heartbeat:Connect(function()
  if not ProximityAPActive then return end
  _proxAPRingFrame = _proxAPRingFrame + 1
  if _proxAPRingFrame < 2 then return end
  _proxAPRingFrame = 0
  local character = player.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 or not proxAPRing then return end
  local v498 = Config.ProximityRange or 15
  proxAPRing.Size = Vector3.new(0.2, v498 * 2, v498 * 2)
  proxAPRing.CFrame = (v22.CFrame * CFrame.Angles(0, 0, math.rad(90))) - Vector3.new(0, 2.8, 0)

  if proxAPRing.Material ~= Enum.Material.Neon then proxAPRing.Material = Enum.Material.Neon end
  if proxAPRing.Transparency > 0.75 then proxAPRing.Transparency = 0.7 end
  proxAPRing.Color = Color3.fromRGB(255, 40, 40)
end)

function setProximityAP(v38)
  ProximityAPActive = v38

  Config.ProximityAP = false
  setToggle("Proximity", v38)
  if v38 then createProxAPRing() else destroyProxAPRing() end
end

onToggleChanged("Proximity", function(v38)
  ProximityAPActive = v38

  Config.ProximityAP = false
  if v38 then createProxAPRing() else destroyProxAPRing() end
end)

task.spawn(function()
  while true do
  task.wait(0.2)
  if ProximityAPActive then
  local v476 = player.Character
  local v927 = v476 and v476:FindFirstChild("HumanoidRootPart")
  if v927 then
  for idx,v23 in ipairs(PlayersService:GetPlayers()) do
  if v23 ~= player and v23.Character and v23.Character:FindFirstChild("HumanoidRootPart") then
  if isPlayerBlacklisted(v23) then continue end
  if (v23.Character.HumanoidRootPart.Position - v927.Position).Magnitude <= (Config.ProximityRange or 15) then
  local v241 = {}
  for idx,v47 in ipairs(AP_ALL_COMMANDS) do
  if not apIsOnCooldown(v47) then
  table.insert(v241, v47)
  end
  end
  task.spawn(function()
  for idx, v47 in ipairs(v241) do
  if not ProximityAPActive or not v23.Parent then break end
  runAdminCommand(v23, v47)
  task.wait(0.2)
  end
  end)
  end
  end
  end
  end
  end
  end
end)


task.spawn(function()
  local v1170 = "you stole"
  local v1169 = 'ran "balloon" on you'
  local v898 = setmetatable({}, {__mode = "k"})

  local function v847(inst)
  local v95 = tostring(inst.Text or "")
  if v95 == "" then return end
  local v914 = string.lower(v95)

  if Config.AutoKickOnSteal and string.find(v914, v1170, 1, true) then
  kickPlayer(v95)
  elseif Config.AutoResetBalloon and string.find(v914, v1169, 1, true) then
  v363(true)
  end
  end

  local function v897(inst)
  if v898[inst] then return end
  v898[inst] = true
  v847(inst)
  inst:GetPropertyChangedSignal("Text"):Connect(function() v847(inst) end)
  end

  local function v1029(v78)

  task.spawn(function()
  for idx, inst in ipairs(v78:GetDescendants()) do
  if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
  v897(inst)
  end
  end
  end)
  v78.DescendantAdded:Connect(function(v58)
  if v58:IsA("TextLabel") or v58:IsA("TextButton") or v58:IsA("TextBox") then
  v897(v58)
  end
  end)
  end

  for idx, v131 in ipairs(playerGui:GetChildren()) do v1029(v131) end
  playerGui.ChildAdded:Connect(function(v131) v1029(v131) end)
end)

task.spawn(function()
  local v620 = game:GetService("GuiService")
  if typeof(cloneref) == "function" then pcall(function() v620 = cloneref(v620) end) end
  local v588 = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")

  local function v606(inst)
  if not Config.CleanErrorGUIs or not inst then return end
  local v30 = string.lower(inst.Name or "")
  if v30 == "errorprompt" or v30 == "errorframe" then
  pcall(function()
  if inst:IsA("LayerCollector") then
  inst.Enabled = false
  elseif inst:IsA("GuiObject") then
  inst.Visible = false
  end
  end)
  end
  end

  local function v1028(v78)
  if not v78 then return end
  pcall(function()
  for idx, inst in ipairs(v78:GetDescendants()) do v606(inst) end
  v78.DescendantAdded:Connect(function(inst)
  task.defer(v606, inst)
  end)
  end)
  end

  v1028(v588)
  game:GetService("CoreGui").ChildAdded:Connect(function(inst)
  if inst.Name == "RobloxPromptGui" then
  v588 = inst
  v1028(inst)
  end
  end)

  while true do
  if Config.CleanErrorGUIs then
  pcall(function() v620:ClearError() end)
  if v588 then
  local v284 = v588:FindFirstChild("promptOverlay", true)
  if v284 then
  v606(v284:FindFirstChild("ErrorPrompt"))
  v606(v284:FindFirstChild("ErrorFrame"))
  end
  end
  end
  task.wait(0.25)
  end
end)


task.spawn(function()
  local function v599(inst)
  if not (inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox")) then return end
  local v95 = tostring(inst.Text or "")
  local v573 = string.lower(v95)
  if string.find(v573, "command is on cooldown") or string.find(v573, "on cooldown") or string.find(v573, "successfully executed") or string.find(v573, "executed") then
  pcall(function()
  inst.TextScaled = false
  inst.TextSize = 10
  end)
  end
  end
  local function v771(v78)
  if not v78 then return end
  for idx, inst in ipairs(v78:GetDescendants()) do
  if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
  v599(inst)
  inst:GetPropertyChangedSignal("Text"):Connect(function() v599(inst) end)
  end
  end
  v78.DescendantAdded:Connect(function(v58)
  if v58:IsA("TextLabel") or v58:IsA("TextButton") or v58:IsA("TextBox") then
  task.wait()
  v599(v58)
  v58:GetPropertyChangedSignal("Text"):Connect(function() v599(v58) end)
  end
  end)
  end
  pcall(function() v771(playerGui) end)
  playerGui.ChildAdded:Connect(function(v131) pcall(function() v771(v131) end) end)
  pcall(function()
  local v835 = (typeof(gethui) == "function" and gethui()) or game:GetService("CoreGui")
  if v835 then v771(v835) end
  end)
end)


do
pcall(function()
  Packages = ReplicatedStorage:WaitForChild("Packages", 5)
  Datas = ReplicatedStorage:WaitForChild("Datas", 5)
  if Packages and Datas then
  local v996 = Packages:WaitForChild("Synchronizer", 5)
  local v823 = Datas:WaitForChild("Animals", 5)
  if v996 then pcall(function() Synchronizer = require(v996) end) end
  if v823 then pcall(function() AnimalsData = require(v823) end) end
  end
end)

autoStealEnabled = Config.AutoStealEnabled == true
instantStealEnabled = Config.InstantStealEnabled
if instantStealEnabled == nil then instantStealEnabled = true end
stealHighestEnabled = Config.StealHighest
if stealHighestEnabled == nil then stealHighestEnabled = true end
stealPriorityEnabled = Config.StealPriority
stealNearestEnabled = Config.StealNearest
selectedTargetIndex = 1
selectedTargetUID = nil
manuallySelectedUID = nil
currentStealTargetUID = nil
activeProgressTween = nil
instantStealReady = false
instantStealDidInit = false
INSTANT_STEAL_RADIUS = 60
INSTANT_STEAL_COOLDOWN = 0
lastInstantStealTime = 0
PromptMemoryCache = {}
InternalStealCacheData = {}


CONFIG = {
  AUTO_STEAL = false,
  RADIUS = 60
}

boxes = {
  {min = Vector3.new(-337.448303, -3.898971, -122.397758), max = Vector3.new(-328.004578, -3.898971, 242.625626)},
  {min = Vector3.new(-327.257660, -3.899109, -122.228622), max = Vector3.new(-320.600891, -3.899109, 242.612259)},
  {min = Vector3.new(-319.783386, -3.898970, -122.227089), max = Vector3.new(-312.908325, -3.898970, 242.585617)},
  {min = Vector3.new(-312.445648, -3.899108, -122.389832), max = Vector3.new(-305.489899, -3.899108, 242.456818)},
  {min = Vector3.new(-305.037048, -3.898970, -122.230743), max = Vector3.new(-293.957489, -3.898970, 242.606873)},
  {min = Vector3.new(-491.448608, -3.898972, -122.253258), max = Vector3.new(-481.811737, -3.898972, 242.615005)},
  {min = Vector3.new(-498.971069, -3.898970, -122.382767), max = Vector3.new(-491.748840, -3.898970, 242.612061)},
  {min = Vector3.new(-506.436737, -3.898972, -122.411476), max = Vector3.new(-499.318542, -3.898972, 242.615982)},
  {min = Vector3.new(-513.783569, -3.898972, -122.223297), max = Vector3.new(-506.801849, -3.898972, 242.627090)},
  {min = Vector3.new(-525.236938, -3.898972, -122.409813), max = Vector3.new(-514.265015, -3.898972, 242.608932)},
}

trackedPrompts = {}
lastFire = {}

SAFE_POLL_RATE = 0.03
SAFE_POLL_OVERRIDE_UNTIL = 0

function _G.getSafePollRate()
  if os.clock() < SAFE_POLL_OVERRIDE_UNTIL then
  return 0.15
  end
  return SAFE_POLL_RATE
end

function _G.triggerSafePollBoost()
  SAFE_POLL_OVERRIDE_UNTIL = os.clock() + 3
end

FIRE_DEBOUNCE = 0.05
FIRE_BURST = 5
ENABLE_BURST = 6
ENABLE_DEBOUNCE = 0.01
ENABLE_COOLDOWN = 0.04
lastEnableFire = {}

function getHRP()
  local character = LocalPlayer.Character
  return character and character:FindFirstChild("HumanoidRootPart")
end


function getPromptPosition(v44)
  local v23 = v44.Parent
  if not v23 then return end
  if v23:IsA("Attachment") and v23.Parent then v23 = v23.Parent end
  if v23:IsA("BasePart") then return v23.Position elseif v23:IsA("Model") then return v23:GetPivot().Position end
end

function promptMatchesSelectedPet(v44)
  if not SharedState then return false end
  local v307 = SharedState.SelectedPetData
  if not v307 then return false end
  local v65 = v44:FindFirstAncestorOfClass("Model")
  if not v65 then return false end
  if v307.slot then
  local v1258 = v44:FindFirstAncestor(v307.slot)
  if v1258 or v65.Name == v307.slot or (v65.Parent and v65.Parent.Name == v307.slot) then return true end
  end
  local v30 = v307.name or v307.petName
  if v30 then
  local v1290 = string.lower(v30)
  local v181 = v65
  while v181 do
  if v181.Name and string.lower(v181.Name) == v1290 then return true end
  v181 = v181.Parent
  end
  end
  return false
end

function isPromptAvailable(v44, v1161)
  if not autoStealEnabled or not instantStealEnabled then return false end
  if not v44 or not v44.Parent or not v44.Enabled then return false end
  local v59 = getPromptPosition(v44)
  if not v59 then return false end
  local v25 = v44:FindFirstAncestorOfClass("Model")
  if v25 then
  local v53 = workspace:FindFirstChild("Plots")
  if v53 then
  local v427 = v44:FindFirstAncestorWhichIsA("Model")
  while v427 and v427.Parent ~= v53 do v427 = v427.Parent end
  if v427 then
  local v111 = v427:FindFirstChild("PlotSign")
  if v111 then
  local v300 = v111:FindFirstChildWhichIsA("SurfaceGui", true)
  local v81 = v300 and v300:FindFirstChildWhichIsA("TextLabel", true)
  if v81 then
  local v95 = v81.Text:lower()
  if v95:find(game.Players.LocalPlayer.Name:lower(), 1, true) or v95:find(game.Players.LocalPlayer.DisplayName:lower(), 1, true) then return false end
  end
  end
  end
  end
  end
  if _G.NEAREST_INSTANT_MODE == true then

  end
  if not (_G.NEAREST_INSTANT_MODE == true) then
  if not promptMatchesSelectedPet(v44) then return false end
  end
  local v1102 = Config.AutoGrabRadius or 60
  return (v59 - v1161).Magnitude <= v1102
end

function canFire(v44, v673)
  local tmpInst = os.clock()
  local v905 = lastFire[v44]
  if v905 and (tmpInst - v905) < v673 then return false end
  lastFire[v44] = tmpInst
  return true
end

function firePrompt(v44, v1097, v673)
  if not v44 or not v44.Parent or not v44.Enabled or not canFire(v44, v673) then return end
  for v28 = 1, v1097 do pcall(function() fireproximityprompt(v44, 0) end) end
end

function trackPrompt(v44)
  if trackedPrompts[v44] then return end
  trackedPrompts[v44] = true
  local function v1014()
  if not autoStealEnabled or not instantStealEnabled then return end
  local v22 = getHRP()
  if v22 and isPromptAvailable(v44, v22.Position) then
  CONFIG.AUTO_STEAL = true
  local v60 = os.clock()
  local v923 = lastEnableFire[v44]
  if not v923 or (v60 - v923) >= ENABLE_COOLDOWN then
  lastEnableFire[v44] = v60
  firePrompt(v44, ENABLE_BURST, ENABLE_DEBOUNCE)
  end
  end
  end
  task.defer(v1014)
  pcall(function() v44:GetPropertyChangedSignal("Enabled"):Connect(function() if v44.Enabled then v1014() end end) end)
  v44.AncestryChanged:Connect(function() if not v44:IsDescendantOf(workspace) then trackedPrompts[v44] = nil; lastFire[v44] = nil; lastEnableFire[v44] = nil end end)
end

function scanBrainrotPrompts()
  local v53 = workspace:FindFirstChild("Plots")
  if v53 then
  for idx, v25 in ipairs(v53:GetChildren()) do
  local v125 = v25:FindFirstChild("AnimalPodiums")
  if v125 then
  for idx, inst in ipairs(v125:GetDescendants()) do
  if inst:IsA("ProximityPrompt") then trackPrompt(inst) end
  end
  end
  end
  end
end

scanBrainrotPrompts()
workspace.DescendantAdded:Connect(function(inst)
  if inst:IsA("ProximityPrompt") and inst:FindFirstAncestor("AnimalPodiums") then trackPrompt(inst) end
end)

task.spawn(function()
  while task.wait(_G.getSafePollRate()) do
  _G.NEAREST_INSTANT_MODE = (stealNearestEnabled == true)
  if autoStealEnabled and instantStealEnabled then
  local v22 = getHRP()
  if not v22 then CONFIG.AUTO_STEAL = false; continue end
  local v1192 = v22.Position
  local v811 = false
  for v44 in pairs(trackedPrompts) do
  if isPromptAvailable(v44, v1192) then
  v811 = true
  if CONFIG.AUTO_STEAL then firePrompt(v44, FIRE_BURST, FIRE_DEBOUNCE) end
  end
  end
  CONFIG.AUTO_STEAL = v811
  else
  CONFIG.AUTO_STEAL = false
  end
  end
end)


function get_all_pets()
  local v259 = {}
  local v70 = SharedState.AllAnimalsCache
  local v257 = Config.StealNearest and Config.TpSettings.MinGenForGrab or Config.TpSettings.MinGenForTp
  local v424 = parseMinGen(v257)
  local v482 = LocalPlayer.Name
  local v481 = LocalPlayer.DisplayName
  local v726 = {}
  for idx, v23 in ipairs(priorityList) do v726[v23:lower()] = true end
  local v156 = Workspace:FindFirstChild("Plots")
  if v70 and type(v70) == "table" then
  for idx, v27 in ipairs(v70) do
  if v27 and (v27.genValue or 0) >= 1 and v27.owner ~= v482 and v27.owner ~= v481 then
  if v27.plot and v156 then
  local v490 = v156:FindFirstChild(v27.plot)
  if not v490 then continue end
  local v163 = getPlotOwner(v490)
  if not v163 or (typeof(v163) == "Instance" and not v163.Parent) then
  continue
  end
  local v452 = (typeof(v163) == "Instance" and v163.Name) or tostring(v163)
  local v661 = (typeof(v163) == "Instance" and v163.DisplayName) or v452
  if v452 == v482 or v661 == v481 then continue end
  end
  local v1172 = ((tonumber(v27.genValue) or 0) >= 10000000)
  local v704 = (v27.name and v726[v27.name:lower()]) or (v27.index and v726[v27.index:lower()])
  if v1172 and v27.name then SharedState.BrainrotNames[v27.name:lower()] = true end
  if v424 > 0 and (tonumber(v27.genValue) or 0) < v424 then
  continue
  end
  table.insert(v259, {
  name = v27.name,
  petName = v27.name,
  mpsText = v27.genText,
  mpsValue = v27.genValue,
  petValue = v27.petValue or 0,
  owner = v27.owner,
  plot = v27.plot,
  slot = v27.slot,
  uid = v27.uid,
  mutation = v27.mutation,
  rarity = v27.rarity,
  animalData = v27,
  })
  end
  end
  end
  table.sort(v259, function(v27, v29) return (v27.mpsValue or 0) > (v29.mpsValue or 0) end)
  return v259
end

function get_all_pets_by_value()
  local v259 = {}
  local v70 = SharedState.AllAnimalsCache
  local v257 = Config.StealNearest and Config.TpSettings.MinGenForGrab or Config.TpSettings.MinGenForTp
  local v424 = parseMinGen(v257)
  local v482 = LocalPlayer.Name
  local v481 = LocalPlayer.DisplayName
  local v156 = Workspace:FindFirstChild("Plots")
  if v70 and type(v70) == "table" then
  for idx, v27 in ipairs(v70) do
  if v27 and (v27.genValue or 0) >= 1 and v27.owner ~= v482 and v27.owner ~= v481 then
  if v27.plot and v156 then
  local v490 = v156:FindFirstChild(v27.plot)
  if not v490 then continue end
  local v163 = getPlotOwner(v490)
  if not v163 or (typeof(v163) == "Instance" and not v163.Parent) then
  continue
  end
  local v452 = (typeof(v163) == "Instance" and v163.Name) or tostring(v163)
  local v661 = (typeof(v163) == "Instance" and v163.DisplayName) or v452
  if v452 == v482 or v661 == v481 then continue end
  end
  if v424 > 0 and (tonumber(v27.genValue) or 0) < v424 then continue end
  table.insert(v259, {
  name = v27.name,
  petName = v27.name,
  mpsText = v27.genText,
  mpsValue = v27.genValue,
  petValue = v27.petValue or 0,
  owner = v27.owner,
  plot = v27.plot,
  slot = v27.slot,
  uid = v27.uid,
  mutation = v27.mutation,
  rarity = v27.rarity,
  animalData = v27,
  })
  end
  end
  end
  table.sort(v259, function(v27, v29) return (v27.petValue or 0) > (v29.petValue or 0) end)
  return v259
end


function setStealMode(v155)
  manuallySelectedUID = nil
  stealHighestEnabled = (v155 == "Highest")
  stealPriorityEnabled = (v155 == "Priority")
  stealNearestEnabled = (v155 == "Nearest")
  Config.StealHighest = stealHighestEnabled
  Config.StealPriority = stealPriorityEnabled
  Config.StealNearest = stealNearestEnabled
  Config.StealMode = v155
  saveConfig()
  setToggle("Steal Highest", stealHighestEnabled)
  setToggle("Steal Priority", stealPriorityEnabled)
  setToggle("Steal Nearest", stealNearestEnabled)

  if _G.CLTHUBStealMode then pcall(_G.CLTHUBStealMode, v155) end
  SharedState.ListNeedsRedraw = true
end


local v85 = (typeof(gethui) == "function" and gethui()) or CoreGui
hudGui = v85:FindFirstChild("AutoStealCurrentTargetHUD")
if hudGui then hudGui:Destroy() end
hudGui = Instance.new("ScreenGui")
hudGui.Name = "AutoStealCurrentTargetHUD"
hudGui.ResetOnSpawn = false
hudGui.IgnoreGuiInset = true
hudGui.DisplayOrder = 998
hudGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
hudGui.Parent = v85
STEALBAR = {
  PANEL = Color3.fromRGB(12, 12, 14),
  TEXT = Color3.fromRGB(255, 255, 255),
  STROKE = Color3.fromRGB(52, 52, 58),
  GLOW = Color3.fromRGB(80, 80, 88),
  TRACK = Color3.fromRGB(38, 38, 42),
  TRACK2 = Color3.fromRGB(26, 26, 30),
  FILL1 = Color3.fromRGB(255, 255, 255),
  FILL2 = Color3.fromRGB(200, 200, 208),
}

mobileScale = 1
targetHud = Instance.new("Frame", hudGui)
targetHud.Name = "CurrentTargetHUD"
targetHud.AnchorPoint = Vector2.new(0.5, 1)
targetHud.Size = UDim2.new(0, 230 * mobileScale, 0, 46 * mobileScale)
targetHud.Position = UDim2.new(0.5, 0, 1, -135)
targetHud.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
targetHud.BackgroundTransparency = 0
targetHud.BorderSizePixel = 0
targetHud.ZIndex = 100
Instance.new("UICorner", targetHud).CornerRadius = UDim.new(0, 0)

hudStroke = Instance.new("UIStroke", targetHud)
hudStroke.Color = Color3.fromRGB(0, 85, 255)
hudStroke.Thickness = 1
hudStroke.Transparency = 0

hudGlow = Instance.new("UIStroke", targetHud)
hudGlow.Color = STEALBAR.GLOW
hudGlow.Thickness = 3
hudGlow.Transparency = 0.84
hudGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

hudShadow = Instance.new("ImageLabel", targetHud)
hudShadow.Name = "Shadow"
hudShadow.AnchorPoint = Vector2.new(0.5, 0.5)
hudShadow.Position = UDim2.new(0.5, 0, 0.5, 1)
hudShadow.Size = UDim2.new(1, 20, 1, 20)
hudShadow.BackgroundTransparency = 1
hudShadow.Image = "rbxassetid://6014261993"
hudShadow.ImageColor3 = Color3.new(0, 0, 0)
hudShadow.ImageTransparency = 0.72
hudShadow.ScaleType = Enum.ScaleType.Slice
hudShadow.SliceCenter = Rect.new(49, 49, 450, 450)
hudShadow.ZIndex = 99

hudName = Instance.new("TextLabel", targetHud)
hudName.Name = "WhiteTextBtn"
hudName.Size = UDim2.new(1, -12, 0, 13 * mobileScale)
hudName.Position = UDim2.fromOffset(6 * mobileScale, 3 * mobileScale)
hudName.BackgroundTransparency = 1
hudName.Font = Enum.Font.GothamBold
hudName.TextSize = 11 * mobileScale
hudName.TextColor3 = Color3.fromRGB(255, 255, 255)
hudName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
hudName.TextStrokeTransparency = 0.4
hudName.TextXAlignment = Enum.TextXAlignment.Center
hudName.TextTruncate = Enum.TextTruncate.AtEnd
hudName.ZIndex = 102
hudName.Text = "No target"

hudProgressBg = Instance.new("Frame", targetHud)
hudProgressBg.Name = "ProgressBg"
hudProgressBg.Size = UDim2.new(1, -10 * mobileScale, 0, 20 * mobileScale)
hudProgressBg.Position = UDim2.fromOffset(5 * mobileScale, 20 * mobileScale)
hudProgressBg.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
hudProgressBg.BorderSizePixel = 0
hudProgressBg.ZIndex = 101
Instance.new("UICorner", hudProgressBg).CornerRadius = UDim.new(0, 0)

hudProgressBgStroke = Instance.new("UIStroke", hudProgressBg)
hudProgressBgStroke.Color = Color3.fromRGB(60, 60, 75)
hudProgressBgStroke.Thickness = 1
hudProgressBgStroke.Transparency = 0.3

hudInnerTrack = Instance.new("Frame", hudProgressBg)
hudInnerTrack.Name = "InnerTrack"
hudInnerTrack.Size = UDim2.new(1, -2, 1, -2)
hudInnerTrack.Position = UDim2.fromOffset(1, 1)
hudInnerTrack.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
hudInnerTrack.BackgroundTransparency = 0.15
hudInnerTrack.BorderSizePixel = 0
hudInnerTrack.ZIndex = 102
Instance.new("UICorner", hudInnerTrack).CornerRadius = UDim.new(0, 0)

hudProgressFill = Instance.new("Frame", hudProgressBg)
hudProgressFill.Name = "ProgressFill"
hudProgressFill.Size = UDim2.new(0, 0, 1, 0)
hudProgressFill.BackgroundColor3 = Color3.fromRGB(56, 214, 110)
hudProgressFill.BorderSizePixel = 0
hudProgressFill.ZIndex = 103
Instance.new("UICorner", hudProgressFill).CornerRadius = UDim.new(0, 0)

hudProgressFillGradient = Instance.new("UIGradient", hudProgressFill)
hudProgressFillGradient.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 214, 110)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 180, 95)),
})

hudProgressFillStroke = Instance.new("UIStroke", hudProgressFill)
hudProgressFillStroke.Color = Color3.fromRGB(255, 255, 255)
hudProgressFillStroke.Thickness = 1
hudProgressFillStroke.Transparency = 0.45

hudPercent = Instance.new("TextLabel", hudProgressBg)
hudPercent.Name = "WhiteTextBtn"
hudPercent.Size = UDim2.new(1, 0, 1, 0)
hudPercent.BackgroundTransparency = 1
hudPercent.Font = Enum.Font.GothamBold
hudPercent.TextSize = 12 * mobileScale
hudPercent.TextColor3 = Color3.fromRGB(255, 255, 255)
hudPercent.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
hudPercent.TextStrokeTransparency = 0.4
hudPercent.TextXAlignment = Enum.TextXAlignment.Center
hudPercent.ZIndex = 105
hudPercent.Text = "0%"


_G.smartInteract = function() end

function applySelection(v200, v63)
  if v200 and (v200 >= 1) and (v200 <= #v63) then
  local v937 = v63[v200].uid
  if (selectedTargetIndex ~= v200) or (selectedTargetUID ~= v937) or (SharedState.SelectedPetData == nil) then
  selectedTargetIndex = v200
  selectedTargetUID = v937
  SharedState.SelectedPetData = v63[v200]
  if SharedState.SelectedPetData then SharedState.LastTargetedPetMpsValue = SharedState.SelectedPetData.mpsValue or 0 end
  end
  end
end


task.spawn(function()
  while true do
  task.wait(0.1)
  if autoStealEnabled then
  local v63 = get_all_pets()
  if #v63 > 0 then
  if manuallySelectedUID then
  local v465 = false
  for v28, v23 in ipairs(v63) do if v23.uid == manuallySelectedUID then applySelection(v28, v63); v465 = true; break end end
  if not v465 then manuallySelectedUID = nil; selectedTargetUID = nil; SharedState.SelectedPetData = nil end
  elseif stealPriorityEnabled then
  local v688 = nil
  for idx, v89 in ipairs(priorityList) do
  local v306 = v89:lower()
  for v28, v23 in ipairs(v63) do if (v23.petName and v23.petName:lower() == v306) or (v23.animalData and v23.animalData.index and v23.animalData.index:lower() == v306) then v688 = v28; break end end
  if v688 then break end
  end
  applySelection(v688, v63)
  elseif stealNearestEnabled then
  local v22 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v651, v124 = nil, math.huge
  for v28, v23 in ipairs(v63) do
  local v179 = v23.animalData and findAdorneeGlobal(v23.animalData)
  if v179 and v179:IsA("BasePart") then
  local v33 = (v22.Position - v179.Position).Magnitude
  if v33 < v124 then v124 = v33; v651 = v28 end
  end
  end
  if v651 then
  applySelection(v651, v63)
  else
  SharedState.SelectedPetData = nil
  end
  else applySelection(1, v63) end
  else applySelection(1, v63) end
  else SharedState.SelectedPetData = nil end
  else SharedState.SelectedPetData = nil end
  end
end)


function v936(v105)
  if not v105 or v105 == 0 then return "0" end
  if v105 >= 1e9 then return string.format("%.2fb", v105 / 1e9) end
  if v105 >= 1e6 then return string.format("%.2fm", v105 / 1e6) end
  if v105 >= 1e3 then return string.format("%.1fk", v105 / 1e3) end
  return tostring(math.floor(v105))
end


RAGBAR_STATES = {
  [Enum.HumanoidStateType.Physics]  = true,
  [Enum.HumanoidStateType.Ragdoll]  = true,
  [Enum.HumanoidStateType.FallingDown] = true,
  [Enum.HumanoidStateType.GettingUp]  = true,
}

function checkRagdollBar()
  local v34 = LocalPlayer.Character
  local v35 = v34 and v34:FindFirstChildOfClass("Humanoid")
  if not v35 then return false, nil end

  local v60 = workspace:GetServerTimeNow()
  local v462 = LocalPlayer:GetAttribute("RagdollEndTime")
  local v165 = v462 and (v462 - v60) or nil


  if v165 and v165 > 1.0 then
  local v1090 = v60 + 1.0
  pcall(function()
  LocalPlayer:SetAttribute("RagdollEndTime", v1090)
  end)
  v165 = 1.0
  end

  if RAGBAR_STATES[v35:GetState()] then
  return true, v165 or 1.0
  end
  if v165 and v165 > 0 then
  return true, v165
  end

  return false, nil
end

RAG_RED = Color3.fromRGB(255, 60, 60)
RAG_ORANGE = Color3.fromRGB(0, 85, 255)
ragTotalDuration, ragLastEndTime = nil, nil

local v189 = ""
local v190 = ""
local v188 = -1
local v791 = nil

RunService.RenderStepped:Connect(function()

  local v705, v379 = checkRagdollBar()
  if v705 then
  hudStroke.Color = RAG_RED
  hudGlow.Color = RAG_RED
  hudProgressFill.BackgroundColor3 = RAG_RED
  if v379 and v379 > 0 then
  local v462 = LocalPlayer:GetAttribute("RagdollEndTime")
  if v462 ~= ragLastEndTime then
  ragLastEndTime = v462
  ragTotalDuration = v379
  end
  local v23 = math.clamp(v379 / math.max(ragTotalDuration or v379, 0.1), 0, 1)
  local v95 = string.format("RAGDOLL - %.1fs", v379)
  if v95 ~= v189 then v189 = v95; hudName.Text = v95 end
  if math.abs(v23 - v188) > 0.01 then v188 = v23; hudProgressFill.Size = UDim2.new(v23, 0, 1, 0) end
  local v378 = string.format("%.1fs", v379)
  if v378 ~= v190 then v190 = v378; hudPercent.Text = v378 end
  hudPercent.TextColor3 = RAG_ORANGE
  else
  if v189 ~= "RAGDOLL" then v189 = "RAGDOLL"; hudName.Text = "RAGDOLL" end
  if v188 ~= 1 then v188 = 1; hudProgressFill.Size = UDim2.new(1, 0, 1, 0) end
  if v190 ~= "..." then v190 = "..."; hudPercent.Text = "..." end
  hudPercent.TextColor3 = RAG_ORANGE
  end
  return
  else
  if hudStroke.Color ~= STEALBAR.STROKE then hudStroke.Color = STEALBAR.STROKE end
  if hudGlow.Color ~= STEALBAR.GLOW then hudGlow.Color = STEALBAR.GLOW end
  if hudPercent.TextColor3 ~= STEALBAR.TEXT then hudPercent.TextColor3 = STEALBAR.TEXT end
  end

  if not (Config and Config.AutoStealEnabled) then
  if v189 ~= "Disabled" then v189 = "Disabled"; hudName.Text = "Disabled" end
  if v188 ~= 0 then v188 = 0; hudProgressFill.Size = UDim2.new(0, 0, 1, 0) end
  if v190 ~= "0%" then v190 = "0%"; hudPercent.Text = "0%" end
  return
  end

  if LocalPlayer:GetAttribute("Stealing") then
  if v188 ~= 1 then v188 = 1; hudProgressFill.Size = UDim2.new(1, 0, 1, 0) end
  hudProgressFill.BackgroundColor3 = Color3.fromRGB(100, 220, 130)
  if v190 ~= "100%" then v190 = "100%"; hudPercent.Text = "100%" end
  if v189 ~= "Carrying Brainrot!" then v189 = "Carrying Brainrot!"; hudName.Text = "Carrying Brainrot!" end
  return
  end

  local v185 = _G.CLTHUB_StealStatus or {}
  if v185.active then
  local v23 = math.clamp((tick() - (v185.start or 0)) / (v185.duration or 1.3), 0, 1)
  if math.abs(v23 - v188) > 0.01 then v188 = v23; hudProgressFill.Size = UDim2.new(v23, 0, 1, 0) end
  local v378 = math.floor(v23 * 100) .. "%"
  if v378 ~= v190 then v190 = v378; hudPercent.Text = v378 end
  local v454 = (v23 >= 1) and Color3.fromRGB(100, 220, 130) or STEALBAR.FILL1
  if v791 ~= v454 then v791 = v454; hudProgressFill.BackgroundColor3 = v454 end
  if v189 ~= "Stealing..." then v189 = "Stealing..."; hudName.Text = "Stealing..." end
  elseif v185.target then
  if v188 ~= 0 then v188 = 0; hudProgressFill.Size = UDim2.new(0, 0, 1, 0) end
  if v190 ~= "0%" then v190 = "0%"; hudPercent.Text = "0%" end
  hudProgressFill.BackgroundColor3 = STEALBAR.FILL1
  local v1035 = v936(v185.target.mps or v185.target.value)
  local v313 = (v185.target.name or "Brainrot") .. ((v1035 ~= "0") and (" - $" .. v1035) or "")
  if v313 ~= v189 then v189 = v313; hudName.Text = v313 end
  else
  if v188 ~= 0 then v188 = 0; hudProgressFill.Size = UDim2.new(0, 0, 1, 0) end
  if v190 ~= "0%" then v190 = "0%"; hudPercent.Text = "0%" end
  hudProgressFill.BackgroundColor3 = STEALBAR.FILL1
  if v189 ~= "Searching..." then v189 = "Searching..."; hudName.Text = "Searching..." end
  end
end)

end


PRIORITY_LIST = priorityList
task.spawn(function()
  local v1198,v343=pcall(function() return ReplicatedStorage:WaitForChild("Packages",5) end); if not v1198 or not v343 then return end
  local v373,v394=pcall(function() return ReplicatedStorage:WaitForChild("Datas",5) end); if not v373 or not v394 then return end
  local v1199,v776=pcall(function() return ReplicatedStorage:WaitForChild("Shared",5) end); if not v1199 or not v776 then return end
  local v1200,v515=pcall(function() return ReplicatedStorage:WaitForChild("Utils",5) end); if not v1200 or not v515 then return end
  local v1205,v225=pcall(function() return require(v343:WaitForChild("Synchronizer")) end); if not v1205 then return end
  local v1201,v5=pcall(function() return require(v394:WaitForChild("Animals")) end); if not v1201 then return end
  local v12=_G.v1021
  local v1203,v625=pcall(function() return require(v515:WaitForChild("NumberUtils")) end); if not v1203 then return end
  _BLOCKING_MACHINE_TYPES = { }
function _CartisIsFusing(v172) if type(v172) ~= "table" then return false end local v87 = v172.Machine if type(v87) ~= "table" then return false end return _BLOCKING_MACHINE_TYPES[v87.Type] == true end
local v115={}; local v301={}
  local function v1137(v171) if not v171 then return "" end; local v52=""; for v288,v33 in pairs(v171) do if type(v33)=="table" then v52=v52..tostring(v288)..tostring(v33.Index)..tostring(v33.Mutation) end end; return v52 end
  local function v971(v25) pcall(function()
  local v392 = getPlotOwner(v25)
  if not v392 or (typeof(v392) == "Instance" and not v392.Parent) then
  if v301[v25.Name] ~= "UNOWNED" then
  v301[v25.Name] = "UNOWNED"
  for v28 = #v115, 1, -1 do
  if v115[v28].plot == v25.Name then
  table.remove(v115, v28)
  end
  end
  SharedState.AllAnimalsCache = v115
  SharedState.ListNeedsRedraw = true
  end
  return
  end

  local v68=_G.XenSyncGet(v25.Name); if not v68 then return end
  local v171=v68:Get("AnimalList")
  local v723 = (v392 and v392.Name) or (type(v392) == "string" and v392) or v25.Name
  if not v171 then
  if v301[v25.Name] ~= "EMPTY" then
  v301[v25.Name] = "EMPTY"
  for v28=#v115,1,-1 do if v115[v28].plot==v25.Name then table.remove(v115,v28) end end
  SharedState.AllAnimalsCache=v115; SharedState.ListNeedsRedraw=true
  end
  return
  end
  local v563 = v1137(v171) .. "_" .. v723
  if v563 == "" then v563 = "EMPTY" end
  if v301[v25.Name] == v563 then return end

  for v28=#v115,1,-1 do if v115[v28].plot==v25.Name then table.remove(v115,v28) end end
  for v288,v108 in pairs(v171) do if type(v108)=="table" then
  if _CartisIsFusing and _CartisIsFusing(v108) then continue end
  local v203,v638=v108.Index,v5 and v5[v108.Index]; if v638 then
  local v139=v108.Mutation or "None"; if v139=="Yin Yang" then v139="YinYang" end
  local v292=(v108.Traits and #v108.Traits>0) and table.concat(v108.Traits,", ") or "None"
  local v470=0
  pcall(function() v470 = v12:GetGeneration(v203,v108.Mutation,v108.Traits,nil) or 0 end)
  local v696="$"..v625:ToString(v470).."/s"
  local v590=0; pcall(function() v590=v12:GetValue(v203,v108.Mutation,v108.Traits,nil) or 0 end)
  if type(v590)~="number" then v590=0 end
  table.insert(v115,{name=v638.DisplayName or v203,index=v203,genText=v696,genValue=v470,petValue=v590,mutation=v139,traits=v292,rarity=v638.Rarity,owner=v723,plot=v25.Name,slot=tostring(v288),uid=v25.Name.."_"..tostring(v288)})
  end
  end end
  v301[v25.Name]=v563
  table.sort(v115,function(v27,v29) return (v27.genValue or 0) > (v29.genValue or 0) end)
  SharedState.AllAnimalsCache=v115; SharedState.ListNeedsRedraw=true
  end) end

  PlayersService.PlayerRemoving:Connect(function(player)
  pcall(function()
  local v89 = player.Name
  local v1223 = player.DisplayName
  for v28 = #v115, 1, -1 do
  local v27 = v115[v28]
  if v27 and (v27.owner == v89 or v27.owner == v1223) then
  table.remove(v115, v28)
  end
  end
  for v157, idx in pairs(v301) do
  local v948 = Workspace.Plots and Workspace.Plots:FindFirstChild(v157)
  if v948 then
  local v679 = getPlotOwner(v948)
  if not v679 or v679 == player or v679.Name == v89 then
  v301[v157] = "UNOWNED"
  for v28 = #v115, 1, -1 do
  if v115[v28].plot == v157 then
  table.remove(v115, v28)
  end
  end
  end
  end
  end
  SharedState.AllAnimalsCache = v115
  SharedState.ListNeedsRedraw = true
  if refreshTargetPanel then pcall(refreshTargetPanel) end
  end)
  end)


  local function v991(v25) local v68; local v744=0
  while not v68 and v744<15 do local ok,v83=pcall(function() return _G.XenSyncGet(v25.Name) end); if ok and v83 then v68=v83; break else v744=v744+1; task.wait(0.25) end end
  if not v68 then return end; v971(v25)
  task.spawn(function() while v25.Parent do task.wait(0.6); v971(v25) end end)
  end
  local v53=Workspace:WaitForChild("Plots",8)
  if v53 then
  for idx,v23 in ipairs(v53:GetChildren()) do
  task.spawn(v991, v23)
  end
  SharedState.InitialScanComplete=true
  v53.ChildAdded:Connect(function(v23) task.wait(0.5); task.spawn(v991, v23) end)
  v53.ChildRemoved:Connect(function(v23) v301[v23.Name]=nil; for v28=#v115,1,-1 do if v115[v28].plot==v23.Name then table.remove(v115,v28) end end; SharedState.ListNeedsRedraw=true end)
  end
  task.spawn(function() while true do SharedState.AllAnimalsCache=v115; task.wait(0.5) end end)
end)


player:GetAttributeChangedSignal("Stealing"):Connect(function()
  local v328=(player:GetAttribute("Stealing")==true)

  if FloatState.active and v328 then setFloat(false) end
  if _G.AutoInvisDuringSteal then
  if v328 and not _G.invisibleStealEnabled and _G._forceInvisToggle then task.defer(function() if player:GetAttribute("Stealing") and not _G.invisibleStealEnabled then pcall(_G._forceInvisToggle) end end)
  elseif not v328 and _G.invisibleStealEnabled and _G._forceInvisToggle then task.wait(0.3); if not player:GetAttribute("Stealing") then pcall(_G._forceInvisToggle) end end
  end
  if v328 and Config.AutoUnlockOnSteal then
  local v22=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v413 = getCurrentUnlockFloor()
  task.spawn(function()
  task.wait(0.1)
  pcall(smartInteract, v413)
  end)
  end
  end
end)

player.CharacterAdded:Connect(function() task.wait(0.5); if FloatState.active then removeFloatPlatform(); createFloatPlatform() end end)


function findAdorneeGlobal(v172)
  if not v172 then return nil end
  local v25 = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(v172.plot)
  if v25 then
  local v125 = v25:FindFirstChild("AnimalPodiums")
  if v125 then
  local v110 = v125:FindFirstChild(v172.slot)
  if v110 then
  local v173 = v110:FindFirstChild("Base")
  if v173 then
  local v264 = v173:FindFirstChild("Spawn")
  if v264 then return v264 end
  return v173:FindFirstChildWhichIsA("BasePart") or v173
  end
  end
  end
  end
  return nil
end

local v447 = nil
local v523 = 0

local function v1314()
  if v447 and (tick() - v523 < 5) then
  return v447
  end
  v447 = {}
  local v53 = Workspace:FindFirstChild("Plots")
  local v1165 = v53 and v53:GetDescendants() or Workspace:GetDescendants()
  for idx, v81 in ipairs(v1165) do
  if v81:IsA("TextLabel") then
  local v95 = tostring(v81.Text or "")
  if (v95 ~= "") and v95:lower():find("base", 1, true) then
  local v300 = v81:FindFirstAncestorWhichIsA("SurfaceGui")
  if v300 then
  local v56 = v300.Adornee or v300.Parent
  if v56 and v56:IsA("BasePart") then
  table.insert(v447, v56)
  end
  end
  end
  end
  end
  v523 = tick()
  return v447
end


_G._isTargetPlotUnlocked = function(v157)
  local ok, v168 = pcall(function()
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return false end
  local v1011 = v53:FindFirstChild(v157)
  if not v1011 then return false end
  local v1015 = v1011:FindFirstChild("Unlock")
  if not v1015 then return true end
  local v612 = {}
  for idx, v61 in pairs(v1015:GetChildren()) do
  local v59 = nil
  if v61:IsA("Model") then
  pcall(function() v59 = v61:GetPivot().Position end)
  elseif v61:IsA("BasePart") then
  v59 = v61.Position
  end
  if v59 then
  table.insert(v612, { Object = v61, Height = v59.Y })
  end
  end
  table.sort(v612, function(v27, v29) return v27.Height < v29.Height end)
  if #v612 == 0 then return true end
  local v885 = v612[1].Object
  for idx, v58 in ipairs(v885:GetDescendants()) do
  if v58:IsA("ProximityPrompt") and v58.Enabled then return false end
  end
  for idx, v24 in ipairs(v885:GetChildren()) do
  if v24:IsA("ProximityPrompt") and v24.Enabled then return false end
  end
  return true
  end)
  return (ok and v168) or false
end


function getTargetPetData()
  local v70 = SharedState.AllAnimalsCache
  if not v70 or #v70 == 0 then
  return nil
  end

  local v63 = get_all_pets()


  if manuallySelectedUID then
  for idx, v27 in ipairs(v70) do
  if v27.uid == manuallySelectedUID and v27.owner ~= LocalPlayer.Name then
  return v27
  end
  end
  end

  local v257 = (Config.StealNearest and Config.TpSettings.MinGenForGrab) or Config.TpSettings.MinGenForTp
  local v332 = parseMinGen(v257) or 0


  for idx, v89 in ipairs(priorityList) do
  local v306 = v89:lower()
  local v272 = nil
  local v124 = math.huge
  for idx, v27 in ipairs(v70) do
  if v27 and v27.name and ((v27.name:lower() == v306) or (v27.index and v27.index:lower() == v306)) and (v27.owner ~= LocalPlayer.Name) then
  if v332 > 0 and (tonumber(v27.genValue) or 0) < v332 then continue end
  local v92 = math.huge
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v53 = Workspace:FindFirstChild("Plots")
  local v494 = v53 and v53:FindFirstChild(v27.plot)
  if v494 then
  local v59 = nil
  pcall(function() v59 = v494:GetPivot().Position end)
  if v59 then
  v92 = (v22.Position - v59).Magnitude
  end
  end
  end

  if not v272 then
  v272 = v27
  v124 = v92
  else
  local v863 = v27.genValue or 0
  local v825 = v272.genValue or 0
  if v863 > v825 then
  v272 = v27
  v124 = v92
  elseif v863 == v825 then
  if v92 < v124 then
  v272 = v27
  v124 = v92
  end
  end
  end
  end
  end
  if v272 then
  return v272
  end
  end


  local v1071 = (Config.StealNearest and Config.TpSettings.MinGenForGrab) or Config.TpSettings.MinGenForTp
  local v1063 = math.max(10000000, parseMinGen(v1071) or 0)
  local v650 = nil
  local v824 = math.huge
  for idx, v27 in ipairs(v70) do
  if v27 and v27.owner ~= LocalPlayer.Name and v27.genValue and v27.genValue >= v1063 then
  local v92 = math.huge
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v53 = Workspace:FindFirstChild("Plots")
  local v494 = v53 and v53:FindFirstChild(v27.plot)
  if v494 then
  local v59 = nil
  pcall(function() v59 = v494:GetPivot().Position end)
  if v59 then v92 = (v22.Position - v59).Magnitude end
  end
  end
  if v92 < v824 then
  v824 = v92
  v650 = v27
  end
  end
  end
  if v650 then return v650 end


  if Config.AutoTPHighestGen then
  if v63 and #v63 > 0 then
  return v63[1].animalData
  end
  end


  if Config.AutoTPHighestValue then
  local v773 = get_all_pets_by_value()
  if v773 and #v773 > 0 then
  return v773[1].animalData
  end
  end


  if Config.AutoTPPriority then
  if v63 and #v63 > 0 then
  return v63[1].animalData
  end
  return nil
  end


  if SharedState.SelectedPetData then
  return SharedState.SelectedPetData.animalData
  end

  return nil
end

do
UPPER = {
  B = {{coord=Vector3.new(-487.921448,16.850713,-75.768013),facing="NORTH"},{coord=Vector3.new(-332.379730,16.850722,-75.762100),facing="NORTH"},{coord=Vector3.new(-487.134918,16.850713,-18.094154),facing="SOUTH"},{coord=Vector3.new(-316.300171,16.850713,-17.845898),facing="SOUTH"}},
  C = {{coord=Vector3.new(-502.989349,16.850713,31.172430),facing="NORTH"},{coord=Vector3.new(-330.765381,16.850713,31.424425),facing="NORTH"},{coord=Vector3.new(-489.077087,16.850713,89.010147),facing="SOUTH"},{coord=Vector3.new(-330.908936,16.850713,88.930145),facing="SOUTH"}},
  D = {{coord=Vector3.new(-487.935181,16.850713,138.026321),facing="NORTH"},{coord=Vector3.new(-331.264893,16.850713,138.209167),facing="NORTH"},{coord=Vector3.new(-487.774933,16.850713,195.882538),facing="SOUTH"},{coord=Vector3.new(-330.799133,16.850575,196.022354),facing="SOUTH"}},
}
LOWER = {
  B = {{coord=Vector3.new(-503.214233,-3.048217,-75.043137),facing="NORTH"},{coord=Vector3.new(-335.725586,-3.048217,-74.984589),facing="NORTH"},{coord=Vector3.new(-483.619385,-3.718430,-18.844337),facing="SOUTH"},{coord=Vector3.new(-316.147095,-3.048218,-18.818844),facing="SOUTH"}},
  C = {{coord=Vector3.new(-503.277008,-3.048217,31.956175),facing="NORTH"},{coord=Vector3.new(-335.985413,-3.048218,32.051426),facing="NORTH"},{coord=Vector3.new(-483.749390,-3.048218,88.147003),facing="SOUTH"},{coord=Vector3.new(-315.793823,-3.048217,88.163979),facing="SOUTH"}},
  D = {{coord=Vector3.new(-503.710083,-3.048218,138.989883),facing="NORTH"},{coord=Vector3.new(-335.476654,-3.048218,139.001083),facing="NORTH"},{coord=Vector3.new(-483.859253,-3.048218,195.269043),facing="SOUTH"},{coord=Vector3.new(-315.654938,-3.048218,195.302444),facing="SOUTH"}},
}
UPPER_Y_THRESHOLD = 7
TALL_PETS = { ["La Secret Combinasion"]=true, ["La Jolly Grande"]=true }
TALL_OFFSET = 3

SKY_CLONE_WAIT = 0.2
CARPET_NAMES = { "Flying Carpet", "Carpet", "Cloud", "Witch's Broom", "Cupid's Wings", "Santa's Sleigh", "Magic Carpet", "Waverider" }
GRAPPLE_NAMES = { "Grapple Hook", "Grappling Hook", "Grapple", "Hook", "Web Slinger", "Grapple Gun", "GrappleHook" }

local PlayersService  = game:GetService("Players")
local v133 = game:GetService("RunService")
UIS  = game:GetService("UserInputService")
RS  = game:GetService("ReplicatedStorage")
LP  = PlayersService.LocalPlayer

_G.AntiDieDisabled = false


task.spawn(function()
  local v397 = game:GetService("ReplicatedStorage")
  local v860 = v397:WaitForChild("Controllers", 10)

  if v860 then
  local v978 = v860:WaitForChild("RNGMachineController", 5)
  if v978 then
  local v234, v360 = pcall(require, v978)
  if v234 and type(v360) == "table" then
  setreadonly(v360, false)

  if v360._animateStage then
  v360._animateStage = function() return end
  end
  if v360._renderActivityOffer then
  v360._renderActivityOffer = function() return end
  end

  setreadonly(v360, true)
  end
  end
  end

  local function v851(v24)
  if v24.Name == "RNGMachineDisplay" or string.find(v24.Name, "RNGMachine.*VFX") then
  game:GetService("RunService").Heartbeat:Wait()
  pcall(function() v24:Destroy() end)
  end
  end

  for idx, v26 in pairs(workspace:GetChildren()) do v851(v26) end
  workspace.ChildAdded:Connect(v851)
end)


do
  local v628, v187, v631
  local v630 = function(v35)
  if _G.AntiDieDisabled or _G._CLTHUB_ResetRequested then return end
  pcall(function() v35.BreakJointsOnDeath = false end)
  pcall(function() v35.RequiresNeck = false end)
  pcall(function() v35:SetStateEnabled(Enum.HumanoidStateType.Dead, false) end)
  pcall(function() v35:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) end)
  pcall(function() v35:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) end)
  pcall(function() v35:SetStateEnabled(Enum.HumanoidStateType.Physics, false) end)
  end
  local function v642(v35)
  if _G.AntiDieDisabled or _G._CLTHUB_ResetRequested then return end
  local v471 = v35 and v35.Parent and v35.Parent:FindFirstChild("Head")
  if not v471 then return end
  pcall(function() v35.Health = v35.MaxHealth end)
  pcall(function() v35:ChangeState(Enum.HumanoidStateType.Running) end)
  end
  local function v798()
  local character = LP.Character
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if not v35 then return end
  v630(v35)
  if v628 then pcall(function() v628:Disconnect() end) end
  if v187 then pcall(function() v187:Disconnect() end) end
  if v631 then pcall(function() v631:Disconnect() end) end
  v628 = v35:GetPropertyChangedSignal("Health"):Connect(function()
  if _G.AntiDieDisabled or _G._CLTHUB_ResetRequested then return end
  if v35.Health <= 0 then v642(v35) end
  end)
  v187 = v35.Died:Connect(function()
  if _G.AntiDieDisabled or _G._CLTHUB_ResetRequested then return end
  v642(v35)
  end)
  local v790 = 0
  v631 = v133.Heartbeat:Connect(function()
  if _G.AntiDieDisabled or _G._CLTHUB_ResetRequested or not v35 or not v35.Parent then return end
  local v60 = os.clock()
  if v60 - v790 >= 0.5 then v790 = v60; v630(v35) end
  if v35.Health <= 0 then v642(v35) end
  local v99 = v35:GetState()
  if v99 == Enum.HumanoidStateType.Dead or v99 == Enum.HumanoidStateType.Ragdoll
  or v99 == Enum.HumanoidStateType.FallingDown then
  pcall(function() v35:ChangeState(Enum.HumanoidStateType.Running) end)
  end
  end)
  end
  v798()
  LP.CharacterAdded:Connect(function(character)
  local v35 = character:WaitForChild("Humanoid", 5)
  if v35 then v630(v35) end
  task.wait(0.1)
  v798()
  end)
end
end


ctapHighlight=Instance.new("Highlight",CoreGui)
ctapHighlight.FillColor=Color3.fromRGB(255,150,200); ctapHighlight.FillTransparency=1
ctapHighlight.OutlineColor=Color3.fromRGB(255,150,200); ctapHighlight.OutlineTransparency=1
ctapHighlight.Adornee=nil; ctapHighlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop

function rayToCubeIntersect(v432,v431,v861,v1108)
  local v415=v1108/2; local v715=v861-Vector3.new(v415,v415,v415); local v707=v861+Vector3.new(v415,v415,v415)
  local v433=Vector3.new(v431.X==0 and 0.0001 or v431.X, v431.Y==0 and 0.0001 or v431.Y, v431.Z==0 and 0.0001 or v431.Z)
  local v386,v385=(v715.X-v432.X)/v433.X,(v707.X-v432.X)/v433.X; if v386>v385 then v386,v385=v385,v386 end
  local v440,v439=(v715.Y-v432.Y)/v433.Y,(v707.Y-v432.Y)/v433.Y; if v440>v439 then v440,v439=v439,v440 end
  if v386>v439 or v440>v385 then return false end; if v440>v386 then v386=v440 end; if v439<v385 then v385=v439 end
  local v611,v610=(v715.Z-v432.Z)/v433.Z,(v707.Z-v432.Z)/v433.Z; if v611>v610 then v611,v610=v610,v611 end
  return not(v386>v610 or v611>v385)
end

RunService.RenderStepped:Connect(function()
  if Config.ClickToAP then
  local v243=Workspace.CurrentCamera; local v280=UIS:GetMouseLocation()
  local v377=v243:ViewportPointToRay(v280.X,v280.Y); local v319,v124=nil,math.huge
  for idx,v23 in ipairs(PlayersService:GetPlayers()) do if v23~=LocalPlayer and v23.Character and v23.Character:FindFirstChild("HumanoidRootPart") then
  if rayToCubeIntersect(v377.Origin,v377.Direction,v23.Character.HumanoidRootPart.Position,Config.ClickToAPRadius or 8) then
  local v92=(v377.Origin-v23.Character.HumanoidRootPart.Position).Magnitude; if v92<v124 then v124=v92; v319=v23 end
  end
  end end
  ctapHighlight.Adornee=(v319 and v319.Character) or nil
  else ctapHighlight.Adornee=nil end
end)

UIS.InputBegan:Connect(function(v893,v131)
  if not v131 and (v893.UserInputType==Enum.UserInputType.MouseButton1 or v893.UserInputType==Enum.UserInputType.Touch) and Config.ClickToAP then
  local v243=Workspace.CurrentCamera; local v280=UIS:GetMouseLocation()
  local v377=v243:ViewportPointToRay(v280.X,v280.Y); local v319,v124=nil,math.huge
  for idx,v23 in ipairs(PlayersService:GetPlayers()) do if v23~=LocalPlayer and v23.Character and v23.Character:FindFirstChild("HumanoidRootPart") then
  if rayToCubeIntersect(v377.Origin,v377.Direction,v23.Character.HumanoidRootPart.Position,Config.ClickToAPRadius or 8) then
  local v92=(v377.Origin-v23.Character.HumanoidRootPart.Position).Magnitude; if v92<v124 then v124=v92; v319=v23 end
  end
  end end
  if v319 then
  if isPlayerBlacklisted(v319) then
  return
  end
  local v275 = AP_ALL_COMMANDS
  local v383 = _G.ClickToAPIndex or 1
  if v383 > #v275 then v383 = 1 end

  local v166 = nil
  local v206 = 0
  while v206 < #v275 do
  local v72 = ((v383 - 1 + v206) % #v275) + 1
  local v47 = v275[v72]
  if Config.ClickToAPCommands and Config.ClickToAPCommands[v47] and not apIsOnCooldown(v47) then
  v166 = v47
  _G.ClickToAPIndex = v72 + 1
  break
  end
  v206 = v206 + 1
  end

  if not v166 then
  return
  end

  if runAdminCommand(v319, v166) then
  local v866 = AP_COMMAND_EMOJIS[v166] or "⚡"
  end
  end
  end
end)


playerESPEnabled=Config.PlayerESP; local v429={}
DANGER_TOOLS={["Boogie Bomb"]=true,["Medusa's Head"]=true,["Body Swap Potion"]=true,["Laser Cape"]=true,["Rainbowrath Sword"]=true,["Gummy Bear"]=true}
function getHeldTool(v23) local v34=v23.Character; if not v34 then return nil end; for idx,v146 in ipairs(v34:GetChildren()) do if v146:IsA("Tool") then return v146.Name end end; return nil end
function makePlayerBillboard(player)
  local v42=Instance.new("BillboardGui"); v42.Name="PlayerESP_"..tostring(player.UserId); v42.Size=UDim2.new(0,170,0,48)
  v42.StudsOffsetWorldSpace=Vector3.new(0,2.8,0); v42.AlwaysOnTop=true; v42.LightInfluence=0; v42.ResetOnSpawn=false
  local v255=Instance.new("TextLabel",v42); v255.Size=UDim2.new(1,0,0,18); v255.BackgroundTransparency=1
  v255.Font=Enum.Font.GothamBold; v255.TextSize=14; v255.TextColor3=Color3.fromRGB(255,255,255)
  v255.TextStrokeTransparency=0.4; v255.TextStrokeColor3=Color3.fromRGB(0,0,0); v255.Text=player.Name
  local v291=Instance.new("TextLabel",v42); v291.Name="ToolLabel"; v291.Size=UDim2.new(1,0,0,13); v291.Position=UDim2.new(0,0,0,18)
  v291.BackgroundTransparency=1; v291.Font=Enum.Font.Nunito; v291.TextSize=11; v291.TextColor3=Color3.fromRGB(100,220,255)
  v291.TextStrokeTransparency=0.4; v291.TextStrokeColor3=Color3.fromRGB(0,0,0); v291.Text=getHeldTool(player) or ""
  local v290=Instance.new("TextLabel",v42); v290.Name="StealLabel"; v290.Size=UDim2.new(1,0,0,13); v290.Position=UDim2.new(0,0,0,31)
  v290.BackgroundTransparency=1; v290.Font=Enum.Font.GothamBold; v290.TextSize=11; v290.TextColor3=Color3.fromRGB(255,60,60)
  v290.TextStrokeTransparency=0.4; v290.TextStrokeColor3=Color3.fromRGB(0,0,0); v290.Text=""
  return v42,v255
end
function createOrRefreshPlayerESP(player)
  if player==LocalPlayer then return end; local v22=player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if not v22 then return end
  local v35=player.Character:FindFirstChild("Humanoid"); if v35 then v35.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None end
  local v76=player.UserId; local v41=v429[v76]
  if not v41 or not v41.bb or not v41.bb.Parent then
  if v41 and v41.bb then pcall(function() v41.bb:Destroy() end) end
  local v42,v255=makePlayerBillboard(player); v42.Adornee=v22; v42.Parent=v22; v429[v76]={bb=v42,nameLbl=v255,player=player}
  elseif v41.bb.Adornee~=v22 then v41.bb.Adornee=v22; v41.bb.Parent=v22 end
end


local v877 = false
local v467 = nil

local function v145(inst)

  local v65 = inst:FindFirstAncestorOfClass("Model")
  if v65 and v65 == LocalPlayer.Character then return end

  if inst:IsA("ParticleEmitter") or inst:IsA("Trail") or inst:IsA("Beam") or inst:IsA("Sparkles") or inst:IsA("Fire") then
  inst:Destroy()
  elseif inst:IsA("Animator") or inst:IsA("AnimationController") then
  inst:Destroy()
  elseif inst:IsA("BasePart") then
  inst.CastShadow = false
  end
end

local function v1187()
  local v13 = game:GetService("CollectionService")
  local v1079 = {"TradePlazaPortal", "Portal", "CrystalSpinWheel"}
  for idx, inst in ipairs(Workspace:GetDescendants()) do
  if inst:IsA("Model") then
  local v865 = false
  for idx, v1213 in ipairs(v1079) do
  if inst.Name == v1213 then v865 = true; break end
  end
  if v865 and not inst.Name:find("v1036") then
  inst.Archivable = true
  local v356 = inst:Clone()
  if v356 then
  v356.Name = v356.Name .. "v1036"
  for idx, v388 in ipairs(v13:GetTags(v356)) do
  v13:RemoveTag(v356, v388)
  end
  for idx, v56 in ipairs(v356:GetDescendants()) do
  for idx, v388 in ipairs(v13:GetTags(v56)) do
  v13:RemoveTag(v56, v388)
  end
  if v56:IsA("BasePart") then
  v56.Anchored = true
  elseif v56:IsA("Script") or v56:IsA("LocalScript") then
  v56:Destroy()
  end
  end
  v356.Parent = inst.Parent
  inst:Destroy()
  end
  end
  end
  end
end

local function v646(inst)

  local v65 = inst:FindFirstAncestorOfClass("Model")
  if v65 and v65 == LocalPlayer.Character then return end

  pcall(function()
  if inst:IsA("BasePart") then
  inst.Material = Enum.Material.SmoothPlastic
  inst.Reflectance = 0
  inst.CastShadow = false
  if inst:IsA("MeshPart") then inst.TextureID = "" end
  elseif inst:IsA("Decal") or inst:IsA("Texture") or inst:IsA("SurfaceAppearance") then
  inst:Destroy()
  elseif inst:IsA("Shirt") or inst:IsA("Pants") or inst:IsA("ShirtGraphic") or inst:IsA("CharacterMesh") or inst:IsA("Accessory") then
  inst:Destroy()
  elseif inst:IsA("PostEffect") or inst:IsA("Atmosphere") or inst:IsA("Sky") or inst:IsA("SunRaysEffect") or inst:IsA("BloomEffect") or inst:IsA("BlurEffect") or inst:IsA("ColorCorrectionEffect") or inst:IsA("DepthOfFieldEffect") or inst:IsA("Clouds") then
  inst:Destroy()
  elseif inst:IsA("PointLight") or inst:IsA("SurfaceLight") or inst:IsA("SpotLight") then
  inst.Enabled = false
  elseif inst:IsA("ParticleEmitter") or inst:IsA("Trail") or inst:IsA("Beam") or inst:IsA("Sparkles") or inst:IsA("Fire") or inst:IsA("Smoke") then
  inst:Destroy()
  elseif inst:IsA("Animator") or inst:IsA("AnimationController") or inst:IsA("Animation") then
  inst:Destroy()
  end
  end)
end

_G.toggleFPSBoost = function(v38)
  v38 = v38 == true
  v877 = v38
  Config.FPSBoost = v38
  Config.FPSBoostPets = v38
  saveConfig()

  local v46 = game:GetService("Lighting")

  if v38 then
  pcall(function()
  v46.GlobalShadows = false
  v46.FogEnd = 9e9
  v46.Brightness = 1
  v46.EnvironmentDiffuseScale = 0
  v46.EnvironmentSpecularScale = 0
  if workspace.Terrain then
  workspace.Terrain.WaterWaveSize = 0
  workspace.Terrain.WaterWaveSpeed = 0
  workspace.Terrain.WaterReflectance = 0
  workspace.Terrain.WaterTransparency = 0
  workspace.Terrain.Decoration = false
  end
  end)

  pcall(v1187)

  for idx, inst in ipairs(workspace:GetDescendants()) do v646(inst) end
  for idx, inst in ipairs(v46:GetDescendants()) do v646(inst) end

  if not v467 then
  v467 = workspace.DescendantAdded:Connect(function(v58)
  if v877 then v646(v58) end
  end)
  end
  else
  v46.GlobalShadows = true
  if v467 then v467:Disconnect(); v467 = nil end
  end
end

task.spawn(function() if Config.FPSBoostPets then _G.toggleFPSBoost(true) end end)

function clearPlayerESP()
  for v76,v41 in pairs(v429) do if v41.bb then pcall(v41.bb.Destroy,v41.bb) end; v429[v76]=nil end
end
task.spawn(function() while true do task.wait(1)
  if _G._isTpMoving then continue end
  if playerESPEnabled then
  for idx,player in ipairs(PlayersService:GetPlayers()) do if player~=LocalPlayer then pcall(createOrRefreshPlayerESP,player) end end
  for v76,v41 in pairs(v429) do if v41.bb and v41.bb.Parent then
  pcall(function() local v609=v41.bb:FindFirstChild("ToolLabel"); if v609 then local v419=getHeldTool(v41.player); v609.Text=v419 or ""
  if v41.nameLbl then v41.nameLbl.TextColor3=v419 and DANGER_TOOLS[v419] and Color3.fromRGB(255,60,60) or Color3.fromRGB(255,255,255) end
  end end)
  pcall(function() local v748=v41.bb:FindFirstChild("StealLabel"); if v748 then
  if v41.player:GetAttribute("Stealing") then


  local idx, v318 = getStealingInfo(v41.player)
  if v318 then v41.stealName = v318 end
  v748.Text = "ROUBANDO : "..tostring(v41.stealName or "Brainrot")
  else
  v41.stealName = nil
  v748.Text = ""
  end
  end end)
  end end
  else clearPlayerESP() end
end end)


task.spawn(function()
  while true do task.wait(0.5)

  if _G._isTpMoving or (os.clock() - (_G.__CLTHUBBootClock or 0)) < 10 then continue end
  pcall(function()
  for idx, player in ipairs(PlayersService:GetPlayers()) do
  if player ~= LocalPlayer and player.Character then
  for idx, v33 in ipairs(player.Character:GetDescendants()) do
  if v33:IsA("BasePart") and v33.Name ~= "HumanoidRootPart" then
  if v33.Transparency > 0.05 and v33.Transparency < 0.95 then v33.Transparency = 0 end
  if v33.LocalTransparencyModifier > 0.05 then v33.LocalTransparencyModifier = 0 end
  elseif (v33:IsA("Decal") or v33:IsA("Texture")) and v33.Transparency > 0.05 and v33.Transparency < 0.95 then
  v33.Transparency = 0
  end
  end
  end
  end
  end)
  end
end)


do
  local v510 = {}
  local function v1224(player)
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return nil end
  for idx, v25 in ipairs(v53:GetChildren()) do
  if getPlotOwner(v25) == player then return v25 end
  end
  return nil
  end
  local function v1080(v25)
  local v111 = v25:FindFirstChild("PlotSign")
  if v111 then
  if v111:IsA("BasePart") then return v111 end
  local v23 = v111:FindFirstChildWhichIsA("BasePart", true)
  if v23 then return v23 end
  end
  return v25:FindFirstChildWhichIsA("BasePart", true)
  end
  local function v668(v76)
  local v50 = v510[v76]
  if v50 then pcall(function() v50.bb:Destroy() end); v510[v76] = nil end
  end
  task.spawn(function()
  while true do
  task.wait(0.5)

  if _G._isTpMoving or (os.clock() - (_G.__CLTHUBBootClock or 0)) < 10 then continue end
  for idx, player in ipairs(PlayersService:GetPlayers()) do
  if player ~= player then
  local v76 = player.UserId
  if player:GetAttribute("Stealing") then
  local v50 = v510[v76]
  if not v50 or not v50.bb or not v50.bb.Parent then
  v668(v76)
  pcall(function()
  local v25 = v1224(player)
  local v56 = v25 and v1080(v25)
  if not v56 then return end
  local idx, v428 = getStealingInfo(player)
  local v42 = Instance.new("BillboardGui")
  v42.Name = "CLTHUBBaseStealTag_" .. v76
  v42.Size = UDim2.new(0, 340, 0, 46)
  v42.StudsOffsetWorldSpace = Vector3.new(0, 14, 0)
  v42.AlwaysOnTop = true
  v42.MaxDistance = 2000
  v42.LightInfluence = 0
  local v37 = Instance.new("TextLabel", v42)
  v37.Size = UDim2.new(1, 0, 1, 0)
  v37.BackgroundTransparency = 1
  v37.Font = Enum.Font.GothamBold
  v37.TextSize = 24
  v37.TextColor3 = Color3.fromRGB(255, 40, 40)
  v37.TextStrokeTransparency = 0.15
  v37.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  v37.Text = "ROUBANDO : " .. tostring(v428 or "Brainrot")
  v42.Adornee = v56
  v42.Parent = v56
  v510[v76] = { bb = v42, lbl = v37 }
  end)
  elseif v50.lbl then


  pcall(function()
  local idx, v428 = getStealingInfo(player)
  if v428 then
  v50.lbl.Text = "ROUBANDO : " .. tostring(v428)
  end
  end)
  end
  else
  v668(v76)
  end
  end
  end
  for v76 in pairs(v510) do
  if not PlayersService:GetPlayerByUserId(v76) then v668(v76) end
  end
  end
  end)
end


do
  local v2  = "PlotBeam"
  local v20 = "PlotBeam_Border"
  local v16  = "PlotBeamAttach_Player"
  local v6  = "PlotBeamAttach_Plot"
  local v159  = Color3.fromRGB(255, 255, 255)
  local v11  = Color3.fromRGB(0, 0, 0)

  local v106  = nil
  local v107 = nil
  local v147  = nil
  local v126  = nil
  local v460 = nil

  local function v813(v118, v116)
  if v116 then
  v116.FaceCamera = true
  v116.LightEmission = 0
  v116.LightInfluence = 0
  v116.Color = ColorSequence.new(v11)
  v116.Transparency = NumberSequence.new(0)
  v116.Width0 = 0.26
  v116.Width1 = 0.26
  v116.TextureMode = Enum.TextureMode.Wrap
  v116.TextureSpeed = 0
  v116.ZOffset = -0.02
  v116.Enabled = true
  end
  if v118 then
  v118.FaceCamera = true
  v118.LightEmission = 0
  v118.LightInfluence = 0
  v118.Color = ColorSequence.new(v159)
  v118.Transparency = NumberSequence.new(0)
  v118.Width0 = 0.18
  v118.Width1 = 0.18
  v118.TextureMode = Enum.TextureMode.Wrap
  v118.TextureSpeed = 0
  v118.ZOffset = 0.02
  v118.Enabled = true
  end
  end

  local function v675()
  if v106 then pcall(function() v106:Destroy() end) end
  if v107 then pcall(function() v107:Destroy() end) end
  local v886 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  if v886 then
  local v484 = v886:FindFirstChild("PlotBeamGlow")
  if v484 then pcall(function() v484:Destroy() end) end
  end
  if v147 then pcall(function() v147:Destroy() end) end
  if v126 then pcall(function() v126:Destroy() end) end
  v106, v107, v147, v126 = nil, nil, nil, nil
  v460 = nil
  end

  local function v882()
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return nil end
  for idx, v25 in ipairs(v53:GetChildren()) do
  if _G.isMyPlot_Instant and _G.isMyPlot_Instant(v25.Name) then
  return v25
  end
  end
  for idx, v25 in ipairs(v53:GetChildren()) do
  local v111 = v25:FindFirstChild("PlotSign")
  if v111 then
  local v391 = v111:FindFirstChild("YourBase")
  if v391 and v391:IsA("BillboardGui") and v391.Enabled then
  return v25
  end
  local v506 = v111:FindFirstChildWhichIsA("SurfaceGui", true)
  if v506 then
  local v81 = v506:FindFirstChildWhichIsA("TextLabel", true)
  if v81 then
  local v100 = v81.Text:lower()
  if v100:find(LocalPlayer.DisplayName:lower(), 1, true)
  or v100:find(LocalPlayer.Name:lower(), 1, true) then
  return v25
  end
  end
  end
  end
  end
  return nil
  end

  local function v890(v25)
  if not v25 then return nil end
  local v111 = v25:FindFirstChild("PlotSign")
  if v111 then
  if v111:IsA("BasePart") then return v111 end
  local v56 = v111:FindFirstChildWhichIsA("BasePart", true)
  if v56 then return v56 end
  end
  local v706 = v25:FindFirstChild("MainRootPart")
  if v706 and v706:IsA("BasePart") then return v706 end
  return v25:FindFirstChildWhichIsA("BasePart")
  end

  local function v869(v22, v216)
  if not v22 or not v22.Parent or not v216 or not v216.Parent then return end

  if not v147 or not v147.Parent or v147.Parent ~= v22 then
  if v147 then pcall(function() v147:Destroy() end) end
  v147 = v22:FindFirstChild(v16) or Instance.new("Attachment")
  v147.Name = v16
  v147.Position = Vector3.new(0, 0, 0)
  v147.Parent = v22
  end

  if v460 ~= v216 or not v126 or not v126.Parent then
  if v126 then pcall(function() v126:Destroy() end) end
  v126 = v216:FindFirstChild(v6) or Instance.new("Attachment")
  v126.Name = v6
  v126.Position = Vector3.new(0, 4, 0)
  v126.Parent = v216
  v460 = v216
  if v106 then v106.Attachment1 = v126 end
  if v107 then v107.Attachment1 = v126 end
  end

  if not v106 or not v106.Parent or not v107 or not v107.Parent then
  if v106 then pcall(function() v106:Destroy() end) end
  if v107 then pcall(function() v107:Destroy() end) end
  local v932 = v22:FindFirstChild("PlotBeamGlow")
  if v932 then pcall(function() v932:Destroy() end) end

  v107 = Instance.new("Beam")
  v107.Name = v20
  v107.Attachment0 = v147
  v107.Attachment1 = v126

  v106 = Instance.new("Beam")
  v106.Name = v2
  v106.Attachment0 = v147
  v106.Attachment1 = v126

  v813(v106, v107)
  v107.Parent = v22
  v106.Parent = v22
  else
  v107.Attachment0 = v147
  v107.Attachment1 = v126
  v106.Attachment0 = v147
  v106.Attachment1 = v126
  v813(v106, v107)
  end
  end

  local function v677()
  if not Config.LineToBase then return end
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then return end
  local v483 = v882()
  if not v483 then return end
  local v216 = v890(v483)
  if not v216 then return end
  pcall(v869, v22, v216)
  end

  task.spawn(function()
  local v176 = 0
  RunService.Heartbeat:Connect(function()
  if not Config.LineToBase then
  if v106 or v107 or v147 or v126 then v675() end
  return
  end
  v176 = v176 + 1
  if v176 < 10 then return end
  v176 = 0

  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then
  if v106 or v107 or v147 or v126 then v675() end
  return
  end

  local v483 = v882()
  if not v483 then
  if v106 or v107 or v126 then
  if v106 then pcall(function() v106:Destroy() end); v106 = nil end
  if v107 then pcall(function() v107:Destroy() end); v107 = nil end
  if v126 then pcall(function() v126:Destroy() end); v126 = nil end
  v460 = nil
  end
  return
  end

  local v216 = v890(v483)
  if not v216 or not v216.Parent then return end
  pcall(v869, v22, v216)
  end)
  end)

  LocalPlayer.CharacterAdded:Connect(function()
  task.wait(0.5)
  v460 = nil
  v147 = nil
  if v106 then pcall(function() v106:Destroy() end); v106 = nil end
  if v107 then pcall(function() v107:Destroy() end); v107 = nil end
  if Config.LineToBase then pcall(v677) end
  end)

  if LocalPlayer.Character and Config.LineToBase then
  task.defer(v677)
  end

  _G.createPlotBeam = v677
  _G.resetPlotBeam = v675
end


do
  local v2  = "BestPetBeam"
  local v20 = "BestPetBeam_Border"
  local v16  = "BestPetBeamAttach_Player"
  local v6  = "BestPetBeamAttach_Target"
  local v159  = Color3.fromRGB(0, 85, 255)
  local v11  = Color3.fromRGB(0, 0, 0)

  local v103  = nil
  local v104 = nil
  local v140  = nil
  local v123  = nil
  local v458 = nil

  local function v552()
  if v103 then pcall(function() v103:Destroy() end) end
  if v104 then pcall(function() v104:Destroy() end) end
  if v140 then pcall(function() v140:Destroy() end) end
  if v123 then pcall(function() v123:Destroy() end) end
  v103, v104, v140, v123 = nil, nil, nil, nil
  v458 = nil
  end

  local function v812(v118, v116)
  if v116 then
  v116.FaceCamera = true
  v116.LightEmission = 0
  v116.LightInfluence = 0
  v116.Color = ColorSequence.new(v11)
  v116.Transparency = NumberSequence.new(0)
  v116.Width0 = 0.26
  v116.Width1 = 0.26
  v116.TextureMode = Enum.TextureMode.Wrap
  v116.TextureSpeed = 0
  v116.ZOffset = -0.02
  v116.Enabled = true
  end
  if v118 then
  v118.FaceCamera = true
  v118.LightEmission = 0
  v118.LightInfluence = 0
  v118.Color = ColorSequence.new(v159)
  v118.Transparency = NumberSequence.new(0)
  v118.Width0 = 0.18
  v118.Width1 = 0.18
  v118.TextureMode = Enum.TextureMode.Wrap
  v118.TextureSpeed = 0
  v118.ZOffset = 0.02
  v118.Enabled = true
  end
  end


  local function v1148()
  local v63 = get_all_pets()
  if not v63 or #v63 == 0 then return {} end

  local v155 = Config.StealMode or "Priority"
  local v183 = {}

  for idx, v40 in ipairs(v63) do
  local v93 = {
  pet = v40,
  isPriority = false,
  priorityIndex = 999,
  mps = v40.mpsValue or 0,
  distance = math.huge
  }
  for v72, v89 in ipairs(priorityList) do
  if v40.petName and v40.petName:lower() == v89:lower() then
  v93.isPriority = true
  v93.priorityIndex = v72
  break
  end
  end
  if v155 == "Nearest" then
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local v102 = v40.animalData and findAdorneeGlobal(v40.animalData)
  if v102 and v102:IsA("BasePart") then
  v93.distance = (v22.Position - v102.Position).Magnitude
  else
  local v53 = Workspace:FindFirstChild("Plots")
  local v25 = v53 and v53:FindFirstChild(v40.plot)
  if v25 then
  local v59 = v25:GetPivot().Position
  v93.distance = (v22.Position - v59).Magnitude
  end
  end
  end
  end
  table.insert(v183, v93)
  end

  if v155 == "Highest" then
  table.sort(v183, function(v27, v29) return v27.mps > v29.mps end)
  elseif v155 == "Priority" then
  table.sort(v183, function(v27, v29)
  if v27.isPriority and not v29.isPriority then return true end
  if not v27.isPriority and v29.isPriority then return false end
  if v27.isPriority and v29.isPriority then
  return v27.priorityIndex < v29.priorityIndex
  end
  return v27.mps > v29.mps
  end)
  elseif v155 == "Nearest" then
  table.sort(v183, function(v27, v29) return v27.distance < v29.distance end)
  else
  table.sort(v183, function(v27, v29) return v27.mps > v29.mps end)
  end

  local v381 = {}
  for idx, v93 in ipairs(v183) do
  table.insert(v381, v93.pet)
  end
  return v381
  end

  local function v1138()
  if manuallySelectedUID then
  local v70 = SharedState.AllAnimalsCache
  if v70 then
  for idx, v40 in ipairs(v70) do
  if v40.uid == manuallySelectedUID then
  local v102 = findAdorneeGlobal(v40)
  if v102 and v102:IsA("BasePart") then
  return v102
  end
  end
  end
  end
  end

  local v381 = v1148()
  if #v381 == 0 then return nil end
  local v272 = v381[1]
  if not v272 then return nil end
  local v102 = findAdorneeGlobal(v272.animalData)
  if v102 and v102:IsA("BasePart") then
  return v102
  end
  return nil
  end

  local function v1109(v22, v179)
  if not v22 or not v22.Parent or not v179 or not v179.Parent then return end
  if not v140 or not v140.Parent or v140.Parent ~= v22 then
  if v140 then pcall(function() v140:Destroy() end) end
  v140 = v22:FindFirstChild(v16) or Instance.new("Attachment")
  v140.Name = v16
  v140.Position = Vector3.new(0, 0, 0)
  v140.Parent = v22
  end
  if v458 ~= v179 or not v123 or not v123.Parent then
  if v123 then pcall(function() v123:Destroy() end) end
  v123 = v179:FindFirstChild(v6) or Instance.new("Attachment")
  v123.Name = v6
  v123.Position = Vector3.new(0, 3, 0)
  v123.Parent = v179
  v458 = v179
  if v103 then v103.Attachment1 = v123 end
  if v104 then v104.Attachment1 = v123 end
  end
  if not v103 or not v103.Parent or not v104 or not v104.Parent then
  if v103 then pcall(function() v103:Destroy() end) end
  if v104 then pcall(function() v104:Destroy() end) end

  v104 = Instance.new("Beam")
  v104.Name = v20
  v104.Attachment0 = v140
  v104.Attachment1 = v123

  v103 = Instance.new("Beam")
  v103.Name = v2
  v103.Attachment0 = v140
  v103.Attachment1 = v123

  v812(v103, v104)
  v104.Parent = v22
  v103.Parent = v22
  else
  v104.Attachment0 = v140
  v104.Attachment1 = v123
  v103.Attachment0 = v140
  v103.Attachment1 = v123
  v812(v103, v104)
  end
  end

  task.spawn(function()
  local v176 = 0
  RunService.Heartbeat:Connect(function()
  if not Config.LineToBrainrot then
  if v103 or v104 or v140 or v123 then v552() end
  return
  end
  v176 = v176 + 1
  if v176 < 10 then return end
  v176 = 0

  local character = LocalPlayer.Character
  local v22  = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then
  if v103 or v104 or v140 or v123 then v552() end
  return
  end

  local v179 = v1138()
  if not v179 or not v179.Parent then
  if v103 or v104 or v123 then
  if v103 then pcall(function() v103:Destroy() end); v103 = nil end
  if v104 then pcall(function() v104:Destroy() end); v104 = nil end
  if v123 then pcall(function() v123:Destroy() end); v123 = nil end
  v458 = nil
  end
  return
  end

  pcall(v1109, v22, v179)
  end)
  end)

  LocalPlayer.CharacterAdded:Connect(function()
  task.wait(0.5)
  v458 = nil
  v140 = nil
  if v103 then pcall(function() v103:Destroy() end); v103 = nil end
  if v104 then pcall(function() v104:Destroy() end); v104 = nil end
  end)

  _G.updateBrainrotBeam = function()

  end
  _G.resetBrainrotBeam = v552
  _G.resetBestPetBeam = v552
end


brainrotESPEnabled = Config.BrainrotESP
local v196 = {}

local function v889()
  local v114 = SharedState and SharedState.SelectedPetData
  if not v114 and manuallySelectedUID then
  local v70 = SharedState and SharedState.AllAnimalsCache
  if v70 then
  for idx, v40 in ipairs(v70) do
  if v40.uid == manuallySelectedUID then v114 = v40; break end
  end
  end
  end
  if not v114 and selectedTargetUID then
  local v70 = SharedState and SharedState.AllAnimalsCache
  if v70 then
  for idx, v40 in ipairs(v70) do
  if v40.uid == selectedTargetUID then v114 = v40; break end
  end
  end
  end
  if not v114 then return nil, nil, nil end

  local v108 = findAdorneeGlobal(v114.animalData or v114)
  local v959 = v114.animalData or v114
  local v157 = v959.plot
  local v1259 = tostring(v959.slot or "")

  return v114, v108, { plot = v157, slot = v1259 }
end

local function v698(v42)
  if not (v42 and v42:IsA("BillboardGui")) then return false end
  if v42.Name:find("BrainrotESP") then return false end
  if v42.Name:find("PlayerESP") or v42.Name == "TimerESP" or v42.Name:find("BaseOwner") then return false end

  if not v42:FindFirstAncestor("AnimalPodiums") then return false end
  return true
end

local function v1163(v42, v114, v338, v339)
  if not v114 then return false end
  if v338 and (v42.Adornee == v338 or v42.Parent == v338) then
  return true
  end
  if v339 and v339.plot and v339.slot and v339.slot ~= "" then
  local v25 = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(v339.plot)
  if v25 then
  local v125 = v25:FindFirstChild("AnimalPodiums")
  if v125 then
  local v110 = v125:FindFirstChild(v339.slot)
  if v110 and v42:IsDescendantOf(v110) then
  return true
  end
  end
  end
  end
  if v338 and v338:IsA("BasePart") then
  local v102 = v42.Adornee or v42.Parent
  if v102 and v102:IsA("BasePart") then
  if (v102.Position - v338.Position).Magnitude < 5 then
  return true
  end
  end
  end
  return false
end

local function v994(v37)
  if not (v37 and v37:IsA("TextLabel") and v37.Parent) then return end
  local v42 = v37:FindFirstAncestorWhichIsA("BillboardGui")
  if not v42 or not v698(v42) then return end

  local v95 = v37.Text
  if not v95 or v95 == "" then return end
  local v323 = v95:match("^%s*(.-)%s*$")
  local v73 = v323:lower()


  if v73:find("cash") or v73:find("multi") or v73:find("collect") or v73:find("offline") or
  v73:find("base") or v73:find("timer") or v73:find("trip") or v73:find("level") or
  v73:find("upgrade") or v73:find("lock") or v73:find("ready") or v73:find("pad") or
  v73:find("door") or v73:find("laser") or v73:find("zone") or v73:find("rebirth") or
  v73:find("owner") or v73:find("buy") or v73:find("cost") or v73:find("price") then
  return
  end


  if v323:match("^%$[%d%.]+.*%/s$") or (v323:find("%$") and v323:find("/s")) or v323:match("^%$[%d%.]+[KkMmBbTtQq]?/s$") then
  v37.Visible = true
  v37.TextTransparency = 0
  v37.BackgroundTransparency = 1
  v37.TextColor3 = Color3.fromRGB(0, 255, 100)
  v37.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  v37.TextStrokeTransparency = 0
  if v37.TextSize < 14 then
  v37.TextSize = 14
  end
  local v149 = v37:FindFirstChildOfClass("UIStroke")
  if v149 then v149.Color = Color3.fromRGB(0, 0, 0); v149.Transparency = 0 end

  elseif not (RARITY_WORDS and RARITY_WORDS[v73]) and not v323:match("^%$[%d%.]+[KkMmBbTtQq]?$") and not v323:match("^[%d%.]+[KkMmBbTtQq]?$") and #v323 > 1 then
  v37.Visible = true
  v37.TextTransparency = 0
  v37.BackgroundTransparency = 1
  v37.TextColor3 = Color3.fromRGB(0, 85, 255)
  v37.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  v37.TextStrokeTransparency = 0
  local v149 = v37:FindFirstChildOfClass("UIStroke")
  if v149 then v149.Color = Color3.fromRGB(0, 0, 0); v149.Transparency = 0 end
  end
end

local function v1264(v42)
  if not v698(v42) then return end
  for idx, v58 in ipairs(v42:GetDescendants()) do
  if v58:IsA("Frame") or v58:IsA("ImageLabel") or v58:IsA("CanvasGroup") then
  v58.BackgroundTransparency = 1
  if v58:IsA("ImageLabel") then v58.ImageTransparency = 1 end
  elseif v58:IsA("UIStroke") and not v58.Parent:IsA("TextLabel") then
  v58.Transparency = 1
  elseif v58:IsA("TextLabel") then
  v994(v58)
  if not v58:GetAttribute("CLTHUB_Styled") then
  v58:SetAttribute("CLTHUB_Styled", true)
  v58:GetPropertyChangedSignal("Text"):Connect(function()
  v994(v58)
  end)
  end
  end
  end
end

function createBrainrotBillboard(v55)
  local v42 = Instance.new("BillboardGui")
  v42.Name = "BrainrotESP_" .. tostring(v55.uid or "target")
  v42.Size = UDim2.new(0, 160, 0, 38)
  v42.StudsOffset = Vector3.new(0, 2.5, 0)
  v42.AlwaysOnTop = true
  v42.LightInfluence = 0
  v42.MaxDistance = 3000

  local v85 = Instance.new("Frame", v42)
  v85.Size = UDim2.new(1, 0, 1, 0)
  v85.BackgroundTransparency = 1
  v85.BorderSizePixel = 0

  local v94 = Instance.new("TextLabel", v85)
  v94.Size = UDim2.new(1, 0, 0, 18)
  v94.Position = UDim2.new(0, 0, 0, 0)
  v94.BackgroundTransparency = 1
  v94.Font = Enum.Font.GothamBold
  v94.TextSize = 15
  v94.TextColor3 = Color3.fromRGB(0, 85, 255)
  v94.TextStrokeTransparency = 0
  v94.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  v94.Text = v55.name or v55.petName or "???"
  v94.TextXAlignment = Enum.TextXAlignment.Center

  local v278 = Instance.new("TextLabel", v85)
  v278.Size = UDim2.new(1, 0, 0, 16)
  v278.Position = UDim2.new(0, 0, 0, 18)
  v278.BackgroundTransparency = 1
  v278.Font = Enum.Font.GothamBold
  v278.TextSize = 14
  v278.TextColor3 = Color3.fromRGB(0, 255, 100)
  v278.TextStrokeTransparency = 0
  v278.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  local v1190 = v55.genText or (v55.mpsValue and ("$" .. v936(v55.mpsValue) .. "/s")) or ""
  v278.Text = v1190
  v278.TextXAlignment = Enum.TextXAlignment.Center

  return v42
end

function refreshBrainrotESP()
  if _G._isTpMoving then return end
  local v114, v102 = v889()
  local v237 = v114 and (v114.uid or (v114.animalData and v114.animalData.uid))

  for v76, v41 in pairs(v196) do
  if v76 ~= v237 or not v114 then
  if v41.bb then pcall(function() v41.bb:Destroy() end) end
  if v41.highlight then pcall(function() v41.highlight:Destroy() end) end
  v196[v76] = nil
  end
  end

  if v114 and v237 and v102 then
  local v1222 = v114.animalData or v114
  if (v1222.genValue or 0) < 20000000 then return end

  if not v196[v237] or not v196[v237].bb or not v196[v237].bb.Parent then
  if v196[v237] then
  if v196[v237].bb then pcall(function() v196[v237].bb:Destroy() end) end
  if v196[v237].highlight then pcall(function() v196[v237].highlight:Destroy() end) end
  end
  local v42 = createBrainrotBillboard(v114.animalData or v114)
  v42.Adornee = v102
  v42.Parent = v102

  local v896 = (v102.Parent and v102.Parent:IsA("Model") and v102.Parent) or v102
  local v153 = Instance.new("Highlight")
  v153.Name = "BrainrotHL_" .. tostring(v237)
  v153.FillColor = Color3.fromRGB(0, 85, 255)
  v153.FillTransparency = 0.65
  v153.OutlineColor = Color3.fromRGB(0, 85, 255)
  v153.OutlineTransparency = 0.1
  v153.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
  v153.Adornee = v896
  v153.Parent = v896

  v196[v237] = { bb = v42, highlight = v153 }
  end
  end
end

function clearBrainrotESP()
  for idx, v50 in pairs(v196) do
  if v50.bb then pcall(function() v50.bb:Destroy() end) end
  if v50.highlight then pcall(function() v50.highlight:Destroy() end) end
  end
  v196 = {}
  pcall(function()
  for idx, inst in ipairs(Workspace:GetChildren()) do
  if inst.Name:find("BrainrotESP_") or inst.Name:find("BrainrotHL_") then
  pcall(function() inst:Destroy() end)
  end
  end
  end)
end

local function v764()
  if not Config.BrainrotESP then
  if clearBrainrotESP then clearBrainrotESP() end
  return
  end
  local v114, v338, v339 = v889()
  local v53 = Workspace:FindFirstChild("Plots")
  if not v53 then return end

  for idx, v25 in ipairs(v53:GetChildren()) do
  local v125 = v25:FindFirstChild("AnimalPodiums")
  if v125 then
  for idx, v58 in ipairs(v125:GetDescendants()) do
  if v58:IsA("BillboardGui") and v698(v58) then
  local v1162 = v1163(v58, v114, v338, v339)
  if v1162 then
  v58.Enabled = true
  v58.AlwaysOnTop = true
  v58.MaxDistance = 2000
  v1264(v58)
  else
  v58.Enabled = false
  v58.AlwaysOnTop = false
  v58.MaxDistance = 0
  end
  end
  end
  end
  end

  pcall(refreshBrainrotESP)
end

_G.updateBrainrotOverheadVisibility = v764


task.spawn(function()
  while true do
  task.wait(0.2)
  pcall(v764)
  end
end)

pcall(function()
  local v53 = Workspace:FindFirstChild("Plots")
  if v53 then
  v53.DescendantAdded:Connect(function(v58)
  if v58:IsA("BillboardGui") and v58:FindFirstAncestor("AnimalPodiums") then
  task.wait(0.05)
  pcall(v764)
  end
  end)
  end
end)


do
  local v636 = false
  local v799 = 0
  local function v987(v565)
  for idx, v50 in pairs(v196) do
  if v50.bb then pcall(function() v50.bb.Enabled = not v565 end) end
  if v50.highlight then pcall(function() v50.highlight.Enabled = not v565 end) end
  end
  for idx, v50 in pairs(v429) do
  if v50.bb then pcall(function() v50.bb.Enabled = not v565 end) end
  end
  _G._espHiddenForTP = v565
  end
  RunService.Heartbeat:Connect(function()
  local v60 = _G._isTpMoving and true or false
  if v60 ~= v636 then
  v636 = v60
  v799 = os.clock()
  v987(v60)
  elseif v60 and (os.clock() - v799) > 20 then


  v636 = false
  v987(false)
  end
  end)
end


subspaceMineESPEnabled=Config.SubspaceMineESP; local v605={}
function refreshSubspaceMineESP()
  if not subspaceMineESPEnabled then return end; local v1022=Workspace:FindFirstChild("ToolsAdds"); if not v1022 then return end
  local v864={}
  for idx,inst in ipairs(v1022:GetChildren()) do if inst.Name:match("SubspaceTripmine") and inst:IsA("BasePart") then v864[inst]=true
  if not v605[inst] then
  local v723=inst.Name:match("SubspaceTripmine(.+)") or "Unknown"
  local v749=Instance.new("SelectionBox",inst); v749.Color3=Color3.fromRGB(167,142,255); v749.LineThickness=0.05
  local v42=Instance.new("BillboardGui",inst); v42.Size=UDim2.new(0,250,0,50); v42.StudsOffset=Vector3.new(0,2.5,0); v42.AlwaysOnTop=false
  local v37=Instance.new("TextLabel",v42); v37.Size=UDim2.new(1,0,1,0); v37.BackgroundTransparency=1; v37.Text="Subspace Mine"
  v37.TextColor3=Color3.fromRGB(0, 85, 255); v37.TextStrokeTransparency=0; v37.Font=Enum.Font.GothamBold; v37.TextSize=16
  v605[inst]={sel=v749,bb=v42}
  end
  end end
  for v718,v55 in pairs(v605) do if not v864[v718] or not v718.Parent then
  v55.sel:Destroy(); v55.bb:Destroy(); v605[v718]=nil
  end end
end
task.spawn(function() while true do if subspaceMineESPEnabled then pcall(refreshSubspaceMineESP) end; task.wait(0.5) end end)


do
  local v130 = Config.BaseOwnerESP
  local v410 = {}

  local function v858(v50)
  if not v50 then return end
  if v50.hl then pcall(function() v50.hl:Destroy() end) end
  if v50.bb then pcall(function() v50.bb:Destroy() end) end
  end
  local function v852()
  for v76, v50 in pairs(v410) do v858(v50); v410[v76] = nil end
  end

  local function v1182()
  local v42 = Instance.new("BillboardGui")
  v42.Name = "BaseOwnerTag"
  v42.Size = UDim2.new(0, 160, 0, 34)
  v42.StudsOffsetWorldSpace = Vector3.new(0, 3.6, 0)
  v42.AlwaysOnTop = true
  v42.LightInfluence = 0
  local v37 = Instance.new("TextLabel", v42)
  v37.Size = UDim2.fromScale(1, 1)
  v37.BackgroundTransparency = 1
  v37.Font = Enum.Font.GothamBold
  v37.TextSize = 18
  v37.TextColor3 = Color3.fromRGB(255, 60, 60)
  v37.TextStrokeTransparency = 0
  v37.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  v37.Text = "Base Owner"
  return v42
  end


  local function v989(player)
  for v76, v50 in pairs(v410) do
  if not player or v76 ~= player.UserId then v858(v50); v410[v76] = nil end
  end
  if not player or not player.Character then return end
  local v76 = player.UserId
  local v50 = v410[v76]; if not v50 then v50 = {}; v410[v76] = v50 end
  if not v50.hl or not v50.hl.Parent then
  if v50.hl then pcall(function() v50.hl:Destroy() end) end
  local v153 = Instance.new("Highlight")
  v153.Name = "BaseOwnerESP"
  v153.FillColor = Color3.fromRGB(255, 0, 0); v153.FillTransparency = 1
  v153.OutlineColor = Color3.fromRGB(255, 0, 0); v153.OutlineTransparency = 1
  v153.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
  v153.Parent = CoreGui
  v50.hl = v153
  end
  if v50.hl.Adornee ~= player.Character then v50.hl.Adornee = player.Character end
  if not v50.bb or not v50.bb.Parent then
  if v50.bb then pcall(function() v50.bb:Destroy() end) end
  v50.bb = v1182(); v50.bb.Parent = CoreGui
  end
  local v471 = player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("HumanoidRootPart")
  if v471 and v50.bb.Adornee ~= v471 then v50.bb.Adornee = v471 end
  end

  local function v334()
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then v989(nil); return end
  local v25 = getPlotAtPosition(v22.Position)
  local v51 = v25 and getPlotOwner(v25)
  if v51 == LocalPlayer then v51 = nil end
  v989(v51)
  end
  _G.setBaseOwnerESP = function(v38)
  v130 = v38
  Config.BaseOwnerESP = v38
  saveConfig()
  setToggle("Base Owner ESP", v38)
  if v38 then pcall(v334) else v852() end
  end
  _G.clearBaseOwnerESP = v852
  task.spawn(function()
  while true do
  task.wait(0.5)
  if v130 then pcall(v334) end
  end
  end)
end


(function()
laserOriginalState = setmetatable({}, {__mode = "k"})
_plotLaserOpenState = {}
_plotMonitorSetup = {}
_plotsFolderHooked = false
_BLOCK_TIME_KEYS = {
  "BlockEndTimeFirstFloor",
  "BlockEndTimeSecondFloor",
  "BlockEndTime",
}

function IsLaserObject(inst)
  if not inst then return false end
  if inst.Name == "Laser" or inst.Name == "LaserHitbox" then return true end
  local v30 = inst.Name:lower()
  if v30:find("laser") then return true end
  local v69 = inst.Parent
  while v69 and v69 ~= Workspace do
  if v69.Name == "Laser" then return true end
  if v69.Name:lower():find("laser") then return true end
  v69 = v69.Parent
  end
  return false
end

function GetPlotFromObject(inst)
  local v23 = inst and inst.Parent
  while v23 and v23 ~= Workspace do
  if v23.Parent and v23.Parent.Name == "Plots" then
  return v23
  end
  v23 = v23.Parent
  end
  return nil
end

function readPlotChannel(v157)
  local v1040 = _G.__getSync and _G.__getSync()
  if v1040 then
  local v68 = nil
  pcall(function() v68 = _G.XenSyncGet(v157) end)
  if not v68 then local v295=os.clock() repeat v68=_G.XenSyncGet(v157) if v68 then break end task.wait(0.05) until os.clock()-v295>2 end
  if v68 then return v68 end
  end
  if _G.stealthGet then
  return _G.stealthGet(v157)
  end
  return nil
end

function readChannelProp(v68, v335)
  if not v68 then return nil end
  local v26 = _G.sProp and _G.sProp(v68, v335)
  if v26 ~= nil then return v26 end
  pcall(function()
  if type(v68.Get) == "function" then
  v26 = v68:Get(v335)
  end
  end)
  if v26 ~= nil then return v26 end
  pcall(function()
  if v68.CacheTable then v26 = v68.CacheTable[v335] end
  end)
  return v26
end

function isBlockTimeActive(v66)
  if v66 == nil or v66 == false then return false end
  if type(v66) == "number" then
  return v66 > os.time()
  end

  if type(v66) == "table" then
  local tmpInst = rawget(v66, "EndTime") or rawget(v66, "endTime") or rawget(v66, "Time")
  if type(tmpInst) == "number" then return tmpInst > os.time() end
  end
  return true
end


function IsPlotFloorOpen(v25, v420)
  if not v25 then return false end
  local ok, v168 = pcall(function()
  local v68 = readPlotChannel(v25.Name)
  if not v68 then return false end
  local v43 = v420 and "BlockEndTimeSecondFloor" or "BlockEndTimeFirstFloor"
  if isBlockTimeActive(readChannelProp(v68, v43)) then return false end
  if isBlockTimeActive(readChannelProp(v68, "BlockEndTime")) then return false end
  return true
  end)
  return ok and v168 == true
end

function IsPlotBaseOpen(v25)

  return IsPlotFloorOpen(v25, false) and IsPlotFloorOpen(v25, true)
end


function _laserIsUpper(inst)
  local v23 = inst
  while v23 and not v23:IsA("BasePart") do v23 = v23.Parent end
  if v23 and v23:IsA("BasePart") then return v23.Position.Y > 10 end
  return false
end

function SaveLaserOriginal(inst)
  if laserOriginalState[inst] then return end
  pcall(function()
  if inst:IsA("BasePart") then
  local v186 = inst.Transparency
  local v370 = inst.LocalTransparencyModifier
  if v186 >= 1 and v370 >= 1 then
  v186, v370 = 0, 0
  end
  laserOriginalState[inst] = {
  trans = v186,
  localTrans = v370,
  shadow = inst.CastShadow,
  }
  elseif inst:IsA("Beam") or inst:IsA("ParticleEmitter") or inst:IsA("Trail")
  or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then
  laserOriginalState[inst] = { enabled = inst.Enabled ~= false }
  elseif inst:IsA("Decal") or inst:IsA("Texture") then
  local v186 = inst.Transparency
  if v186 >= 1 then v186 = 0 end
  laserOriginalState[inst] = { trans = v186 }
  elseif inst:IsA("GuiObject") then
  laserOriginalState[inst] = { visible = inst.Visible ~= false }
  end
  end)
end

function HideLaserObject(inst)
  if not inst then return end
  pcall(function()
  if inst:IsA("BasePart") then
  inst.Transparency = 1
  inst.LocalTransparencyModifier = 1
  inst.CastShadow = false
  elseif inst:IsA("Beam") or inst:IsA("ParticleEmitter") or inst:IsA("Trail")
  or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then
  inst.Enabled = false
  elseif inst:IsA("Decal") or inst:IsA("Texture") then
  inst.Transparency = 1
  elseif inst:IsA("GuiObject") then
  inst.Visible = false
  end
  end)
end

function RestoreLaserObject(inst)
  local v64 = laserOriginalState[inst]
  pcall(function()
  if inst:IsA("BasePart") then
  local v186 = v64 and v64.trans or 0
  local v370 = v64 and v64.localTrans or 0
  if v186 >= 1 then v186 = 0 end
  if v370 >= 1 then v370 = 0 end
  inst.Transparency = v186
  inst.LocalTransparencyModifier = v370
  inst.CastShadow = v64 and v64.shadow or true
  elseif inst:IsA("Beam") or inst:IsA("ParticleEmitter") or inst:IsA("Trail")
  or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then
  inst.Enabled = v64 and v64.enabled or true
  elseif inst:IsA("Decal") or inst:IsA("Texture") then
  local v186 = v64 and v64.trans or 0
  if v186 >= 1 then v186 = 0 end
  inst.Transparency = v186
  elseif inst:IsA("GuiObject") then
  inst.Visible = v64 and v64.visible or true
  end
  end)
end

function UpdateLaserObject(inst)
  if not IsLaserObject(inst) then return end
  local v25 = GetPlotFromObject(inst)

  if v25 and IsPlotFloorOpen(v25, _laserIsUpper(inst)) then
  SaveLaserOriginal(inst)
  HideLaserObject(inst)
  else
  RestoreLaserObject(inst)
  end
end

function RefreshPlotLasers(v25)
  if not v25 then return end
  local v326 = v25:FindFirstChild("Laser")
  if not v326 then return end
  UpdateLaserObject(v326)
  for idx, v24 in ipairs(v326:GetDescendants()) do
  UpdateLaserObject(v24)
  end
end

function BindLaserState(inst, v25, v129)
  UpdateLaserObject(inst)
  if inst:IsA("BasePart") then
  v129[#v129 + 1] = inst:GetPropertyChangedSignal("Transparency"):Connect(function()
  if not v25 then return end
  if IsPlotFloorOpen(v25, _laserIsUpper(inst)) and inst.Transparency < 1 then
  SaveLaserOriginal(inst)
  HideLaserObject(inst)
  elseif not IsPlotFloorOpen(v25, _laserIsUpper(inst)) then
  RestoreLaserObject(inst)
  end
  end)
  elseif inst:IsA("Beam") or inst:IsA("ParticleEmitter") or inst:IsA("Trail")
  or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then
  v129[#v129 + 1] = inst:GetPropertyChangedSignal("Enabled"):Connect(function()
  if not v25 then return end
  if IsPlotFloorOpen(v25, _laserIsUpper(inst)) and inst.Enabled then
  SaveLaserOriginal(inst)
  HideLaserObject(inst)
  elseif not IsPlotFloorOpen(v25, _laserIsUpper(inst)) and not inst.Enabled then
  RestoreLaserObject(inst)
  end
  end)
  end
end

function SetupPlotLaserMonitor(v25, v129)
  if not v25 then return end
  local v326 = v25:FindFirstChild("Laser")
  if not v326 then return end
  if _plotMonitorSetup[v25] then return end
  _plotMonitorSetup[v25] = true

  _plotLaserOpenState[v25] = tostring(IsPlotFloorOpen(v25, false)) .. tostring(IsPlotFloorOpen(v25, true))
  RefreshPlotLasers(v25)

  BindLaserState(v326, v25, v129)
  for idx, v24 in ipairs(v326:GetDescendants()) do
  BindLaserState(v24, v25, v129)
  end

  v129[#v129 + 1] = v326.DescendantAdded:Connect(function(inst)
  task.defer(function()
  BindLaserState(inst, v25, v129)
  end)
  end)

  local v71 = 0
  v129[#v129 + 1] = RunService.Heartbeat:Connect(function()
  v71 = v71 + 1
  if v71 % 6 ~= 0 then return end


  local v99 = tostring(IsPlotFloorOpen(v25, false)) .. tostring(IsPlotFloorOpen(v25, true))
  if v99 ~= _plotLaserOpenState[v25] then
  _plotLaserOpenState[v25] = v99
  RefreshPlotLasers(v25)
  end
  end)
end

function RefreshAllPlotLasers()
  local v156 = Workspace:FindFirstChild("Plots")
  if not v156 then return end
  for idx, v25 in ipairs(v156:GetChildren()) do
  RefreshPlotLasers(v25)
  end
end

function SetupPlotLaserWatch(v25, v129)
  if not v25 or _plotMonitorSetup[v25] then return end
  if v25:FindFirstChild("Laser") then
  SetupPlotLaserMonitor(v25, v129)
  return
  end
  v129[#v129 + 1] = v25.ChildAdded:Connect(function(v24)
  if v24.Name == "Laser" then
  SetupPlotLaserMonitor(v25, v129)
  end
  end)
end

function SetupAllPlotLaserMonitor(v129)
  local v156 = Workspace:FindFirstChild("Plots")
  if not v156 then return end
  for idx, v25 in ipairs(v156:GetChildren()) do
  SetupPlotLaserWatch(v25, v129)
  end
  if not _plotsFolderHooked then
  _plotsFolderHooked = true
  v129[#v129 + 1] = v156.ChildAdded:Connect(function(v25)
  task.wait(0.2)
  SetupPlotLaserWatch(v25, v129)
  end)
  end
end

_globalLaserConnections = {}
task.defer(function()
  local v156 = Workspace:WaitForChild("Plots", 30)
  if v156 then
  SetupAllPlotLaserMonitor(_globalLaserConnections)
  end
end)

_G.__laser = {
  IsLaserObject = IsLaserObject,
  UpdateLaserObject = UpdateLaserObject,
  SetupPlotLaserMonitor = SetupPlotLaserMonitor,
  SetupAllPlotLaserMonitor = SetupAllPlotLaserMonitor,
  RefreshPlotLasers = RefreshPlotLasers,
  RefreshAllPlotLasers = RefreshAllPlotLasers,
  GetPlotFromObject = GetPlotFromObject,
  IsPlotBaseOpen = IsPlotBaseOpen,
  SaveLaserOriginal = SaveLaserOriginal,
  HideLaserObject = HideLaserObject,
  RestoreLaserObject = RestoreLaserObject,
}
end)()

function IsProtected(inst)
  if not inst then return false end
  if _G.__laser and _G.__laser.IsLaserObject and _G.__laser.IsLaserObject(inst) then return true end
  local v30 = inst.Name
  if v30:find("DO_NOT_REMOVE") or v30:find("ForgeTextureCache") or v30 == "ChargeSoundPart"
  or v30 == "XiProxAPRing" then
  return true
  end
  v30 = v30:lower()


  if v30:find("door") or v30:find("gate") or v30:find("shield") or v30:find("barrier") or v30:find("fence") or v30:find("forcefield") or v30:find("wall") or v30:find("protect") or v30:find("tutorial") then
  return true
  end
  local v69 = inst.Parent
  while v69 and v69 ~= Workspace do
  local v89 = v69.Name
  if v89 == "CraftingMachine" or v89:find("Forge") or v89:find("Crafting") then return true end
  v89 = v89:lower()
  if v89:find("door") or v89:find("gate") or v89:find("shield") or v89:find("barrier") or v89:find("fence") or v89:find("forcefield") or v89:find("wall") or v89:find("protect") or v89:find("tutorial") then
  return true
  end
  v69 = v69.Parent
  end
  return false
end

fpsBoostConnection = nil
_fpsBoostLaserConnections = {}


OriginalTransparency = setmetatable({}, {__mode = "k"})
_ultraDescendantConn = nil
_ultraLightingConn = nil
_ultraMaterialConn = nil


do
xrayOriginalTransparencies = setmetatable({}, {__mode = "k"})
xrayConnections = {}
xrayLoopId = 0

function setXRayTargetTransparency(v210, v109, v97)
  if not v210 then return end
  if v97 and v97 ~= xrayLoopId then return end

  local function v535(inst)
  if _G.__laser.IsLaserObject(inst) then
  local v25 = _G.__laser.GetPlotFromObject(inst)
  if v25 and _G.__laser.IsPlotBaseOpen(v25) then
  _G.__laser.SaveLaserOriginal(inst)
  _G.__laser.HideLaserObject(inst)
  end
  return
  end
  if inst:IsA("BasePart") then
  if xrayOriginalTransparencies[inst] == nil then
  if inst.Transparency == v109 then xrayOriginalTransparencies[inst] = 0
  else xrayOriginalTransparencies[inst] = inst.Transparency end
  end
  local v64 = xrayOriginalTransparencies[inst]
  if v64 < 1 then
  local v169 = v64 + (1 - v64) * v109
  if math.abs(inst.Transparency - v169) > 0.01 then inst.Transparency = v169 end
  end
  elseif inst:IsA("TextLabel") or inst:IsA("TextButton") then
  if xrayOriginalTransparencies[inst] == nil then
  local tmpInst, v29 = inst.TextTransparency, inst.BackgroundTransparency
  if tmpInst == v109 then tmpInst = 0 end
  if v29 == v109 then v29 = 0 end
  xrayOriginalTransparencies[inst] = {text = tmpInst, bg = v29}
  end
  local v64 = xrayOriginalTransparencies[inst]
  if v64.text < 1 then
  local v1013 = v64.text + (1 - v64.text) * v109
  if math.abs(inst.TextTransparency - v1013) > 0.01 then inst.TextTransparency = v1013 end
  end
  if v64.bg < 1 then
  local v511 = v64.bg + (1 - v64.bg) * v109
  if math.abs(inst.BackgroundTransparency - v511) > 0.01 then inst.BackgroundTransparency = v511 end
  end
  elseif inst:IsA("Frame") or inst:IsA("ScrollingFrame") then
  if xrayOriginalTransparencies[inst] == nil then
  if inst.BackgroundTransparency == v109 then xrayOriginalTransparencies[inst] = 0
  else xrayOriginalTransparencies[inst] = inst.BackgroundTransparency end
  end
  local v64 = xrayOriginalTransparencies[inst]
  if v64 < 1 then
  local v169 = v64 + (1 - v64) * v109
  if math.abs(inst.BackgroundTransparency - v169) > 0.01 then inst.BackgroundTransparency = v169 end
  end
  elseif inst:IsA("ImageLabel") or inst:IsA("ImageButton") then
  if xrayOriginalTransparencies[inst] == nil then
  local v28, v29 = inst.ImageTransparency, inst.BackgroundTransparency
  if v28 == v109 then v28 = 0 end
  if v29 == v109 then v29 = 0 end
  xrayOriginalTransparencies[inst] = {img = v28, bg = v29}
  end
  local v64 = xrayOriginalTransparencies[inst]
  if v64.img < 1 then
  local v1007 = v64.img + (1 - v64.img) * v109
  if math.abs(inst.ImageTransparency - v1007) > 0.01 then inst.ImageTransparency = v1007 end
  end
  if v64.bg < 1 then
  local v511 = v64.bg + (1 - v64.bg) * v109
  if math.abs(inst.BackgroundTransparency - v511) > 0.01 then inst.BackgroundTransparency = v511 end
  end
  end
  end

  v535(v210)
  local v1105 = v210:GetDescendants()
  for v28, v24 in ipairs(v1105) do
  v535(v24)
  if v28 % 300 == 0 then
  task.wait()
  if v97 and v97 ~= xrayLoopId then return end
  end
  end
end

XRAY_FOLDERS = {"Base","PlotSign","FriendPanel","Cash","Decorations","Skin","Unlock","Purchases"}


function trackXRaySubtree(v78, v109, v97)
  if not v78 then return end
  if v97 ~= xrayLoopId then return end
  setXRayTargetTransparency(v78, v109, v97)
  if v97 ~= xrayLoopId then return end
  xrayConnections[#xrayConnections+1] = v78.DescendantAdded:Connect(function(inst)
  if v97 ~= xrayLoopId then return end
  setXRayTargetTransparency(inst, v109, v97)
  end)
end

function processPlotXRay(v25, v109, v97)
  if not v25 then return end
  if v97 ~= xrayLoopId then return end

  for idx, v687 in ipairs(XRAY_FOLDERS) do
  if v97 ~= xrayLoopId then return end
  trackXRaySubtree(v25:FindFirstChild(v687), v109, v97)
  end
  if v97 ~= xrayLoopId then return end

  if v97 ~= xrayLoopId then return end

  xrayConnections[#xrayConnections+1] = v25.ChildAdded:Connect(function(v24)
  if v97 ~= xrayLoopId then return end
  for idx, v687 in ipairs(XRAY_FOLDERS) do
  if v24.Name == v687 then trackXRaySubtree(v24, v109, v97); break end
  end
  end)

  local v643 = v25:FindFirstChild("AnimalPodiums")
  if v643 then
  local function v955(v110)
  for idx, v24 in ipairs(v110:GetChildren()) do
  if v24.Name == "Claim" then
  trackXRaySubtree(v24, v109, v97)
  elseif v24.Name == "Base" then
  trackXRaySubtree(v24:FindFirstChild("Decorations"), v109, v97)
  elseif v24:IsA("Model") and v24.Name ~= "Decorations" then
  trackXRaySubtree(v24, v109, v97)
  end
  end
  end
  for idx, v110 in ipairs(v643:GetChildren()) do v955(v110) end
  xrayConnections[#xrayConnections+1] = v643.ChildAdded:Connect(function(v110)
  if v97 ~= xrayLoopId then return end
  task.wait(0.1)
  if v97 ~= xrayLoopId then return end
  v955(v110)
  end)
  end
end

function applyTransparencyToAllPlotsXRay(v109, v97)
  local v156 = Workspace:FindFirstChild("Plots")
  if not v156 then return end

  for idx, v25 in ipairs(v156:GetChildren()) do
  if v97 ~= xrayLoopId then return end
  processPlotXRay(v25, v109, v97)
  task.wait()
  end

  xrayConnections[#xrayConnections+1] = v156.ChildAdded:Connect(function(v25)
  if v97 ~= xrayLoopId then return end
  task.wait(0.2)
  processPlotXRay(v25, v109, v97)
  end)
end

function setXRay(v130)
  Config.XRay = v130
  saveConfig()
  setToggle("XRay", v130)
  setToggle("X-Ray", v130)
  setToggle("Xray", v130)


  for idx, v208 in ipairs(xrayConnections) do
  if typeof(v208) == "RBXScriptConnection" then
  v208:Disconnect()
  end
  end
  xrayConnections = {}

  xrayLoopId = xrayLoopId + 1
  local v555 = xrayLoopId

  if v130 then
  local v109 = 0.5

  task.spawn(function()

  while v555 == xrayLoopId and not Workspace:FindFirstChild("Plots") do
  task.wait(0.5)
  end

  if v555 ~= xrayLoopId then return end


  if v555 ~= xrayLoopId then return end
  pcall(applyTransparencyToAllPlotsXRay, v109, v555)


  end)
  else


  local v1260 = xrayOriginalTransparencies
  xrayOriginalTransparencies = setmetatable({}, {__mode = "k"})
  for inst, v64 in pairs(v1260) do
  pcall(function()
  if inst:IsA("BasePart") then
  inst.Transparency = v64
  elseif inst:IsA("TextLabel") or inst:IsA("TextButton") then
  inst.TextTransparency = v64.text
  inst.BackgroundTransparency = v64.bg
  elseif inst:IsA("Frame") or inst:IsA("ScrollingFrame") then
  inst.BackgroundTransparency = v64
  elseif inst:IsA("ImageLabel") or inst:IsA("ImageButton") then
  inst.ImageTransparency = v64.img
  inst.BackgroundTransparency = v64.bg
  end
  end)
  end


  for v56, v55 in pairs(OriginalTransparency) do
  if v56 and v56.Parent and typeof(v55) == "table" then
  pcall(function() v56.Transparency = v55.trans end)
  end
  end
  if _G.__laser and _G.__laser.RefreshAllPlotLasers then
  pcall(_G.__laser.RefreshAllPlotLasers)
  end
  end
end

_G.setXRay = setXRay
end


SharedState.ANTI_BEE_DISCO = {
  running = false,
  connections = {},
  originalMoveFunction = nil,
  controlsProtected = false,
  badLightingNames = { Blue = true, DiscoEffect = true, BeeBlur = true, ColorCorrection = true },
}
SharedState.ANTI_BEE_DISCO.nuke = function(inst)
  if not inst or not inst.Parent then return end
  if SharedState.ANTI_BEE_DISCO.badLightingNames[inst.Name] then
  pcall(function() inst:Destroy() end)
  end
end
SharedState.ANTI_BEE_DISCO.disconnectAll = function()
  for idx, v208 in ipairs(SharedState.ANTI_BEE_DISCO.connections) do
  if typeof(v208) == "RBXScriptConnection" then v208:Disconnect() end
  end
  SharedState.ANTI_BEE_DISCO.connections = {}
end
SharedState.ANTI_BEE_DISCO.protectControls = function()
  if SharedState.ANTI_BEE_DISCO.controlsProtected then return end
  pcall(function()
  local v1051 = LocalPlayer.PlayerScripts
  local v344 = v1051:FindFirstChild("PlayerModule")
  if not v344 then return end
  local v17 = require(v344):GetControls()
  if not v17 then return end
  local v101 = SharedState.ANTI_BEE_DISCO
  if not v101.originalMoveFunction then v101.originalMoveFunction = v17.moveFunction end
  local function v733(self, v1189, v1241)
  if v101.originalMoveFunction then v101.originalMoveFunction(self, v1189, v1241) end
  end
  table.insert(v101.connections, RunService.Heartbeat:Connect(function()
  if not v101.running or not Config.AntiBeeDisco then return end
  if _G._isTpMoving then return end
  if v17.moveFunction ~= v733 then v17.moveFunction = v733 end
  end))
  v17.moveFunction = v733
  v101.controlsProtected = true
  end)
end
SharedState.ANTI_BEE_DISCO.restoreControls = function()
  if not SharedState.ANTI_BEE_DISCO.controlsProtected then return end
  pcall(function()
  local v344 = LocalPlayer.PlayerScripts:FindFirstChild("PlayerModule")
  if not v344 then return end
  local v17 = require(v344):GetControls()
  local v101 = SharedState.ANTI_BEE_DISCO
  if v17 and v101.originalMoveFunction then
  v17.moveFunction = v101.originalMoveFunction
  v101.controlsProtected = false
  end
  end)
end
SharedState.ANTI_BEE_DISCO.blockBuzzingSound = function()
  pcall(function()
  local v834 = LocalPlayer.PlayerScripts:FindFirstChild("Bee", true)
  if v834 then
  local v151 = v834:FindFirstChild("Buzzing")
  if v151 and v151:IsA("Sound") then
  v151:Stop()
  v151.Volume = 0
  end
  end
  end)
end
SharedState.ANTI_BEE_DISCO.Enable = function()
  local v101 = SharedState.ANTI_BEE_DISCO
  if v101.running then return end
  v101.running = true
  for idx, v45 in ipairs(Lighting:GetDescendants()) do v101.nuke(v45) end
  table.insert(v101.connections, Lighting.DescendantAdded:Connect(function(inst)
  if not v101.running or not Config.AntiBeeDisco then return end
  v101.nuke(inst)
  end))
  v101.protectControls()
  table.insert(v101.connections, RunService.Heartbeat:Connect(function()
  if not v101.running or not Config.AntiBeeDisco then return end
  v101.blockBuzzingSound()
  end))
end
SharedState.ANTI_BEE_DISCO.Disable = function()
  local v101 = SharedState.ANTI_BEE_DISCO
  if not v101.running then return end
  v101.running = false
  v101.restoreControls()
  v101.disconnectAll()
end
_G.ANTI_BEE_DISCO = SharedState.ANTI_BEE_DISCO
if Config.AntiBeeDisco then
  task.delay(1, function()
  if SharedState.ANTI_BEE_DISCO.Enable then SharedState.ANTI_BEE_DISCO.Enable() end
  end)
end


do
autoBuyActive = false
autoBuyRing = nil

function createAutoBuyRing() end
function destroyAutoBuyRing() end

toggleAutoBuy = function(v38)
  if v38 ~= nil then
  autoBuyActive = v38
  else
  autoBuyActive = not autoBuyActive
  end
  Config.AutoBuyEnabled = autoBuyActive
  pcall(saveConfig)
  pcall(setToggle, "Auto Buy", autoBuyActive)

  if _G.AutoBuyOnToggle then
  pcall(_G.AutoBuyOnToggle, autoBuyActive)
  end
end

RARITY_WORDS = {
  common = true, uncommon = true, rare = true, epic = true,
  legendary = true, secret = true, divine = true, rainbow = true,
  cursed = true, gold = true, diamond = true,
}

function getBrainrotName(v65)
  if not v65 then return "Brainrot", "" end
  local v371, v566 = "", ""
  for idx, v42 in ipairs(v65:GetDescendants()) do
  if v42:IsA("BillboardGui") then
  for idx, v37 in ipairs(v42:GetDescendants()) do
  if v37:IsA("TextLabel") and v37.Text and v37.Text ~= "" then
  local tmpInst = v37.Text:match("^%s*(.-)%s*$")
  local v609 = tmpInst:lower()
  if RARITY_WORDS[v609] then continue end
  if tmpInst:match("^%$[%d%.]+[KkMmBb]?/s$") then
  if v566 == "" then v566 = tmpInst end
  continue
  end
  if tmpInst:match("^%$[%d%.]+[KkMmBb]?$") then continue end
  if tmpInst:match("^[%d%.]+[KkMmBb]?$") then continue end
  if v371 == "" and #tmpInst > 1 then v371 = tmpInst end
  end
  end
  end
  end
  if v371 == "" then
  pcall(function()
  local v93 = AnimalsData[v65.Name]
  if v93 and v93.DisplayName then
  v371 = v93.DisplayName
  local v470 = AnimalsShared:GetGeneration(v65.Name, nil, nil, nil)
  local v696 = "$" .. NumberUtils:ToString(v470) .. "/s"
  v566 = v696
  end
  end)
  end
  if v371 == "" then v371 = v65.Name ~= "" and v65.Name or "Brainrot" end
  return v371, v566
end


function scanConveyor()
  local v977 = {}
  for idx, inst in ipairs(Workspace:GetDescendants()) do
  if not (inst:IsA("ProximityPrompt") and inst.Enabled) then continue end
  local v95 = inst.ActionText or ""
  if not (v95 == "Purchase" or v95:lower():find("purchase") or v95:lower():find("comprar")) then continue end
  local v56 = inst.Parent
  if not v56 then continue end
  local v586 = (v56:IsA("Attachment") and v56.Parent) or v56
  if not (v586 and v586:IsA("BasePart")) then continue end
  local v65, v408 = nil, v586
  for idx = 1, 8 do
  if v408 and v408:IsA("Model") then v65 = v408; break end
  v408 = v408 and v408.Parent
  end
  local v30, v1136 = getBrainrotName(v65)
  table.insert(v977, {
  name = v30,
  gen = v1136,
  prompt = inst,
  part = v586,
  model = v65,
  source = "ESTEIRA",
  uid = "esteira_" .. tostring(inst),
  })
  end
  return v977
end

SharedState.ConveyorAnimals = {}
function refreshConveyor()
  local ok, v465 = pcall(scanConveyor)
  if ok and v465 then
  SharedState.ConveyorAnimals = v465
  end
end
task.spawn(function()
  task.wait(3)
  refreshConveyor()
end)
_G.refreshConveyor = refreshConveyor

purchaseRemote = nil
function resolvePurchaseRemote()
  if purchaseRemote and purchaseRemote.Parent then return purchaseRemote end
  pcall(function()
  local v581 = {"RF/ShopService/BuyAnimal", "RF/AnimalShop/Purchase", "RE/Shop/Buy", "RF/Shop/Buy"}
  for idx, v23 in ipairs(v581) do
  local v373, v83 = pcall(function() return Decrypted[v23] end)
  if v373 and v83 and v83.Parent then
  purchaseRemote = v83
  return
  end
  end
  end)
  return purchaseRemote
end


function firePurchaseSafe(v44)
  if not v44 or not v44.Parent or not v44.Enabled then return false end

  if fireproximityprompt then
  local ok = pcall(function() fireproximityprompt(v44) end)
  if ok then return true end
  end

  local v497 = resolvePurchaseRemote()
  if v497 then
  pcall(function()
  if v497:IsA("RemoteFunction") then
  v497:InvokeServer(v44.Parent)
  elseif v497:IsA("RemoteEvent") then
  v497:FireServer(v44.Parent)
  end
  end)
  return true
  end

  return false
end

carpetLockConn = nil
function startCarpetLock()
  if carpetLockConn then carpetLockConn:Disconnect(); carpetLockConn = nil end
  local function v868()
  pcall(function()
  local character = LocalPlayer.Character
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if not v35 then return end
  local v389 = (Config.TpSettings and Config.TpSettings.Tool) or "Flying Carpet"
  if not character:FindFirstChild(v389) then
  local v158 = LocalPlayer.Backpack:FindFirstChild(v389)
  if v158 then v35:EquipTool(v158) end
  end
  end)
  end
  task.spawn(function()
  for idx = 1, 15 do
  if not autoBuyActive then break end
  v868()
  task.wait(0.3)
  local character = LocalPlayer.Character
  local v389 = (Config.TpSettings and Config.TpSettings.Tool) or "Flying Carpet"
  if character and character:FindFirstChild(v389) then break end
  end
  end)
  carpetLockConn = RunService.Heartbeat:Connect(function()
  if not autoBuyActive then return end
  v868()
  end)
end

function stopCarpetLock()
  if carpetLockConn then carpetLockConn:Disconnect(); carpetLockConn = nil end
end

HOVER_HEIGHT = 5
BUY_INTERVAL = 0.08
DETECT_RADIUS = 17
local v1319 = false
lockedTarget = nil
lockedPart = nil
lockedModel = nil

function partAlive()
  return lockedPart and lockedPart.Parent and lockedModel and lockedModel.Parent
end

function promptAlive()
  return lockedTarget and lockedTarget.prompt and lockedTarget.prompt.Parent and lockedTarget.prompt.Enabled
end

bodyPos = nil
function ensureBodyPos(v22)
  if bodyPos and bodyPos.Parent == v22 then
  local v507 = math.clamp(Config.AutoGrabSpeed or 17, 5, 100)
  bodyPos.P = v507 * 1000
  return bodyPos
  end
  if bodyPos then bodyPos:Destroy() end
  local v507 = math.clamp(Config.AutoGrabSpeed or 17, 5, 100)
  local v194 = Instance.new("BodyPosition", v22)
  v194.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
  v194.P = v507 * 1000
  v194.D = 1000
  v194.Position = v22.Position
  bodyPos = v194
  return v194
end

function destroyBodyPos()
  if bodyPos then bodyPos:Destroy(); bodyPos = nil end
end

RunService.Heartbeat:Connect(function()
  if not autoBuyActive or not partAlive() then
  destroyBodyPos()
  return
  end
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then destroyBodyPos(); return end
  local v1068 = lockedPart.Position + Vector3.new(0, HOVER_HEIGHT, 0)
  local v194 = ensureBodyPos(v22)
  v194.Position = v1068
end)


task.spawn(function()
  while true do
  task.wait()
  if not autoBuyActive then continue end
  if not partAlive() or not promptAlive() then continue end


  pcall(function()
  firePurchaseSafe(lockedTarget.prompt)
  end)
  end
end)

task.spawn(function()
  while true do
  task.wait(0.25)
  if not autoBuyActive then
  lockedTarget = nil
  lockedPart = nil
  lockedModel = nil
  stopCarpetLock()
  destroyBodyPos()
  continue
  end
  if lockedPart or lockedModel then
  if not partAlive() then
  pcall(refreshConveyor)
  lockedTarget = nil
  lockedPart = nil
  lockedModel = nil
  end
  continue
  end
  pcall(refreshConveyor)
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then continue end
  local v1247 = Config.AutoBuyRange or DETECT_RADIUS
  local v138, v124 = nil, math.huge
  for idx, v41 in ipairs(SharedState.ConveyorAnimals) do
  if v41.prompt and v41.prompt.Parent and v41.prompt.Enabled and v41.part and v41.part.Parent then
  local v33 = (v22.Position - v41.part.Position).Magnitude
  if v33 <= v1247 and v33 < v124 then
  v124 = v33
  v138 = v41
  end
  end
  end
  if v138 then
  lockedTarget = v138
  lockedPart = v138.part
  lockedModel = v138.model or v138.part.Parent
  startCarpetLock()
  end
  end
end)

_G.AutoBuyOnToggle = function(v400)
  if v400 then
  if _G.refreshConveyor then pcall(_G.refreshConveyor) end
  startCarpetLock()
  else
  stopCarpetLock()
  destroyBodyPos()
  end
end
end


function hasExclamation(v169)
  for idx, v33 in ipairs(v169:GetDescendants()) do
  if v33:IsA("BillboardGui") then

  for idx, v36 in ipairs(v33:GetDescendants()) do
  if (v36:IsA("TextLabel") or v36:IsA("TextBox")) and tostring(v36.Text):find("!") then return true end
  end
  end
  end
  return false
end

do
  local v603, v918 = {}, 0
  local v753 = false
  local function v1126(character)
  local function v968(v456)
  if not v456 then return nil end
  for idx, tmpInst in ipairs(v456:GetChildren()) do
  if tmpInst:IsA("Tool") and tmpInst.Name:lower():find("bat", 1, true) then return tmpInst end
  end
  end
  return v968(character) or v968(player:FindFirstChild("Backpack"))
  end
  task.spawn(function()
  while true do task.wait(0.1)


  if Config.AutoDestroyTurrets and LocalPlayer:GetAttribute("Stealing") ~= true
  and not _G._isTpMoving then
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if v22 and v35 and v35.Health > 0 then


  local v60 = os.clock()
  if v60 - v918 > 1 then
  v918 = v60
  v603 = {}
  for v28, v45 in ipairs(Workspace:GetDescendants()) do
  if v45.Name:match("^Sentry_") then v603[#v603 + 1] = v45 end
  if v28 % 300 == 0 then task.wait() end
  end
  end


  local v198, v980 = nil, math.huge
  local v853, v979 = nil, math.huge
  for idx, v45 in ipairs(v603) do
  if v45.Parent then
  local v78 = v45:IsA("BasePart") and v45 or v45:FindFirstChildWhichIsA("BasePart", true)
  if v78 then
  local v92 = (v22.Position - v78.Position).Magnitude
  if hasExclamation(v45) then
  if v92 < v980 then v980 = v92; v198 = v45 end
  else
  if v92 < v979 then v979 = v92; v853 = v45 end
  end
  end
  end
  end
  if not v198 then v198 = v853 end
  if v198 and not v753 then
  v753 = true
  task.spawn(function()
  pcall(function()

  for idx, v33 in ipairs(v198:GetDescendants()) do
  if v33:IsA("BasePart") then v33.Transparency = 0.5; v33.CanCollide = false end
  end
  local v1006 = CFrame.new(v22.Position + v22.CFrame.LookVector * 4, v22.Position)
  if v198:IsA("Model") then v198:PivotTo(v1006)
  elseif v198:IsA("BasePart") then v198.CFrame = v1006 end
  local v351 = v1126(character)
  if v351 then
  if v351.Parent ~= character then


  local v387 = os.clock()
  while v351.Parent ~= character and os.clock() - v387 < 1 do
  pcall(function() v35:EquipTool(v351) end)
  task.wait(0.08)
  end
  end


  for idx = 1, 4 do
  if not (v198 and v198.Parent) then break end
  if v351.Parent ~= character then pcall(function() v35:EquipTool(v351) end) end
  pcall(function() v351:Activate() end)
  task.wait(0.12)
  end
  end
  end)
  v753 = false
  end)
  end
  end
  end
  end
  end)
end


main,mainBody,tabBar,sidebarNav,sidebarProfile,bottomBar,fpsText = nil,nil,nil,nil,nil,nil,nil
panels,panelSetters,tabButtons={},{},{}
actionSettingsPanel,actionSettingsBody,tpSpeedSettingsPanel,tpSpeedSettingsBody = nil,nil,nil,nil
BoundToggles={}

stealProgressBarGui = nil


_G.ShowStealProgressBar = function(v313, v1120)
  local v57 = (gethui and gethui()) or game:GetService("CoreGui")

  if stealProgressBarGui then
  pcall(function() stealProgressBarGui:Destroy() end)
  end

  local v98 = Instance.new("ScreenGui")
  v98.Name = "CLTHUB_StealProgressBar"
  v98.ResetOnSpawn = false
  v98.Parent = v57
  stealProgressBarGui = v98

  local v832 = 270
  local v1087 = 50

  local v85 = Instance.new("Frame")
  v85.Size = UDim2.fromOffset(v832, v1087)
  v85.Position = UDim2.new(0.5, -v832/2, 1, -190)
  v85.BackgroundColor3 = Theme.Background
  v85.BackgroundTransparency = UITransparency.Progress
  v85.BorderSizePixel = 0
  v85.Parent = registerScreenGui(v98)
  corner(v85, 12)
  addOutline(v85)

  local v310 = Instance.new("TextLabel")
  v310.Size = UDim2.new(0.6, -14, 0, 16)
  v310.Position = UDim2.new(0, 14, 0, 8)
  v310.BackgroundTransparency = 1
  v310.Text = "⚡ STEALING: " .. (v313 or "Brainrot"):upper()
  v310.TextColor3 = Theme.Text
  v310.Font = Enum.Font.GothamBold
  v310.TextSize = 9.5
  v310.TextXAlignment = Enum.TextXAlignment.Left
  v310.Parent = v85

  local v283 = Instance.new("TextLabel")
  v283.Size = UDim2.new(0.4, -14, 0, 16)
  v283.Position = UDim2.new(0.6, 0, 0, 8)
  v283.BackgroundTransparency = 1
  v283.Text = "0%"
  v283.TextColor3 = Theme.Text
  v283.Font = Enum.Font.GothamBold
  v283.TextSize = 10
  v283.TextXAlignment = Enum.TextXAlignment.Right
  v283.Parent = v85

  local v137 = Instance.new("Frame")
  v137.Size = UDim2.new(1, -28, 0, 6)
  v137.Position = UDim2.new(0, 14, 0, 30)
  v137.BackgroundColor3 = Theme.SliderBg
  v137.BorderSizePixel = 0
  v137.Parent = v85
  corner(v137, 3)
  stroke(v137, Theme.Stroke, 1, 0.1)

  local v178 = Instance.new("Frame")
  v178.Size = UDim2.new(0, 0, 1, 0)
  v178.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  v178.BorderSizePixel = 0
  v178.Parent = v137
  corner(v178, 3)

  local v1125 = Instance.new("UIGradient", v178)
  v1125.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 208)),
  })

  local v738 = tonumber(v1120) or 5
  if v738 <= 0.01 then v738 = 5 end
  local v1269 = tick()

  task.spawn(function()
  while v98 and v98.Parent do
  local v461 = tick() - v1269
  local tmpInst = math.clamp(v461 / v738, 0, 1)
  local v958 = 1 - (1 - tmpInst)^3

  pcall(function()
  v283.Text = math.floor(v958 * 100) .. "%"
  v178.Size = UDim2.new(v958, 0, 1, 0)
  end)

  if tmpInst >= 1 then break end
  task.wait()
  end
  end)
end

_G.HideStealProgressBar = function()
  local v762 = stealProgressBarGui
  if v762 then
  stealProgressBarGui = nil
  pcall(function()
  local v85 = v762:FindFirstChildWhichIsA("Frame")
  if v85 then
  tw(v85, {BackgroundTransparency = 1}, 0.15)
  for idx, v24 in ipairs(v85:GetDescendants()) do
  if v24:IsA("TextLabel") then
  tw(v24, {TextTransparency = 1}, 0.15)
  elseif v24:IsA("Frame") then
  tw(v24, {BackgroundTransparency = 1}, 0.15)
  elseif v24:IsA("UIStroke") then
  tw(v24, {Transparency = 1}, 0.15)
  end
  end
  task.wait(0.16)
  end
  v762:Destroy()
  end)
  end
end


UICornerMult = UICornerMult or 1.6
UIActiveColor = Color3.fromRGB(56, 214, 110)
corner = function(v146,v83) local v34=Instance.new("UICorner"); v34.CornerRadius=UDim.new(0, math.max(2, math.floor((v83 or 6) * UICornerMult))); v34.Parent=v146; return v34 end
stroke = function(v146,v454,v1271,v768) local v84=Instance.new("UIStroke"); v84.Color=v454 or Theme.Stroke; v84.Thickness=v1271 or 1; v84.Transparency=v768 or 0.62; v84.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; v84.Parent=v146; return v84 end
tw = function(v146,v23,tmpInst) TweenService:Create(v146,TweenInfo.new(tmpInst or 0.14,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),v23):Play() end
addOutline = function(v49) local v146=Instance.new("UIStroke"); v146.Color=Theme.Accent; v146.Thickness=1; v146.Transparency=0.32; v146.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; v146.Parent=v49; return v146 end
function clearBody(v77) for idx,v34 in ipairs(v77:GetChildren()) do if not v34:IsA("UIListLayout") and not v34:IsA("UIPadding") then v34:Destroy() end end end

function openAnim(v49) if not v49 then return end; local v618=v49:FindFirstChild("CLTHUBScale") or Instance.new("UIScale"); v618.Name="CLTHUBScale"; v618.Parent=v49
  if not Config.PanelScales then Config.PanelScales={} end
  local v1012 = Config.PanelScales[v49.Name] or 1
  local v509=v49.Position; v49.Visible=true; v618.Scale=v1012*0.92; v49.Position=UDim2.new(v509.X.Scale,v509.X.Offset,v509.Y.Scale,v509.Y.Offset+18); tw(v618,{Scale=v1012},0.20); tw(v49,{Position=v509},0.20) end
function closeAnim(v49) if not v49 then return end; v49.Visible = false end

makeDraggable = function(v71, v86, v1249)
  local v74, v464, v508 = false, nil, nil


  local v236 = v1249 or v71:GetAttribute("CLTHUBPositionKey")
  if not v236 or v236 == "" then
  v236 = "UI_" .. tostring(v71.Name)
  end
  v236 = tostring(v236)

  pcall(function()
  v71:SetAttribute("CLTHUBDraggable", true)
  v71:SetAttribute("CLTHUBPositionKey", v236)
  end)


  pcall(function() applySavedPosition(v236, v71) end)

  v86.InputBegan:Connect(function(v28)
  if UI.Locked then return end
  if v28.UserInputType == Enum.UserInputType.MouseButton1 or v28.UserInputType == Enum.UserInputType.Touch then
  v74 = true
  v464 = v28.Position
  v508 = v71.Position
  end
  end)

  UIS.InputEnded:Connect(function(v28)
  if v28.UserInputType == Enum.UserInputType.MouseButton1 or v28.UserInputType == Enum.UserInputType.Touch then
  if v74 then
  rememberPosition(v236, v71)
  end
  v74 = false
  end
  end)

  UIS.InputChanged:Connect(function(v28)
  if v74 and not UI.Locked and (v28.UserInputType == Enum.UserInputType.MouseMovement or v28.UserInputType == Enum.UserInputType.Touch) then
  local v33 = v28.Position - v464
  local v261 = getGlobalScale()
  v71.Position = UDim2.new(
  v508.X.Scale,
  v508.X.Offset + (v33.X / v261),
  v508.Y.Scale,
  v508.Y.Offset + (v33.Y / v261)
  )
  rememberPosition(v236, v71)
  end
  end)
end

makeResizable = function(v71, v928, v214)
  local v52 = Instance.new("TextButton")
  v52.Name = "ResizeGrip"
  v52.Size = UDim2.new(0, 16, 0, 16)
  v52.Position = UDim2.new(1, -16, 1, -16)
  v52.BackgroundTransparency = 1
  v52.Text = "◢"
  v52.TextColor3 = Theme.Dim or Color3.new(1, 1, 1)
  v52.TextSize = 12
  v52.ZIndex = 100
  v52.Visible = not UI.Locked
  v52.Parent = v71
  _G.__CLTHUBGrips = _G.__CLTHUBGrips or {}
  table.insert(_G.__CLTHUBGrips, v52)
  local v74, v464, v309 = false, nil, nil
  v52.InputBegan:Connect(function(v28)
  if UI.Locked then return end
  if v28.UserInputType == Enum.UserInputType.MouseButton1 or v28.UserInputType == Enum.UserInputType.Touch then
  v74 = true; v464 = v28.Position; v309 = v71.AbsoluteSize
  end
  end)
  UIS.InputEnded:Connect(function(v28)
  if v28.UserInputType == Enum.UserInputType.MouseButton1 or v28.UserInputType == Enum.UserInputType.Touch then
  if v74 then
  v74 = false
  if v214 then
  if not Config.sizes then Config.sizes = {} end
  Config.sizes[v214] = {x = v71.Size.X.Offset, y = v71.Size.Y.Offset}
  saveConfig()
  end
  end
  end
  end)
  UIS.InputChanged:Connect(function(v28)
  if v74 and not UI.Locked and (v28.UserInputType == Enum.UserInputType.MouseMovement or v28.UserInputType == Enum.UserInputType.Touch) then
  local v33 = v28.Position - v464
  local v261 = getGlobalScale()
  local v1214 = math.max(v928.X.Offset, v309.X + (v33.X / v261))
  local v1215 = math.max(v928.Y.Offset, v309.Y + (v33.Y / v261))
  v71.Size = UDim2.new(0, v1214, 0, v1215)
  end
  end)
end

function createPanelSectionBanner(v69, v100)
  return nil
end

function makeHeader(v49,tmpInst,v701) local v52=Instance.new("Frame"); v52.Name="PanelHeader"; v52.Size=UDim2.new(1,0,0,42); v52.BackgroundColor3=Theme.Panel; v52.BackgroundTransparency=0.18; v52.BorderSizePixel=0; v52.Parent=v49
  local v258={}; for v84 in string.gmatch(tmpInst,"([^\n]+)") do table.insert(v258,v84) end
  if v701 then local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-50,0,24); v36.Position=UDim2.new(0,13,0,8); v36.BackgroundTransparency=1; v36.Text=v258[1] or "CLTHUB"; v36.TextColor3=Theme.Text; v36.Font=UIFont.Title; v36.TextSize=16; v36.TextXAlignment=Enum.TextXAlignment.Left; v36.Parent=v52
  else
  local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-24,0,24); v36.Position=UDim2.new(0,12,0,8); v36.BackgroundTransparency=1; v36.Text="CLTHUB"; v36.TextColor3=Theme.Text; v36.Font=Enum.Font.GothamBlack; v36.TextSize=14; v36.TextXAlignment=Enum.TextXAlignment.Center; v36.Parent=v52
  end
  local v33=Instance.new("Frame"); v33.Name="HeaderDivider"; v33.Size=UDim2.new(1,-24,0,1); v33.Position=UDim2.new(0,12,0,40); v33.BackgroundColor3=Theme.Accent or Color3.fromRGB(0, 85, 255); v33.BackgroundTransparency=0.4; v33.BorderSizePixel=0; v33.Parent=v49
  local v262 = Instance.new("UIGradient"); v262.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Theme.Accent or Color3.fromRGB(0, 85, 255)), ColorSequenceKeypoint.new(1, Theme.Accent or Color3.fromRGB(0, 85, 255))}; v262.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}; v262.Parent = v33
  makeDraggable(v49,v52,tmpInst); return v52 end

function makeMainPanel(tmpInst,v602,v59)
  local v49=Instance.new("Frame"); v49.Size=UDim2.new(0,340,0,500); v49.Position=v59; v49.BackgroundColor3=Theme.MainBackground; v49.BackgroundTransparency=UITransparency.MainPanel; v49.BorderSizePixel=0; v49.ClipsDescendants=true; v49.Parent=gui; corner(v49,6); addOutline(v49)
  local v52=Instance.new("Frame"); v52.Name="Header"; v52.Size=UDim2.new(1,0,0,42); v52.BackgroundColor3=Theme.Panel; v52.BackgroundTransparency=0.18; v52.BorderSizePixel=0; v52.Parent=v49
  local v1275={}; for v84 in string.gmatch(tmpInst or "CLTHUB","([^\n]+)") do table.insert(v1275,v84) end
  local v37=Instance.new("TextLabel"); v37.Name="SidebarTitle"; v37.Size=UDim2.new(1,-24,1,0); v37.Position=UDim2.new(0,12,0,0); v37.BackgroundTransparency=1; v37.Text="CLTHUB"; v37.TextColor3=Theme.Text; v37.Font=Enum.Font.GothamBlack; v37.TextSize=14; v37.TextXAlignment=Enum.TextXAlignment.Center; v37.TextYAlignment=Enum.TextYAlignment.Center; v37.Parent=v52
  local v33=Instance.new("Frame"); v33.Name="HeaderDivider"; v33.Size=UDim2.new(1,-24,0,1); v33.Position=UDim2.new(0,12,0,40); v33.BackgroundColor3=Theme.Accent or Color3.fromRGB(0, 85, 255); v33.BackgroundTransparency=0.4; v33.BorderSizePixel=0; v33.Parent=v49
  local v262 = Instance.new("UIGradient"); v262.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Theme.Accent or Color3.fromRGB(0, 85, 255)), ColorSequenceKeypoint.new(1, Theme.Accent or Color3.fromRGB(0, 85, 255))}; v262.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}; v262.Parent = v33

  local v77=Instance.new("ScrollingFrame"); v77.Size=UDim2.new(1,-12,1,-48); v77.Position=UDim2.new(0,6,0,42); v77.BackgroundTransparency=1; v77.BorderSizePixel=0; v77.ScrollBarThickness=2; v77.ScrollBarImageColor3=Theme.Stroke; v77.ScrollBarImageTransparency=0.35; v77.CanvasSize=UDim2.new(0,0,0,0); v77.Active=true; v77.Parent=v49
  local v184=Instance.new("UIPadding"); v184.PaddingTop=UDim.new(0,2); v184.PaddingBottom=UDim.new(0,10); v184.PaddingLeft=UDim.new(0,2); v184.PaddingRight=UDim.new(0,2); v184.Parent=v77
  local v279=Instance.new("UIListLayout"); v279.Padding=UDim.new(0,8); v279.Parent=v77
  v279:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() v77.CanvasSize=UDim2.new(0,0,0,v279.AbsoluteContentSize.Y+16) end)

  if Config.sizes and Config.sizes[tmpInst] then v49.Size=UDim2.new(0,Config.sizes[tmpInst].x,0,Config.sizes[tmpInst].y) end
  makeDraggable(v49,v52,tmpInst); makeResizable(v49,UDim2.new(0,300,0,300),tmpInst); addResizeHandle(v49, 300, 300, 900, 800);


  tabBar = Instance.new("Frame")

  return v49,v77
end

function makeQuickPanel(tmpInst,v602,v59,v720)
  local v49=Instance.new("Frame"); v49.Size=v602; v49.Position=v59; v49.BackgroundColor3=Theme.Background; v49.BackgroundTransparency=UITransparency.Panel; v49.BorderSizePixel=0; v49.ClipsDescendants=true; v49.Parent=gui; corner(v49,6); addOutline(v49);
  if not v720 then makeHeader(v49,tmpInst,false) end
  local v258 = {}
  for v84 in string.gmatch(tmpInst or "", "([^\n]+)") do table.insert(v258, v84) end
  local v1313 = v258[2] or (v258[1] ~= "CLTHUB" and v258[1] or nil)

  local v1085 = v720 and 6 or 46
  local v1084 = v720 and -12 or -50


  local v77=Instance.new("ScrollingFrame"); v77.Name="PanelBody"; v77.Size=UDim2.new(1,-12,1,v1084); v77.Position=UDim2.new(0,6,0,v1085); v77.BackgroundTransparency=1; v77.BorderSizePixel=0; v77.ScrollBarThickness=2; v77.ScrollBarImageColor3=Theme.Stroke; v77.ScrollBarImageTransparency=0.4; v77.CanvasSize=UDim2.new(0,0,0,0); v77.Active=true; v77.Parent=v49
  local v184=Instance.new("UIPadding", v77); v184.PaddingTop=UDim.new(0,4); v184.PaddingBottom=UDim.new(0,4); v184.PaddingLeft=UDim.new(0,2); v184.PaddingRight=UDim.new(0,2)
  local v279=Instance.new("UIListLayout"); v279.Padding=UDim.new(0,6); v279.SortOrder=Enum.SortOrder.LayoutOrder; v279.Parent=v77
  v279:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() v77.CanvasSize=UDim2.new(0,0,0,v279.AbsoluteContentSize.Y+16) end);

  if Config.sizes and Config.sizes[tmpInst] then v49.Size = UDim2.new(0, Config.sizes[tmpInst].x, 0, Config.sizes[tmpInst].y) end
  if not string.find(tmpInst, "Admin Command Painel") then makeResizable(v49, UDim2.new(0, 150, 0, 150), tmpInst) end

  return v49,v77 end

function makeSyncStateRow(v69,v100,v170,v79)
  regToggle(v170,getToggle(v170))

  local v41 = Instance.new("TextButton")
  v41.Name = v170
  v41.Text = v100
  v41.Font = Enum.Font.GothamBold
  v41.TextSize = 12
  v41.AutoButtonColor = false
  v41.Size = UDim2.new(1, -4, 0, 32)
  v41.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v41.BackgroundTransparency = 0.5
  v41.Parent = v69
  corner(v41, 4)
  local v215 = addOutline(v41)

  local function v334(v66)
  v41.TextColor3 = v66 and UIActiveColor or Theme.Text
  v215.Color = v66 and UIActiveColor or Theme.Accent
  v215.Transparency = v66 and 0.2 or 0.32
  end

  v334(getToggle(v170))
  onToggleChanged(v170, function(v66) v334(v66) end)

  v41.Activated:Connect(function()
  local v488 = not getToggle(v170)
  setToggle(v170, v488)
  if v79 then v79(v488) end
  end)

  return function(v233, v366)
  if typeof(v233) == "boolean" then
  setToggle(v170, v233)
  if v366 ~= false and v79 then v79(v233) end
  end
  end, v41
end

function makeSyncMainToggle(v69,v100,v170,v79)
  regToggle(v170,getToggle(v170))

  local v41 = Instance.new("TextButton")
  v41.Name = v170
  v41.Text = v100
  v41.Font = UIFont.Label
  v41.TextSize = 12
  v41.AutoButtonColor = false
  v41.Size = UDim2.new(1, -4, 0, 32)
  v41.BackgroundColor3 = Theme.ToggleOff
  v41.TextColor3 = Theme.Text
  v41.Parent = v69
  corner(v41, 6)
  local v215 = addOutline(v41)

  local function v334(v66)
  tw(v41, {BackgroundColor3 = Theme.ToggleOff, TextColor3 = v66 and UIActiveColor or Theme.Text}, 0.12)
  v215.Color = v66 and UIActiveColor or Theme.Accent
  v215.Transparency = v66 and 0.2 or 0.32
  end

  v334(getToggle(v170))
  onToggleChanged(v170, function(v66) v334(v66) end)

  v41.Activated:Connect(function()
  local v488 = not getToggle(v170)
  setToggle(v170, v488)
  if v79 then v79(v488) end
  end)

  BoundToggles[v100] = function(v233, v366)
  if typeof(v233) == "boolean" then
  setToggle(v170, v233)
  if v366 ~= false and v79 then v79(v233) end
  end
  end
  return BoundToggles[v100]
end

function makeQuickButton(v69,v100,v79,v1082)
  local v29=Instance.new("TextButton")
  v29.Size=UDim2.new(1,-4,0,36)
  v29.BackgroundColor3=v1082 or Color3.fromRGB(0,0,0)
  v29.BackgroundTransparency=0.5
  v29.BorderSizePixel=0
  v29.Text=v100
  v29.TextColor3=Color3.fromRGB(255,255,255)
  v29.Font=Enum.Font.GothamBold
  v29.TextSize=11
  v29.AutoButtonColor=false
  v29.Parent=v69
  corner(v29,6)
  addOutline(v29)
  v29.MouseEnter:Connect(function() TweenService:Create(v29,TweenInfo.new(0.12),{BackgroundTransparency=0.3}):Play() end)
  v29.MouseLeave:Connect(function() TweenService:Create(v29,TweenInfo.new(0.12),{BackgroundTransparency=0.5}):Play() end)
  v29.MouseButton1Click:Connect(function() if v79 then v79() end end)
  return v29
end

function makeQuickSlider(v69,v100,v256,v421,v358,v79,v235,v263) local v143=Instance.new("Frame"); v143.Size=UDim2.new(1,-4,0,54); v143.BackgroundTransparency=1; v143.Parent=v69
  local v81=Instance.new("TextLabel"); v81.Size=UDim2.new(1,0,0,18); v81.Position=UDim2.new(0,2,0,0); v81.BackgroundTransparency=1; v81.Text=v100..": "..string.format("%g", v358)..(v235 or ""); v81.TextColor3=Theme.Text; v81.Font=UIFont.Body; v81.TextSize=12; v81.TextXAlignment=Enum.TextXAlignment.Left; v81.Parent=v143
  local v242=Instance.new("Frame"); v242.Size=UDim2.new(1,-8,0,4); v242.Position=UDim2.new(0,2,0,32); v242.BackgroundColor3=Theme.SliderBg or Color3.fromRGB(46,52,63); v242.BackgroundTransparency=0.25; v242.BorderSizePixel=0; v242.Parent=v143; corner(v242,6)
  local v178=Instance.new("Frame"); v178.Size=UDim2.new(math.clamp((v358-v256)/(v421-v256),0,1),0,1,0); v178.BackgroundColor3=Color3.fromRGB(0, 85, 255); v178.BackgroundTransparency=0; v178.BorderSizePixel=0; v178.Parent=v242; corner(v178,6)
  local v252=Instance.new("Frame"); v252.Size=UDim2.new(0,12,0,12); v252.AnchorPoint=Vector2.new(0.5,0.5); v252.Position=UDim2.new(math.clamp((v358-v256)/(v421-v256),0,1),0,0.5,0); v252.Name="WhiteSliderKnob"; v252.BackgroundColor3=Color3.fromRGB(255,255,255); v252.BorderSizePixel=0; v252.ZIndex=2; v252.Parent=v242; corner(v252,20)
  local v74=false
  local v921 = nil
  v263 = tonumber(v263) or 0.1
  local function v964(v26) return math.clamp(math.floor((v26 / v263) + 0.5) * v263, v256, v421) end
  local function v1016(v150) local v1239=math.clamp((v150-v242.AbsolutePosition.X)/v242.AbsoluteSize.X,0,1); local v26=v964(v256+(v421-v256)*v1239); local v496=(v26-v256)/(v421-v256); v178.Size=UDim2.new(v496,0,1,0); v252.Position=UDim2.new(v496,0,0.5,0); v81.Text=v100..": "..string.format("%g", v26)..(v235 or ""); if v26 == v921 then return end; v921 = v26; if v79 then task.spawn(v79, v26) end end
  v143.InputBegan:Connect(function(v28) if v28.UserInputType==Enum.UserInputType.MouseButton1 or v28.UserInputType==Enum.UserInputType.Touch then v74=true; v1016(v28.Position.X) end end)
  UIS.InputEnded:Connect(function(v28) if v28.UserInputType==Enum.UserInputType.MouseButton1 or v28.UserInputType==Enum.UserInputType.Touch then v74=false end end)
  UIS.InputChanged:Connect(function(v28) if v74 and (v28.UserInputType==Enum.UserInputType.MouseMovement or v28.UserInputType==Enum.UserInputType.Touch) then v1016(v28.Position.X) end end)
  local function v1262(v26, v601)
  v26 = v964(v26)
  local v496 = (v26 - v256) / (v421 - v256)
  local v871 = v26
  v178.Size = UDim2.new(v496, 0, 1, 0)
  v252.Position = UDim2.new(v496, 0, 0.5, 0)
  v81.Text = v100..": "..string.format("%g", v871)..(v235 or "")
  if v79 and not v601 then v79(v871) end
  end
  return {Set = v1262, Frame = v143}
end


function makeMainButton(v69,v100,v79,v455) local v29=Instance.new("TextButton"); v29.Size=UDim2.new(1,-4,0,30); v29.BackgroundColor3=v455 or Theme.Row; v29.BackgroundTransparency=UITransparency.MainButton; v29.Text=v100; v29.TextColor3=Theme.Text; v29.Font=Enum.Font.GothamBold; v29.TextSize=11; v29.AutoButtonColor=false; v29.Parent=v69; corner(v29,6); stroke(v29,Theme.Accent,1,0.32)
  v29.MouseEnter:Connect(function() tw(v29,{BackgroundColor3=v455 or Theme.RowHover},0.12) end); v29.MouseLeave:Connect(function() tw(v29,{BackgroundColor3=v455 or Theme.Row},0.12) end)
  v29.MouseButton1Click:Connect(function() if v79 then v79() end end); return v29 end

function makeMainToggle(v69,v100,v130,v79)
  local v39=Instance.new("TextButton"); v39.Size=UDim2.new(1,-4,0,32); v39.Parent=v69
  v39.AutoButtonColor=false; v39.Text=v100; v39.TextColor3=Theme.Text; v39.Font=UIFont.Label; v39.TextSize=12; corner(v39,6)
  local v215 = addOutline(v39)

  local v99=v130
  local function v604(v233,v366)
  v99=v233
  if v99 then
  tw(v39, {BackgroundColor3 = Theme.ToggleOff, TextColor3 = UIActiveColor}, 0.12)
  v215.Color = UIActiveColor; v215.Transparency = 0.2
  else
  tw(v39, {BackgroundColor3 = Theme.ToggleOff, TextColor3 = Theme.Text}, 0.12)
  v215.Color = Theme.Accent; v215.Transparency = 0.32
  end
  if v366~=false and v79 then v79(v99) end
  end
  v604(v130, false)
  v39.MouseButton1Click:Connect(function() v604(not v99,true) end)
  BoundToggles[v100]=function(v233,v366) if typeof(v233)=="boolean" then v604(v233,v366) else v604(not v99,true) end end; return BoundToggles[v100]
end

function makeMainTextBox(v69,v100,v358,v1232,v79,v384)
  local v31=Instance.new("Frame"); v31.Size=UDim2.new(1,-4,0,36); v31.BackgroundTransparency=1; v31.Parent=v69
  local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-100,1,0); v36.Position=UDim2.new(0,2,0,0); v36.BackgroundTransparency=1; v36.Text=v100; v36.TextColor3=Theme.Text; v36.Font=Enum.Font.Nunito; v36.TextSize=v384 or 12; v36.TextXAlignment=Enum.TextXAlignment.Left; v36.TextTruncate=Enum.TextTruncate.AtEnd; v36.Parent=v31
  local v67=Instance.new("TextBox"); v67.Size=UDim2.new(0,84,0,24); v67.Position=UDim2.new(1,-90,0.5,-12); v67.BackgroundColor3=Theme.InputBg; v67.BackgroundTransparency=UITransparency.Input; v67.BorderSizePixel=0; v67.Text=v358 or ""; v67.PlaceholderText=v1232 or ""; v67.TextColor3=Theme.Text; v67.Font=Enum.Font.Nunito; v67.TextSize=v384 and math.max(11,v384-2) or 10; v67.ClearTextOnFocus=false; v67.Parent=v31; corner(v67,6); stroke(v67,Theme.Stroke,1,0.65)
  v67.FocusLost:Connect(function()
  local v495 = v67.Text:gsub("%s", "")
  if v79 then v79(v495) end
  end)
  return v67
end

function makeKeybindRow(v69,v302)
  local v31=Instance.new("Frame"); v31.Size=UDim2.new(1,-4,0,36); v31.BackgroundTransparency=1; v31.Parent=v69
  local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-88,1,0); v36.Position=UDim2.new(0,2,0,0); v36.BackgroundTransparency=1; v36.Text=v302; v36.TextColor3=Theme.Text; v36.Font=Enum.Font.Nunito; v36.TextSize=12; v36.TextXAlignment=Enum.TextXAlignment.Left; v36.Parent=v31
  local v150=Instance.new("TextButton"); v150.Name="WhiteTextBtn"; v150.Size=UDim2.new(0,22,0,20); v150.Position=UDim2.new(1,-74,0.5,-10); v150.BackgroundColor3=Theme.Red; v150.Text="X"; v150.TextColor3=Color3.new(1,1,1); v150.Font=Enum.Font.GothamBold; v150.TextSize=10; v150.Parent=v31; corner(v150,5)
  local v43=Instance.new("TextButton"); v43.Name="WhiteTextBtn"; v43.Size=UDim2.new(0,50,0,20); v43.Position=UDim2.new(1,-50,0.5,-10); v43.BackgroundColor3=Theme.Row; v43.BackgroundTransparency=UITransparency.Input; v43.Text=Keybinds[v302] or "NONE"; v43.TextColor3=Color3.new(1,1,1); v43.Font=Enum.Font.GothamBold; v43.TextSize=9; v43.Parent=v31; corner(v43,5); stroke(v43,Theme.Stroke,1,0.45)
  v150.MouseButton1Click:Connect(function() Keybinds[v302]="NONE"; Config.keybinds[v302]="NONE"; saveConfig(); v43.Text="NONE"; if updateMovementPanelLabels then updateMovementPanelLabels() end end)
  v43.MouseButton1Click:Connect(function() v43.Text="..."
  local v840; v840=UIS.InputBegan:Connect(function(v80,v693) if v693 then return end; if v80.UserInputType==Enum.UserInputType.Keyboard then Keybinds[v302]=v80.KeyCode.Name; Config.keybinds[v302]=v80.KeyCode.Name; saveConfig(); v43.Text=v80.KeyCode.Name; if v302=="Open Menu" then UI.OpenMenuKey=v80.KeyCode end; v840:Disconnect(); if updateMovementPanelLabels then updateMovementPanelLabels() end end end)
  end)
end

function addResizeHandle(v426, v717, v372, v710, v708)
  v717 = v717 or 140
  v372 = v372 or 180
  v710 = v710 or 800
  v708 = v708 or 800

  local v86 = Instance.new("TextButton")
  v86.Name = "ResizeHandle"
  v86.AnchorPoint = Vector2.new(1, 1)
  v86.Position = UDim2.new(1, -2, 1, -2)
  v86.Size = UDim2.new(0, 18, 0, 18)
  v86.BackgroundTransparency = 1
  v86.AutoButtonColor = false
  v86.Text = "↘"
  v86.Font = Enum.Font.GothamBold
  v86.TextSize = 16
  v86.TextColor3 = Color3.fromRGB(140, 145, 155)
  v86.ZIndex = 50
  v86.Parent = v426

  local v596 = false
  local v976, v309, v975

  v86.InputBegan:Connect(function(v80)
  if v80.UserInputType == Enum.UserInputType.MouseButton1 or v80.UserInputType == Enum.UserInputType.Touch then
  v596 = true
  v976 = v80.Position
  v309 = v426.Size

  v80.Changed:Connect(function()
  if v80.UserInputState == Enum.UserInputState.End then
  if v596 then
  v596 = false
  local v236 = v426:GetAttribute("CLTHUBPositionKey")
  if v236 then
  if not Config.sizes then Config.sizes = {} end
  Config.sizes[v236] = {x = v426.Size.X.Offset, y = v426.Size.Y.Offset}
  if saveConfig then pcall(saveConfig) end
  end
  end
  end
  end)
  end
  end)

  v86.InputChanged:Connect(function(v80)
  if v80.UserInputType == Enum.UserInputType.MouseMovement or v80.UserInputType == Enum.UserInputType.Touch then
  v975 = v80
  end
  end)

  UIS.InputChanged:Connect(function(v80)
  if v80 == v975 and v596 then
  local v856 = v80.Position - v976
  local v1212 = math.clamp(v309.X.Offset + v856.X, v717, v710)
  local v579 = math.clamp(v309.Y.Offset + v856.Y, v372, v708)
  v426.Size = UDim2.new(v309.X.Scale, v1212, v309.Y.Scale, v579)
  end
  end)

  v86.MouseEnter:Connect(function() v86.TextColor3 = Color3.fromRGB(255, 255, 255) end)
  v86.MouseLeave:Connect(function() v86.TextColor3 = Color3.fromRGB(140, 145, 155) end)
  return v86
end


main,mainBody=makeMainPanel("CLTHUB",UDim2.new(0,520,0,440),UDim2.new(0.5,-260,0.5,-220))
main.Visible = false

panels["Invisible Steal Panel"],panels["InvisStealBody"]=makeQuickPanel("CLTHUB\nInvisible Steal",UDim2.new(0,230,0,360),UDim2.new(0,80,0.5,-220))
addResizeHandle(panels["Invisible Steal Panel"], 160, 200, 600, 700)
panels["InvisStealBody"].ScrollBarThickness = 2
panels["InvisStealBody"].ScrollingEnabled = true
do
  local v894 = panels["InvisStealBody"]:FindFirstChildOfClass("UIListLayout")
  if v894 then v894.Padding = UDim.new(0, 4) end
end
panels["Admin Command Painel"],panels["AdminBody"]=makeQuickPanel("CLTHUB\nAdmin Command Painel",UDim2.new(0,340,0,260),UDim2.new(0.5,85,1,-340))
addResizeHandle(panels["Admin Command Painel"], 160, 200, 600, 700)
panels["Command Cooldowns"],panels["CooldownBody"]=Instance.new("Frame"),Instance.new("Frame"); panels["Command Cooldowns"].Visible=false
panels["Actions"],panels["ActionsBody"]=makeQuickPanel("CLTHUB\nActions",UDim2.new(0,230,0,340),UDim2.new(0.5,505,1,-415))
addResizeHandle(panels["Actions"], 160, 200, 600, 700)
panels["Command Cooldowns"],panels["CooldownBody"]=Instance.new("Frame"),Instance.new("Frame"); panels["Command Cooldowns"].Visible=false
panels["Steal Panel"],panels["StealBody"]=panels["Invisible Steal Panel"], panels["InvisStealBody"]

panels["Steal Target"],panels["TargetBody"]=makeQuickPanel("CLTHUB\nSteal Target",UDim2.new(0,320,0,530),UDim2.new(1,-330,0,85))
addResizeHandle(panels["Steal Target"], 160, 200, 600, 700)
if targetHud then
  targetHud.Parent = panels["Steal Target"]
  targetHud.AnchorPoint = Vector2.new(0.5, 1)
  targetHud.Position = UDim2.new(0.5, 0, 1, -6)
  targetHud.Size = UDim2.new(1, -12, 0, 48 * (mobileScale or 1))
  targetHud.ZIndex = 100
  targetHud.BackgroundTransparency = 0
  targetHud.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
end
if panels["TargetBody"] then
  panels["TargetBody"].Size = UDim2.new(1, -12, 1, -104 * (mobileScale or 1))
end


function findBestAnimalModel(v374)
  if not v374 then return nil end
  local v607 = nil
  pcall(function()
  local v108 = v374.animalData or v374


  local v845 = Workspace:FindFirstChild("RenderedMovingAnimals")
  if v845 and v108.uid then
  for idx, v65 in ipairs(v845:GetChildren()) do
  if v65:GetAttribute("uid") == v108.uid then
  v607 = v65
  return
  end
  end
  end

  local v53 = Workspace:FindFirstChild("Plots")
  local v25 = v53 and v53:FindFirstChild(v108.plot)
  if not v25 then return end
  local v125 = v25:FindFirstChild("AnimalPodiums")
  local v110 = v125 and v125:FindFirstChild(v108.slot)
  local v608 = v110 and v110:FindFirstChild("Base")
  if not v608 then return end
  local v264 = v608:FindFirstChild("Spawn") or v608:FindFirstChildWhichIsA("BasePart") or v608
  local v1000 = v264.Position


  for idx, v24 in ipairs(v264:GetChildren()) do
  if v24:IsA("Model") then
  local v78 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart or v24:FindFirstChildWhichIsA("BasePart")
  if v78 and (v78.Position - v1000).Magnitude < 6 then
  local v562 = v24:FindFirstChildWhichIsA("AnimationController") or v24:FindFirstChild("Humanoid")
  local v1034 = 0
  for idx, v33 in ipairs(v24:GetDescendants()) do
  if v33:IsA("MeshPart") and v33.Transparency < 1 then v1034 += 1 end
  end
  if v1034 > 0 or v562 then
  v607 = v24
  return
  end
  end
  end
  end


  local v828, v827 = -1, nil
  for idx, inst in ipairs(v25:GetDescendants()) do
  if not inst:IsA("Model") or inst.Name=="Base" then continue end
  if inst:FindFirstChild("Base") or inst:FindFirstChild("Spawn") then continue end
  local v78 = inst:FindFirstChild("HumanoidRootPart") or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
  if not v78 then continue end
  local v92 = (v78.Position - v1000).Magnitude
  if v92 > 12 then continue end
  local v336 = -v92
  local v697 = v108.animalIndex or v108.index or ""
  if v697~="" and (inst.Name==v697 or inst.Name:find(v697,1,true)) then v336+=500 end
  if (v374.petName or v374.name or "")~="" and inst.Name:find(v374.petName or v374.name or "",1,true) then v336+=200 end
  local v562 = inst:FindFirstChildWhichIsA("AnimationController") or inst:FindFirstChild("Humanoid")
  if v562 then v336+=150 end
  local v619 = 0
  for idx, v33 in ipairs(inst:GetDescendants()) do
  if v33:IsA("MeshPart") and v33.Transparency < 1 then v619 += 1 end
  end
  if v619 > 0 then
  v336 += math.min(v619 * 10, 100)
  else
  if not v562 then v336 -= 300 end
  end
  if v78:IsA("BasePart") and v78.Transparency >= 1 and v619 == 0 then v336 -= 300 end
  if v336>v828 then v828=v336; v827=inst end
  end
  v607 = v827
  end)
  return v607
end

actionSettingsPanel,actionSettingsBody=makeQuickPanel("CLTHUB\nAction Settings",UDim2.new(0,230,0,370),UDim2.new(0.5,745,1,-440))
addResizeHandle(actionSettingsPanel, 160, 200, 600, 700)
actionSettingsPanel.Visible=false
tpSpeedSettingsPanel,tpSpeedSettingsBody=makeQuickPanel("CLTHUB\nTP & Clone Settings",UDim2.new(0,235,0,325),UDim2.new(0.5,745,1,-440))
tpSpeedSettingsPanel.Visible=false
for idx,v951 in ipairs({
  {"CLTHUB", main},
  {"CLTHUB\nMovement", panels["Invisible Steal Panel"]},
  {"CLTHUB\nInvisible Steal", panels["Invisible Steal Panel"]},
  {"CLTHUB\nAdmin Command Painel", panels["Admin Command Painel"]},
  {"CLTHUB\nCommand Cooldowns", panels["Command Cooldowns"]},
  {"CLTHUB\nActions", panels["Actions"]},
  {"CLTHUB\nSteal Target", panels["Steal Target"]},
  {"CLTHUB\nAction Settings", actionSettingsPanel},
  {"CLTHUB\nTP & Clone Settings", tpSpeedSettingsPanel}
}) do applySavedPosition(v951[1], v951[2]) end


if _G.addLazyUI then
  _G.addLazyUI(main, not Config.AutoCloseOnExec)
  _G.addLazyUI(actionSettingsPanel, false)
  _G.addLazyUI(tpSpeedSettingsPanel, false)
end


local v1009 = panels["Steal Target"]
if v1009 then
  local v324 = _G._CLTHUBPanelVis["Steal Target"]
  local v337 = (v324 ~= nil and v324) or (Config.Visibilities["Steal Target"] ~= false)
  v1009.Visible = v337
end


local v986 = {
  "Admin Command Painel",
  "Steal Panel",
  "Invisible Steal Panel",
  "Actions",
  "Command Cooldowns"
}


for idx, v214 in ipairs(v986) do
  local v23 = panels[v214]
  if v23 then v23.Visible = false end
end


task.spawn(function()
  for idx, v214 in ipairs(v986) do
  task.wait(1.0)
  local v23 = panels[v214]
  if v23 and v23.Parent then
  local v324 = _G._CLTHUBPanelVis[v214]
  local v337
  if v324 ~= nil then
  v337 = v324
  elseif Config.Visibilities[v214] ~= nil then
  v337 = Config.Visibilities[v214]
  else
  v337 = true
  end
  if v337 then
  v23.Visible = true
  Config.Visibilities[v214] = true
  _G._CLTHUBPanelVis[v214] = true
  end
  end
  end
  if saveConfig then pcall(saveConfig) end
end)


function rebuildActions()
  clearBody(panels["ActionsBody"])
  createPanelSectionBanner(panels["ActionsBody"], "ACTIONS")

  if actionConfig["Proximity"] then
  local v448 = Instance.new("Frame")
  v448.Size = UDim2.new(1, -8, 0, 36)
  v448.BackgroundTransparency = 1
  v448.Parent = panels["ActionsBody"]
  local v640 = Instance.new("UIGridLayout", v448)

  v640.CellSize = UDim2.new(1, 0, 0, 36)

  v640.CellPadding = UDim2.new(0, 8, 0, 8)
  v640.SortOrder = Enum.SortOrder.LayoutOrder

  makeSyncStateRow(v448,"Proximity:","Proximity",function(v38) setProximityAP(v38) end)
  end

  if actionConfig["Ragdoll Self (R)"] then makeQuickButton(panels["ActionsBody"],"Ragdoll Self (R)",function() pcall(runAdminCommand,player,"ragdoll") end) end
  if actionConfig["Rejoin PS"] then makeQuickButton(panels["ActionsBody"],"Rejoin PS",function() TeleportService:Teleport(game.PlaceId,player) end) end
  if actionConfig["Rejoin"] then makeQuickButton(panels["ActionsBody"],"Rejoin",function()
  local v251 = game.JobId
  task.spawn(function()
  if not v251 or v251 == "" then return end
  for idx = 1, 4 do
  local ok = pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, v251, player) end)
  if ok then break end
  task.wait(1.5)
  end
  end)
  end) end
  if actionConfig["Kick (Y)"] then makeQuickButton(panels["ActionsBody"],"Kick (Y)",function() kickPlayer() end) end
  if actionConfig["Kick To Private"] then makeQuickButton(panels["ActionsBody"],"Kick To Private",function()
  if PrivateServerCode and PrivateServerCode ~= "" then
  task.delay(0.2, function()
  pcall(function() game:GetService("ExperienceService"):LaunchExperience({placeId=game.PlaceId,linkCode=PrivateServerCode}) end)
  end)
  end
  end) end


  makeSyncStateRow(panels["ActionsBody"],"Auto Turrets","Auto Destroy Turrets",function(v38) Config.AutoDestroyTurrets=v38; saveConfig() end)

  makeQuickButton(panels["ActionsBody"],"Settings",function()
  if actionSettingsPanel.Visible then closeAnim(actionSettingsPanel) else openAnim(actionSettingsPanel) end
  end)
end

function rebuildActionSettings()
  clearBody(actionSettingsBody)
  createPanelSectionBanner(actionSettingsBody, "ACTION SETTINGS")

  local v414 = Instance.new("Frame")
  v414.Size = UDim2.new(1, -8, 0, 0)
  v414.AutomaticSize = Enum.AutomaticSize.Y
  v414.BackgroundTransparency = 1
  v414.Parent = actionSettingsBody

  local v695 = Instance.new("UIGridLayout", v414)
  v695.CellSize = UDim2.new(0.5, -4, 0, 32)
  v695.CellPadding = UDim2.new(0, 8, 0, 8)
  v695.SortOrder = Enum.SortOrder.Name

  for v347,v130 in pairs(actionConfig) do
  local v1020 = "ActionSetting_" .. v347
  makeSyncStateRow(v414, v347, v1020, function(v38)
  actionConfig[v347] = v38
  Config.actions[v347] = v38
  saveConfig()
  rebuildActions()
  end)
  setToggle(v1020, v130)
  end

  local v999 = Instance.new("Frame", actionSettingsBody)
  v999.Size = UDim2.new(1,0,0,10)
  v999.BackgroundTransparency = 1

  makeQuickButton(actionSettingsBody, "Close", function() closeAnim(actionSettingsPanel) end)
end

function createBlackSlider(v69, v81, v1154, v577, v709, v79, v598, v263, v235)
  v263 = v263 or 1
  v235 = v235 or ""
  local v41 = Instance.new("Frame", v69)
  v41.Size = UDim2.new(1, 0, 0, 50)
  v41.BackgroundColor3 = Theme.Row; v41.BackgroundTransparency = 0; v41.BorderSizePixel = 0
  Instance.new("UICorner", v41).CornerRadius = UDim.new(0, 6)

  local v407 = v1154 or v577
  local v686 = v263 < 0.1 and "%.2f" or (v263 < 1 and "%.1f" or "%d")

  local v37 = Instance.new("TextLabel", v41)
  v37.Size = UDim2.new(1, v598 and -50 or -10, 0, 18)
  v37.Position = UDim2.new(0, 8, 0, 2); v37.BackgroundTransparency = 1
  v37.Text = v81 .. ": " .. string.format(v686, v407) .. v235
  v37.Font = Enum.Font.GothamBold; v37.TextSize = 11
  v37.TextColor3 = Color3.fromRGB(200, 210, 220); v37.TextXAlignment = Enum.TextXAlignment.Left

  if v598 then
  local v254 = Instance.new("TextButton", v41)
  v254.Size = UDim2.new(0, 24, 0, 18)
  v254.Position = UDim2.new(1, -32, 0, 2)
  v254.BackgroundColor3 = _G.DepthLocked and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(60, 65, 75)
  v254.Text = "L"; v254.Font = Enum.Font.GothamBold; v254.TextSize = 10
  v254.TextColor3 = Color3.fromRGB(255, 255, 255); v254.BorderSizePixel = 0
  Instance.new("UICorner", v254).CornerRadius = UDim.new(0, 4)
  v254.MouseButton1Click:Connect(function()
  _G.DepthLocked = not _G.DepthLocked
  v254.BackgroundColor3 = _G.DepthLocked and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(60, 65, 75)
  end)
  end

  local v212 = Instance.new("TextButton", v41)
  v212.Size = UDim2.new(0, 36, 0, 23)
  v212.Position = UDim2.new(0, 8, 0, 23)
  v212.BackgroundColor3 = Theme.ToggleOff
  v212.BorderSizePixel = 0
  v212.Text = "−"
  v212.TextColor3 = Color3.fromRGB(235, 72, 72)
  v212.Font = Enum.Font.GothamBold
  v212.TextSize = 18
  v212.AutoButtonColor = false
  corner(v212, 5)
  stroke(v212, Color3.fromRGB(235, 72, 72), 1, 0.12)

  local v269 = Instance.new("TextLabel", v41)
  v269.Size = UDim2.new(1, -96, 0, 23)
  v269.Position = UDim2.new(0, 48, 0, 23)
  v269.BackgroundColor3 = Theme.InputBg
  v269.BackgroundTransparency = 0.08
  v269.BorderSizePixel = 0
  v269.TextColor3 = Theme.Text
  v269.Font = Enum.Font.GothamBold
  v269.TextSize = 11
  corner(v269, 5)
  stroke(v269, Theme.Stroke, 1, 0.5)

  local v217 = Instance.new("TextButton", v41)
  v217.Size = UDim2.new(0, 36, 0, 23)
  v217.Position = UDim2.new(1, -44, 0, 23)
  v217.BackgroundColor3 = Theme.ToggleOff
  v217.BorderSizePixel = 0
  v217.Text = "+"
  v217.TextColor3 = UIActiveColor
  v217.Font = Enum.Font.GothamBold
  v217.TextSize = 16
  v217.AutoButtonColor = false
  corner(v217, 5)
  stroke(v217, UIActiveColor, 1, 0.12)

  local function v615(v66, v601)
  v66 = math.clamp(v66, v577, v709)
  if v66 == v407 and not v601 then return end
  v407 = v66
  v37.Text = v81 .. ": " .. string.format(v686, v66) .. v235
  v269.Text = string.format(v686, v66) .. v235
  v212.TextTransparency = v66 <= v577 and 0.65 or 0
  v217.TextTransparency = v66 >= v709 and 0.65 or 0
  if v79 and not v601 then task.spawn(v79, v66) end
  end

  v212.MouseButton1Click:Connect(function()
  if v598 and _G.DepthLocked then return end
  v615(math.max(v577, v407 - v263))
  end)
  v217.MouseButton1Click:Connect(function()
  if v598 and _G.DepthLocked then return end
  v615(math.min(v709, v407 + v263))
  end)
  v615(v407, true)
  return v41, v615
end

function rebuildTpSpeedSettings()
  clearBody(tpSpeedSettingsBody)
  createPanelSectionBanner(tpSpeedSettingsBody, "TP & CLONE SETTINGS")
  createBlackSlider(tpSpeedSettingsBody, "Grabble TP Speed", Config.TpSettings.GrabbleTPSpeed or 230, 50, 600, function(v26) Config.TpSettings.GrabbleTPSpeed=v26; saveConfig(); if _G.CLTHUBSetCarpetSpeed then pcall(_G.CLTHUBSetCarpetSpeed, v26) end end)
  createBlackSlider(tpSpeedSettingsBody, "Walk To Brainrot Speed", Config.TpSettings.WalkTPSpeed or 190, 50, 300, function(v26) Config.TpSettings.WalkTPSpeed=v26; saveConfig() end)
  createBlackSlider(tpSpeedSettingsBody, "Clone Delay", Config.TpSettings.CloneDelayVal or 0.1, 0.05, 2.0, function(v26) Config.TpSettings.CloneDelayVal=v26; saveConfig() end, false, 0.05)
  makeQuickButton(tpSpeedSettingsBody, "Close", function() closeAnim(tpSpeedSettingsPanel) end)
end

do

  _G.InvisStealAngle = Config.InvisStealAngle or 180
  _G.SinkSliderValue = Config.SinkSliderValue or 8
  setWalkSpeedValue(Config.WalkSpeedValue or 28)

  regToggle("Auto Recover Lagback", Config.AutoRecoverLagback)
  regToggle("Auto Invis During Steal", Config.AutoInvisDuringSteal)
  regToggle("WalkSpeed", Config.WalkSpeedEnabled)

  local v396 = panels["InvisStealBody"]


  local function v1107(v69, v81, v1104, v79)
  local v41 = Instance.new("TextButton", v69)
  v41.Text = v81
  v41.Font = Enum.Font.GothamBold
  v41.TextSize = 12
  v41.AutoButtonColor = false
  v41.Size = UDim2.new(1, -4, 0, 32)
  v41.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v41.BackgroundTransparency = 0.5
  corner(v41, 4)
  local v215 = addOutline(v41)

  local v99 = v1104 and true or false

  local function v772(v130)
  v99 = v130
  v41.TextColor3 = v130 and UIActiveColor or Theme.Text
  v215.Color = v130 and UIActiveColor or Theme.Accent
  v215.Transparency = v130 and 0.2 or 0.32
  end

  v772(v99)

  v41.Activated:Connect(function()
  v99 = not v99
  v772(v99)
  if v79 then v79(v99) end
  end)
  return v41, v772
  end

  local v314 = Instance.new("Frame")
  v314.Name = "TopGridContainer"
  v314.Size = UDim2.new(1, -8, 0, 80)
  v314.BackgroundTransparency = 1
  v314.Parent = v396
  local v616 = Instance.new("UIGridLayout")
  v616.CellSize = UDim2.new(0.5, -4, 0, 36)
  v616.CellPadding = UDim2.new(0, 8, 0, 8)
  v616.SortOrder = Enum.SortOrder.LayoutOrder
  v616.Parent = v314

  makeSyncStateRow(v314,"Steal Priority","Steal Priority",function(v38) if v38 then setStealMode("Priority") end end)
  makeSyncStateRow(v314,"Steal Highest","Steal Highest",function(v38) if v38 then setStealMode("Highest") end end)

  makeQuickButton(v314,"Reset",function() v363() end)

  makeSyncStateRow(v314,"Walk Speed","WalkSpeed",function(v130)
  setWalkSpeedEnabled(v130)
  end)
  _G.updateWalkspeedPanelVisual = function(v99)
  pcall(function() setToggle("WalkSpeed", v99, true) end)
  end


  local v1316, v1018 = v1107(v396, "Enabled:", animPlaying or _G.invisibleStealEnabled or false, function(v38)
  if _G.toggleInvisibleSteal then pcall(_G.toggleInvisibleSteal) end
  end)
  _G.updateMovementPanelInvisVisual = function(v99)
  if v1018 then v1018(v99) end
  end

  local v1323, v1019 = createBlackSlider(v396, "Rotation", Config.InvisStealAngle or 180, 0, 360, function(v26)
  _G.InvisStealAngle = v26; Config.InvisStealAngle = v26; saveConfig()
  end, false, 1)

  _G.updateRotationSliderUI = function(v1081)
  if v1019 then v1019(v1081, true) end
  end

  createBlackSlider(v396, "Depth", math.min(Config.SinkSliderValue or 8, 10), 0, 10, function(v26)
  _G.SinkSliderValue = v26; Config.SinkSliderValue = v26; saveConfig()
  end, false, 0.1)

  createBlackSlider(v396, "Walk Speed", math.clamp(Config.WalkSpeedValue or 20, 15, 25), 15, 25, function(v66)
  setWalkSpeedValue(v66)
  end, false, 1)

  local v349 = Instance.new("Frame")
  v349.Name = "BottomGridContainer"
  v349.Size = UDim2.new(1, -8, 0, 36)
  v349.BackgroundTransparency = 1
  v349.Parent = v396
  local v539 = Instance.new("UIGridLayout")
  v539.CellSize = UDim2.new(0.5, -4, 0, 36)
  v539.CellPadding = UDim2.new(0, 8, 0, 8)
  v539.SortOrder = Enum.SortOrder.LayoutOrder
  v539.Parent = v349

  makeSyncStateRow(v349,"Auto Buy","Auto Buy",function(v38)
  if toggleAutoBuy then toggleAutoBuy(v38)
  else warn("[CLTHUB] Auto Buy not ready yet -- try again in a sec") end
  end)
  makeSyncStateRow(v349,"Auto Kick","Auto Kick",function(v38) Config.AutoKickOnSteal=v38; saveConfig() end)


  _G.AutoInvisDuringSteal = true; Config.AutoInvisDuringSteal = true; saveConfig()
  _G.updateMovementPanelLabels = function() end
  if Config.WalkSpeedEnabled then
  task.defer(function() setWalkSpeedEnabled(true) end)
  end
end


function spamPlayerBaseOwner(v222)
  if not v222 then return 0 end
  local v275 = Config.SpamBaseOwnerOrder or AP_ALL_COMMANDS

  if Config.SpamBaseOwnerSingleCommand then
  local v383 = _G.SpamBaseOwnerIndex or 1
  if v383 > #v275 then v383 = 1 end

  local v166 = nil
  local v206 = 0
  while v206 < #v275 do
  local v72 = ((v383 - 1 + v206) % #v275) + 1
  local v47 = v275[v72]
  if Config.SpamBaseOwnerCommands and Config.SpamBaseOwnerCommands[v47] and not apIsOnCooldown(v47) then
  v166 = v47
  _G.SpamBaseOwnerIndex = v72 + 1
  break
  end
  v206 = v206 + 1
  end

  if v166 then
  runAdminCommand(v222, v166)
  return 1
  end
  return 0
  else
  local v241 = {}
  for idx, v47 in ipairs(v275) do
  if Config.SpamBaseOwnerCommands and Config.SpamBaseOwnerCommands[v47] and not apIsOnCooldown(v47) then
  table.insert(v241, v47)
  end
  end
  task.spawn(function()
  for v28, v47 in ipairs(v241) do
  if not v222 or not v222.Parent then break end
  runAdminCommand(v222, v47)
  if v28 < #v241 then task.wait(0.2) end
  end
  end)
  return #v241
  end
end


LazyInit("Cooldown Panel", function()
cooldownLabels={}
for idx,v61 in ipairs({"jail","rocket","inverse","ragdoll","jumpscare","tiny","balloon","morph","nightvision"}) do
  local v31=Instance.new("Frame"); v31.Size=UDim2.new(1,-4,0,24); v31.BackgroundTransparency=1; v31.Parent=panels["CooldownBody"]
  local v165=Instance.new("TextLabel"); v165.Size=UDim2.new(0.58,0,1,0); v165.Position=UDim2.new(0,6,0,0); v165.BackgroundTransparency=1; v165.Text=v61:sub(1,1):upper()..v61:sub(2); v165.TextColor3=Theme.Text; v165.Font=Enum.Font.GothamBold; v165.TextSize=12; v165.TextXAlignment=Enum.TextXAlignment.Left; v165.Parent=v31
  local v287=Instance.new("TextLabel"); v287.Size=UDim2.new(0.36,0,1,0); v287.Position=UDim2.new(0.62,0,0,0); v287.BackgroundTransparency=1; v287.Text="READY"; v287.TextColor3=Theme.Green; v287.Font=Enum.Font.GothamBold; v287.TextSize=11; v287.TextXAlignment=Enum.TextXAlignment.Right; v287.Parent=v31
  cooldownLabels[v61]=v287
end
task.spawn(function() while true do task.wait(1); for v47,v81 in pairs(cooldownLabels) do local v961=apGetRemaining(v47); if v961>0 then v81.Text=string.format("%.0fs",v961); v81.TextColor3=Theme.Red else v81.Text="READY"; v81.TextColor3=Theme.Green end end end end)
end)


do

local function v1144(v40)
  local character = LocalPlayer.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then return math.huge end

  local v102 = v40.animalData and findAdorneeGlobal(v40.animalData)
  if v102 and v102:IsA("BasePart") then
  return (v22.Position - v102.Position).Magnitude
  end

  local v53 = Workspace:FindFirstChild("Plots")
  local v25 = v53 and v53:FindFirstChild(v40.plot)
  if v25 then
  local v59 = v25:GetPivot().Position
  return (v22.Position - v59).Magnitude
  end
  return math.huge
end


local v1038 = {
  ["gold"] = Color3.fromRGB(255, 222, 89),
  ["diamond"] = Color3.fromRGB(37, 196, 254),
  ["bloodrot"] = Color3.fromRGB(220, 20, 20),
  ["candy"] = Color3.fromRGB(255, 150, 200),
  ["lava"] = Color3.fromRGB(255, 85, 0),
  ["galaxy"] = Color3.fromRGB(170, 60, 255),
  ["radioactive"] = Color3.fromRGB(57, 255, 20),
  ["divine"] = Color3.fromRGB(255, 215, 0),
  ["cyber"] = Color3.fromRGB(100, 180, 255),
  ["phantom"] = Color3.fromRGB(85, 85, 85),
  ["crystal"] = Color3.fromRGB(255, 150, 220),
}


local v781 = {
  ["Common"]  = Color3.fromRGB(76, 175, 80),
  ["Rare"]  = Color3.fromRGB(33, 150, 243),
  ["Epic"]  = Color3.fromRGB(156, 39, 176),
  ["Legendary"] = Color3.fromRGB(255, 193, 7),
  ["Mythic"]  = Color3.fromRGB(244, 67, 54),
}


local function v664(v34)
  return string.format("#%02X%02X%02X", math.floor(v34.R*255), math.floor(v34.G*255), math.floor(v34.B*255))
end


local function v1147(v304)
  if not v304 or v304 == "" then
  return "", nil
  end

  local v585 = v304:gsub("%s+", ""):lower()
  local v731 = v304:upper()
  local v122 = 'size="12"'


  if v585 == "brainrotgod" then
  return string.format(
  '<font color="#4FC3F7" %s><b>Brainr</b></font><font color="#FF1744" %s><b>ot God</b></font> ',
  v122, v122
  ), nil
  end


  if v585 == "secret" then
  return string.format(
  '<font color="#D0D0D0" %s><b>SEC</b></font><font color="#555555" %s><b>RET</b></font> ',
  v122, v122
  ), nil
  end


  if v585 == "phantom" then
  return string.format(
  '<font color="#555555" %s><b>%s</b></font> ',
  v122, v731
  ), nil
  end


  if v585 == "og" then
  return string.format(
  '<font color="#B8860B" %s><b>O</b></font><font color="#000000" %s><b>G</b></font> ',
  v122, v122
  ), nil
  end


  local v592 = v781[v304]
  if v592 then
  local v117 = v664(v592)
  return string.format('<font color="%s" %s><b>%s</b></font> ', v117, v122, v731), nil
  end


  return string.format('<font color="#888888" %s><b>%s</b></font> ', v122, v731), nil
end


local function v1142(v139)
  if not v139 or v139 == "None" or v139 == "" then
  return ""
  end

  local v330 = v139:gsub("%s+", ""):lower()
  local v480 = v139:upper()
  local v122 = 'size="12"'


  if v330 == "rainbow" then
  local v839 = {
  "#FF0000", "#FF7F00", "#FFFF00", "#00FF00", "#0000FF", "#4B0082", "#8B00FF"
  }
  local v735 = ""
  for v28 = 1, #v480 do
  local character = v480:sub(v28, v28)
  local v455 = v839[((v28 - 1) % #v839) + 1]
  v735 = v735 .. string.format('<font color="%s" %s><b>%s</b></font>', v455, v122, character)
  end
  return v735 .. " "
  end


  if v330 == "yinyang" then
  return string.format(
  '<font color="#000000" %s><b>YIN</b></font><font color="#FFFFFF" %s><b>YANG</b></font> ',
  v122, v122
  )
  end


  if v330 == "cursed" then
  return string.format(
  '<font color="#000000" %s><b>CUR</b></font><font color="#FF0000" %s><b>SED</b></font> ',
  v122, v122
  )
  end


  if v330 == "divine" then
  return string.format(
  '<font color="#FFFFFF" %s><b>DIV</b></font><font color="#FFD700" %s><b>INE</b></font> ',
  v122, v122
  )
  end


  if v330 == "cyber" then
  return string.format(
  '<font color="#000000" %s><b>CY</b></font><font color="#4FC3F7" %s><b>BER</b></font> ',
  v122, v122
  )
  end


  if v330 == "phantom" then
  return string.format(
  '<font color="#555555" %s><b>%s</b></font> ',
  v122, v480
  )
  end


  if v330 == "crystal" then
  return string.format(
  '<font color="#64B5F6" %s><b>CRY</b></font><font color="#F06292" %s><b>STAL</b></font> ',
  v122, v122
  )
  end


  local v925 = v1038[v330]
  if v925 then
  local v117 = v664(v925)
  return string.format('<font color="%s" %s><b>%s</b></font> ', v117, v122, v480)
  end


  return string.format('<font color="#888888" %s><b>%s</b></font> ', v122, v480)
end

local function v1143(v139)
  local v73 = tostring(v139 or ""):lower():gsub("%s+", "")
  if v73 == "gold" then return Color3.fromRGB(255, 215, 0)
  elseif v73 == "diamond" or v73 == "dima" then return Color3.fromRGB(0, 220, 255)
  elseif v73 == "lava" then return Color3.fromRGB(255, 85, 0)
  elseif v73 == "rainbow" then return Color3.fromRGB(255, 100, 255)
  elseif v73 == "phantom" then return Color3.fromRGB(150, 150, 150)
  elseif v73 == "cursed" or v73 == "blood" or v73 == "bloodrot" then return Color3.fromRGB(255, 40, 40)
  elseif v73 == "divine" then return Color3.fromRGB(255, 230, 100)
  elseif v73 == "cyber" then return Color3.fromRGB(0, 230, 255)
  elseif v73 == "yinyang" or v73 == "yin" then return Color3.fromRGB(220, 220, 220)
  elseif v73 == "crystal" then return Color3.fromRGB(100, 180, 255)
  elseif v73 == "galaxy" then return Color3.fromRGB(170, 60, 255)
  elseif v73 == "candy" then return Color3.fromRGB(255, 150, 200)
  elseif v73 == "radioactive" or v73 == "radio" then return Color3.fromRGB(57, 255, 20)
  end
  return Color3.fromRGB(55, 55, 65)
end


local v14 = {}
do
  local v70  = {}
  local v185  = {}
  local v560  = {}
  local v369 = {}
  local v1326  = false

  if typeof(makefolder) == "function" then
  pcall(makefolder, "skyr0_brainrots")
  pcall(makefolder, "clt_brainrots")
  end

  local v900 = request or http_request or (http and http.request)
  or (syn and syn.request) or (fluxus and fluxus.request)
  or (getgenv and getgenv().request)
  local v671 = (typeof(getcustomasset) == "function" and getcustomasset)
  or (typeof(getsynasset) == "function" and getsynasset)
  or (typeof(getcustomasseturl) == "function" and getcustomasseturl)
  or (syn and typeof(syn.getcustomasset) == "function" and syn.getcustomasset)
  or nil
  local v1089 = typeof(writefile) == "function" and typeof(isfile) == "function"

  local function v913(v29)
  return type(v29) == "string" and #v29 > 200
  and v29:sub(1, 1) ~= "{" and v29:sub(1, 1) ~= "<"
  end

  local function v1117(v1032)
  if v900 then
  local ok, v168 = pcall(v900, {Url = v1032, Method = "GET"})
  if ok and type(v168) == "table" then
  local v77 = v168.Body or v168.body
  if v913(v77) then return v77 end
  end
  end
  local v373, v77 = pcall(function() return game:HttpGet(v1032) end)
  if v373 and v913(v77) then return v77 end
  return nil
  end

  function v14.get(v30, v79)
  if not v30 or v30 == "" then return nil end
  local v1238 = tostring(v30):gsub("^%s+", ""):gsub("%s+$", "")
  local v43 = v1238:gsub("%s+", "_")

  if v70[v43] then
  if v79 then pcall(v79, v70[v43]) end
  return v70[v43]
  end

  if v79 then
  v369[v43] = v369[v43] or {}
  table.insert(v369[v43], v79)
  end

  if v185[v43] == "pending" then
  return nil
  end

  if not (v1089 and v671) then
  v185[v43] = "failed"
  return nil
  end

  v185[v43] = "pending"
  task.spawn(function()
  local v412 = v43:gsub("[^%w_%-]", "")
  local v581 = {
  "skyr0_brainrots/" .. v412 .. ".png",
  "clt_brainrots/" .. v412 .. ".png",
  "skyr0_br_" .. v412 .. ".png",
  "clt_br_" .. v412 .. ".png",
  v412 .. ".png"
  }
  local v317, v587


  for idx, v23 in ipairs(v581) do
  local v246 = false
  pcall(function() v246 = isfile(v23) end)
  if v246 then
  local ok, v27 = pcall(v671, v23)
  if ok and v27 then v317 = v27; break end
  end
  end


  if not v317 then
  local v1294 = {
  string.format("https://cdn.lura.blue/sab/%s.png", v43),
  string.format("https://cdn.lura.blue/sab/%s.png", v412),
  }
  local v545
  for idx, v1280 in ipairs(v1294) do
  v545 = v1117(v1280)
  if v545 then break end
  end

  if not v545 then
  v587 = "download failed"
  else
  for idx, v23 in ipairs(v581) do
  if pcall(writefile, v23, v545) then
  local ok, v27 = pcall(v671, v23)
  if ok and v27 then v317 = v27; break else v587 = "getcustomasset error" end
  else
  v587 = v587 or "writefile error"
  end
  end
  end
  end

  if v317 then
  v70[v43], v185[v43], v560[v43] = v317, nil, nil
  local v659 = v369[v43]
  v369[v43] = nil
  if v659 then
  for idx, v1093 in ipairs(v659) do
  pcall(v1093, v317)
  end
  end
  else
  v560[v43] = (v560[v43] or 0) + 1
  v185[v43] = "failed"
  local v659 = v369[v43]
  v369[v43] = nil
  if v560[v43] < 3 then
  task.delay(10, function()
  if v185[v43] == "failed" then v185[v43] = nil end
  end)
  end
  end
  end)
  return nil
  end
end
_G.Skyr0_GetBrainrotImg = v14.get
_G.CLTHUB_GetBrainrotImg = v14.get

function refreshTargetPanel()
  if not panels["Steal Target"] or not panels["Steal Target"].Visible then return end
  clearBody(panels["TargetBody"])
  createPanelSectionBanner(panels["TargetBody"], "STEAL TARGET")
  local v70 = get_all_pets()
  if not v70 or #v70 == 0 then
  local v36 = Instance.new("TextLabel")
  v36.Size = UDim2.new(1,-4,0,24)
  v36.BackgroundTransparency = 1
  v36.Text = "Scanning..."
  v36.TextColor3 = Theme.Dim
  v36.Font = Enum.Font.GothamMedium
  v36.TextSize = 11
  v36.TextXAlignment = Enum.TextXAlignment.Center
  v36.Parent = panels["TargetBody"]
  return
  end

  local v155 = Config.StealMode or "Priority"
  local v911 = (v155 == "Priority" or Config.StealPriority == true)
  local v183 = {}
  for idx, v40 in ipairs(v70) do
  local v93 = {
  pet = v40,
  isPriority = false,
  priorityIndex = 999,
  mps = v40.mpsValue or 0,
  distance = v1144(v40),
  }
  for v72, v89 in ipairs(priorityList) do
  local v594 = v89:lower()
  if (v40.petName and v40.petName:lower() == v594)
  or (v40.animalData and v40.animalData.index and tostring(v40.animalData.index):lower() == v594)
  or (v40.animalData and v40.animalData.name and tostring(v40.animalData.name):lower() == v594)
  or (v40.petName and v40.petName:lower():find(v594, 1, true)) then
  v93.isPriority = true
  v93.priorityIndex = v72
  break
  end
  end
  if not v911 or v93.isPriority then
  table.insert(v183, v93)
  end
  end

  if #v183 == 0 then
  local v36 = Instance.new("TextLabel")
  v36.Size = UDim2.new(1,-4,0,24)
  v36.BackgroundTransparency = 1
  v36.Text = v911 and "No Priority Targets Found" or "No Targets Found"
  v36.TextColor3 = Theme.Dim
  v36.Font = Enum.Font.GothamMedium
  v36.TextSize = 11
  v36.TextXAlignment = Enum.TextXAlignment.Center
  v36.Parent = panels["TargetBody"]
  return
  end

  if v155 == "Highest" then
  table.sort(v183, function(v27, v29) return v27.mps > v29.mps end)
  elseif v155 == "Priority" then
  table.sort(v183, function(v27, v29)
  return v27.priorityIndex < v29.priorityIndex
  end)
  elseif v155 == "Nearest" then
  table.sort(v183, function(v27, v29) return v27.distance < v29.distance end)
  else
  table.sort(v183, function(v27, v29) return v27.mps > v29.mps end)
  end

  local v1267 = {}
  for idx, v93 in ipairs(v183) do
  table.insert(v1267, v93.pet)
  end


  local function v1183(v40, v1113, v704)
  local v1180 = (selectedTargetUID == v40.uid)
  local v703 = (manuallySelectedUID == v40.uid)
  local v31 = Instance.new("Frame")
  v31.Size = UDim2.new(1, -4, 0, 56)
  v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v31.BackgroundTransparency = 0.5
  v31.BorderSizePixel = 0
  v31.Parent = panels["TargetBody"]
  corner(v31, 6)

  v31:SetAttribute("PetUID", v40.uid)
  v31:SetAttribute("IsPriority", v704 or false)

  if v1180 or v703 then
  local v82 = Instance.new("UIStroke", v31)
  v82.Color = v703 and Color3.fromRGB(56, 214, 110) or Color3.fromRGB(0, 85, 255)
  v82.Thickness = v703 and 1.75 or 1.25
  elseif v704 then
  local v82 = Instance.new("UIStroke", v31)
  v82.Color = Color3.fromRGB(255, 90, 120)
  v82.Thickness = 0.75
  v82.Transparency = 0.3
  end


  local v380 = Instance.new("Frame")
  v380.Size = UDim2.new(0, 20, 0, 20)
  v380.Position = UDim2.new(0, 5, 0.5, -10)
  v380.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v380.BorderSizePixel = 0
  v380.Parent = v31
  corner(v380, 4)

  local v62 = Instance.new("TextLabel")
  v62.Size = UDim2.new(1, 0, 1, 0)
  v62.BackgroundTransparency = 1
  v62.Text = tostring(v1113)
  v62.TextColor3 = Color3.new(1, 1, 1)
  v62.Font = Enum.Font.GothamBold
  v62.TextSize = 11
  v62.Parent = v380


  local v139 = v40.mutation or "None"
  local v286 = Instance.new("Frame")
  v286.Size = UDim2.new(0, 42, 0, 42)
  v286.Position = UDim2.new(0, 28, 0.5, -21)
  v286.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
  v286.BorderSizePixel = 0
  v286.ClipsDescendants = true
  v286.Parent = v31
  corner(v286, 6)

  local v727 = Instance.new("UIStroke", v286)
  v727.Color = v1143(v139)
  v727.Thickness = (v139 and v139 ~= "None" and v139 ~= "") and 1.4 or 0.8
  v727.Transparency = (v139 and v139 ~= "None" and v139 ~= "") and 0 or 0.5

  local v1219 = v40.petName or v40.name or (v40.animalData and v40.animalData.name)
  local v1322 = v40.animalData and v40.animalData.index
  local v313 = v1219 or v40.petName or v40.name or "BR"


  local v248 = Instance.new("TextLabel")
  v248.Size = UDim2.new(1, 0, 1, 0)
  v248.BackgroundTransparency = 1
  local v418 = ""
  for v1291 in tostring(v313):gmatch("%S+") do
  v418 = v418 .. v1291:sub(1, 1):upper()
  if #v418 >= 2 then break end
  end
  if v418 == "" then v418 = string.sub(tostring(v313), 1, 2):upper() end
  v248.Text = v418
  v248.TextColor3 = Color3.fromRGB(150, 150, 160)
  v248.Font = Enum.Font.GothamBold
  v248.TextSize = 13
  v248.Parent = v286

  local v230 = Instance.new("ImageLabel")
  v230.Size = UDim2.new(1, -4, 1, -4)
  v230.Position = UDim2.new(0, 2, 0, 2)
  v230.BackgroundTransparency = 1
  v230.ScaleType = Enum.ScaleType.Fit
  v230.ZIndex = 2
  v230.Parent = v286

  local v892 = v14.get(v313, function(v317)
  if v230 and v230.Parent then
  v230.Image = v317
  if v248 and v248.Parent then v248.Visible = false end
  end
  end)
  if v892 then
  v230.Image = v892
  v248.Visible = false
  end


  local v88 = Instance.new("TextLabel")
  v88.Size = UDim2.new(1, -80, 0, 22)
  v88.Position = UDim2.new(0, 76, 0, 4)
  v88.BackgroundTransparency = 1
  v88.RichText = true
  v88.TextTruncate = Enum.TextTruncate.AtEnd
  v88.TextXAlignment = Enum.TextXAlignment.Left
  v88.Font = Enum.Font.GothamBold
  v88.TextSize = 15
  v88.Parent = v31

  local v1191 = v1142(v139)
  local v302 = v40.petName or "?"
  v88.Text = v1191 .. string.format('<font color="#FFFFFF"><b>%s</b></font>', v302)


  local v249 = Instance.new("TextLabel")
  v249.Size = UDim2.new(1, -80, 0, 20)
  v249.Position = UDim2.new(0, 76, 0, 28)
  v249.BackgroundTransparency = 1
  v249.RichText = true
  v249.TextTruncate = Enum.TextTruncate.AtEnd
  v249.TextXAlignment = Enum.TextXAlignment.Left
  v249.Font = Enum.Font.GothamBold
  v249.TextSize = 14
  v249.Parent = v31

  local v304 = v40.rarity or "Common"
  local v730 = v1147(v304)
  local v954 = v40.mpsText or "$0/s"


  if v730 and v730 ~= "" then
  v249.Text = string.format(
  '%s <font color="#000000"><b>|</b></font> <font color="#38D66E"><b>%s</b></font>',
  v730, v954
  )
  else
  local v592 = v781[v304] or Theme.Dim
  local v1237 = v664(v592)
  v249.Text = string.format(
  '<font color="%s"><b>%s</b></font> <font color="#000000"><b>|</b></font> <font color="#38D66E"><b>%s</b></font>',
  v1237, v304, v954
  )
  end


  local v284 = Instance.new("TextButton")
  v284.Size = UDim2.new(1, 0, 1, 0)
  v284.BackgroundTransparency = 1
  v284.Text = ""
  v284.ZIndex = 8
  v284.Parent = v31
  local v792 = 0
  v284.MouseButton1Click:Connect(function()
  local v60 = os.clock()
  if (v60 - v792) < 0.05 then return end
  v792 = v60

  if manuallySelectedUID == v40.uid then
  manuallySelectedUID = nil
  selectedTargetUID = nil
  SharedState.SelectedPetData = nil
  _G.CLTHUB_StealStatus = _G.CLTHUB_StealStatus or {}
  _G.CLTHUB_StealStatus.target = nil
  else
  selectedTargetUID = v40.uid
  manuallySelectedUID = v40.uid
  SharedState.SelectedPetData = v40
  _G.CLTHUB_StealStatus = _G.CLTHUB_StealStatus or {}
  _G.CLTHUB_StealStatus.target = v40
  if v40 then SharedState.LastTargetedPetMpsValue = v40.mpsValue or 0 end
  end


  pcall(function()
  for idx, v406 in ipairs(panels["TargetBody"]:GetChildren()) do
  if v406:IsA("Frame") then
  local v76 = v406:GetAttribute("PetUID")
  local v82 = v406:FindFirstChildOfClass("UIStroke")
  local v702 = (manuallySelectedUID == v76)
  local v1179 = (selectedTargetUID == v76)
  if v702 or v1179 then
  if not v82 then v82 = Instance.new("UIStroke", v406) end
  v82.Color = v702 and Color3.fromRGB(56, 214, 110) or Theme.Accent
  v82.Thickness = v702 and 1.75 or 1.25
  v82.Transparency = 0
  else
  local v1178 = v406:GetAttribute("IsPriority")
  if v1178 then
  if not v82 then v82 = Instance.new("UIStroke", v406) end
  v82.Color = Color3.fromRGB(255, 90, 120)
  v82.Thickness = 0.75
  v82.Transparency = 0.3
  else
  if v82 then v82:Destroy() end
  end
  end
  end
  end
  if _G.updateBrainrotOverheadVisibility then _G.updateBrainrotOverheadVisibility() end
  end)
  end)
  end


  for v72, v93 in ipairs(v183) do
  v1183(v93.pet, v72, v93.isPriority)
  end
end

task.spawn(function()
  local v919 = ""
  local v760 = 0
  while true do
  task.wait(0.4)
  if panels["Steal Target"] and panels["Steal Target"].Visible then
  local v70 = SharedState.AllAnimalsCache
  local v257 = Config.StealNearest and Config.TpSettings.MinGenForGrab or Config.TpSettings.MinGenForTp
  local v1289 = (v70 and v70[1] and v70[1].uid) or ""
  local v1288 = (v70 and v70[1] and v70[1].genValue) or 0
  local v600 = (v70 and #v70 or 0) .. "_" .. tostring(v1289) .. "_" .. tostring(v1288) .. "_" .. (Config.StealMode or "") .. "_" .. tostring(v257)

  v760 = v760 + 1
  local v1253 = SharedState.HasMissingModels and (v760 % 5 == 0)

  if v600 ~= v919 or SharedState.ListNeedsRedraw or v1253 then
  v919 = v600
  SharedState.ListNeedsRedraw = false
  SharedState.HasMissingModels = false
  refreshTargetPanel()
  end
  end
  end
end)

end


LazyInit("Admin Painel UI", function()
  apList = panels["AdminBody"]
  apRows,stealLabels={},{}; rc=0

  local function v836()
  local v544 = {}
  local v584 = Config.AdminPanelOrder or AP_ALL_COMMANDS
  for idx, v47 in ipairs(v584) do
  if Config.AdminPanelButtons and Config.AdminPanelButtons[v47] then
  table.insert(v544, {AP_COMMAND_EMOJIS[v47] or "⚡", v47})
  end
  end
  if #v544 == 0 then v544 = {{"🤸","ragdoll"},{"🔒","jail"},{"🚀","rocket"},{"🎈","balloon"}} end
  return v544
  end
  RP_BUTTONS = v836()

  _G.refreshAdminPanelRows = function()
  for v76, v31 in pairs(apRows) do
  if v31 then v31:Destroy() end
  end
  table.clear(apRows)
  table.clear(stealLabels)
  rc = 0
  createPanelSectionBanner(apList, "ADMIN COMMAND PAINEL")
  RP_BUTTONS = v836()
  for idx, player in ipairs(PlayersService:GetPlayers()) do
  if player ~= player then createAPRow(player) end
  end
  end

  function createAPRow(player)
  if not player or player == player then return end
  if apRows[player.UserId] and apRows[player.UserId].Parent then return end
  rc = rc + 1
  local v801 = #RP_BUTTONS * 24
  local v31 = Instance.new("Frame")
  v31.Name = "Row_" .. player.UserId
  v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  v31.BackgroundTransparency = 0.15
  v31.BorderSizePixel = 0
  v31.Size = UDim2.new(1, -4, 0, 42)
  v31.ZIndex = 5
  v31.ClipsDescendants = false
  v31.Parent = apList
  corner(v31, 6)
  addOutline(v31)
  apRows[player.UserId] = v31


  local v350 = Instance.new("Frame")
  v350.BackgroundTransparency = 1
  v350.BorderSizePixel = 0
  v350.Size = UDim2.fromOffset(28, 28)
  v350.Position = UDim2.fromOffset(6, 7)
  v350.Parent = v31
  corner(v350, 6)

  local v320 = Instance.new("ImageLabel")
  v320.BackgroundTransparency = 1
  v320.Size = UDim2.fromScale(1, 1)
  v320.ZIndex = 10
  v320.Parent = v350
  corner(v320, 6)
  task.spawn(function()
  local ok, v230 = pcall(function()
  return PlayersService:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
  end)
  if ok then v320.Image = v230 end
  end)

  local v763 = -(v801 + 42)


  local v94 = Instance.new("TextLabel")
  v94.Size = UDim2.new(1, v763, 0, 14)
  v94.Position = UDim2.fromOffset(40, 2)
  v94.BackgroundTransparency = 1
  v94.Text = player.DisplayName
  v94.Font = Enum.Font.GothamBold
  v94.TextSize = 13
  v94.TextColor3 = Theme.Text
  v94.TextXAlignment = Enum.TextXAlignment.Left
  v94.ZIndex = 10
  v94.Parent = v31


  local v238 = Instance.new("TextLabel")
  v238.BackgroundTransparency = 1
  v238.Position = UDim2.fromOffset(40, 15)
  v238.Size = UDim2.new(1, v763, 0, 14)
  v238.TextXAlignment = Enum.TextXAlignment.Left
  v238.Text = "@" .. player.Name
  v238.Font = Enum.Font.GothamBold
  v238.TextSize = 11
  v238.TextColor3 = Theme.Dim
  v238.ZIndex = 10
  v238.Parent = v31


  local v221 = Instance.new("TextLabel")
  v221.BackgroundTransparency = 1
  v221.Position = UDim2.fromOffset(40, 28)
  v221.Size = UDim2.new(1, v763, 0, 14)
  v221.TextXAlignment = Enum.TextXAlignment.Left
  v221.Text = ""
  v221.Font = Enum.Font.GothamBold
  v221.TextSize = 11
  v221.TextColor3 = Theme.AccentLight
  v221.ZIndex = 10
  v221.Parent = v31
  stealLabels[player.UserId] = v221


  local v128 = Instance.new("Frame")
  v128.Name = "Actions"
  v128.BackgroundTransparency = 1
  v128.AnchorPoint = Vector2.new(1, 0.5)
  v128.Position = UDim2.new(1, -6, 0.5, 0)
  v128.Size = UDim2.fromOffset(v801 + 2, 30)
  v128.ZIndex = 12
  v128.Parent = v31

  local v171 = Instance.new("UIListLayout")
  v171.FillDirection = Enum.FillDirection.Horizontal
  v171.SortOrder = Enum.SortOrder.LayoutOrder
  v171.Padding = UDim.new(0, 2)
  v171.Parent = v128


local v1312 = {}

for v28, v29 in ipairs(RP_BUTTONS) do
  local v405 = Instance.new("Frame")
  v405.Size = UDim2.fromOffset(22, 30)
  v405.BackgroundTransparency = 1
  v405.LayoutOrder = v28
  v405.Parent = v128


  local v162 = Instance.new("TextLabel")
  v162.Size = UDim2.new(1, 0, 0, 10)
  v162.Position = UDim2.new(0, 0, 0, 0)
  v162.BackgroundTransparency = 1
  v162.Text = ""
  v162.TextColor3 = Color3.new(1, 1, 1)
  v162.TextStrokeColor3 = Color3.new(0, 0, 0)
  v162.TextStrokeTransparency = 0.2
  v162.Font = Enum.Font.GothamBold
  v162.TextSize = 10
  v162.TextXAlignment = Enum.TextXAlignment.Center
  v162.TextYAlignment = Enum.TextYAlignment.Bottom
  v162.ZIndex = 14
  v162.Parent = v405


  local v39 = Instance.new("TextButton")
  v39.Size = UDim2.fromOffset(22, 22)
  v39.Position = UDim2.new(0, 0, 0, 8)
  v39.BackgroundTransparency = 1
  v39.AutoButtonColor = false
  v39.Text = v29[1]
  v39.TextSize = 14
  v39.BackgroundColor3 = Theme.SoftButton
  v39.Font = Enum.Font.GothamBold
  v39.TextColor3 = Color3.new(1, 1, 1)
  v39.ZIndex = 13
  v39.Parent = v405


  v39:SetAttribute("CLTHUB_CmdName", v29[2])


  v39.MouseButton1Click:Connect(function()
  if isPlayerBlacklisted(player) then
  return
  end
  if apIsOnCooldown(v29[2]) then return end
  pcall(runAdminCommand, player, v29[2])
  end)
end


  local function v1283()
  local v1158 = isPlayerBlacklisted(player)
  if v1158 then
  v320.ImageTransparency = 0
  v94.TextTransparency = 0
  v238.TextTransparency = 0
  v221.TextTransparency = 0
  for idx, v24 in ipairs(v128:GetDescendants()) do
  if v24:IsA("TextButton") then
  v24.TextTransparency = 0.8
  end
  end
  else
  v320.ImageTransparency = 0
  v94.TextTransparency = 0
  v238.TextTransparency = 0
  v221.TextTransparency = 0
  for idx, v24 in ipairs(v128:GetDescendants()) do
  if v24:IsA("TextButton") then
  v24.TextTransparency = 0
  end
  end
  end
  end
  v1283()


  v31.InputBegan:Connect(function(v80)
  if v80.UserInputType ~= Enum.UserInputType.MouseButton1 and v80.UserInputType ~= Enum.UserInputType.Touch then return end
  local v280 = UIS:GetMouseLocation()
  if v128 and v128.AbsolutePosition and v128.AbsoluteSize then
  local v829, v830 = v128.AbsolutePosition.X, v128.AbsolutePosition.Y
  local v1086, v1076 = v128.AbsoluteSize.X, v128.AbsoluteSize.Y
  if v280.X >= v829 and v280.X <= v829 + v1086 and v280.Y >= v830 and v280.Y <= v830 + v1076 then
  return
  end
  end
  if isPlayerBlacklisted(player) then
  return
  end
  task.spawn(function()
  local v241 = {}
  for idx, v47 in ipairs(AP_ALL_COMMANDS) do
  if not apIsOnCooldown(v47) then
  table.insert(v241, v47)
  end
  end
  if #v241 == 0 then
  return
  end
  for idx, v47 in ipairs(v241) do
  if not player or not player.Parent then break end
  runAdminCommand(player, v47)
  task.wait(0.2)
  end
  end)
  end)


  task.spawn(function()
  while v31.Parent do
  task.wait(0.5)
  if not player or not player.Parent then break end

  pcall(function()
  local v906 = isPlayerBlacklisted(player)
  for idx, v24 in ipairs(v128:GetChildren()) do
  if v24:IsA("Frame") then
  local v39 = v24:FindFirstChildWhichIsA("TextButton")
  local v162 = v24:FindFirstChildWhichIsA("TextLabel")
  local v47 = v39 and v39:GetAttribute("CLTHUB_CmdName")
  if v47 and v162 then
  local v322 = _readRealAdminTimer(v47)
  if v322 and v322 > 0 then
  v162.Text = tostring(v322)
  if not v906 then v39.TextTransparency = 0.6 end
  else
  v162.Text = ""
  if not v906 then v39.TextTransparency = 0 end
  end
  end
  end
  end
  end)

  local v149 = stealLabels[player.UserId]
  if not v149 then break end

  local v1324, v1001 = getStealingInfo(player)
  local v1317, v1318, v904, v901 = getHubUserBadge(player)
  local v862 = _G.__getCurrentBaseOwnerId()

  pcall(function()
  if v901 then
  v94.RichText = true
  local v258 = {}
  for idx, v244 in ipairs(v901) do
  local v117 = string.format("#%02X%02X%02X",
  math.floor(v244.color.R * 255), math.floor(v244.color.G * 255), math.floor(v244.color.B * 255))
  v258[#v258 + 1] = '<font color="' .. v117 .. '"><b>' .. v244.badge .. '</b></font>'
  end
  v94.Text = player.DisplayName .. '  ' .. table.concat(v258, " ")
  elseif v94.RichText then
  v94.RichText = false
  v94.Text = player.DisplayName
  end
  end)

  local v253 = v862 and v862 == player.UserId
  local v365 = nil
  if v904 then
  local v495 = v904:lower()
  for idx, v472 in ipairs({"invers", "jail", "jumpscare", "morph", "nightvision", "rocket", "tiny", "balloon"}) do
  if v495:find(v472, 1, true) then
  v365 = v472:sub(1, 1):upper() .. v472:sub(2)
  if v365 == "Invers" then v365 = "Inversed" end
  break
  end
  end
  end
  if v1001 then
  v149.Text = "● ROUBANDO : " .. tostring(v1001)
  v149.TextColor3 = Color3.fromRGB(255, 90, 90)
  v31.LayoutOrder = 1
  elseif v253 then
  v149.Text = v365 and ("● Base Owner | " .. v365) or "● Base Owner"
  v149.TextColor3 = Color3.fromRGB(90, 230, 120)
  v31.LayoutOrder = 2
  elseif v365 then
  v149.Text = "● " .. v365
  v149.TextColor3 = Color3.fromRGB(255, 190, 70)
  v31.LayoutOrder = 10
  else
  v149.Text = ""
  v31.LayoutOrder = 10
  end

  pcall(function()
  local v419 = getHeldTool(player)
  if v419 and DANGER_TOOLS[v419] then v94.TextColor3 = Color3.fromRGB(255, 60, 60)
  else v94.TextColor3 = Theme.Text end
  end)
  end
  end)
end

  for idx,player in ipairs(PlayersService:GetPlayers()) do if player~=player then createAPRow(player) end end
  PlayersService.PlayerAdded:Connect(function(player) task.delay(1, function() if player.Parent then createAPRow(player) end end) end)
  PlayersService.PlayerRemoving:Connect(function(player) local v31=apRows[player.UserId]; if v31 then v31:Destroy(); apRows[player.UserId]=nil end; stealLabels[player.UserId]=nil end)
end)


function styleSidebarTabs(v816)
  for v30, v39 in pairs(tabButtons) do
  local v400 = v30 == v816
  v39.BackgroundColor3 = Theme.SidebarActive or Color3.fromRGB(28,34,44)
  v39.BackgroundTransparency = v400 and (UITransparency.SidebarTab or 0.12) or 1
  v39.TextColor3 = v400 and Color3.new(1, 1, 1) or (Theme.SidebarInactiveText or Theme.Text)
  v39.Font = v400 and Enum.Font.GothamBlack or Enum.Font.GothamBold
  local v250 = v39:FindFirstChild("ActiveInd")
  if v250 then v250.Visible = v400 end
  end
end
_G.styleSidebarTabs = styleSidebarTabs


tabGroups={
  {label="MAIN",  tabs={"Auto TP","Priority"}},
  {label="VISUALS",  tabs={"ESP","UI"}},
  {label="ADDITIONAL", tabs={"Misc","GUI","Keybinds"}},
}
do
  local v584=0
  for v1315,v1132 in ipairs(tabGroups) do
  for idx,v30 in ipairs(v1132.tabs) do
  v584+=1
  local v29=Instance.new("TextButton")
  v29.Size=UDim2.new(1,-16,0,36)
  v29.Position=UDim2.new(0,8,0,0)
  v29.LayoutOrder=v584
  v29.BackgroundColor3=Theme.SidebarActive or Color3.fromRGB(28,34,44)
  v29.BackgroundTransparency=1
  v29.Text=v30
  v29.TextColor3=Theme.SidebarInactiveText or Theme.Text
  v29.Font=Enum.Font.GothamBold
  v29.TextSize=16
  v29.TextXAlignment=Enum.TextXAlignment.Left
  v29.AutoButtonColor=false
  v29.Parent=sidebarNav
  corner(v29,6)
  local v250=Instance.new("Frame")
  v250.Name="ActiveInd"
  v250.Size=UDim2.new(0,3,1,-12)
  v250.Position=UDim2.new(0,-18,0,6)
  v250.BackgroundColor3=Color3.fromRGB(0, 85, 255)
  v250.BorderSizePixel=0
  v250.Visible=false
  v250.Parent=v29
  corner(v250,2)

  local v120=Instance.new("Frame")
  v120.Name="Divider"
  v120.Size=UDim2.new(1,-4,0,1)
  v120.Position=UDim2.new(0,0,1,0)
  v120.AnchorPoint=Vector2.new(0,1)
  v120.BackgroundColor3=Color3.fromRGB(0, 85, 255)
  v120.BackgroundTransparency=0.4
  v120.BorderSizePixel=0
  v120.Parent=v29
  local v262 = Instance.new("UIGradient"); v262.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 85, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 255))}; v262.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}; v262.Parent = v120

  local v950 = Instance.new("UIPadding")
  v950.PaddingLeft = UDim.new(0, 24)
  v950.Parent = v29

  v29.MouseEnter:Connect(function()
  if UI.CurrentTab~=v30 then tw(v29,{TextColor3=Theme.Text, BackgroundTransparency=0.6},0.1) end
  end)
  v29.MouseLeave:Connect(function()
  if UI.CurrentTab~=v30 then tw(v29,{TextColor3=Theme.SidebarInactiveText or Theme.Text, BackgroundTransparency=1},0.1) end
  end)
  tabButtons[v30]=v29
  end
  end
end

function makeToolDropdown(v69, v1171, v722, v307, v933, v384)
  local v85=Instance.new("Frame")
  v85.Size=UDim2.new(1,-4,0,36)
  v85.BackgroundTransparency=1
  v85.Parent=v69

  local v37=Instance.new("TextLabel")
  v37.Size=UDim2.new(0.42,0,1,0)
  v37.BackgroundTransparency=1
  v37.Text=v1171
  v37.TextColor3=Theme.Text
  v37.Font=Enum.Font.Nunito
  v37.TextSize=v384 or 12
  v37.TextXAlignment=Enum.TextXAlignment.Left
  v37.Parent=v85

  local v181=v307 or v722[1]
  local v152=Instance.new("TextButton")
  v152.Size=UDim2.new(0.56,-4,0,26)
  v152.Position=UDim2.new(0.44,0,0.5,-13)
  v152.BackgroundColor3=Theme.InputBg
  v152.BackgroundTransparency=UITransparency.Input
  v152.Text=v181
  v152.TextColor3=Theme.Text
  v152.Font=Enum.Font.Nunito
  v152.TextSize=v384 and math.max(11,v384-2) or 10
  v152.AutoButtonColor=false
  v152.Parent=v85
  corner(v152,8)
  stroke(v152,Theme.Stroke,1,0.65)

  local v134, v549 = nil, nil
  local function v550()
  if v549 then v549:Disconnect(); v549=nil end
  if v134 then v134:Destroy(); v134=nil end
  end
  local function v988(v66)
  v181=v66
  v152.Text=v66
  end
  local function v1210()
  v550()
  if not main then return end
  local v399=v152.AbsolutePosition
  local v1027=v152.AbsoluteSize.X
  v134=Instance.new("Frame")
  v134.Size=UDim2.fromOffset(v1027,#v722*28+4)
  v134.Position=UDim2.fromOffset(v399.X,v399.Y+v152.AbsoluteSize.Y+2)
  v134.BackgroundColor3=Theme.InputBg
  v134.BorderSizePixel=0
  v134.ZIndex=200
  v134.Parent=gui
  corner(v134,6)
  stroke(v134,Theme.Stroke,1,0.35)
  for v28,v485 in ipairs(v722) do
  local v232=Instance.new("TextButton")
  v232.Size=UDim2.new(1,-4,0,26)
  v232.Position=UDim2.new(0,2,0,(v28-1)*28+2)
  v232.BackgroundColor3=v485==v181 and (Theme.SidebarActive or Color3.fromRGB(245,245,247)) or Theme.InputBg
  v232.Text=v485
  v232.TextColor3=v485==v181 and (Theme.SidebarActiveText or Color3.fromRGB(18,18,20)) or Theme.Text
  v232.Font=Enum.Font.Nunito
  v232.TextSize=9
  v232.AutoButtonColor=false
  v232.ZIndex=201
  v232.Parent=v134
  corner(v232,4)
  v232.MouseButton1Click:Connect(function()
  v988(v485)
  if v933 then v933(v485) end
  v550()
  end)
  end
  v549=UIS.InputBegan:Connect(function(v80)
  if v80.UserInputType~=Enum.UserInputType.MouseButton1 and v80.UserInputType~=Enum.UserInputType.Touch then return end
  local v23=v80.Position
  local v1153=v134 and v23.X>=v134.AbsolutePosition.X and v23.X<=v134.AbsolutePosition.X+v134.AbsoluteSize.X and v23.Y>=v134.AbsolutePosition.Y and v23.Y<=v134.AbsolutePosition.Y+v134.AbsoluteSize.Y
  local v1152=v23.X>=v399.X and v23.X<=v399.X+v1027 and v23.Y>=v399.Y and v23.Y<=v399.Y+v152.AbsoluteSize.Y
  if not v1153 and not v1152 then v550() end
  end)
  end
  v152.MouseButton1Click:Connect(function() if v134 then v550() else v1210() end end)
  return v988
end


_allAnimalNames = nil
function getAllAnimalNames()
  if _allAnimalNames and #_allAnimalNames > 0 then return _allAnimalNames end
  _allAnimalNames = {}
  pcall(function()
  local v382 = ReplicatedStorage:FindFirstChild("Animations")
  v382 = v382 and v382:FindFirstChild("Animals")
  if not v382 then

  local v929 = ReplicatedStorage:FindFirstChild("Models")
  v382 = v929 and v929:FindFirstChild("Animals")
  end
  if v382 then
  local v220 = {}
  for idx, v24 in ipairs(v382:GetChildren()) do
  if not v220[v24.Name] then
  v220[v24.Name] = true
  table.insert(_allAnimalNames, v24.Name)
  end
  end
  table.sort(_allAnimalNames, function(v27, v29) return v27:lower() < v29:lower() end)
  end
  end)
  return _allAnimalNames
end
task.spawn(getAllAnimalNames)


_priDragState = {active = false, fromIndex = nil, ghostFrame = nil, overlay = nil}

function cleanupPriDrag()
  if _priDragState.ghostFrame then pcall(function() _priDragState.ghostFrame:Destroy() end); _priDragState.ghostFrame = nil end
  if _priDragState.overlay then pcall(function() _priDragState.overlay:Destroy() end); _priDragState.overlay = nil end
  _priDragState.active = false; _priDragState.fromIndex = nil
end

function makePriorityRow(v132)
  local v31=Instance.new("Frame"); v31.Size=UDim2.new(1,-4,0,31); v31.BackgroundColor3=Theme.Panel; v31.BackgroundTransparency=UITransparency.Row; v31.Parent=mainBody; corner(v31,6); v31.LayoutOrder=v132


  local v105=Instance.new("TextLabel"); v105.Size=UDim2.new(0,24,1,0); v105.Position=UDim2.new(0,4,0,0); v105.BackgroundTransparency=1; v105.Text=tostring(v132).."."; v105.TextColor3=Theme.Dim; v105.Font=Enum.Font.GothamBold; v105.TextSize=14; v105.TextXAlignment=Enum.TextXAlignment.Left; v105.Parent=v31

  local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-120,1,0); v36.Position=UDim2.new(0,34,0,0); v36.BackgroundTransparency=1; v36.Text=priorityList[v132]; v36.TextColor3=Theme.Text; v36.Font=Enum.Font.GothamBold; v36.TextSize=14; v36.TextXAlignment=Enum.TextXAlignment.Left; v36.TextTruncate=Enum.TextTruncate.AtEnd; v36.Parent=v31

  local v113=Instance.new("TextButton"); v113.Name="WhiteTextBtn"; v113.Size=UDim2.new(0,26,0,22); v113.Position=UDim2.new(1,-86,0.5,-11); v113.BackgroundColor3=Theme.Accent; v113.BackgroundTransparency=UITransparency.Toggle; v113.Text="▲"; v113.TextColor3=Color3.fromRGB(18,18,20); v113.Font=Enum.Font.GothamBold; v113.TextSize=14; v113.Parent=v31; corner(v113,5)
  local v299=Instance.new("TextButton"); v299.Name="WhiteTextBtn"; v299.Size=UDim2.new(0,26,0,22); v299.Position=UDim2.new(1,-56,0.5,-11); v299.BackgroundColor3=Theme.Accent; v299.BackgroundTransparency=UITransparency.Toggle; v299.Text="▼"; v299.TextColor3=Color3.fromRGB(18,18,20); v113.Font=Enum.Font.GothamBold; v113.TextSize=14; v113.Parent=v31; corner(v299,5)
  local v228=Instance.new("TextButton"); v228.Name="WhiteTextBtn"; v228.Size=UDim2.new(0,26,0,22); v228.Position=UDim2.new(1,-26,0.5,-11); v228.BackgroundColor3=Theme.Red; v228.BackgroundTransparency=UITransparency.Toggle; v228.Text="X"; v228.TextColor3=Color3.new(1,1,1); v228.Font=Enum.Font.GothamBold; v228.TextSize=14; v228.Parent=v31; corner(v228,5)
  v113.MouseButton1Click:Connect(function() if v132>1 then priorityList[v132],priorityList[v132-1]=priorityList[v132-1],priorityList[v132]; Config.PriorityList=priorityList; saveConfig(); loadTab("Priority") end end)
  v299.MouseButton1Click:Connect(function() if v132<#priorityList then priorityList[v132],priorityList[v132+1]=priorityList[v132+1],priorityList[v132]; Config.PriorityList=priorityList; saveConfig(); loadTab("Priority") end end)
  v228.MouseButton1Click:Connect(function() local v972=priorityList[v132]; table.remove(priorityList,v132); if not Config.RemovedFromPriority then Config.RemovedFromPriority={} end; local v821=false; for idx,v745 in ipairs(Config.RemovedFromPriority) do if v745==v972 then v821=true; break end end; if not v821 then table.insert(Config.RemovedFromPriority,v972) end; Config.PriorityList=priorityList; saveConfig(); loadTab("Priority") end)


  local v364 = Instance.new("TextButton"); v364.Size=UDim2.new(0,24,1,0); v364.Position=UDim2.new(0,0,0,0); v364.BackgroundTransparency=1; v364.Text=""; v364.ZIndex=9; v364.Parent=v31
  v364.InputBegan:Connect(function(v80)
  if v80.UserInputType ~= Enum.UserInputType.MouseButton1 and v80.UserInputType ~= Enum.UserInputType.Touch then return end
  cleanupPriDrag()
  _priDragState.active = true; _priDragState.fromIndex = v132

  local v90 = Instance.new("Frame"); v90.Size = UDim2.new(0, v31.AbsoluteSize.X, 0, 31)
  v90.BackgroundColor3 = Theme.Accent; v90.BackgroundTransparency = 0.55; v90.BorderSizePixel = 0; v90.ZIndex = 100
  v90.Parent = gui_sg; corner(v90, 6)
  local v367 = Instance.new("TextLabel"); v367.Size = UDim2.new(1,0,1,0); v367.BackgroundTransparency = 1; v367.Text = tostring(v132)..". "..priorityList[v132]; v367.TextColor3 = Color3.fromRGB(18,18,20); v367.Font = Enum.Font.GothamBold; v367.TextSize = 10; v367.Parent = v90
  _priDragState.ghostFrame = v90

  local v924, v867
  v924 = UIS.InputChanged:Connect(function(v576)
  if v576.UserInputType == Enum.UserInputType.MouseMovement or v576.UserInputType == Enum.UserInputType.Touch then
  v90.Position = UDim2.new(0, v576.Position.X - v90.AbsoluteSize.X/2, 0, v576.Position.Y - 15)
  end
  end)
  v867 = UIS.InputEnded:Connect(function(v681)
  if v681.UserInputType ~= Enum.UserInputType.MouseButton1 and v681.UserInputType ~= Enum.UserInputType.Touch then return end
  v924:Disconnect(); v867:Disconnect()
  if not _priDragState.active then cleanupPriDrag(); return end


  local v1118 = v681.Position.Y
  local v312 = #priorityList
  for idx, v24 in ipairs(mainBody:GetChildren()) do
  if v24:IsA("Frame") and v24.LayoutOrder and v24.LayoutOrder >= 1 and v24.LayoutOrder <= #priorityList then
  local v1070 = v24.AbsolutePosition.Y
  local v1069 = v24.AbsoluteSize.Y
  if v1118 < v1070 + v1069 / 2 then
  v312 = v24.LayoutOrder
  break
  end
  end
  end
  local v559 = _priDragState.fromIndex
  cleanupPriDrag()
  if v559 and v312 and v559 ~= v312 then
  local v61 = table.remove(priorityList, v559)
  if v312 > v559 then v312 = v312 - 1 end
  v312 = math.clamp(v312, 1, #priorityList + 1)
  table.insert(priorityList, v312, v61)
  Config.PriorityList = priorityList; saveConfig()
  loadTab("Priority")
  end
  end)
  end)
end

function makePriorityAddRow()
  local v143 = Instance.new("Frame"); v143.Size=UDim2.new(1,-4,0,31); v143.BackgroundColor3=Theme.SoftAccent; v143.BackgroundTransparency=UITransparency.SoftRow; v143.ClipsDescendants=false; v143.Parent=mainBody; v143.ZIndex=20; corner(v143,6); v143.LayoutOrder = -2

  local v67=Instance.new("TextBox"); v67.Size=UDim2.new(1,-60,1,-6); v67.Position=UDim2.new(0,6,0,3); v67.BackgroundColor3=Theme.InputBg; v67.BackgroundTransparency=UITransparency.Input; v67.BorderSizePixel=0; v67.Text=""; v67.PlaceholderText="Enter pet name..."; v67.TextColor3=Theme.Text; v67.PlaceholderColor3=Theme.Dim; v67.Font=Enum.Font.Nunito; v67.TextSize=10; v67.ClearTextOnFocus=false; v67.Parent=v143; v67.ZIndex=21; corner(v67,4)

  local v193=Instance.new("TextButton"); v193.Name="WhiteTextBtn"; v193.Size=UDim2.new(0,44,0,25); v193.Position=UDim2.new(1,-50,0.5,-12.5); v193.BackgroundColor3=Theme.Accent; v193.BackgroundTransparency=UITransparency.Toggle; v193.Text="ADD"; v193.TextColor3=Color3.fromRGB(18,18,20); v193.Font=Enum.Font.GothamBold; v193.TextSize=10; v193.AutoButtonColor=false; v193.Parent=v143; v193.ZIndex=21; corner(v193,5)


  local v142 = Instance.new("Frame"); v142.Name="PriorityDropdown"; v142.Size=UDim2.new(1,-60,0,0); v142.Position=UDim2.new(0,6,1,2)
  v142.BackgroundColor3=Theme.Background; v142.BackgroundTransparency=UITransparency.Panel; v142.BorderSizePixel=0; v142.ClipsDescendants=true; v142.Visible=false; v142.ZIndex=50; v142.Parent=v143; corner(v142,6)
  local v672 = Instance.new("UIStroke"); v672.Color=Theme.AccentLight; v672.Thickness=1; v672.Parent=v142
  local v209 = Instance.new("ScrollingFrame"); v209.Size=UDim2.new(1,0,1,0); v209.BackgroundTransparency=1; v209.BorderSizePixel=0; v209.ScrollBarThickness=3; v209.ScrollBarImageColor3=Theme.Accent; v209.CanvasSize=UDim2.new(0,0,0,0); v209.Active=true; v209.ZIndex=51; v209.Parent=v142
  local v551 = Instance.new("UIListLayout"); v551.Padding=UDim.new(0,1); v551.Parent=v209
  v551:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() v209.CanvasSize=UDim2.new(0,0,0,v551.AbsoluteContentSize.Y) end)

  local function v819(v30)
  local v512 = v30:match("^%s*(.-)%s*$")
  if not v512 or v512 == "" then return end
  local v246 = false
  for idx, v89 in ipairs(priorityList) do if v89 == v512 then v246 = true; break end end
  if not v246 then
  table.insert(priorityList, v512)
  if Config.RemovedFromPriority then
  for v28=#Config.RemovedFromPriority,1,-1 do
  if Config.RemovedFromPriority[v28] == v512 then table.remove(Config.RemovedFromPriority, v28) end
  end
  end
  Config.PriorityList=priorityList; saveConfig()
  end
  v67.Text=""; v142.Visible=false; loadTab("Priority")
  end

  local function v1017(v734)
  for idx, v34 in ipairs(v209:GetChildren()) do if v34:IsA("TextButton") then v34:Destroy() end end
  if not v734 or v734 == "" then v142.Visible = false; return end
  local v575 = getAllAnimalNames()
  local v1244 = v734:lower()
  local v474 = {}
  for idx, v30 in ipairs(v575) do
  if v30:lower():find(v1244, 1, true) then
  local v246 = false
  for idx, v89 in ipairs(priorityList) do if v89 == v30 then v246 = true; break end end
  if not v246 then table.insert(v474, v30); if #v474 >= 8 then break end end
  end
  end
  if #v474 == 0 then v142.Visible = false; return end
  local v903 = 24
  v142.Size = UDim2.new(1,-60,0,math.min(#v474,6)*v903)
  v142.Visible = true
  for idx, v30 in ipairs(v474) do
  local v39 = Instance.new("TextButton"); v39.Size=UDim2.new(1,0,0,v903); v39.BackgroundColor3=Theme.Row; v39.BackgroundTransparency=UITransparency.Dropdown; v39.Text=v30; v39.TextColor3=Theme.Text; v39.Font=Enum.Font.Nunito; v39.TextSize=10; v39.AutoButtonColor=false; v39.ZIndex=52; v39.Parent=v209
  v39.MouseEnter:Connect(function() v39.BackgroundColor3=Theme.RowHover end)
  v39.MouseLeave:Connect(function() v39.BackgroundColor3=Theme.Row end)
  v39.MouseButton1Click:Connect(function() v819(v30) end)
  end
  end

  v67:GetPropertyChangedSignal("Text"):Connect(function() v1017(v67.Text) end)
  v67.FocusLost:Connect(function() task.delay(0.15, function() v142.Visible = false end) end)
  v67.Focused:Connect(function() if v67.Text ~= "" then v1017(v67.Text) end end)

  v193.MouseButton1Click:Connect(function() v819(v67.Text) end)
end

function makePriorityRestoreRow()
  if not Config.RemovedFromPriority or #Config.RemovedFromPriority == 0 then return end
  local v31=Instance.new("Frame"); v31.Size=UDim2.new(1,-4,0,31); v31.BackgroundColor3=Theme.SoftAccent; v31.BackgroundTransparency=UITransparency.SoftRow; v31.Parent=mainBody; corner(v31,6); v31.LayoutOrder = -1
  local v36=Instance.new("TextLabel"); v36.Size=UDim2.new(1,-96,1,0); v36.Position=UDim2.new(0,8,0,0); v36.BackgroundTransparency=1; v36.Text=tostring(#Config.RemovedFromPriority).." ignored pet(s) available"; v36.TextColor3=Theme.Dim; v36.Font=Enum.Font.Nunito; v36.TextSize=10; v36.TextXAlignment=Enum.TextXAlignment.Left; v36.Parent=v31
  local v219=Instance.new("TextButton"); v219.Name="WhiteTextBtn"; v219.Size=UDim2.new(0,74,0,25); v219.Position=UDim2.new(1,-80,0.5,-12.5); v219.BackgroundColor3=Theme.Green; v219.BackgroundTransparency=UITransparency.Toggle; v219.Text="RESTORE"; v219.TextColor3=Color3.fromRGB(18,18,20); v219.Font=Enum.Font.GothamBold; v219.TextSize=10; v219.AutoButtonColor=false; v219.Parent=v31; corner(v219,5)
  v219.MouseButton1Click:Connect(function()
  for idx, v30 in ipairs(Config.RemovedFromPriority) do
  local v246 = false
  for idx, v89 in ipairs(priorityList) do
  if v89 == v30 then v246 = true; break end
  end
  if not v246 then table.insert(priorityList, v30) end
  end
  Config.RemovedFromPriority = {}
  Config.PriorityList = priorityList
  saveConfig()
  loadTab("Priority")
  end)
end

function makeSectionDivider(v69, v100)
  local v49 = Instance.new("Frame", v69)
  v49.Size = UDim2.new(1, -4, 0, 26)
  v49.BackgroundTransparency = 1

  local v33 = Instance.new("Frame", v49)
  v33.Size = UDim2.new(1, 0, 0, 1)
  v33.Position = UDim2.new(0, 0, 0.5, 0)
  v33.BackgroundColor3 = Theme.Stroke
  v33.BackgroundTransparency = 0.5
  v33.BorderSizePixel = 0
  v33.ZIndex = 0

  local v36 = Instance.new("TextLabel", v49)
  v36.Size = UDim2.new(0, 120, 1, 0)
  v36.Position = UDim2.new(0.5, -60, 0, 0)
  v36.BackgroundColor3 = Theme.MainBackground
  v36.BorderSizePixel = 0
  v36.Text = "— " .. string.upper(v100) .. " —"
  v36.TextColor3 = Theme.Dim or Color3.fromRGB(180, 180, 190)
  v36.Font = UIFont.Title
  v36.TextSize = 10
end

function loadMainMenu()
  UI.CurrentTab = "MainMenu"
  clearBody(mainBody)
  pcall(function() mainBody:FindFirstChildOfClass("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder end)

  local v1092 = {"Auto TP", "Misc", "UI", "GUI", "Priority", "Keybinds"}
  for v28, v30 in ipairs(v1092) do
  local v39 = Instance.new("TextButton", mainBody)
  v39.Size = UDim2.new(1, -4, 0, 42)
  v39.BackgroundColor3 = Theme.Row
  v39.Text = v30
  v39.TextColor3 = Theme.Text
  v39.Font = Enum.Font.GothamBold
  v39.TextSize = 14
  v39.AutoButtonColor = false
  v39.LayoutOrder = v28 * 10
  corner(v39, 6)
  addOutline(v39)

  v39.MouseButton1Click:Connect(function()
  loadTab(v30)
  end)

  if v30 == "Auto TP" then
  local v875 = createBlackSlider(mainBody,"FOV",Config.FOV or 70,50,120,function(v26) Config.FOV=v26; saveConfig(); pcall(function() Workspace.CurrentCamera.FieldOfView=v26 end) end,false,1)
  if v875 then v875.LayoutOrder = (v28 * 10) + 1 end
  end
  end
end

function makeBackButton(v69)
  local v31 = Instance.new("Frame", v69)
  v31.Size = UDim2.new(1, -4, 0, 32)
  v31.BackgroundTransparency = 1

  local v39 = Instance.new("TextButton", v31)
  v39.Size = UDim2.new(1, 0, 1, 0)
  v39.BackgroundColor3 = Theme.ToggleOff or Color3.fromRGB(40,40,40)
  v39.Text = "< VOLTAR"
  v39.TextColor3 = Color3.fromRGB(0, 85, 255)
  v39.Font = Enum.Font.GothamBold
  v39.TextSize = 12
  v39.AutoButtonColor = false
  corner(v39, 6)
  addOutline(v39)

  v39.MouseButton1Click:Connect(function()
  loadMainMenu()
  end)
  return v39
end

function loadTab(v311)
  if v311 == "MainMenu" then
  return loadMainMenu()
  end

  local v1209 = (mainBody and mainBody.CanvasPosition and mainBody.CanvasPosition.Y) or 0
  clearBody(mainBody)
  pcall(function() mainBody:FindFirstChildOfClass("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder end)
  makeBackButton(mainBody)

  if v311=="Keybinds" then

  for idx,v30 in ipairs({"Kick","Clone","Manual TP","Invisible Steal","Proximity","Carpet Boost","Open Menu","Ragdoll Self","Reset","Auto Buy","Click to AP"}) do makeKeybindRow(mainBody,v30) end

  elseif v311=="Auto TP" then
  local v1197 = math.clamp((parseMinGen(Config.TpSettings.MinGenForTp) or 0) / 1000000, 0, 100)
  createBlackSlider(mainBody,"Min Gen for Auto TP",v1197,0,100,function(v26)
  Config.TpSettings.MinGenForTp = tostring(math.floor(v26 + 0.5)) .. "M"
  saveConfig()
  SharedState.ListNeedsRedraw = true
  end,false,5,"M")
  makeMainToggle(mainBody,"Grabble TP",Config.TpSettings.GrabbleTP == true,function(v38)
  Config.TpSettings.GrabbleTP = v38
  saveConfig()
  end)
  makeMainToggle(mainBody,"Auto Steal",Config.AutoStealEnabled == true,function(v38)
  Config.AutoStealEnabled = v38
  autoStealEnabled = v38
  if _G.CLTHUBAutoSteal then pcall(_G.CLTHUBAutoSteal, v38) end
  setToggle("Auto Steal", v38, true)
  saveConfig()
  end)
  makeMainToggle(mainBody,"TP on Load",Config.TpSettings.TpOnLoad,function(v38) Config.TpSettings.TpOnLoad=v38; saveConfig() end)
  local v1287={"Flying Carpet","Cupid's Wings","Santa's Sleigh","Witch's Broom","Waverider"}
  makeMainButton(mainBody, "Tp Speed", function()
  if tpSpeedSettingsPanel.Visible then closeAnim(tpSpeedSettingsPanel) else openAnim(tpSpeedSettingsPanel) end
  end, Theme.Panel)
  makeToolDropdown(mainBody,"Teleport Tool",v1287,Config.TpSettings.Tool or "Flying Carpet",function(v1005)
  Config.TpSettings.Tool=v1005; saveConfig(); ShowNotification("TP TOOL",v1005)
  end,14)

  elseif v311=="UI" then
  for idx,v30 in ipairs({"Invisible Steal Panel","Admin Command Painel","Actions","Steal Target"}) do
  makeMainToggle(mainBody,v30,panels[v30].Visible,function(v38)
  Config.Visibilities[v30]=v38
  saveConfig()
  if v38 then openAnim(panels[v30]) else closeAnim(panels[v30]) end
  end)
  end
  makeMainToggle(mainBody,"Auto Close Main UI on Execute",Config.AutoCloseOnExec,function(v38) Config.AutoCloseOnExec=v38; saveConfig() end)


  makeMainToggle(mainBody,"Priority Sound Alert",Config.PrioritySoundAlert,function(v38) Config.PrioritySoundAlert=v38; saveConfig() end)
  makeMainTextBox(mainBody,"Custom Sound ID",Config.PrioritySoundID or "e.g. 123456789","e.g. 123456789",function(v26) Config.PrioritySoundID=v26; saveConfig() end)

  elseif v311=="GUI" then
  if not Config.PanelScales then Config.PanelScales={} end
  local function v348(v30, v71, v1033)
  createBlackSlider(mainBody, v30, (Config.PanelScales[v1033] or 1)*100, 50, 150, function(v26)
  Config.PanelScales[v1033] = v26/100; saveConfig()
  if v71 then
  local v201 = v71:FindFirstChild("CLTHUBScale")
  if not v201 then
  v201 = Instance.new("UIScale")
  v201.Name = "CLTHUBScale"
  v201.Parent = v71
  end
  v201.Scale = v26/100
  end
  end, false, 5, "%")
  end
  v348("Main Painel Scale", main, "CLTHUB")
  v348("ACTIONS", panels["Actions"], "CLTHUB\nActions")
  v348("INVISIBLE STEAL", panels["Invisible Steal Panel"], "CLTHUB\nInvisible Steal")
  v348("ADMIN COMMAND PAINEL", panels["Admin Command Painel"], "CLTHUB\nAdmin Command Painel")
  v348("STEAL TARGET", panels["Steal Target"], "CLTHUB\nSteal Target")
  v348("TP & CLONE SETTINGS", tpSpeedSettingsPanel, "CLTHUB\nTP & Clone Settings")
  v348("ACTION SETTINGS", actionSettingsPanel, "CLTHUB\nAction Settings")

  elseif v311=="Misc" then

  setToggle("Instant Clone", true, true)
  _G.AutoInvisDuringSteal = true; Config.AutoInvisDuringSteal = true; saveConfig()
  Config.AntiRagdoll = true; if startAntiRagdoll then startAntiRagdoll() end; setToggle("Anti Ragdoll", true, true)

  createBlackSlider(mainBody,"Distance",Config.ProximityRange or 15,1,50,function(v26) Config.ProximityRange=v26; saveConfig() end,false,1)
  makeMainTextBox(mainBody,"Private Server Code",PrivateServerCode,"e.g. ABC123XYZ...",function(v26) PrivateServerCode=v26; savePSCode() end,14)
  makeMainToggle(mainBody,"XRay",Config.XRay == true,function(v38)
  if setXRay then pcall(setXRay, v38) else Config.XRay = v38; saveConfig() end
  end)
  makeMainToggle(mainBody,"Base Owner ESP",Config.BaseOwnerESP == true,function(v38)
  if _G.setBaseOwnerESP then pcall(_G.setBaseOwnerESP, v38) else Config.BaseOwnerESP = v38; saveConfig() end
  end)
  makeMainToggle(mainBody,"LineToBase",Config.LineToBase == true,function(v38)
  Config.LineToBase = v38; saveConfig()
  if v38 then pcall(function() if _G.createPlotBeam then _G.createPlotBeam() end end)
  else pcall(function() if _G.resetPlotBeam then _G.resetPlotBeam() end end) end
  end)
  makeMainToggle(mainBody,"LineToBrainrot",Config.LineToBrainrot == true,function(v38)
  Config.LineToBrainrot = v38; saveConfig()
  if not v38 then pcall(function() if _G.resetBrainrotBeam then _G.resetBrainrotBeam() end end) end
  end)
  makeMainToggle(mainBody,"Brainrot ESP",Config.BrainrotESP == true,function(v38)
  Config.BrainrotESP = v38; brainrotESPEnabled = v38; saveConfig()
  if v38 then pcall(function() if _G.updateBrainrotOverheadVisibility then _G.updateBrainrotOverheadVisibility() end end)
  else pcall(function() if clearBrainrotESP then clearBrainrotESP() end end) end
  end)
  makeMainToggle(mainBody,"Anti-Bee/Disco",Config.AntiBeeDisco == true,function(v38)
  Config.AntiBeeDisco = v38; saveConfig()
  local v644 = _G.ANTI_BEE_DISCO
  if v644 then pcall(v38 and v644.Enable or v644.Disable) end
  setToggle("AntiBeeDisco", v38, true)
  setToggle("Anti-Bee & Anti-Disco", v38, true)
  end)
  makeMainToggle(mainBody,"Auto Reset Balloon",Config.AutoResetBalloon == true,function(v38)
  Config.AutoResetBalloon = v38; setToggle("Auto Reset Balloon", v38, true); saveConfig()
  end)
  makeMainToggle(mainBody,"Clear Error Popups",Config.CleanErrorGUIs == true,function(v38)
  Config.CleanErrorGUIs = v38; saveConfig()
  end)
  makeMainToggle(mainBody,"Click to AP",Config.ClickToAP,function(v38) Config.ClickToAP=v38; saveConfig() end)
  makeMainToggle(mainBody,"Auto Unlock During Steal",Config.AutoUnlockOnSteal,function(v38) Config.AutoUnlockOnSteal=v38; saveConfig() end)
  makeSyncMainToggle(mainBody,"Auto Kick On Steal","Auto Kick",function(v38) Config.AutoKickOnSteal=v38; saveConfig() end)
  makeMainToggle(mainBody,"Kick to Private Server",Config.KickToPrivateServer,function(v38) Config.KickToPrivateServer=v38; saveConfig() end)

  makeMainToggle(mainBody,"+FPS",Config.FPSBoost == true,function(v38)
  if _G.toggleFPSBoost then _G.toggleFPSBoost(v38)
  else Config.FPSBoost=v38; Config.FPSBoostPets=v38; saveConfig() end
  if v38 and _G.ApplyFPSBoost then _G.ApplyFPSBoost() end
  end)

  local function v1320(v333, v1276, v841, v489, v935)
  if panels[v333] then
  panels[v333].Visible = not panels[v333].Visible
  return
  end


  if not Config[v489] then
  Config[v489] = {}
  for v28, v47 in ipairs(AP_ALL_COMMANDS) do Config[v489][v28] = v47 end
  end
  local v227 = Config[v489]

  local v175 = Instance.new("Frame")
  v175.Name = v333
  v175.Size = UDim2.fromOffset(240, 0)
  v175.AutomaticSize = Enum.AutomaticSize.Y
  v175.Position = v333 == "AdminPanelCmds" and UDim2.new(0.5, 200, 0.5, -200) or UDim2.new(0.5, 200, 0.5, -50)
  v175.BackgroundColor3 = Theme.Background
  v175.BackgroundTransparency = UITransparency.ConfigPanel
  v175.BorderSizePixel = 0
  v175.ZIndex = 100
  v175.Parent = gui_sg
  panels[v333] = v175
  corner(v175, 10)
  stroke(v175, Theme.Accent, 1.5, 0.3)
  makeDraggable(v175, v175)

  local v274 = Instance.new("TextLabel")
  v274.Size = UDim2.new(1, 0, 0, 28)
  v274.BackgroundColor3 = Theme.Panel
  v274.BackgroundTransparency = 0.3
  v274.Text = v1276
  v274.TextColor3 = Theme.Text
  v274.Font = Enum.Font.GothamBold
  v274.TextSize = 12
  v274.ZIndex = 101
  v274.Parent = v175
  corner(v274, 8)

  local v174 = Instance.new("Frame")
  v174.Size = UDim2.new(1, -8, 0, 0)
  v174.AutomaticSize = Enum.AutomaticSize.Y
  v174.Position = UDim2.fromOffset(4, 32)
  v174.BackgroundTransparency = 1
  v174.ZIndex = 101
  v174.Parent = v175
  Instance.new("UIListLayout", v174).SortOrder = Enum.SortOrder.LayoutOrder
  v174:FindFirstChildOfClass("UIListLayout").Padding = UDim.new(0, 2)

  local v736 = {}
  local v721 = {}

  local function v1240()
  for v28, v47 in ipairs(v227) do
  if v736[v47] then v736[v47].LayoutOrder = v28 end
  if v721[v47] then v721[v47].Text = tostring(v28) end
  end
  end

  local function v995(v570, v571)
  if v570 < 1 or v571 < 1 or v570 > #v227 or v571 > #v227 then return end
  v227[v570], v227[v571] = v227[v571], v227[v570]
  Config[v489] = v227
  saveConfig()
  v1240()
  end

  for v72, v47 in ipairs(v227) do
  local v866 = AP_COMMAND_EMOJIS[v47] or "⚡"
  local v327 = v841[v47] == true
  local v31 = Instance.new("Frame")
  v31.Size = UDim2.new(1, 0, 0, 28)
  v31.BackgroundColor3 = Theme.Panel
  v31.BackgroundTransparency = UITransparency.RowAlt
  v31.LayoutOrder = v72
  v31.ZIndex = 102
  v31.Parent = v174
  corner(v31, 5)
  v736[v47] = v31


  local v282 = Instance.new("TextLabel")
  v282.Size = UDim2.fromOffset(16, 28)
  v282.Position = UDim2.fromOffset(2, 0)
  v282.BackgroundTransparency = 1
  v282.Text = tostring(v72)
  v282.TextColor3 = Theme.Dim
  v282.Font = Enum.Font.GothamBold
  v282.TextSize = 10
  v282.ZIndex = 103
  v282.Parent = v31
  v721[v47] = v282


  local v267 = Instance.new("TextButton")
  v267.Size = UDim2.fromOffset(16, 13)
  v267.Position = UDim2.fromOffset(18, 1)
  v267.BackgroundTransparency = 1
  v267.Text = "▲"
  v267.TextColor3 = Theme.AccentLight
  v267.Font = Enum.Font.GothamBold
  v267.TextSize = 8
  v267.AutoButtonColor = false
  v267.ZIndex = 103
  v267.Parent = v31


  local v247 = Instance.new("TextButton")
  v247.Size = UDim2.fromOffset(16, 13)
  v247.Position = UDim2.fromOffset(18, 14)
  v247.BackgroundTransparency = 1
  v247.Text = "▼"
  v247.TextColor3 = Theme.AccentLight
  v247.Font = Enum.Font.GothamBold
  v247.TextSize = 8
  v247.AutoButtonColor = false
  v247.ZIndex = 103
  v247.Parent = v31

  v267.MouseButton1Click:Connect(function()
  local v245
  for v28, v34 in ipairs(v227) do if v34 == v47 then v245 = v28; break end end
  if v245 and v245 > 1 then v995(v245, v245 - 1) end
  end)
  v247.MouseButton1Click:Connect(function()
  local v245
  for v28, v34 in ipairs(v227) do if v34 == v47 then v245 = v28; break end end
  if v245 and v245 < #v227 then v995(v245, v245 + 1) end
  end)


  local v37 = Instance.new("TextLabel")
  v37.Size = UDim2.new(1, -90, 1, 0)
  v37.Position = UDim2.fromOffset(36, 0)
  v37.BackgroundTransparency = 1
  v37.Text = v866 .. " " .. v47
  v37.TextColor3 = Theme.Text
  v37.Font = Enum.Font.Nunito
  v37.TextSize = 11
  v37.TextXAlignment = Enum.TextXAlignment.Left
  v37.ZIndex = 103
  v37.Parent = v31


  local v39 = Instance.new("TextButton")
  v39.Size = UDim2.fromOffset(36, 18)
  v39.Position = UDim2.new(1, -42, 0.5, -9)
  v39.BackgroundColor3 = v327 and Theme.Green or Theme.ToggleOff
  v39.Text = v327 and "ON" or "OFF"
  v39.TextColor3 = Color3.new(1, 1, 1)
  v39.Font = Enum.Font.GothamBold
  v39.TextSize = 9
  v39.AutoButtonColor = false
  v39.ZIndex = 103
  v39.Parent = v31
  corner(v39, 5)

  v39.MouseButton1Click:Connect(function()
  v327 = not v327
  v841[v47] = v327
  saveConfig()
  v39.BackgroundColor3 = v327 and Theme.Green or Theme.ToggleOff
  v39.Text = v327 and "ON" or "OFF"
  if v935 then v935(v47, v327) end
  end)
  end

  if v333 == "ClickToAPCmds" then
  local function v504(v45)
  if v45:IsA("GuiObject") then
  v45.ZIndex = 103
  end
  for idx, v24 in ipairs(v45:GetChildren()) do
  v504(v24)
  end
  end

  local v120 = Instance.new("Frame")
  v120.Size = UDim2.new(1, -8, 0, 1)
  v120.Position = UDim2.new(0, 4, 0, 0)
  v120.BackgroundColor3 = Theme.Stroke
  v120.BackgroundTransparency = 0.2
  v120.LayoutOrder = 1000
  v120.ZIndex = 103
  v120.Parent = v174

  local v148 = Instance.new("TextLabel")
  v148.Size = UDim2.new(1, 0, 0, 24)
  v148.BackgroundTransparency = 1
  v148.Text = "Settings"
  v148.TextColor3 = Theme.Accent
  v148.Font = Enum.Font.GothamBold
  v148.TextSize = 10
  v148.LayoutOrder = 1001
  v148.ZIndex = 103
  v148.Parent = v174

  local v435 = Instance.new("Frame")
  v435.Size = UDim2.new(1, 0, 0, 50)
  v435.BackgroundTransparency = 1
  v435.LayoutOrder = 1002
  v435.Parent = v174

  makeQuickSlider(v435, "Click Radius", 1, 50, Config.ClickToAPRadius or 8, function(v26)
  Config.ClickToAPRadius = v26
  saveConfig()
  end, " studs")
  v504(v435)
  end

  if v333 == "SpamBaseOwnerCmds" then
  local function v504(v45)
  if v45:IsA("GuiObject") then
  v45.ZIndex = 103
  end
  for idx, v24 in ipairs(v45:GetChildren()) do
  v504(v24)
  end
  end

  local v120 = Instance.new("Frame")
  v120.Size = UDim2.new(1, -8, 0, 1)
  v120.Position = UDim2.new(0, 4, 0, 0)
  v120.BackgroundColor3 = Theme.Stroke
  v120.BackgroundTransparency = 0.2
  v120.LayoutOrder = 1000
  v120.ZIndex = 103
  v120.Parent = v174

  local v148 = Instance.new("TextLabel")
  v148.Size = UDim2.new(1, 0, 0, 24)
  v148.BackgroundTransparency = 1
  v148.Text = "Settings"
  v148.TextColor3 = Theme.Accent
  v148.Font = Enum.Font.GothamBold
  v148.TextSize = 10
  v148.LayoutOrder = 1001
  v148.ZIndex = 103
  v148.Parent = v174

  local v31 = Instance.new("Frame")
  v31.Size = UDim2.new(1, 0, 0, 34)
  v31.BackgroundTransparency = 1
  v31.LayoutOrder = 1002
  v31.Parent = v174

  makeSyncStateRow(v31, "Single Command:", "SpamBaseOwnerSingleCommand", function(v38)
  Config.SpamBaseOwnerSingleCommand = v38
  saveConfig()
  end)
  v504(v31)
  end

  local v184 = Instance.new("Frame")
  v184.Size = UDim2.new(1, 0, 0, 6)
  v184.BackgroundTransparency = 1
  v184.LayoutOrder = 1004
  v184.Parent = v174
  end


  elseif v311=="Priority" then
  makePriorityAddRow(); makePriorityRestoreRow(); for v28=1,#priorityList do makePriorityRow(v28) end
  end
  local v72 = 0
  for idx, v24 in ipairs(mainBody:GetChildren()) do
  if v24:IsA("GuiObject") and not v24:IsA("UIListLayout") and not v24:IsA("UIPadding") then
  v72 = v72 + 1
  v24.LayoutOrder = v72
  end
  end

  task.defer(function()
  if mainBody then
  mainBody.CanvasPosition = Vector2.new(0, v1209)
  end
  end)
end


function hexToColor3(v117)
  if typeof(v117)=="Color3" then return v117 end
  if type(v117)~="string" then return nil end
  v117=v117:gsub("#",""):gsub("%s","")
  if #v117==3 then v117=v117:sub(1,1):rep(2)..v117:sub(2,2):rep(2)..v117:sub(3,3):rep(2) end
  if #v117~=6 or v117:find("%X") then return nil end
  return Color3.fromRGB(tonumber(v117:sub(1,2),16),tonumber(v117:sub(3,4),16),tonumber(v117:sub(5,6),16))
end

function setMenuAccent(v117)
  local v34=hexToColor3(v117); if not v34 then return false end
  local tmpInst=Themes.Nexus
  tmpInst.Accent=Color3.fromRGB(0, 85, 255); tmpInst.ToggleOn=Color3.fromRGB(0, 85, 255); tmpInst.SliderFill=Color3.fromRGB(0, 85, 255); tmpInst.SidebarActiveText=Color3.fromRGB(0, 85, 255)
  tmpInst.SoftAccent=v34:Lerp(Color3.fromRGB(19,21,26),0.78); tmpInst.SoftAccentHover=v34:Lerp(Color3.fromRGB(19,21,26),0.68)

  local v1181=0.299*v34.R+0.587*v34.G+0.114*v34.B
  tmpInst.ToggleKnobOn=(v1181>0.7) and Color3.fromRGB(18,18,20) or Color3.fromRGB(255,255,255)
  if Config then Config.AccentHex=(type(v117)=="string" and v117 or Config.AccentHex); if saveConfig then saveConfig() end end
  pcall(applyTheme,"Nexus")
  return true
end

_G.setMenuAccent=setMenuAccent

function _G.updateResizeGrips()
  for idx, v131 in ipairs(_G.__CLTHUBGrips or {}) do
  if v131 and v131.Parent then v131.Visible = not UI.Locked end
  end
end

for v311,v39 in pairs(tabButtons) do v39.MouseButton1Click:Connect(function() loadTab(v311) end) end


bottomBar=Instance.new("Frame"); bottomBar.Size=UDim2.new(0,0,0,78); bottomBar.AutomaticSize=Enum.AutomaticSize.X; bottomBar.AnchorPoint=Vector2.new(0.5,0); bottomBar.Position=UDim2.new(0.5,0,1,-145); bottomBar.BackgroundColor3=Color3.new(0,0,0); bottomBar.BackgroundTransparency=0; bottomBar.BorderSizePixel=0; bottomBar.ClipsDescendants=false; bottomBar.Parent=gui; local v833 = Instance.new("UICorner"); v833.CornerRadius = UDim.new(0, 9); v833.Parent = bottomBar
barPad=Instance.new("UIPadding"); barPad.PaddingLeft=UDim.new(0,4); barPad.PaddingRight=UDim.new(0,4); barPad.PaddingTop=UDim.new(0,1); barPad.PaddingBottom=UDim.new(0,1); barPad.Parent=bottomBar
barLay=Instance.new("UIListLayout"); barLay.FillDirection=Enum.FillDirection.Horizontal; barLay.VerticalAlignment=Enum.VerticalAlignment.Center; barLay.Padding=UDim.new(0,12); barLay.SortOrder=Enum.SortOrder.LayoutOrder; barLay.Parent=bottomBar


local v133 = game:GetService("RunService")
local v1129 = UDim2.new(0.5, 0, 1, -145)
v133.RenderStepped:Connect(function()
  if bottomBar and bottomBar.Parent then
  bottomBar.Position = v1129
  end
  if gui_sg and gui_sg.Parent then
  gui_sg.DisplayOrder = 2147483647
  end
end)


_G.updateLogoImage = function() end
topInfo=Instance.new("Frame"); topInfo.Name="TopInfo"; topInfo.LayoutOrder=1; topInfo.Size=UDim2.new(0,0,1,0); topInfo.AutomaticSize=Enum.AutomaticSize.X; topInfo.BackgroundTransparency=1; topInfo.Parent=bottomBar
topLay=Instance.new("UIListLayout"); topLay.FillDirection=Enum.FillDirection.Horizontal; topLay.VerticalAlignment=Enum.VerticalAlignment.Center; topLay.Padding=UDim.new(0,10); topLay.SortOrder=Enum.SortOrder.LayoutOrder; topLay.Parent=topInfo


local v297 = Instance.new("Frame")
v297.Name = "BrandLogoShell"
v297.LayoutOrder = 1
v297.Size = UDim2.new(0, 210, 0, 74)
v297.BackgroundColor3 = Color3.new(0, 0, 0)
v297.BorderSizePixel = 0
v297.ClipsDescendants = false
v297.Parent = topInfo
corner(v297, 9)

local v207 = Instance.new("ImageLabel")
v207.Name = "BrandLogo"
v207.Size = UDim2.new(0, 198, 0, 68)
v207.Position = UDim2.new(0, 6, 0, 3)
v207.BackgroundTransparency = 1
v207.BorderSizePixel = 0
v207.Image = "rbxassetid://117304106349487"
v207.ImageColor3 = Color3.new(1, 1, 1)
v207.ScaleType = Enum.ScaleType.Fit
v207.ClipsDescendants = true
v207.Parent = v297
corner(v207, 8)

local v197 = Instance.new("TextLabel")
v197.Name = "BrandDiscordOverlay"
v197.Position = UDim2.new(0, 0, 0, 41)
v197.Size = UDim2.new(1, 0, 0, 21)
v197.BackgroundColor3 = Color3.new(0, 0, 0)
v197.BackgroundTransparency = 0
v197.BorderSizePixel = 0
v197.Text = "DSC.GG/CLTHUB"
v197.TextColor3 = Color3.new(1, 1, 1)
v197.Font = Enum.Font.GothamBold
v197.TextSize = 15
v197.TextXAlignment = Enum.TextXAlignment.Center
v197.TextYAlignment = Enum.TextYAlignment.Center
v197.ZIndex = v207.ZIndex + 1
v197.Parent = v207


fpsText = Instance.new("TextLabel")
fpsText.Name = "FpsText"
fpsText.BackgroundColor3 = Theme.Background
fpsText.BackgroundTransparency = 0.08
fpsText.BorderSizePixel = 0
fpsText.AutomaticSize = Enum.AutomaticSize.None
fpsText.Size = UDim2.new(0, 210, 0, 34)
fpsText.RichText = true
fpsText.Font = Enum.Font.GothamBold
fpsText.TextSize = 15
fpsText.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
fpsText.TextStrokeTransparency = 0.15
fpsText.TextXAlignment = Enum.TextXAlignment.Center
fpsText.TextYAlignment = Enum.TextYAlignment.Center
fpsText.AnchorPoint = Vector2.new(0.5, 1)
fpsText.Position = UDim2.new(0.5, 0, 1, -151)
fpsText.Parent = gui
corner(fpsText, 7)
local v468 = Instance.new("UIStroke")
v468.Color = Theme.Accent
v468.Thickness = 1.5
v468.Transparency = 0
v468.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
v468.Parent = fpsText

_G.fpsText = fpsText

if type(_G.addLazyUI) == "function" then
  _G.addLazyUI(bottomBar, true)
end


frames,lastT=0,tick()
_G.currentFPS = 60
v133.RenderStepped:Connect(function()
  frames = frames + 1
  local v60 = tick()
  if v60 - lastT >= 1 then
  local v689 = frames
  _G.currentFPS = v689
  frames = 0
  lastT = v60
  local v728 = 0
  pcall(function() v728 = math.floor(LocalPlayer:GetNetworkPing() * 1000) end)

  if fpsText and fpsText.Parent then
  local v1121 = (v689 <= 50) and "rgb(255,0,0)" or "rgb(0,255,0)"
  local v1230 = (v728 >= 150) and "rgb(255,0,0)" or "rgb(0,255,0)"
  fpsText.Text = string.format("FPS  <font color=\"%s\"><b>%d</b></font>  •  PING  <font color=\"%s\"><b>%dms</b></font>", v1121, v689, v1230, v728)
  end
  end
end)


UIS.InputBegan:Connect(function(v80,v693)
  if v80.UserInputType~=Enum.UserInputType.Keyboard then return end
  local v700=v80.KeyCode.Name

  if Keybinds["Reset"] and Keybinds["Reset"]~="NONE" and v700==Keybinds["Reset"] then
  pcall(v363)
  return
  end
  if v693 then return end
  if v80.KeyCode==UI.OpenMenuKey then
  if main.Visible then
  closeAnim(main)
  if tpSpeedSettingsPanel and tpSpeedSettingsPanel.Visible then closeAnim(tpSpeedSettingsPanel) end
  if actionSettingsPanel and actionSettingsPanel.Visible then closeAnim(actionSettingsPanel) end
  local v645 = gui_sg and gui_sg:FindFirstChild("AdminPanelCmds")
  if v645 and v645.Visible then v645.Visible = false end
  local v669 = gui_sg and gui_sg:FindFirstChild("ClickToAPCmds")
  if v669 and v669.Visible then v669.Visible = false end
  local v739 = gui_sg and gui_sg:FindFirstChild("SpamBaseOwnerCmds")
  if v739 and v739.Visible then v739.Visible = false end
  else openAnim(main) end
  return end
  local v700=v80.KeyCode.Name
  local v128={
  ["Clone"]=instantClone,

  ["Carpet Boost"]=function() setCarpetSpeed(not CarpetState.enabled) end,
  ["Reset"]=v363, ["Kick"]=kickPlayer,
  ["Proximity"]=function() ProximityAPActive=not ProximityAPActive; setToggle("Proximity",ProximityAPActive) end,
  ["Ragdoll Self"]=function() pcall(runAdminCommand,player,"ragdoll") end,
  ["Invisible Steal"]=function() if _G.toggleInvisibleSteal then pcall(_G.toggleInvisibleSteal) end end,
  ["Manual TP"]=function() if _G.CLTHUBStartSideTP then task.spawn(_G.CLTHUBStartSideTP) end end,
  ["Auto Buy"]=function() toggleAutoBuy() end,
  ["Click to AP"]=function()
  Config.ClickToAP = not Config.ClickToAP
  saveConfig()
  setToggle("Click to AP", Config.ClickToAP)
  setToggle("ClickToAP", Config.ClickToAP)
  end,
  }
  for v347,v1168 in pairs(Keybinds) do if v1168==v700 and v128[v347] then v128[v347](); return end end
end)


if Config.TpSettings.TpOnLoad then task.spawn(function()
  local character = player.Character or player.CharacterAdded:Wait()


  local v899, v902 = false, false
  task.spawn(function() character:WaitForChild("HumanoidRootPart", 20); v899 = true end)
  task.spawn(function() character:WaitForChild("Humanoid", 20); v902 = true end)
  local v1279 = os.clock()
  while (not v899 or not v902) and os.clock() - v1279 < 20 do
  v133.Heartbeat:Wait()
  end


  if Config.TpSettings.GrabbleTP then
  local v387 = os.clock()
  while not _G.CLTHUBScannerReady and os.clock() - v387 < 15 do v133.Heartbeat:Wait() end
  if not _G.CLTHUBScannerReady then
  return
  end
  if bootMark then bootMark("TP firing") end
  if _G.CLTHUBStartSideTP then
  _G._isTpMoving = true
  task.spawn(_G.CLTHUBStartSideTP)
  end
  return
  end


  local v662 = 0
  while #SharedState.AllAnimalsCache == 0 and v662 < 200 do
  task.wait(0.1)
  v662 = v662 + 1
  end
  if #SharedState.AllAnimalsCache == 0 then
  return
  end
  task.wait(0.15)


  local v389 = (Config and Config.TpSettings and Config.TpSettings.Tool) or "Flying Carpet"
  local v765 = 0
  local v223 = false
  while v765 < 100 and not v223 do
  v223 = (player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild(v389) ~= nil)
  or (player.Character and player.Character:FindFirstChild(v389) ~= nil)
  if not v223 then task.wait(0.1) end
  v765 = v765 + 1
  end
  if not v223 then
  return
  end


  local v424 = parseMinGen(Config.TpSettings.MinGenForTp)
  local v234 = false
  local v206 = 0
  while not v234 and v206 < 40 do
  v206 = v206 + 1
  local v34 = player.Character
  local v22 = v34 and v34:FindFirstChild("HumanoidRootPart")
  local v35 = v34 and v34:FindFirstChild("Humanoid")
  if v22 and v35 and v35.Health > 0 then
  local v1010 = getTargetPetData()
  if v1010 then
  if Config.TpSettings.GrabbleTP then
  _G._isTpMoving = true
  task.spawn(function()
  if _G.CLTHUBStartSideTP then
  _G.CLTHUBStartSideTP()
  elseif runAutoSnipe then
  runAutoSnipe()
  end
  end)
  v234 = true
  break
  end
  local v179 = findAdorneeGlobal(v1010)
  if v179 then
  _G._isTpMoving = true
  task.spawn(function()
  if _G.CLTHUBStartSideTP then
  _G.CLTHUBStartSideTP()
  elseif runAutoSnipe then
  runAutoSnipe()
  end
  end)
  v234 = true
  break
  end
  end
  end
  task.wait(0.5)
  end
  if not v234 then
  end
end) end

task.spawn(function()
  task.wait(0.5)
  setToggle("Click to AP", Config.ClickToAP, true)
  setToggle("ClickToAP", Config.ClickToAP, true)

  if Config.AntiRagdoll then startAntiRagdoll() end

  if Config.Float then Config.Float = false; saveConfig() end
  pcall(function() if setToggle then setToggle("Float", false) end end)
  if Config.InfiniteJump then setInfiniteJump(true) end
  if Config.Unwalk then setUnwalk(true) end

  if Config.AutoCloseOnExec then if main then main.Visible = false end end


  if Config.XRay then setXRay(true) end
  pcall(function() Workspace.CurrentCamera.FieldOfView = Config.FOV or 70 end)
  if Config.PlayerESP then playerESPEnabled=true end
  if Config.SubspaceMineESP then subspaceMineESPEnabled=true end
  if Config.ProximityAP then setProximityAP(true) end

  if Config.StealHighest then setStealMode("Highest")
  elseif Config.StealPriority then setStealMode("Priority")
  elseif Config.StealNearest then setStealMode("Nearest")
  else setStealMode("Highest") end
  if updateMovementPanelLabels then updateMovementPanelLabels() end
end)

_G.InvisStealAngle=Config.InvisStealAngle or 180; _G.SinkSliderValue=Config.SinkSliderValue or 8
_G.AutoRecoverLagback=true; _G.AutoInvisDuringSteal=Config.AutoInvisDuringSteal or false

print("CLTHUB loaded ")


Config.FPSCap = 9999

task.spawn(function()
  while true do
  task.wait(30)
  pcall(collectgarbage, "collect")
  end
end)

task.spawn(function()
  while task.wait(1) do
  pcall(function()
  local v296 = Workspace.CurrentCamera
  if v296 and Config.FOV and v296.FieldOfView ~= Config.FOV then
  v296.FieldOfView = Config.FOV
  end
  if LocalPlayer.CameraMaxZoomDistance ~= 128 then
  LocalPlayer.CameraMaxZoomDistance = 128
  end
  if LocalPlayer.CameraMinZoomDistance > 0.5 then
  LocalPlayer.CameraMinZoomDistance = 0.5
  end
  if LocalPlayer.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Invisicam then
  LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
  end
  end)
  end
end)


local v939 = 0
v133.Heartbeat:Connect(function()
  local v60 = tick()
  if v60 - v939 < 0.5 then return end
  v939 = v60
  local character = LocalPlayer.Character
  if character then
  for idx, v56 in ipairs(character:GetChildren()) do
  if v56:IsA("BasePart") and v56.CanCollide and v56.Name ~= "HumanoidRootPart" then
  v56.CanCollide = false
  end
  end
  end
end)
CLTHUB_AC = {}

task.spawn(function()
  task.wait(0.15)

  pcall(function()
  applyTheme("Nexus")
  end)


  pcall(function()

  if Config and type(Config.MenuScale)=="number" and setMenuScale then
  setMenuScale(Config.MenuScale, true)
  end
  end)


  pcall(function() if initToggles then initToggles() end end)
  pcall(function() if _G.updateResizeGrips then _G.updateResizeGrips() end end)
end)


do
  local PlayersService  = game:GetService("Players")
  local v133 = game:GetService("RunService")
  local v1043  = game:GetService("UserInputService")
  local v397  = game:GetService("ReplicatedStorage")
  local v48 = PlayersService.LocalPlayer


  local v225, v5, v12, v625
  local function v713()
  if v225 then return true end
  local ok = pcall(function()
  local v343 = v397:WaitForChild("Packages", 5)
  local v394 = v397:WaitForChild("Datas", 5)
  local v776 = v397:WaitForChild("Shared", 5)
  local v515 = v397:WaitForChild("Utils", 5)
  v225 = require(v343:WaitForChild("Synchronizer"))
  v5 = require(v394:WaitForChild("Animals"))
  v12 = _G.v1021
  v625 = require(v515:WaitForChild("NumberUtils"))
  end)
  return ok and v225 ~= nil
  end

  local v446
  local function v479()
  if v446 then return true end
  local ok, v578 = pcall(function()
  return _G.Net
  end)
  if not ok or type(v578) ~= "table" then return false end
  v446 = v578
  return true
  end

  local function v1128()
  local v48 = game:GetService("Players").LocalPlayer
  local character = v48.Character
  if not character then return end

  local v22 = character:FindFirstChild("HumanoidRootPart")
  local v194 = v48:FindFirstChild("Backpack")
  local v158 = (v194 and v194:FindFirstChild("Grapple Hook")) or character:FindFirstChild("Grapple Hook")
  local v35 = character:FindFirstChildOfClass("Humanoid")

  if v158 and v35 and v22 then
  pcall(function() v35:EquipTool(v158) end)
  task.wait(0.1)

  pcall(function()
  local v353 = v158:FindFirstChild("Beam", true)
  if v353 and v353:IsA("Beam") then
  v353.Width0 = 0
  v353.Width1 = 0
  local v656
  v656 = v353:GetPropertyChangedSignal("Width0"):Connect(function()
  v353.Width0 = 0
  v353.Width1 = 0
  end)
  task.delay(1, function() if v656 then v656:Disconnect() end end)
  end
  for idx, v984 in ipairs(v158:GetDescendants()) do
  if v984:IsA("Sound") then v984.Volume = 0 end
  end
  end)

  local v752
  local v466 = false
  v752 = v22.ChildAdded:Connect(function(v24)
  if v24:IsA("BodyVelocity") and v24.Name == "FlightPower" then
  v466 = true
  pcall(function() v24.MaxForce = Vector3.zero end)
  end
  end)

  local v517 = game:GetService("ReplicatedStorage")
  local v161 = v517:WaitForChild("Packages", 2) and v517.Packages:WaitForChild("PlayerMouse", 2)
  local v345 = v161 and require(v161) or nil

  local v277 = Instance.new("Part")
  v277.Size = Vector3.new(2, 2, 2)
  v277.Anchored = true
  v277.CanCollide = false
  v277.Transparency = 1
  v277.CFrame = v22.CFrame * CFrame.new(0, 0, -11)
  v277.Parent = workspace

  if v345 then
  local v1207 = v345.Hit
  local v1208 = v345.Target

  v345.Hit = v277.CFrame
  v345.Target = v277

  local v629 = os.clock()
  while not v466 and os.clock() - v629 < 4.0 do
  if v158 then pcall(function() v158:Activate() end) end
  task.wait(0.05)
  local v635 = os.clock()
  while not v466 and os.clock() - v635 < 0.1 do
  game:GetService("RunService").Heartbeat:Wait()
  end
  end

  v345.Hit = v1207
  v345.Target = v1208
  else
  local v629 = os.clock()
  while not v466 and os.clock() - v629 < 4.0 do
  if v158 then pcall(function() v158:Activate() end) end
  task.wait(0.05)
  local v635 = os.clock()
  while not v466 and os.clock() - v635 < 0.1 do
  game:GetService("RunService").Heartbeat:Wait()
  end
  end
  end

  if v752 then v752:Disconnect() end
  if v277 then v277:Destroy() end
  end
end


  _G.CLTHUBFireGrapple = v1128


  local v3 = { CARPET = 400, INBASE = 250 }
  _G.CLTHUBSetCarpetSpeed = function(v26) v26 = tonumber(v26); if v26 and v26 > 0 then v3.CARPET = v26 end end
  _G.CLTHUBSetInbaseSpeed = function(v26) v26 = tonumber(v26); if v26 and v26 > 0 then v3.INBASE = v26 end end
  _G.CLTHUBGetCarpetSpeed = function() return v3.CARPET end
  if Config and Config.TpSettings then
  if tonumber(Config.TpSettings.GrabbleTPSpeed) then v3.CARPET = tonumber(Config.TpSettings.GrabbleTPSpeed) end
  end


  local v1 = { "Flying Carpet", "Carpet", "Cloud", "Witch's Broom", "Cupid's Wings", "Santa's Sleigh", "Magic Carpet" }
  local v293 = { "Grapple Hook", "Grappling Hook", "Grapple", "Hook", "Web Slinger", "Grapple Gun", "GrappleHook" }
  local function v561(v30)
  local character = v48.Character
  local v194 = v48:FindFirstChild("Backpack")
  return (character and character:FindFirstChild(v30)) or (v194 and v194:FindFirstChild(v30))
  end
  local function v361()
  local character = v48.Character
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if not v35 then return nil end
  local v260 = Config and Config.TpSettings and Config.TpSettings.Tool
  if v260 then
  local v589 = v561(v260)
  if v589 and v589:IsA("Tool") then
  if v589.Parent ~= character then pcall(function() v35:EquipTool(v589) end) end
  return v260
  end
  end
  for idx, v62 in ipairs(v1) do
  local tmpInst = v561(v62)
  if tmpInst and tmpInst:IsA("Tool") then
  if tmpInst.Parent ~= character then pcall(function() v35:EquipTool(tmpInst) end) end
  return v62
  end
  end
  return nil
  end
  local function v657()
  if not v446 then pcall(v479) end
  local v295 = os.clock()
  while not v561("Grapple Hook") and os.clock() - v295 < 5 do
  if not v446 then pcall(v479) end
  v133.Heartbeat:Wait()
  end
  local character = v48.Character
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if not character or not v35 then return nil end
  if not character:FindFirstChild("Grapple Hook") then
  local v131 = v561("Grapple Hook")
  if v131 then pcall(function() v35:EquipTool(v131) end) end
  end
  task.wait(0.08)
  if v48.Character and v48.Character:FindFirstChild("Grapple Hook") then
  if _G.CLTHUBFireGrapple then _G.CLTHUBFireGrapple() end
  end
  task.wait(0.15)
  local v52 = v48.Character and v48.Character:FindFirstChildOfClass("Humanoid")
  if v52 then pcall(function() v52:UnequipTools() end) end
  pcall(function()
  local v787 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
  if v787 then local v876 = v787:FindFirstChild("FlightPower"); if v876 then v876:Destroy() end end
  end)
  task.wait(0.15)
  local v546
  local v1067 = os.clock()
  repeat
  v546 = v361()
  local v34 = v48.Character
  if v546 and v34 and v34:FindFirstChild(v546) then break end
  v133.Heartbeat:Wait()
  until os.clock() - v1067 > 1
  return v546
  end


  local v778 = {
  [1]  = { pets = {"Headless Horseman"}, threshold = 0 },
  [2]  = { pets = {"Signore Carapace"}, threshold = 0 },
  [3]  = { pets = {"Strawberry Elephant"}, threshold = 0 },
  [4]  = { pets = {"Arcadragon"}, threshold = 0 },
  [5]  = { pets = {"Elefanto Frigo"}, threshold = 5e9 },
  [6]  = { pets = {"John Pork"}, threshold = 10e9 },
  [7]  = { pets = {"Meowl"}, threshold = 5e9 },
  [8]  = { pets = {"Skibidi Toilet"}, threshold = 5e9 },
  [9]  = { pets = {"Love Love Bear"}, threshold = 0 },
  [10] = { pets = {"Antonio"}, threshold = 0 },
  [11] = { pets = {"Pancake and Syrup"}, threshold = 0 },
  [12] = { pets = {"Griffin"}, threshold = 0 },
  [13] = { pets = {"La Supreme Combinasion","Fishino Clownino","Dragon Gingerini","Tirilikalika Tirilikalako"}, threshold = 5e9 },
  [14] = { pets = {"Ginger Gerat","Pet"}, threshold = 10e9 },
  [15] = { pets = {"Hydra Bunny","Digi Narwhal","Kalika Bros"}, threshold = 3e9 },
  [16] = { pets = {"Hydra Dragon Cannelloni","Dragon Cannelloni","Bunny and Eggy"}, threshold = 3e9 },
  [17] = { pets = {"Globa Steppa","Ketupat Bros","Rosey and Teddy","La Casa Boo","Fragola la la"}, threshold = 3e9 },
  [18] = { pets = {"Fragola La La La","Cerberus","Guest 666","Los Hackers"}, threshold = 1e9 },
  [19] = { pets = {"Garama and Madundung","Spooky and Pumpky","Reinito Sleighito","Burguro And Fryuro","Cooki and Milki","Fragrama and Chocrama","La Food Combinasion","Los Amigos","Foxini Lanternini","Capitano Moby","Fortunu and Cashuru","Los Sekolahs","Celestial Pegasus"}, threshold = 750e6 },
  [20] = { pets = {"La Secret Combinasion","Sammyni Fattini","Cloverat Clapat","Popcuru and Fizzuru"}, threshold = 1e9 },
  }
  local v445 = {}
  for v1272, v55 in pairs(v778) do
  for idx, v30 in ipairs(v55.pets) do v445[v30] = v1272 end
  end
  local v271 = { [1]=true,[2]=true,[3]=true,[4]=true }
  local v15 = {
  [3] = { [4] = 10e9 },
  [4] = {},
  [5] = { [6] = math.huge },
  [6] = { [9] = math.huge, [10] = math.huge, [12] = 15e9 },
  [10] = { [12] = 20e9 },
  [11] = { [12] = 10e9 },
  }
  local v622 = {
  ["Galaxy"]=1,["Candy"]=1,["Yin Yang"]=1,["YinYang"]=1,["Divine"]=1,
  ["Cursed"]=1,["Lava"]=1,["Radioactive"]=1,["Cyber"]=1,["Rainbow"]=1,["Bloodrot"]=2,
  }
  local v342 = {
  ["Fishino Clownino"]=true,["Globa Steppa"]=true,
  ["La Supreme Combinasion"]=true,["Tirilikalika Tirilikalako"]=true,
  }
  local function v416(v87)
  if not v87 or v87 == "" or v87 == "None" then return 0 end
  if v622[v87] then return v622[v87] end
  local v62 = tostring(v87):lower():gsub("[%s%-_]","")
  if v62 == "bloodrot" then return 2 end
  if v62 == "yinyang" or v62 == "galaxy" or v62 == "candy" or v62 == "divine"
  or v62 == "cursed" or v62 == "lava" or v62 == "radioactive" or v62 == "cyber"
  or v62 == "rainbow" then return 1 end
  return 0
  end
  local function v1141(v368, v478)
  if v15[v368] and v15[v368][v478] then return v15[v368][v478] end
  if v271[v368] then return math.huge end
  local v766 = 0
  for tmpInst = v368 + 1, v478 do
  local v757 = v778[tmpInst]
  if v757 and v757.threshold > 0 then v766 = v766 + v757.threshold end
  end
  return v766
  end
  local function v1218(v203, v321, v639, v654, v522, v541)
  if v203 == "Strawberry Elephant" and v321 == "John Pork" then return true end
  if v203 == "John Pork" and v321 == "Strawberry Elephant" then return false end
  if v342[v203] and v321 == "Griffin" and v416(v639) >= 1 then return true end
  if v203 == "Griffin" and v342[v321] and v416(v654) >= 1 then return false end
  if v203 == "Antonio" and v321 == "Elefanto Frigo" and v416(v639) >= 1 then return true end
  if v203 == "Elefanto Frigo" and v321 == "Antonio" and v416(v654) >= 1 then return false end
  local v265 = v445[v203] or 99
  local v266 = v445[v321] or 99
  if not (v445[v203] and v445[v321]) then
  if v265 == v266 then return (v522 or 0) > (v541 or 0) end
  return v265 < v266
  end
  if v265 == v266 then
  local v946, v947 = v416(v639), v416(v654)
  if v946 ~= v947 then return v946 > v947 end
  return (v522 or 0) > (v541 or 0)
  end
  if v265 == 4 and v266 == 3 then return true end
  if v265 == 3 and v266 == 4 then return false end
  local v368 = math.min(v265, v266)
  local v478 = math.max(v265, v266)
  local v1134 = v265 < v266 and v522 or v541
  local v1186 = v265 < v266 and v541 or v522
  local v678 = v1141(v368, v478)
  if v678 > 0 and v678 ~= math.huge then
  if (v1186 or 0) - (v1134 or 0) > v678 then return v265 > v266 end
  end
  return v265 < v266
  end


  local function v1146(v157)
  if not v225 then return nil end
  local v141
  pcall(function() v141 = _G.XenSyncGet(v157) end)
  return v141
  end
  local function v665(v141, v43)
  if not v141 then return nil end
  local v26
  pcall(function() if type(v141.Get) == "function" then v26 = v141:Get(v43) end end)
  if v26 == nil then pcall(function() v26 = v141.CacheTable and v141.CacheTable[v43] end) end
  return v26
  end
  local function v1176(v141)
  if not v141 then return false end
  local v51 = v665(v141, "Owner")
  if not v51 then return false end
  local v305 = false
  pcall(function()
  if typeof(v51) == "Instance" and v51:IsA("Player") then
  v305 = v51.UserId == v48.UserId
  elseif type(v51) == "table" and (v51.UserId or v51.userId) then
  v305 = (v51.UserId or v51.userId) == v48.UserId
  elseif type(v51) == "number" then
  v305 = v51 == v48.UserId
  elseif type(v51) == "string" then
  v305 = (v51 == v48.Name or v51 == v48.DisplayName)
  elseif typeof(v51) == "Instance" then
  v305 = v51 == v48
  end
  end)
  return v305
  end
  local function v1221(v141)
  if not v141 then return false end
  local v51 = v665(v141, "Owner")
  if not v51 then return false end
  local v417 = false
  pcall(function()
  if typeof(v51) == "Instance" and v51:IsA("Player") then
  v417 = PlayersService:FindFirstChild(v51.Name) ~= nil
  elseif type(v51) == "number" then
  v417 = PlayersService:GetPlayerByUserId(v51) ~= nil
  elseif type(v51) == "table" and (v51.Name or v51.name) then
  v417 = PlayersService:FindFirstChild(tostring(v51.Name or v51.name)) ~= nil
  elseif type(v51) == "string" then
  v417 = PlayersService:FindFirstChild(v51) ~= nil
  elseif typeof(v51) == "Instance" and v51.Name then
  v417 = PlayersService:FindFirstChild(v51.Name) ~= nil
  end
  end)
  return v417
  end


  local v803 = {}


  local v1059 = 30
  local function v1145(v25, v288)
  local v43 = v25.Name .. "|" .. tostring(v288)
  local v121 = v803[v43]
  local v60 = os.clock()
  if v121 and (v60 - v121.t) < v1059 then return v121.pos end
  local function v1101()
  local v125 = v25:FindFirstChild("AnimalPodiums")
  if not v125 then return nil end
  local v110 = v125:FindFirstChild(tostring(v288))
  if not v110 then return nil end
  if v110:IsA("BasePart") then return v110.Position end
  if v110.PrimaryPart then return v110.PrimaryPart.Position end
  local v23 = v110:FindFirstChildWhichIsA("BasePart")
  if v23 then return v23.Position end
  local ok, v450 = pcall(function() return v110:GetPivot() end)
  if ok then return v450.Position end
  return nil
  end
  local v59 = v1101()
  if v59 then v803[v43] = { pos = v59, t = v60 } end
  return v59
  end


  local v1046 = { }
  local function v1048(v172)
  if type(v172) ~= "table" then return false end
  local v87 = v172.Machine
  if type(v87) ~= "table" then return false end
  return v1046[v87.Type] == true and v87.Active == true
  end


  local v783 = {}
  local function v784(v204, v199, v292)
  local v43 = nil
  if type(v292) ~= "table" or next(v292) == nil then
  v43 = tostring(v204) .. "|" .. tostring(v199)
  local v34 = v783[v43]
  if v34 then return v34 end
  end
  local v131 = 0
  pcall(function()
  v131 = v12:GetGeneration(v204, v199, v292, nil) or 0
  end)
  if v43 then v783[v43] = v131 end
  return v131
  end


  local function v595(v1004)
  local v63 = {}
  local v528 = os.clock()


  local v303 = 0
  if not v713() then return v63, 1 end
  local v779 = workspace:FindFirstChild("Plots")
  if not v779 then return v63, 1 end
  for idx, v25 in ipairs(v779:GetChildren()) do


  if v1004 and (os.clock() - v528) > 0.004 then
  v133.Heartbeat:Wait()
  v528 = os.clock()
  end
  local v141 = v1146(v25.Name)
  if not v141 then v303 = v303 + 1 continue end
  if v1176(v141) then continue end
  if not v1221(v141) then continue end
  local v810 = v665(v141, "AnimalList")
  if not v810 then continue end
  for v288, v172 in pairs(v810) do
  if type(v172) ~= "table" then continue end
  local v204 = v172.Index
  if not v204 then continue end
  local v402 = v5 and v5[v204]
  if not v402 then v303 = v303 + 1 continue end
  if v1048(v172) then continue end
  local v199 = v172.Mutation or "None"
  local v567 = v784(v204, v172.Mutation, v172.Traits)
  local v1114 = (v402 and v402.DisplayName) or v204
  local v59 = v1145(v25, v288)
  if v59 then
  table.insert(v63, {
  name = v1114, index = v204, mps = v567,
  mutation = v199, position = v59, plot = v25.Name, slot = tostring(v288),
  })
  else

  v303 = v303 + 1
  end
  end
  end
  local v846 = workspace:FindFirstChild("RenderedMovingAnimals")
  if v846 then
  for idx, v65 in ipairs(v846:GetChildren()) do
  if v1004 and (os.clock() - v528) > 0.004 then
  v133.Heartbeat:Wait()
  v528 = os.clock()
  end

  if not v65:IsA("Model") then continue end
  local v402 = v5 and v5[v65.Name]
  if not v402 then continue end

  local v199 = v65:GetAttribute("Mutation") or "None"
  local v567 = v784(v65.Name, v199, nil)
  if v567 <= 0 then continue end

  local v56 = v65.PrimaryPart or v65:FindFirstChildWhichIsA("BasePart")
  local v59
  if v56 then
  v59 = v56.Position
  else
  local ok, v450 = pcall(function() return v65:GetPivot() end)
  if ok then v59 = v450.Position end
  end

  if v59 then
  table.insert(v63, {
  name = v402.DisplayName or v65.Name, index = v65.Name,
  mps = v567, mutation = v199, position = v59,
  plot = nil, slot = nil, conveyor = true, model = v65,
  })
  end
  end
  end
  table.sort(v63, function(v27, v29)
  return v1218(v27.name, v29.name, v27.mutation, v29.mutation, v27.mps, v29.mps)
  end)
  return v63, v303
  end


  local v777 = {
  B = {{coord=Vector3.new(-487.921448,16.850713,-75.768013),facing="NORTH"},{coord=Vector3.new(-332.379730,16.850722,-75.762100),facing="NORTH"},{coord=Vector3.new(-487.134918,16.850713,-18.094154),facing="SOUTH"},{coord=Vector3.new(-316.300171,16.850713,-17.845898),facing="SOUTH"}},
  C = {{coord=Vector3.new(-330.765381,16.850713,31.424425),facing="NORTH"},{coord=Vector3.new(-502.989349,16.850713,31.172430),facing="NORTH"},{coord=Vector3.new(-489.077087,16.850713,89.010147),facing="SOUTH"},{coord=Vector3.new(-330.908936,16.850713,88.930145),facing="SOUTH"}},
  D = {{coord=Vector3.new(-331.264893,16.850713,138.209167),facing="NORTH"},{coord=Vector3.new(-487.935181,16.850713,138.026321),facing="NORTH"},{coord=Vector3.new(-487.774933,16.850713,195.882538),facing="SOUTH"},{coord=Vector3.new(-330.799133,16.850575,196.022354),facing="SOUTH"}},
  }
  local v1037 = {
  B = {{coord=Vector3.new(-335.725586,-3.048217,-74.984589),facing="NORTH"},{coord=Vector3.new(-503.214233,-3.048217,-75.043137),facing="NORTH"},{coord=Vector3.new(-483.619385,-3.718430,-18.844337),facing="SOUTH"},{coord=Vector3.new(-316.147095,-3.048218,-18.818844),facing="SOUTH"}},
  C = {{coord=Vector3.new(-335.985413,-3.048218,32.051426),facing="NORTH"},{coord=Vector3.new(-503.277008,-3.048217,31.956175),facing="NORTH"},{coord=Vector3.new(-483.749390,-3.048218,88.147003),facing="SOUTH"},{coord=Vector3.new(-315.793823,-3.048217,88.163979),facing="SOUTH"}},
  D = {{coord=Vector3.new(-335.476654,-3.048218,139.001083),facing="NORTH"},{coord=Vector3.new(-503.710083,-3.048218,138.989883),facing="NORTH"},{coord=Vector3.new(-315.654938,-3.048218,195.302444),facing="SOUTH"},{coord=Vector3.new(-483.859253,-3.048218,195.269043),facing="SOUTH"}},
  }
  local v1300 = 7
  local v1042 = { ["La Secret Combinasion"]=true, ["La Jolly Grande"]=true }
  local v1041 = 3

  local function v568(v582)
  if v582 > 23.15 then return 3 end
  if v582 >= 9.5 then return 2 end
  return 1
  end


  local function v1139(v582)
  if v568(v582) >= 3 then return v777 end
  return v1037
  end

  local v18 = {
  [1]=Vector3.new(-476.52,-2,220.94),[2]=Vector3.new(-476.52,-2,113.77),
  [3]=Vector3.new(-476.52,-2,6.18),[4]=Vector3.new(-476.52,-2,-101.07),
  [5]=Vector3.new(-342.66,-2,221.45),[6]=Vector3.new(-342.66,-2,113.41),
  [7]=Vector3.new(-342.66,-2,6.25),[8]=Vector3.new(-342.66,-2,-99.73),
  }
  local v9 = {
  [1]=Vector3.new(-479.51,18,220.94),[2]=Vector3.new(-479.51,18,113.77),
  [3]=Vector3.new(-479.51,18,6.18),[4]=Vector3.new(-479.51,18,-101.07),
  [5]=Vector3.new(-339.48,18,221.45),[6]=Vector3.new(-339.48,18,113.41),
  [7]=Vector3.new(-339.48,18,6.25),[8]=Vector3.new(-339.48,18,-99.73),
  }
  local v202 = -3.048217
  local v395 = 16.850713
  local v4 = -410
  local v514 = 18
  local v1052 = 45

  local function v1140(v59)
  local v198, v92 = 1, math.huge
  for v28 = 1, 8 do
  local v29 = v18[v28]
  local v33 = (v59.X - v29.X)^2 + (v59.Z - v29.Z)^2
  if v33 < v92 then v92 = v33; v198 = v28 end
  end
  return v198
  end
  local function v1095(v72, v420, v1236)
  local v173 = v420 and v9[v72] or v18[v72]
  local v1122 = v420 and v395 or v202
  local v1123 = math.clamp(v1236 - v173.Z, -v514, v514) + v173.Z
  local v1106 = Vector3.new(v173.X, v1122, v1123)
  local v1124 = (v72 <= 4) and Vector3.new(-1, 0, 0) or Vector3.new(1, 0, 0)
  return v1106, v1124
  end
  local function v1225(v359, v72)
  local v173 = v18[v72]
  local v1164 = v72 <= 4
  local v259 = {}
  for idx, v676 in pairs(v359) do
  for idx, v55 in ipairs(v676) do
  if ((v55.coord.X < v4) == v1164)
  and math.abs(v55.coord.Z - v173.Z) < v1052 then
  v259[#v259 + 1] = v55
  end
  end
  end
  return v259
  end
  local function v1127(v135, v359)
  local v138, v826, v124 = nil, nil, math.huge
  for v747, v676 in pairs(v359) do
  for idx, v55 in ipairs(v676) do
  local v34 = v55.coord
  local v33 = math.sqrt((v135.X - v34.X)^2 + (v135.Z - v34.Z)^2)
  if v33 < v124 then v124 = v33; v138 = v55; v826 = v747 end
  end
  end
  return v138, v826
  end


  local v1053 = 200
  local v21 = 3
  local v443 = 60

  local function v340(v22)
  if v22 then v22.AssemblyLinearVelocity = Vector3.zero; v22.AssemblyAngularVelocity = Vector3.zero end
  end


  local function v1297(v22, v268, v1268, v1077, v1246)
  if not v22 or not v22.Parent or #v268 == 0 then return end
  local v526 = v1268 or v3.CARPET
  local v390 = 1
  local v276 = false
  local v208
  local function v325()
  if v276 then return end
  v276 = true
  if v22 and v22.Parent then
  v22.AssemblyLinearVelocity = Vector3.zero
  v22.AssemblyAngularVelocity = Vector3.zero


  local v782 = v268[#v268]
  if (v22.Position - v782).Magnitude <= 25 then
  local idx, v315 = v22.CFrame:ToEulerAnglesYXZ()
  v22.CFrame = CFrame.new(v782) * CFrame.Angles(0, v315, 0)
  end
  end
  if v208 then v208:Disconnect() end
  end
  local v422, v289 = math.huge, 0
  if v1246 then
  local v519 = RaycastParams.new()
  v519.FilterType = Enum.RaycastFilterType.Exclude
  v519.IgnoreWater = true
  local v527 = {}
  for idx, v493 in ipairs(PlayersService:GetPlayers()) do
  if v493.Character then v527[#v527 + 1] = v493.Character end
  end
  v519.FilterDescendantsInstances = v527
  for idx = 1, 3 do
  local v169 = v268[v390]
  if not v169 then break end
  local v884 = Vector3.new(v169.X - v22.Position.X, 0, v169.Z - v22.Position.Z)
  local v231 = v884.Magnitude
  if v231 < 1 then break end
  local v938 = v22.Position + v884.Unit * math.min(20, v231)
  local v632 = workspace:Raycast(v22.Position, v938 - v22.Position, v519)
  if v632 and v632.Instance and v632.Instance.CanCollide then break end
  v22.CFrame = (v22.CFrame - v22.CFrame.Position) + v938
  v22.AssemblyLinearVelocity = Vector3.zero
  v22.AssemblyAngularVelocity = Vector3.zero
  v133.Heartbeat:Wait()
  if not v22 or not v22.Parent then return end
  end
  end
  v208 = v133.Heartbeat:Connect(function()
  if not v22 or not v22.Parent or v276 then
  if v208 then v208:Disconnect() end; return
  end


  local v169 = v268[v390]
  local v229 = v169 - v22.Position
  local v231 = v229.Magnitude
  if v231 < v21 then
  v390 = v390 + 1
  if v390 > #v268 then v325(); return end
  v422, v289 = math.huge, 0
  v169 = v268[v390]
  v229 = v169 - v22.Position
  v231 = v229.Magnitude
  end
  if v231 > v422 - 0.05 then v289 = v289 + 1 else v289 = 0 end
  v422 = v231


  if v289 >= 80 then v325(); return end
  if v231 >= 0.1 then
  local v684 = v229.Unit
  if v1077 and v229.Y > 5 and v390 < #v268 then
  local v35 = v22.Parent and v22.Parent:FindFirstChildOfClass("Humanoid")
  if v35 then
  local v149 = v35:GetState()
  if v149 ~= Enum.HumanoidStateType.Jumping and v149 ~= Enum.HumanoidStateType.Freefall then
  pcall(function() v35:ChangeState(Enum.HumanoidStateType.Jumping) end)
  pcall(function() v35.Jump = true end)
  end
  end
  end
  local v556 = v526
  local v1115 = (v268[#v268] - v22.Position).Magnitude
  if v1115 <= 15 then
  v556 = v526 * 0.75
  end
  local v637 = v684.Y * v556
  if v637 > v443 then v637 = v443 end
  v22.AssemblyLinearVelocity = Vector3.new(v684.X * v556, v637, v684.Z * v556)
  end
  end)
  local v767 = 0
  local v953 = v22.Position
  for idx, v1030 in ipairs(v268) do v767 = v767 + (v953 - v1030).Magnitude; v953 = v1030 end
  local v1274 = v767 / math.min(v1053, v526) + 2
  local v461 = 0
  while not v276 and v461 < v1274 do task.wait(0.05); v461 = v461 + 0.05 end
  v325()
  v340(v22)
  end


local v1306 = { Vector3.new(1,0,0), Vector3.new(-1,0,0), Vector3.new(0,0,1), Vector3.new(0,0,-1) }
local v795 = { ["structure base home"] = true, ["Wall"] = true, ["Floor"] = true, ["Roof"] = true }
local v794 = {
  ["DeliveryHitbox"]=true, ["StealHitbox"]=true, ["LaserHitbox"]=true,
  ["AnimalTarget"]=true, ["Multiplier"]=true, ["Laser"]=true, ["Hitbox"]=true,
  ["Spawn"]=true, ["MainRoot"]=true, ["SecondFloor"]=true, ["ThirdFloor"]=true, ["Slope"]=true
}
local v1307 = { minX = -458, maxX = -362, minZ = -40, maxZ = 185 }
local v1303, v1304 = 205, -95
local v1302, v1301 = -525, -295
local v1047 = {
  "machine", "spin", "wheel", "event", "portal", "npc", "vendor",
  "futbol", "livematches", "live matches",
}

local function v789(v45)
  if not v45 then return false end
  local v23 = v45
  while v23 and v23 ~= workspace do
  local v487 = v23.Name:lower()
  for idx, v472 in ipairs(v1047) do
  if v487:find(v472, 1, true) then return true end
  end
  v23 = v23.Parent
  end
  return false
end

local function v788(v45)
  return v45 and v45:FindFirstAncestor("RenderedMovingAnimals") ~= nil
end

local function v1062(v45)
  if not v45 then return false end
  if v794[v45.Name] then return false end
  if v788(v45) then return false end
  if v789(v45) then return true end
  if v45.CanCollide then return true end
  if v795[v45.Name] then return true end
  local v84 = v45.Size
  if v84 and math.max(v84.X * v84.Y, v84.X * v84.Z, v84.Y * v84.Z) > 150 then return true end
  return false
end

local function v1308(v45)
  if not v45 then return false end
  if v794[v45.Name] then return false end
  if v788(v45) then return false end
  if v789(v45) then return true end
  if v45.CanCollide then return true end
  if v795[v45.Name] then return true end
  local v84 = v45.Size
  if v84 and math.max(v84.X * v84.Y, v84.X * v84.Z, v84.Y * v84.Z) > 30 then return true end
  return false
end

local function v1061(v1220, v169, v653)
  v653 = v653 or v1062
  local v593 = RaycastParams.new()
  v593.FilterType = Enum.RaycastFilterType.Exclude
  v593.IgnoreWater = true
  local v502 = {}
  for idx, v493 in ipairs(PlayersService:GetPlayers()) do
  if v493.Character then v502[#v502 + 1] = v493.Character end
  end
  local v146 = v1220
  for idx = 1, 16 do
  v593.FilterDescendantsInstances = v502
  local v33 = v169 - v146
  if v33.Magnitude < 0.05 then return nil end
  local v168 = workspace:Raycast(v146, v33, v593)
  if not v168 then return nil end
  if v653(v168.Instance) then return v168 end
  v502[#v502 + 1] = v168.Instance
  v146 = v168.Position + v33.Unit * 0.3
  end
  return nil
end

local function v1309(v27, v29) return v1061(v27, v29) == nil end


  local function v1116()
  v780()
  task.wait(0.01)

  local v22 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
  local v25 = getPlotAtPosition and v22 and getPlotAtPosition(v22.Position)
  local v769 = 0
  repeat
  if v769 >= 50 then break end
  v769 = v769 + 1
  local v1155 = v909 and v909(v25)
  task.wait(0.005)
  until v1155
  return true
  end

  local function v1131(v135)
  if not v135 then return end
  if typeof(v135) == "table" and v135.position then v135 = v135.position end

  local v331 = v48.Character
  local v213 = v331 and v331:FindFirstChild("HumanoidRootPart")
  local v281 = v331 and v331:FindFirstChildOfClass("Humanoid")
  if not v213 or not v281 then return end

  pcall(function() v213.Anchored = false end)
  v361()

  local v413 = v568(v135.Y)
  local v437 = v135.Y
  if v413 == 3 then
  v437 = 22.0
  elseif v413 == 2 then
  v437 = 6
  end

  local v1278 = Vector3.new(v135.X, v437, v135.Z)
  local v507 = (Config and Config.TpSettings and (tonumber(Config.TpSettings.WalkTPSpeed) or tonumber(Config.TpSettings.GrabbleTPSpeed))) or 190


  local v641 = v281.MaxHealth
  local v786 = v281.HealthChanged:Connect(function(v1160)
  if v1160 < v641 then
  pcall(function() v281.Health = v641 end)
  end
  end)
  pcall(function() v281.Health = v641 end)


  local v96 = nil
  if v413 >= 2 then
  local v1233 = v437 - 3.2
  v96 = Instance.new("Part")
  v96.Name = "CLTHUBTempPlatform"
  v96.Size = Vector3.new(16, 1, 16)
  v96.Position = Vector3.new(v135.X, v1233, v135.Z)
  v96.Anchored = true
  v96.CanCollide = false
  v96.Transparency = 1
  v96.Material = Enum.Material.SmoothPlastic
  v96.Parent = workspace
  end


  local v387 = os.clock()
  local v422 = math.huge
  local v289 = 0
  local v690 = 0

  while v213.Parent and (os.clock() - v387) < 6 do
  if v48:GetAttribute("Stealing") or _G._CLTHUB_ResetRequested then break end
  v690 = v690 + 1
  if v690 % 10 == 1 then v361() end


  if v96 and v96.Parent then
  if v213.Position.Y >= (v96.Position.Y + 0.2) then
  v96.CanCollide = true
  else
  v96.CanCollide = false
  end
  end

  local v229 = v1278 - v213.Position
  local v231 = v229.Magnitude
  if v231 < 2.0 then break end

  if v231 > v422 - 0.05 then v289 = v289 + 1 else v289 = 0 end
  v422 = v231
  if v289 >= 25 then break end

  local v1296 = v229.Unit
  v213.AssemblyLinearVelocity = v1296 * v507
  v133.Heartbeat:Wait()
  end

  if v213 and v213.Parent then
  v340(v213)
  end


  if v413 >= 2 and v213 and v213.Parent then
  if v96 and v96.Parent then
  v96.CanCollide = true
  end
  pcall(function()
  if v281 then v281:ChangeState(Enum.HumanoidStateType.Running) end
  end)

  v213.AssemblyLinearVelocity = Vector3.new(0, 0.5, 0)
  v213.AssemblyAngularVelocity = Vector3.zero
  end


  task.spawn(function()
  local v1072 = tick()
  while tick() - v1072 < 20 do
  if _G._CLTHUB_ResetRequested then break end

  local v22 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
  if not v22 or not v22.Parent then break end

  if v96 and v96.Parent then


  if v22.Position.Y >= (v96.Position.Y + 0.2) then
  v96.CanCollide = true
  else
  v96.CanCollide = false
  end
  local v1133 = (Vector3.new(v22.Position.X, 0, v22.Position.Z) - Vector3.new(v96.Position.X, 0, v96.Position.Z)).Magnitude
  local v1295 = math.abs(v22.Position.Y - v96.Position.Y)


  if v48:GetAttribute("Stealing") == true then
  break
  end

  if v1133 > 12 or v1295 > 10 then
  break
  end
  else
  break
  end

  task.wait(0.08)
  end
  if v96 and v96.Parent then
  pcall(function() v96:Destroy() end)
  end
  if v786 then v786:Disconnect() end
  end)
  end


  local v160 = {}
  local v1055 = 0.9
  local v530 = 0
  local v529 = false

  _G.resetStealCache = function()
  for idx, v55 in pairs(v160) do
  v55.ready = true
  end
  table.clear(v160)
  v529 = false
  if _G.CLTHUB_StealStatus then _G.CLTHUB_StealStatus.active = false end
  end

  local function v1096(v44)
  if v160[v44] then
  if v160[v44].ready == false then
  if tick() - (v530 or 0) > 2.5 then
  v160[v44].ready = true
  end
  end
  return
  end
  if not v44 or not v44.Parent then return end
  local v55 = { holdCallbacks = {}, triggerCallbacks = {}, holdEndCallbacks = {}, ready = true }
  local function v694(v600, v1156)
  local ok, v843 = pcall(getconnections, v600)
  if ok and type(v843) == "table" then
  for idx, v34 in ipairs(v843) do
  if type(v34.Function) == "function" then table.insert(v1156, v34.Function) end
  end
  end
  end
  v694(v44.PromptButtonHoldBegan, v55.holdCallbacks)
  v694(v44.Triggered, v55.triggerCallbacks)
  v694(v44.PromptButtonHoldEnded, v55.holdEndCallbacks)
  if #v55.holdCallbacks > 0 or #v55.triggerCallbacks > 0 or #v55.holdEndCallbacks > 0 then
  v160[v44] = v55
  end
  end

  local function v1111(v44)
  local v55 = v160[v44]
  if not v55 or not v55.ready then return false end
  v55.ready = false
  v530 = tick()
  v529 = true
  _G.CLTHUB_StealStatus = _G.CLTHUB_StealStatus or {}
  _G.CLTHUB_StealStatus.active = true
  _G.CLTHUB_StealStatus.start = v530


  local v817 = 1.2
  _G.CLTHUB_StealStatus.duration = v817

  task.spawn(function()
  for idx, v182 in ipairs(v55.holdCallbacks) do task.spawn(v182) end
  pcall(function()
  local v805 = v44:GetAttribute("State")
  if v805 ~= nil and v805 ~= "Steal" and (#v55.holdCallbacks == 0 and #v55.triggerCallbacks == 0) then
  if not _G._xenStealRemote then
  local v802 = _G.Net
  _G._xenStealRemote = v802 and v802:RemoteEvent("f40f7d9e-2f0d-4167-b250-899273f46874")
  end
  local v83 = _G._xenStealRemote
  if v83 then
  pcall(function()
  local v809 = workspace:GetServerTimeNow() + 0.124
  v83:FireServer(v809, "68c86eb7-eb7e-4b4d-96ae-cf7cd847c5b0")
  v83:FireServer(v809, "07b9cc25-2a1f-4a26-a0ec-f2fab578d8bd")
  end)
  end
  end
  end)
  local v962 = v817 - (tick() - v530)
  if v962 > 0 then task.wait(v962) end
  if v44 and v44.Parent then
  for idx, v182 in ipairs(v55.triggerCallbacks) do task.spawn(v182) end
  end
  for idx, v182 in ipairs(v55.holdEndCallbacks) do task.spawn(v182) end
  v529 = false
  if _G.CLTHUB_StealStatus then _G.CLTHUB_StealStatus.active = false end
  task.wait(0.15)
  v55.ready = true
  end)
  return true
  end

  local function v883(v40)
  if v40.plot and v40.slot then
  local v53 = workspace:FindFirstChild("Plots")
  local v25 = v53 and v53:FindFirstChild(v40.plot)
  local v125 = v25 and v25:FindFirstChild("AnimalPodiums")
  local v110 = v125 and v125:FindFirstChild(tostring(v40.slot))
  if v110 then
  local v173 = v110:FindFirstChild("Base")
  local v264 = v173 and v173:FindFirstChild("Spawn")
  local v814 = v264 and v264:FindFirstChild("PromptAttachment")
  if v814 then
  for idx, v23 in ipairs(v814:GetChildren()) do
  if v23:IsA("ProximityPrompt") then return v23 end
  end
  end
  for idx, v33 in ipairs(v110:GetDescendants()) do
  if v33:IsA("ProximityPrompt") then return v33 end
  end
  end
  end
  if v40.model and v40.model.Parent then
  for idx, v33 in ipairs(v40.model:GetDescendants()) do
  if v33:IsA("ProximityPrompt") then return v33 end
  end
  end
  return nil
  end

  local v1039 = 120
  local v1054 = 25
  local v449 = nil
  local v807 = 0

  local function v1273()
  if v48:GetAttribute("Stealing") or v48:GetAttribute("IsTrading")
  or v48:GetAttribute("IsDuelSelecting") or v48:GetAttribute("Web") then
  return -1
  end
  return 0
  end

  local function v804(v63)
  if not v63 or #v63 == 0 then return nil end
  local v8 = Config or {}
  local v155 = v8.StealMode or "Priority"


  if v155 == "Highest" then
  local v138, v451
  for idx, v23 in ipairs(v63) do
  local v26 = v23.mps or 0
  if not v451 or v26 > v451 then v451, v138 = v26, v23 end
  end
  return v138
  end


  if v155 == "Priority" then
  if priorityList and #priorityList > 0 then
  for idx, v89 in ipairs(priorityList) do
  local v306 = v89:lower()
  for idx, v23 in ipairs(v63) do
  if (v23.name and v23.name:lower() == v306) or (v23.index and v23.index:lower() == v306) or (v23.name and v23.name:lower():find(v306, 1, true)) then
  return v23
  end
  end
  end
  end
  return nil
  end


  return v63[1]
end
  local function v1073(v27, v29)
  if not v27 or not v29 then return false end
  return v27.plot == v29.plot and tostring(v27.slot) == tostring(v29.slot)
  end

  local v1074 = nil
  local function v647(v40)
  if not v40 then return end
  v449 = v40; v807 = os.clock()
  v1074 = v40
  _G.CLTHUB_StealStatus = _G.CLTHUB_StealStatus or {}
  _G.CLTHUB_StealStatus.target = v40
  end
  local function v463()
  v449 = nil
  _G.CLTHUB_StealStatus = _G.CLTHUB_StealStatus or {}
  _G.CLTHUB_StealStatus.target = nil
  _G.CLTHUB_StealStatus.active = false
  end
  _G.CLTHUBArmSteal = v647
  _G.CLTHUBDisarmSteal = v463

  local v7 = Config.AutoStealEnabled == true
  _G.CLTHUBAutoSteal = function(v38) v7 = v38 == true end

  local v808 = 0
  local v797 = 0
  local v211 = false
  local v800 = 0
  local v518 = false
  local v634 = false
  local v806 = false

  v133.Heartbeat:Connect(function()
  local v60 = os.clock()
  if v7 and v806 and not v48:GetAttribute("Stealing")
  and not (v211 and v518)
  and (v60 - v797) >= 0.5 then
  v797 = v60
  local character = v48.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if v22 then
  local ok, v63 = pcall(v595)
  if ok and v63 then
  local v257 = (Config and Config.StealNearest) and Config.TpSettings.MinGenForGrab or (Config and Config.TpSettings and Config.TpSettings.MinGenForTp)
  local v332 = parseMinGen(v257) or 0
  local v441 = {}
  for idx, v23 in ipairs(v63) do
  local v724 = tonumber(v23.mps) or 0
  if v332 <= 0 or v724 >= v332 then
  table.insert(v441, v23)
  end
  end

  local v138

  if manuallySelectedUID then
  for idx, v40 in ipairs(v63) do
  if not v40.conveyor and v40.plot and v40.slot then
  local v76 = v40.plot .. "_" .. tostring(v40.slot)
  if v76 == manuallySelectedUID then v138 = v40; break end
  end
  end
  end
  if not v138 then
  local v627 = (Config and Config.StealMode) or "Priority"
  if v627 == "Nearest" then
  local v352
  for idx, v40 in ipairs(v441) do
  if not v40.conveyor then
  local v44 = v883(v40)
  if v44 and v44.Parent then
  local v218 = v44.Parent
  local v492 = (v218:IsA("BasePart") and v218.Position)
  or (v218.Parent and v218.Parent:IsA("BasePart") and v218.Parent.Position)
  if v492 then
  local v33 = (v22.Position - v492).Magnitude
  if (not v352 or v33 < v352) then v352, v138 = v33, v40 end
  end
  end
  end
  end
  else
  local v714 = {}
  for idx, v23 in ipairs(v441) do if not v23.conveyor then v714[#v714 + 1] = v23 end end
  v138 = v804(v714)
  end
  end
  if v138 then
  if not v1073(v138, v449) then v647(v138) end
  elseif v449 and not v529 then
  v463()
  end
  end
  end
  end

  local v40 = v449
  if not v40 then return end
  local v627 = (Config and Config.StealMode) or "Priority"
  if v627 == "Nearest" and v60 - v807 > v1054 then
  v463(); return
  end
  if v60 - v808 < 0.067 then return end
  v808 = v60
  local tmpInst = v1273()
  if tmpInst == -1 then
  if v48:GetAttribute("Stealing") then v463() end
  return
  end
  if tmpInst > 0 and tmpInst > v1055 then return end
  local character = v48.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  if not v22 then return end
  local v44 = v883(v40)
  if not v44 or not v44.Parent then return end
  local v218 = v44.Parent
  local v492 = (v218 and v218:IsA("BasePart") and v218.Position)
  or (v218 and v218.Parent and v218.Parent:IsA("BasePart") and v218.Parent.Position)
  local v1057 = v211 and v518 and v634
  if not v1057 and v492 and (v22.Position - v492).Magnitude > v1039 then return end
  local v719
  pcall(function() v719 = v44.MaxActivationDistance end)
  pcall(function() v44.MaxActivationDistance = math.huge end)
  v1096(v44)
  if v160[v44] then v1111(v44) end
  pcall(function() if v719 ~= nil then v44.MaxActivationDistance = v719 end end)
  end)


  local function v557()
  if v211 and (os.clock() - v800) < 5 then return end
  v211 = true
  _G._isTpMoving = true
  v800 = os.clock()
  v518 = false
  v634 = false
  if not v446 then pcall(v479) end

  local character = v48.Character
  local v22 = character and character:FindFirstChild("HumanoidRootPart")
  local v35 = character and character:FindFirstChildOfClass("Humanoid")
  if not v22 or not v35 then v211 = false; _G._isTpMoving = false; return end

  local v404 = v595(true)
  if #v404 == 0 then
  local v295 = os.clock()
  while #v404 == 0 and os.clock() - v295 < 4 do
  task.wait(0.1)
  v404 = v595(true)
  end
  end
  if #v404 == 0 then v211 = false; _G._isTpMoving = false; return end

  local v257 = (Config and Config.StealNearest) and Config.TpSettings.MinGenForGrab or (Config and Config.TpSettings and Config.TpSettings.MinGenForTp)
  local v332 = parseMinGen(v257) or 0
  local v441 = {}
  for idx, v23 in ipairs(v404) do
  local v724 = tonumber(v23.mps) or 0
  if v332 <= 0 or v724 >= v332 then
  table.insert(v441, v23)
  end
  end


  local v40
  if manuallySelectedUID then
  for idx, v23 in ipairs(v404) do
  if v23.plot and v23.slot and (v23.plot .. "_" .. tostring(v23.slot)) == manuallySelectedUID then v40 = v23; break end
  end
  end
  if not v40 then v40 = v804(v441) end

  if not v40 then
  v211 = false
  _G._isTpMoving = false
  return
  end

  local v521 = (Config and Config.TpSettings and Config.TpSettings.GrabbleTPSpeed) or 400
  local v1065 = (Config and Config.TpSettings and Config.TpSettings.CloneDelayVal) or 0.35

  local v135 = v40.position
  local v428 = v40.name


  local v346 = false
  local v187 = v35.Died:Connect(function()
  v346 = true


  task.defer(function()
  if v346 then
  v211 = false
  _G._isTpMoving = false
  end
  end)
  end)

  local v820 = v135.Y
  if v1042[v428] then v820 = v135.Y - v1041 end

  local v359 = v1139(v820)


  if v40.conveyor then
  local v65 = v40.model
  local v475 = v35.MaxHealth
  v35.Health = v475
  local v564 = v133.Heartbeat:Connect(function()
  if v35 and v35.Parent then v35.Health = v475 end
  end)
  v657()
  v340(v22)
  local function v1185()
  if not v65 or not v65.Parent then return nil end
  local v56 = v65.PrimaryPart or v65:FindFirstChildWhichIsA("BasePart")
  if v56 then return v56.Position end

  local ok, v1231 = pcall(function() return v65:GetPivot().Position end)
  return ok and v1231 or nil
  end
  local v295 = os.clock()
  while os.clock() - v295 < 8 do
  if v346 then break end
  if not v22 or not v22.Parent then break end
  local v915 = v1185()
  if not v915 then break end
  local v229 = v915 - v22.Position
  if v229.Magnitude <= 6 then break end
  v361()
  local v680 = v521
  local v680 = v521
  if v229.Magnitude <= 15 then
  v680 = v521 * 0.75
  end
  v22.AssemblyLinearVelocity = v229.Unit * v680
  v133.Heartbeat:Wait()
  end
  if v22 and v22.Parent then
  v22.AssemblyLinearVelocity = Vector3.zero
  v22.AssemblyAngularVelocity = Vector3.zero
  end
  v564:Disconnect()
  if v187 then v187:Disconnect() end
  v211 = false
  _G._isTpMoving = false
  return
  end


  v518 = true
  v463()

  local v670, v747 = v1127(v135, v359)
  if not v670 or not v747 then if v187 then v187:Disconnect() end; v211 = false; _G._isTpMoving = false; return end

  local v177 = v670.coord
  local v475 = v35.MaxHealth
  v35.Health = v475
  local v564 = v133.Heartbeat:Connect(function()
  if v35 and v35.Parent then v35.Health = v475 end
  end)


  if v568(v135.Y) >= 1 then
  v361()
  v657()
  task.wait(0.05)
  local v756 = v22.Position.Y

  local v1174 = (v756 < 5)
  local v1008 = v1174 and (v756 + 3) or (v756 + 15)
  local v387 = os.clock()
  while os.clock() - v387 < 0.6 and v22 and v22.Parent do
  local v357 = v22.Position.Y
  if v357 >= v1008 - 0.5 then break end
  v361()
  local v1242 = v1008 - v357
  local v1281 = math.clamp(v1242 * 14, 40, 80)
  v22.AssemblyLinearVelocity = Vector3.new(v22.AssemblyLinearVelocity.X, v1281, v22.AssemblyLinearVelocity.Z)
  v133.Heartbeat:Wait()
  end
  if v22 and v22.Parent then
  v340(v22)
  end
  v361()
  else
  v657()
  v340(v22)
  end

  local v411 = v670.facing == "NORTH" and Vector3.new(0, 0, -1) or Vector3.new(0, 0, 1)
  do
  local v420 = (v359 == v777)
  local v72 = v1140(v135)
  local v879, v880 = v1095(v72, v420, v22.Position.Z)
  local v982 = v1225(v359, v72)


  local v1235 = (v22.Position.X < v4)
  local v1217 = (v177.X < v4)
  local v1177 = (v1235 ~= v1217)

  local v1277 = v18[v72]
  local v1293 = math.abs(v22.Position.Z - v1277.Z)
  local v1173 = v1177 and (v1293 <= 35)

  if v1173 then
  v177 = v879
  v411 = v880
  elseif #v982 > 0 then
  local v660, v352
  for idx, v33 in ipairs(v982) do
  local v855 = (v22.Position - v33.coord).Magnitude
  if not v352 or v855 < v352 then v352, v660 = v855, v33 end
  end
  v177 = v660.coord
  v411 = v660.facing == "NORTH" and Vector3.new(0, 0, -1) or Vector3.new(0, 0, 1)
  else
  v177 = v879
  v411 = v880
  end
  end

  if v22 and v22.Parent then
  v22.CFrame = CFrame.new(v22.Position, v22.Position + v411)
  v22.AssemblyAngularVelocity = Vector3.zero
  end


  local v1130 = v568(v135.Y)

  local v1045  = 8
  local v1044 = 11
  local v437 = (v1130 >= 3) and (v22.Position.Y + v1044) or (v22.Position.Y + v1045)
  local v881 = {}


  local v1263 = (v177.X < v4) and -450 or -370
  local v617 = 40
  if v177.Z > v22.Position.Z then v617 = -40 end


  if math.abs(v22.Position.Z - v177.Z) <= 35 then


  if v22.Position.Z > 60 then
  v617 = -20
  else
  v617 = 20
  end
  end

  local v1196 = v177.Z + v617

  local v1195 = v437 + 2
  local v1194 = Vector3.new(v1263, v1195, v1196)

  v881 = { v1194, v177 }


  v1297(v22, v881, v521, true, false)


  do
  local v525 = v48.Character
  v22 = v525 and v525:FindFirstChild("HumanoidRootPart")
  v35 = v525 and v525:FindFirstChildOfClass("Humanoid")
  if v346 or not v22 or not v35 or (v22.Position - v177).Magnitude > 15 then
  if v187 then v187:Disconnect() end
  v564:Disconnect()
  if v22 and v22.Parent then v340(v22) end
  v211 = false
  _G._isTpMoving = false
  return
  end
  end

  v22.CFrame = CFrame.new(v177, v177 + v411)
  v340(v22)

  local v755 = 5
  local v754
  v754 = v133.Heartbeat:Connect(function()
  if not v22 or not v22.Parent then v754:Disconnect(); return end
  v755 = v755 - 1
  v22.CFrame = CFrame.new(v177, v177 + v411)
  v22.AssemblyLinearVelocity = Vector3.zero
  v22.AssemblyAngularVelocity = Vector3.zero
  if v755 <= 0 then v754:Disconnect() end
  end)


  for idx = 1, 20 do
  task.wait(0.05)
  if v346 then break end
  if v35.FloorMaterial ~= Enum.Material.Air then break end
  end

  v564:Disconnect()


  do
  local v398 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
  if v346 or not v398 or not v398.Parent or (v398.Position - v177).Magnitude > 20 then
  if v187 then v187:Disconnect() end
  if v398 and v398.Parent then v340(v398) end
  v211 = false
  _G._isTpMoving = false
  return
  end
  end

  v647(v40)
  v634 = true

  local v240 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
  local v520 = (v240 and v240.Parent and v240.Position) or v177

  local v191 = Instance.new("Part")
  v191.Name = "CLTHUBClonePlatform"
  v191.Size = Vector3.new(12, 1, 12)
  v191.Position = Vector3.new(v520.X, v520.Y - 3, v520.Z)
  v191.Anchored = true; v191.CanCollide = false; pcall(makeOneWay, v191); v191.Transparency = 1
  v191.Material = Enum.Material.SmoothPlastic; v191.Parent = workspace

  if v240 and v240.Parent then
  v240.AssemblyLinearVelocity = Vector3.zero
  v240.AssemblyAngularVelocity = Vector3.zero
  pcall(function() v240.Anchored = true end)
  task.delay(1, function()
  if v240 and v240.Parent then pcall(function() v240.Anchored = false end) end
  end)
  end

  local v1064 = false
  local v316 = v48.CharacterAdded:Connect(function() v1064 = true end)

  task.wait(v1065)
  local v1066 = v1116()

  if v191 then pcall(function() v191:Destroy() end); v191 = nil end
  if v316 then v316:Disconnect() end
  if v1066 and not v346 and not _G._CLTHUB_ResetRequested then
  v1131(v40, v520)
  end
  if v187 then v187:Disconnect() end
  v211 = false
  _G._isTpMoving = false
  end

  doGrabbleVelocityTP = v557
  _G.CLTHUBStartSideTP = v557

  _G.CLTHUB_ExecuteManualTP = function()
  task.spawn(function() pcall(v557) end)
  end

  v1043.InputBegan:Connect(function(v80, v1135)
  if v1135 then return end
  local v1252 = (Keybinds and Keybinds["Reset"]) or (Config and Config.keybinds and Config.keybinds["Reset"]) or "X"
  local v974 = Enum.KeyCode[v1252]
  if v974 and v80.KeyCode == v974 then
  task.spawn(function() pcall(v363) end)
  elseif v80.KeyCode == Enum.KeyCode.T then
  task.spawn(function() pcall(v557) end)
  end
  end)


  if bootMark then bootMark("TP engine reached (all UI above this point is already built)") end
  task.spawn(function() pcall(v713) pcall(v479) end)
  task.spawn(function()


  pcall(v713); pcall(v479)
  local v295 = os.clock()
  local v917, v505 = -1, 0
  repeat
  local ok, v63, v303 = pcall(v595, true)
  if ok and v63 then
  local v62 = #v63
  if v62 == v917 then v505 = v505 + 1 else v505 = 0; v917 = v62 end


  if v62 > 0 and (((v303 or 0) == 0 and v505 >= 1) or v505 >= (_G.CLTHUB_SCAN_STREAK or 3)) then break end
  end
  task.wait(0.05)
  until os.clock() - v295 > 12
  v806 = true
  _G.CLTHUBScannerReady = true
  if bootMark then bootMark("TP scanner ready (TpOnLoad unblocks here)") end
  end)
end


task.defer(function()
  if bootMark then bootMark("UI fully built") end

  local function v815(v71, v30)
  if typeof(v71) ~= "Instance" or not v71:IsA("GuiObject") then return false end
  if v71 == bottomBar or v71.Name == "BrandLogoShell" then return false end
  if v71:GetAttribute("CLTHUBDraggable") then return false end

  local v998 = v71.Size
  if v998.X.Scale >= 0.99 and v998.Y.Scale >= 0.99 then return false end


  local v86
  for idx, v1159 in ipairs({ "Header", "TopBar", "Top", "TitleBar", "DragHandle" }) do
  local v52 = v71:FindFirstChild(v1159)
  if v52 and v52:IsA("GuiObject") then v86 = v52; break end
  end
  v86 = v86 or v71
  local ok = pcall(makeDraggable, v71, v86, v30)
  if ok then
  pcall(function() if applySavedPosition then applySavedPosition(v30, v71) end end)
  end
  return ok
  end

  local v459 = 0

  for v30, v49 in pairs({
  ["CLTHUB\nBottom Bar"]  = (bottomBar ~= nil) and bottomBar or nil,
  }) do
  if v815(v49, v30) then v459 = v459 + 1 end
  end


  pcall(function()
  for v98, v154 in pairs(scaledGuis or {}) do
  if v98 and v98.Parent then
  for idx, v85 in ipairs({ v154, v98 }) do
  if v85 then
  for idx, v24 in ipairs(v85:GetChildren()) do
  if v24:IsA("Frame") and v24.Name ~= "CLTHUB_MasterFrame" then
  if v815(v24, "CLTHUB\nAuto_" .. tostring(v98.Name) .. "_" .. tostring(v24.Name)) then
  v459 = v459 + 1
  end
  end
  end
  end
  end
  end
  end
  end)

  if _G.CLTHUB_BOOT_DEBUG then
  print("[CLTHUB] drag attached to " .. v459 .. " previously-fixed UI(s). Unlock the UI if dragging does nothing.")
  end
end)


local function v1060()
  local PlayersService = game:GetService("Players")
  local v1299 = game:GetService("StarterGui")


  local v239 = 8

  local function v849(v61)
  if v61:IsA("WrapLayer") or v61:IsA("WrapTarget") then
  v61:Destroy()
  return
  end
  if v61:IsA("Accessory") or v61:IsA("Hat") then
  local v86 = v61:FindFirstChild("Handle")
  if v86 then
  if v86:FindFirstChildOfClass("WrapLayer") then
  v61:Destroy()
  return
  end
  if v86.Size.X > v239 or v86.Size.Y > v239 or v86.Size.Z > v239 then
  v61:Destroy()
  return
  end
  for idx, v24 in ipairs(v86:GetChildren()) do
  if v24:IsA("SpecialMesh") or v24:IsA("Mesh") then
  if v24.Scale.X > v239 or v24.Scale.Y > v239 or v24.Scale.Z > v239 then
  v61:Destroy()
  return
  end
  end
  end
  end
  end
  end

  local function v547(v119)
  local v1251 = {"BodyDepthScale", "BodyHeightScale", "BodyWidthScale", "BodyProportionScale", "HeadScale"}
  for idx, v1250 in ipairs(v1251) do
  local v261 = v119:FindFirstChild(v1250)
  if v261 and v261:IsA("NumberValue") then
  if v261.Value > 3 or v261.Value < 0.5 then
  v261.Value = 1
  end
  end
  end
  end

  local function v848(v54)
  for idx, v61 in ipairs(v54:GetDescendants()) do
  v849(v61)
  end
  local v119 = v54:FindFirstChildOfClass("Humanoid")
  if v119 then v547(v119) end
  v54.DescendantAdded:Connect(function(v61)
  task.wait()
  v849(v61)
  if v61:IsA("NumberValue") and v54:FindFirstChildOfClass("Humanoid") then
  v547(v54:FindFirstChildOfClass("Humanoid"))
  end
  end)
  end

  local function v934(v729)
  if v729.Character then v848(v729.Character) end
  v729.CharacterAdded:Connect(v848)
  end

  for idx, v23 in ipairs(PlayersService:GetPlayers()) do
  if v23 ~= PlayersService.LocalPlayer then v934(v23) end
  end
  PlayersService.PlayerAdded:Connect(function(v23)
  if v23 ~= PlayersService.LocalPlayer then v934(v23) end
  end)
end

task.spawn(v1060)


_G.ApplyFPSBoost = function()
  if _G.FPSBoostApplied then return end
  _G.FPSBoostApplied = true
  task.spawn(function()
  local v623 = game:GetService("Workspace")
  local v46 = game:GetService("Lighting")
  local PlayersService = game:GetService("Players")
  local v775 = game:GetService("MaterialService")

  pcall(function()
  settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
  settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
  settings().Physics.AllowSleep = true
  settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Skip
  end)

  pcall(function() if sethiddenproperty then sethiddenproperty(v46, "Technology", Enum.Technology.Compatibility) end end)
  pcall(setfpscap, 999)


  local function v294(inst) pcall(function() inst:Destroy() end) end
  local function v270(inst)
  local v1100 = {"Shirt", "Pants", "ShirtGraphic", "Accessory", "Hat", "HairAccessory", "FaceAccessory", "NeckAccessory", "ShoulderAccessory", "FrontAccessory", "BackAccessory", "WaistAccessory"}
  for idx,v34 in ipairs(v1100) do if inst:IsA(v34) then return true end end return false
  end

  local function v624(inst)
  if not Config.FPSBoost then return end
  pcall(function()
  if inst:IsA("SurfaceAppearance") or inst:IsA("Decal") or inst:IsA("Texture") then
  if inst.Name ~= "face" then v294(inst) end
  elseif inst:IsA("SpecialMesh") then inst.TextureId = ""
  elseif inst:IsA("Beam") then
  local v62 = inst.Name
  if v62 ~= "PlotBeam" and v62 ~= "PlotBeam_Border" and v62 ~= "BestPetBeam" and v62 ~= "BestPetBeam_Border" and v62 ~= "PlotBeamGlow" then v294(inst) end
  elseif inst:IsA("ParticleEmitter") or inst:IsA("Trail") or inst:IsA("PointLight") or inst:IsA("SpotLight") or inst:IsA("SurfaceLight") or inst:IsA("Fire") or inst:IsA("Smoke") or inst:IsA("Sparkles") or inst:IsA("Explosion") then v294(inst)
  elseif inst:IsA("BasePart") then
  inst.CastShadow = false; inst.Material = Enum.Material.SmoothPlastic; inst.MaterialVariant = ""; inst.Reflectance = 0
  inst.TopSurface = Enum.SurfaceType.SmoothNoOutlines; inst.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
  inst.LeftSurface = Enum.SurfaceType.SmoothNoOutlines; inst.RightSurface = Enum.SurfaceType.SmoothNoOutlines
  inst.FrontSurface = Enum.SurfaceType.SmoothNoOutlines; inst.BackSurface = Enum.SurfaceType.SmoothNoOutlines
  end
  end)
  end

  local function v1049()
  v46.GlobalShadows = false; v46.FogEnd = 9e9; v46.FogStart = 9e9; v46.EnvironmentDiffuseScale = 0; v46.EnvironmentSpecularScale = 0; v46.Brightness = 1.5; v46.Ambient = Color3.fromRGB(60, 60, 60)
  for idx, v26 in ipairs(v46:GetChildren()) do if v26:IsA("PostEffect") then pcall(function() v26.Enabled = false end) elseif v26:IsA("Atmosphere") or v26:IsA("Clouds") or v26:IsA("Sky") then v26:Destroy() end end
  v46.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
  v46.ColorShift_Top = Color3.fromRGB(128, 128, 128)
  v46.ColorShift_Bottom = Color3.fromRGB(128, 128, 128)
  v46.FogColor = Color3.fromRGB(128, 128, 128)
  end

  local function v1050()
  pcall(function()
  local v444 = v623.Terrain
  v444.Decoration = false
  v444.WaterWaveSize = 0
  v444.WaterWaveSpeed = 0
  v444.WaterReflectance = 0
  v444.WaterTransparency = 1
  end)
  end

  if Config.FPSBoost then v1049(); v1050() end

  local v649 = v623:GetDescendants()
  for v28 = 1, #v649, 5000 do
  if not Config.FPSBoost then break end
  for v1166 = v28, math.min(v28 + 4999, #v649) do
  local inst = v649[v1166]; if inst and inst.Parent then if v270(inst) then v294(inst) else v624(inst) end end
  end
  task.wait()
  end

  v623.DescendantAdded:Connect(function(inst) if Config.FPSBoost then if v270(inst) then v294(inst) else v624(inst) end end end)
  v46.DescendantAdded:Connect(function(inst) if not Config.FPSBoost then return end if inst:IsA("PostEffect") then pcall(function() inst.Enabled = false end) elseif inst:IsA("Atmosphere") or inst:IsA("Clouds") then v294(inst) end end)

  v775.DescendantAdded:Connect(function(inst) if Config.FPSBoost then v294(inst) end end)
  for idx, inst in ipairs(v775:GetChildren()) do if Config.FPSBoost then v294(inst) end end

  local function v626(character)
  if not character then return end
  task.spawn(function()
  task.wait(0.3)
  if not Config.FPSBoost then return end
  for idx, inst in ipairs(character:GetDescendants()) do if v270(inst) then v294(inst) else v624(inst) end end
  end)
  end
  for idx, player in ipairs(PlayersService:GetPlayers()) do v626(player.Character); player.CharacterAdded:Connect(v626) end
  PlayersService.PlayerAdded:Connect(function(player) player.CharacterAdded:Connect(v626) end)
  end)
end

if Config.FPSBoost then _G.ApplyFPSBoost() end


