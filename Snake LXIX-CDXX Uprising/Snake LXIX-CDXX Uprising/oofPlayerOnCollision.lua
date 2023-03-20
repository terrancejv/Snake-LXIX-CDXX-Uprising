local part = script.Parent

local function onTouch(hit)
	local Humanoid = hit.Parent:FindFirstChild('Humanoid')
	if Humanoid then
		local player = game.Players:FindFirstChild(hit.Parent.Name)
		if player then
			Humanoid.Health = 0
		end
	end	
end
part.Touched:Connect(onTouch)