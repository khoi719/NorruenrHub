-- NORRUENR HUB (GokuTheme)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local userAllowed = {
    ["hung111111111146"] = true,
    ["Khikhibocon"] = true
}

-- UI button (menu tròn) ảnh Sasuke
local btn = Instance.new("ImageButton")
btn.Size = UDim2.new(0, 60, 0, 60)
btn.Position = UDim2.new(0, 20, 0.5, -30)
btn.Image = "rbxassetid://13116639556" -- Sasuke lạnh lùng
btn.BackgroundTransparency = 1
btn.Parent = game.CoreGui

-- Tạo UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NORRUENR_UI"
ScreenGui.Parent = game.CoreGui

-- Giao diện chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- Nền Goku
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.new(1,0,1,0)
bg.Image = "rbxassetid://13135976859" -- Goku Ultra Instinct
bg.BackgroundTransparency = 1
bg.ImageTransparency = 0.4
bg.ZIndex = -1
bg.Parent = MainFrame

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Text = "NORRUENR HUB (GokuTheme)"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,40)
title.Parent = MainFrame

-- Các danh mục
local buttons = {
    "Farm", "Event", "V4", "Sea", "Trái", "Code", "PvP", "Skill", "Admin"
}

for i, name in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.3, 0, 0, 30)
    btn.Position = UDim2.new(0.05 + ((i-1)%3)*0.32, 0, 0.2 + math.floor((i-1)/3)*0.12, 0)
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = MainFrame

    if name == "Admin" then
        btn.MouseButton1Click:Connect(function()
            if userAllowed[LocalPlayer.Name] then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Admin Mode",
                    Text = "Quyền admin được bật!",
                    Duration = 3
                })
            else
                game.Players:Chat("kick "..LocalPlayer.Name)
            end
        end)
    end
end

-- Toggle menu
btn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
