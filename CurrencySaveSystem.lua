local datastore = game:GetService("DataStoreService")
local ds1 = datastore:GetDataStore("HighscoreSaveSystem")
local ds2 = datastore:GetDataStore("TimeSaveSystem")
local ds3 = datastore:GetDataStore("ApplesSaveSystem")

game.Players.PlayerAdded:Connect(function(plr)
	local folder = Instance.new("Folder", plr)
	folder.Name = "leaderstats"
	local Highscore = Instance.new("IntValue", folder)
	Highscore.Name = "Highscore"
	local Apples = Instance.new("IntValue", folder)
	Apples.Name = "Apples"
	
	Highscore.Value = ds1:GetAsync(plr.UserId)
	ds1:SetAsync(plr.UserId, Highscore.Value)
	Apples.Value = ds3:GetAsync(plr.UserId)
	ds3:SetAsync(plr.UserId, Apples.Value)
	
	Highscore.Changed:connect(function()
		ds1:SetAsync(plr.UserId, Highscore.Value)
	end)
	Apples.Changed:connect(function()
		ds3:SetAsync(plr.UserId, Apples.Value)
	end)
end)