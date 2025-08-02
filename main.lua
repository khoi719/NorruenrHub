-- NORRUENR Hub | Goku Theme

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🌌 NORRUENR HUB (Goku Theme)", "Ocean")

-- Nút tròn ẩn/hiện menu
local CoreGui = game:GetService("CoreGui")
local toggleGUI = Instance.new("ScreenGui", CoreGui)
toggleGUI.Name = "NUH_Toggle"
local btn = Instance.new("ImageButton", toggleGUI)
btn.Position = UDim2.new(0, 8, 0.3, 0)
btn.Size = UDim2.new(0, 48, 0, 48)
btn.Image = "rbxassetid://3926307971"
btn.BackgroundTransparency = 1
local menuOpen = true
btn.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    for _, v in ipairs(CoreGui:GetChildren()) do
        if v.Name == "KavoUI" then
            v.Enabled = menuOpen
        end
    end
end)

-- Admin bằng TÊN NGƯỜI DÙNG
local AdminNames = {
    ["hung111111111146"] = true,
    ["Khikhibocon"] = true
}
local AdminPass = "delta123"
local failCount = {}

function isAdmin()
    return AdminNames[game.Players.LocalPlayer.Name] == true
end

-- Tạo 9 tab
local tabs = {}
for i, name in ipairs({"Farm","Event","V4","Sea","Trái","Code","PvP","Skill","Admin"}) do
    tabs[i] = Window:NewTab(name)
end

-- Admin UI
local s9 = tabs[9]:NewSection("🔒 ADMIN")
local inputPass
s9:NewTextBox("Nhập mật khẩu admin","",function(txt)
  inputPass = txt
  local name = game.Players.LocalPlayer.Name
  if isAdmin() and inputPass == AdminPass then
    s9:NewLabel("✅ Đã mở quyền Admin (NORRUENR)")
  else
    failCount[name] = (failCount[name] or 0) + 1
    s9:NewLabel("❌ Sai mật khẩu hoặc không có quyền")
    if failCount[name] >= 10 then
      warn("Người dùng "..name.." thử sai pass >10 lần")
      pcall(function() game.Players.LocalPlayer:Kick("Không đủ quyền sử dụng HUB") end)
    end
  end
end)

-- Anti kick
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "Kick" then return end
    return old(self, ...)
end)
