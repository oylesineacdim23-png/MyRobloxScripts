--// YT-PUBGXALİ V26 - UNLIMITED JUMP & INDEX STABLE
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local lp = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local CorrectKey = "31hehahe"

--// RGB TASARIM
local function ApplyStyle(obj)
    local s = Instance.new("UIStroke", obj)
    s.Thickness = 2
    local c = Instance.new("UICorner", obj)
    c.CornerRadius = UDim.new(0, 8)
    task.spawn(function()
        while task.wait() do
            s.Color = Color3.fromHSV(tick() % 5 / 5, 0.7, 1)
        end
    end)
end

--// 1. ANAHTAR GİRİŞİ
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 280, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -140, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.Active = true
KeyFrame.Draggable = true
ApplyStyle(KeyFrame)

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.PlaceholderText = "KEY: 31hehahe"
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.TextColor3 = Color3.new(1,1,1)

local LoginBtn = Instance.new("TextButton", KeyFrame)
LoginBtn.Size = UDim2.new(0.6, 0, 0, 35)
LoginBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
LoginBtn.Text = "BAŞLAT"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
LoginBtn.TextColor3 = Color3.new(1,1,1)
ApplyStyle(LoginBtn)

--// 2. ANA PANEL
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 480)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
ApplyStyle(MainFrame)

local function CreateBox(text, default, pos)
    local l = Instance.new("TextLabel", MainFrame)
    l.Size = UDim2.new(0.4, 0, 0, 20)
    l.Position = UDim2.new(0.05, 0, pos.Y.Scale, -25)
    l.Text = text
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundTransparency = 1
    l.TextXAlignment = Enum.TextXAlignment.Left
    
    local b = Instance.new("TextBox", MainFrame)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = pos
    b.Text = default
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.TextColor3 = Color3.new(1,1,1)
    ApplyStyle(b)
    return b
end

local SpeedBox = CreateBox("HIZ:", "216", UDim2.new(0.05, 0, 0.15, 0))
local JumpBox = CreateBox("ZIPLAMA:", "100", UDim2.new(0.05, 0, 0.28, 0))
local FloatPowerBox = CreateBox("SÜZÜLME GÜCÜ:", "5", UDim2.new(0.05, 0, 0.41, 0))

local FloatBtn = Instance.new("TextButton", MainFrame)
FloatBtn.Size = UDim2.new(0.9, 0, 0, 45)
FloatBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
FloatBtn.Text = "SÜZÜLME: KAPALI"
FloatBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FloatBtn.TextColor3 = Color3.new(1,1,1)
ApplyStyle(FloatBtn)

local IndexBtn = Instance.new("TextButton", MainFrame)
IndexBtn.Size = UDim2.new(0.9, 0, 0, 45)
IndexBtn.Position = UDim2.new(0.05, 0, 0.68, 0)
IndexBtn.Text = "INDEX KASMA: KAPALI"
IndexBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
IndexBtn.TextColor3 = Color3.new(1,1,1)
ApplyStyle(IndexBtn)

--// HİLE SİSTEMİ
local floatOn = false
local farmActive = false
local basePos = nil

-- SONSUZ ZIPLAMA (Süzülürken zıplama sorunu çözümü)
UIS.JumpRequest:Connect(function()
    if floatOn and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- INDEX KASMA (Gelişmiş Mesafe & Touch)
IndexBtn.MouseButton1Click:Connect(function()
    farmActive = not farmActive
    IndexBtn.Text = farmActive and "INDEX: AKTİF ✅" or "INDEX: KAPALI ❌"
    IndexBtn.BackgroundColor3 = farmActive and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(45, 45, 45)
    
    if farmActive then
        basePos = lp.Character.HumanoidRootPart.CFrame
        task.spawn(function()
            while farmActive do
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if farmActive and (v.Name:find("Brainrot") or v.Name:find("Index") or v.Name == "Collect") then
                        local root = lp.Character.HumanoidRootPart
                        if v:IsA("BasePart") or v:IsA("MeshPart") then
                            root.CFrame = v.CFrame
                            task.wait(0.15) -- Toplama payı
                            root.CFrame = basePos
                            task.wait(0.35)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    end
end)

-- HIZ VE SÜZÜLME
game:GetService("RunService").Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = tonumber(SpeedBox.Text) or 16
        lp.Character.Humanoid.JumpPower = tonumber(JumpBox.Text) or 50
        
        if floatOn and lp.Character.HumanoidRootPart.Velocity.Y < 0 then
            local pwr = tonumber(FloatPowerBox.Text) or 5
            lp.Character.HumanoidRootPart.Velocity = Vector3.new(lp.Character.HumanoidRootPart.Velocity.X, -pwr, lp.Character.HumanoidRootPart.Velocity.Z)
        end
    end
end)

FloatBtn.MouseButton1Click:Connect(function()
    floatOn = not floatOn
    FloatBtn.Text = floatOn and "SÜZÜLME: AKTİF 🕊️" or "SÜZÜLME: KAPALI ❌"
    FloatBtn.BackgroundColor3 = floatOn and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(45, 45, 45)
end)

--// MENÜ AÇ/KAPA
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 10, 0, 200)
Toggle.Text = "V26"
Toggle.Visible = false
ApplyStyle(Toggle)

Toggle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

LoginBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyFrame:Destroy()
        MainFrame.Visible = true
        Toggle.Visible = true
    end
end)
