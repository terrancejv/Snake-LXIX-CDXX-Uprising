local setting = require(script.Parent.Setting)
local dataStore = game:GetService("DataStoreService")
local data = dataStore:GetDataStore("Time")
local data3 = dataStore:GetDataStore("Data")
local data4 = dataStore:GetDataStore("Days")
local canSave = false



function playerAdd(player)
	if setting.AlreadyHaveLeaderstats == false then
		local leaderstats = Instance.new("Folder",player)
		leaderstats.Name = "leaderstats"
		
		local currency = Instance.new("IntValue",leaderstats)
		currency.Name = setting.Currency
	end
	
	local dayz = Instance.new("Folder",player)
	dayz.Name = "Dayzz"
	
	local day1 = Instance.new("BoolValue",dayz)
	day1.Name = "Day1"
	
	local day2 = Instance.new("BoolValue",dayz)
	day2.Name = "Day2"
	
	local day3 = Instance.new("BoolValue",dayz)
	day3.Name = "Day3"
	
	local day4 = Instance.new("BoolValue",dayz)
	day4.Name = "Day4"
	
	local day5 = Instance.new("BoolValue",dayz)
	day5.Name = "Day5"
	
	local dayss = data4:getAsync(player.UserId)
	
	if dayss then
		day1.Value = dayss[1]
		day2.Value = dayss[2]
		day3.Value = dayss[3]
		day4.Value = dayss[4]
		day5.Value = dayss[5]
	end
	
	local saved = data:GetAsync(player.UserId)
	local saved1 = data3:GetAsync(player.UserId)
	
	if not saved then
		canSave = true
	end
	
	if saved and saved1 then
		local connect = Instance.new("BoolValue",player)
		connect.Name = "Connected"
		connect.Value = false
		
		local val = Instance.new("IntValue", player)
		val.Name = "Days"
		
		if (os.time() - saved1) / 3600 < 24 then
			player.Connected.Value = true
			if (os.time() - saved) / 3600 >= 24 then
				if math.floor(((os.time() - saved) / 3600) / 24) <= 5 then
					val.Value = math.floor(((os.time() - saved) / 3600) / 24)
					game.ReplicatedStorage.ShowGui:FireClient(player)
				end
			end
		else
			player.Connected.Value = false
			day1.Value = false
			day2.Value = false
			day3.Value = false
			day4.Value = false
			day5.Value = false
		end
		
		game.ReplicatedStorage.Day.OnServerEvent:Connect(function(player, day)
			if day == 1 then
				day1.Value = true
			elseif day == 2 then
				day2.Value = true
			elseif day == 3 then
				day3.Value = true
			elseif day == 4 then
				day4.Value = true
			elseif day == 5 then
				day5.Value = true
			end
		end)
	end
end

function save(player)
	local days = {}
	
	for i,v in pairs(player.Dayzz:GetChildren()) do
		table.insert(days,v.Value)
	end
	
	data4:SetAsync(player.UserId, days)
	data3:SetAsync(player.UserId, os.time())
	
	if player.Connected.Value == false or canSave == true then
		data:SetAsync(player.UserId, os.time())
	end
end

game.Players.PlayerRemoving:Connect(save)
game.Players.PlayerAdded:Connect(playerAdd)

game.ReplicatedStorage.GiveMoney.OnServerEvent:Connect(function(player, num)
	player:WaitForChild("leaderstats"):WaitForChild(setting.Currency).Value = player:WaitForChild("leaderstats"):WaitForChild(setting.Currency).Value + num
end)