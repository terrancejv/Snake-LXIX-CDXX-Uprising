local player = game.Players.LocalPlayer
game.ReplicatedStorage.ShowGui.OnClientEvent:Connect(function()
	local days = player:WaitForChild("Days").Value
	if player:WaitForChild("Dayzz"):WaitForChild("Day"..days).Value ~= true then
		if days == 1 then
			script.Parent.Reward1.ImageColor3 = Color3.fromRGB(9,189,0)
			script.Parent.Collect.Value = script.Parent.Reward1.Give.Value
		elseif days == 2 then
			script.Parent.Reward2.ImageColor3 = Color3.fromRGB(9,189,0)
			script.Parent.Collect.Value = script.Parent.Reward2.Give.Value
		elseif days == 3 then
			script.Parent.Reward3.ImageColor3 = Color3.fromRGB(9,189,0)
			script.Parent.Collect.Value = script.Parent.Reward3.Give.Value
		elseif days == 4 then
			script.Parent.Reward4.ImageColor3 = Color3.fromRGB(9,189,0)
			script.Parent.Collect.Value = script.Parent.Reward4.Give.Value
		elseif days == 5 then
			script.Parent.Reward5.ImageColor3 = Color3.fromRGB(9,189,0)
			script.Parent.Collect.Value = script.Parent.Reward5.Give.Value
		end
		
		script.Parent:TweenPosition(UDim2.new(0.5, 0, 0.6, 0), "Out", "Quint", 1, true)
	end
end)
