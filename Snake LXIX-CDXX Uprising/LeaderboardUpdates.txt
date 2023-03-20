local DataStoreService = game:GetService("DataStoreService")
local HighScoreLeaderboard = DataStoreService:GetOrderedDataStore("HighScoreLeaderBoard")

local function updateLeaderBoard()
	local success, errorMessage = pcall(function()
		local Data = HighScoreLeaderboard:GetSortedAsync(false, 10)
		local highscorePage = Data:GetCurrentPage()
		for Rank, data in ipairs(highscorePage) do
			local userName = game.Players:GetNameFromUserIdAsync(tonumber(data.key))
			local Name = userName
			local Highscore = data.value
			local isOnLeaderboard = false
			for i, v in pairs(game.Workspace.GlobalLeaderboard.Sign.LeaderboardGUI.Holder:GetChildren()) do
				if v.Player.Text == Name then
					isOnLeaderboard = true
					break
				end
			end
			
			if Highscore and isOnLeaderboard == false then
				local newLbFrame = game.ReplicatedStorage:WaitForChild("LeaderBoardFrame"):Clone()
				newLbFrame.Player.Text = Name
				newLbFrame.Highscore.Text = Highscore
				newLbFrame.Rank.Text = "#"..Rank
				if newLbFrame.Rank.Text == "#1" then
					newLbFrame.Rank.TextColor3 = Color3.new(255/255, 170/255, 0/255)
					newLbFrame.Highscore.TextColor3 = Color3.new(255/255, 170/255, 0/255)
					newLbFrame.Player.TextColor3 = Color3.new(255/255, 170/255, 0/255)
				end
				if newLbFrame.Rank.Text == "#2" then
					newLbFrame.Rank.TextColor3 = Color3.new(170/255, 255/255, 255/255)
					newLbFrame.Highscore.TextColor3 = Color3.new(170/255, 255/255, 255/255)
					newLbFrame.Player.TextColor3 = Color3.new(170/255,255/255,255/255)
				end
				if newLbFrame.Rank.Text == "#3" then
					newLbFrame.Rank.TextColor3 = Color3.new(170/255,85/255,0/255)
					newLbFrame.Highscore.TextColor3 = Color3.new(170/255,85/255,0/255)
					newLbFrame.Player.TextColor3 = Color3.new(170/255,85/255,0/255)
				end
				
				newLbFrame.Position = UDim2.new(0,0, newLbFrame.Position.Y.Scale + (.08 * #game.Workspace.GlobalLeaderboard.Sign.LeaderboardGUI.Holder:GetChildren()), 0)
				newLbFrame.Parent = game.Workspace.GlobalLeaderboard.Sign.LeaderboardGUI.Holder
			end
		end
	end)
	
	if not success then
		print(errorMessage)
	end
end

while true do 
	
	for _, player in pairs(game.Players:GetPlayers()) do
		HighScoreLeaderboard:SetAsync(player.UserId, player.leaderstats.Highscore.Value)
	end
	
	for _, frame in pairs (game.Workspace.GlobalLeaderboard.Sign.LeaderboardGUI.Holder:GetChildren()) do
		frame:Destroy()
	end
	
	updateLeaderBoard()
	print("Updated!")
	
	wait(20)
	
end