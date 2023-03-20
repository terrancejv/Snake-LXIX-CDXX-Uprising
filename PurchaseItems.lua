local toolList = {
	[1] = 'CloneJuice'; 
	[2] = 'GrowJuice'; 
	[3] = 'FlashJuice';
}

local rStorage = game:GetService('ReplicatedStorage')
local sStorage = game:GetService('ServerStorage')

local requestTool = rStorage:FindFirstChild('Remotes'):FindFirstChild('RequestTool')
local tools = sStorage:FindFirstChild('Tools')

requestTool.OnServerEvent:Connect(function(player, toolValue)
	if toolValue == 1 then
		local ShopOpenedFrame = player.PlayerGui.ShopGui.ShopOpenedFrame
		if player.leaderstats.Apples.Value >= 100 then
			local bp = player:FindFirstChild('Backpack')
			local tool = tools:FindFirstChild(toolList[toolValue])
			if not tool then print('tool does not exist') return end
			player.leaderstats.Apples.Value = player.leaderstats.Apples.Value - 100
			player.PlayerGui.ShopGui.ShopOpenedFrame.PlayerAppleCount.Text = player.leaderstats.Apples.Value
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Text = "-100"
			tool:Clone().Parent = bp
			player.PlayerGui.ShopGui.SoundEffects.Money:Play()
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Visible = true
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Visible = true
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount:TweenPosition(UDim2.new(0.67, 0, 0.12, 0),"In","Quint")
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2:TweenPosition(UDim2.new(0.77, 0, 0.12, 0),"In","Quint")
			wait(1)
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Visible = false
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Visible = false
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Position = UDim2.new(0.67, 0, 0.07, 0)
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Position = UDim2.new(0.77, 0, 0.07, 0)
			wait(1)
		else
			player.PlayerGui.ShopGui.SoundEffects.Buzz:Play()
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 0/255, 0/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Position = UDim2.new(0.2, 0, 0.65, 0)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = true
			wait(1)
			ShopOpenedFrame.NotEnoughApplesLabel:TweenPosition(UDim2.new(0.2, 0, 0.4, 0))
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 255/255, 255/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = false
		end
	end
	if toolValue == 2 then
		local ShopOpenedFrame = player.PlayerGui.ShopGui.ShopOpenedFrame
		if player.leaderstats.Apples.Value >= 150 then
			local bp = player:FindFirstChild('Backpack')
			local tool = tools:FindFirstChild(toolList[toolValue])
			if not tool then print('tool does not exist') return end
			player.leaderstats.Apples.Value = player.leaderstats.Apples.Value - 150
			ShopOpenedFrame.PlayerAppleCount.Text = player.leaderstats.Apples.Value
			ShopOpenedFrame.LostAppleCount.Text = "-150"
			tool:Clone().Parent = bp
			player.PlayerGui.ShopGui.SoundEffects.Money:Play()
			ShopOpenedFrame.LostAppleCount.Visible = true
			ShopOpenedFrame.ApplePicture2.Visible = true
			ShopOpenedFrame.LostAppleCount:TweenPosition(UDim2.new(0.67, 0, 0.13, 0),"In","Quint")
			ShopOpenedFrame.ApplePicture2:TweenPosition(UDim2.new(0.77, 0, 0.13, 0),"In","Quint")
			wait(1)
			ShopOpenedFrame.LostAppleCount.Visible = false
			ShopOpenedFrame.ApplePicture2.Visible = false
			ShopOpenedFrame.LostAppleCount.Position = UDim2.new(0.67, 0, 0.07, 0)
			ShopOpenedFrame.ApplePicture2.Position = UDim2.new(0.77, 0, 0.07, 0)
			wait(1)
		else
			player.PlayerGui.ShopGui.SoundEffects.Buzz:Play()
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 0/255, 0/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Position = UDim2.new(0.2, 0, 0.65, 0)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = true
			wait(1)
			ShopOpenedFrame.NotEnoughApplesLabel:TweenPosition(UDim2.new(0.2, 0, 0.4, 0))
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 255/255, 255/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = false
		end
	end
	if toolValue == 3 then
		local ShopOpenedFrame = player.PlayerGui.ShopGui.ShopOpenedFrame
		if player.leaderstats.Apples.Value >= 200 then
			local bp = player:FindFirstChild('Backpack')
			local tool = tools:FindFirstChild(toolList[toolValue])
			if not tool then print('tool does not exist') return end
			player.leaderstats.Apples.Value = player.leaderstats.Apples.Value - 200
			player.PlayerGui.ShopGui.ShopOpenedFrame.PlayerAppleCount.Text = player.leaderstats.Apples.Value
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Text = "-200"
			tool:Clone().Parent = bp
			player.PlayerGui.ShopGui.SoundEffects.Money:Play()
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Visible = true
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Visible = true
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount:TweenPosition(UDim2.new(0.67, 0, 0.12, 0),"In","Quint")
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2:TweenPosition(UDim2.new(0.77, 0, 0.12, 0),"In","Quint")
			wait(1)
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Visible = false
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Visible = false
			player.PlayerGui.ShopGui.ShopOpenedFrame.LostAppleCount.Position = UDim2.new(0.67, 0, 0.07, 0)
			player.PlayerGui.ShopGui.ShopOpenedFrame.ApplePicture2.Position = UDim2.new(0.77, 0, 0.07, 0)
			wait(1)
		else
			player.PlayerGui.ShopGui.SoundEffects.Buzz:Play()
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 0/255, 0/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Position = UDim2.new(0.2, 0, 0.65, 0)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = true
			wait(1)
			ShopOpenedFrame.NotEnoughApplesLabel:TweenPosition(UDim2.new(0.2, 0, 0.4, 0))
			ShopOpenedFrame.ShopPage1.RedJuiceDesc.TextColor = Color3.new(255/255, 255/255, 255/255)
			ShopOpenedFrame.NotEnoughApplesLabel.Visible = false
		end
	end
end)

