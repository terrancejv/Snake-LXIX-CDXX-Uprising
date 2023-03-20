math.randomseed(tick())

local part = script.Parent
local canGet = true

local function onTouch(hit)
	local random = math.random(1,15)
	local Humanoid = hit.Parent:FindFirstChild('Humanoid')
	if Humanoid then
		local player = game.Players:FindFirstChild(hit.Parent.Name)
		if player and canGet then
			canGet = false
			player.leaderstats.Apples.Value = player.leaderstats.Apples.Value + random
			wait(1)
			canGet = true
		end
	end
	hit.Parent.HumanoidRootPart.CFrame = CFrame.new(workspace["TelePart1"].Position)
end

part.Touched:Connect(onTouch)