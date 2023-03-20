game.Players.PlayerAdded:Connect(function(player)
	
	local marketservice = game:GetService("MarketplaceService")
	
	local can = true
	repeat wait() until player:FindFirstChild("leaderstats")
	local leader = player:FindFirstChild("leaderstats")
	if leader then
	repeat wait() until leader:FindFirstChild(script:WaitForChild("Currency").Value)
	local currency = leader:FindFirstChild(script:WaitForChild("Currency").Value)
		if currency then
			wait(5)
			local folder = Instance.new("Folder",player)
			folder.Name = "2xGamepass"
			local oldmoney = Instance.new("IntValue",folder)
			oldmoney.Name = "OldMoney"
			oldmoney.Value = currency.Value
			local give2x = Instance.new("IntValue",folder)
			give2x.Name = "Give2x"
			give2x.Value = 0
			
			currency.Changed:Connect(function()
				if marketservice:UserOwnsGamePassAsync(player.UserId, script:WaitForChild("GamepassId").Value) then
				
					
				if can == true then
					can = false
				if currency.Value > oldmoney.Value then
				give2x.Value = currency.Value - oldmoney.Value
			
				currency.Value = currency.Value + give2x.Value
				
				oldmoney.Value = currency.Value
					can = true
					else
						
							oldmoney.Value = currency.Value
							can = true
						
						
				end
					
				end
				else
					oldmoney.Value = currency.Value
				end
			end)
			
		end
	end
end)
