P0 = script.Parent

M = {}
i = 1
M[i] = P0			
dead = false
local randNum1 = 0
local randNum2 = 0
HighScoreDisplay = workspace.Info.SurfaceGui.HighScoreDisplay.Text
ScoreDisplay = workspace.Info.SurfaceGui.ScoreDisplay.Text
PreviousScore = workspace.Info.SurfaceGui.PreviousScoreValue.Value

-- restart function
local function Restart()
	for i = 2, #M do
		--M[i].Position = Vector3.new(1000, 1000, 1000)
		M[i]:Destroy()
	end
	if Humanoid then
		local Player = game.Players:GetPlayerFromCharacter(Humanoid.Parent)
		Player.leaderstats.Apples.Value = Player.leaderstats.Apples.Value + PreviousScore
		PreviousScore = 0
		if (workspace.Info.SurfaceGui.ScoreValue.Value >= Player.leaderstats.Highscore.Value) then
			workspace.Info.SurfaceGui.HighScoreDisplay.Text = workspace.Info.SurfaceGui.ScoreDisplay.Text
			Player.leaderstats.Highscore.Value = workspace.Info.SurfaceGui.HighScoreDisplay.Text
		end
		Humanoid.Health = 0
		workspace.Seat.Disabled = true
		workspace.Seat.SeatGui.SeatText.Visible = true
	end
	workspace.Info.SurfaceGui.ScoreDisplay.Text = 0
	workspace.Info.SurfaceGui.ScoreValue.Value = 0
	workspace.Info.SurfaceGui.PlayerName.Text = "Waiting for player..."
--	s = 0
--	m = 0
--	h = 0
--	secDisplay = ""
--	minDisplay = ""
--	hourDisplay = ""
	
	dead = true
	
	if dead == true then
		randNum1 = math.random(1,2)
		randNum2 = math.random(1,2)
		if randNum1 == 1 then
			workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.Text = "You're Doodoo"
		elseif randNum1 == 2 then
			workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.Text = "The game is not buggy"
		end
	end	
	
	if randNum2 == 1 then
		game.Workspace.SoundList.kanyesad:Play()
	elseif randNum2 == 2 then
		game.Workspace.SoundList.sadviolin:Play()		
	end
	
	game.Workspace.SoundList.deadsound:Play() 
	
	P0.Position = Vector3.new(0.5,7.5,0.5)
	i = 1
	
	local sec = 10
	local done = false
	workspace.SnakeGame.Walls.InvisibleBarrier.Transparency = 0.5
	workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.TextTransparency = 0
	
	wait (1)
	
	workspace.Info.SurfaceGui.HighScoreValue.Value = 0
	workspace.Info.SurfaceGui.HighScoreDisplay.Text = 0
	
--	local model = workspace.SnakeGame.Grid
--	local backup = model:Clone()
--	local newGame = backup:clone()
--	model:remove()
--	newGame.Parent = game.Workspace.SnakeGame
	
	wait(1)
	
	while done == false do
		workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.Text = sec
		
		wait(1)
		
		sec = sec - 1
		if sec == 0 then
			workspace.SnakeGame.Walls.InvisibleBarrier.Transparency = 1
			workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.TextTransparency = 1
			done = true
		end		
	end
	
	if randNum2 == 1 then
		game.Workspace.SoundList.kanyesad:Stop()
	elseif randNum2 == 2 then
		game.Workspace.SoundList.sadviolin:Stop()	
	end	
	
	local model = workspace.Seat
	local backup = model:Clone()
	local newGame = backup:clone()
	model:remove()
	newGame.Parent = game.Workspace
end

P0.Position = Vector3.new(0.5,7.5,0.5)
food = true

-- runs the game
while true do
	x = P0.X.Value
	y = P0.Y.Value
	workspace.Seat.Disabled = false
	workspace.SnakeGame.Walls.InvisibleBarrier.Transparency = 0.5
	workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.TextTransparency = 0
	workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.Text = "Use WASD or the Dpad to move the snake."
	
--	timer = true
--	
--	s = 0
--	m = 0
--	h = 0
--	secDisplay = ""
--	minDisplay = ""
--	hourDisplay = ""
--	
--	while timer == true do
--		print("timer is starting")
--		if s > 9 then
--			secDisplay = s
--		else
--			secDisplay = "0" .. s
--		end
--		if m > 9 then
--			minDisplay = m
--		else
--			minDisplay = "0" .. m
--		end
--		if h > 9 then
--			hourDisplay = h
--		else
--			hourDisplay = "0" .. h
--		end
--		if s == 60 then
--			m = m + 1
--			s = 0
--		end																																					
--		if m == 60 then
--			h = h + 1
--			m = 0
--		end		
--		
--		wait(0.1)
--		s = s + 0.1
--		timer = false
--	end
	
	-- a red ball spawns in and acts as food
	function createFood()
		game.Workspace.SoundList.foodchew2:Play()
		P = workspace.AppleModel:Clone()
		P.Name = "GameApple"
		P.Parent = workspace
		P.Transparency = 1		
		newPos()
		P.Size = Vector3.new(1,1,1)
		P.CanCollide = true
		P.Anchored = true
		food = false
	end
	
	function newPos()
		local x1 = math.random(-6,6) * 1
		local y1 = math.random(2,13) * 1
		P.Position = Vector3.new(x1-0.5,y1-0.5,0.5)
	end
	
	if food then
		local clear = true
		while clear == true do
			createFood()
			for i = 2, #M do
				if P.Position == M[i].Position then
					newPos()
					clear = true
				end
			end
			P.Transparency = 0
			clear = false
		end
	end	

	-- adds a block behind the head, making the snake grow bigger
	local blockColor
	if P0.Position == P.Position then
		i = i + 1
		P.Mesh:Destroy()
		P.Shape = "Block"	
		--P.CFrame = P.CFrame * CFrame.Angles(0, 90, 0)
		P.Transparency = 0.2
		P.Color = Color3.new(0,0,1)
		M[i] = P
		food = true	
	end
	
	-- block follows the head
	for n = #M, 2, -1 do
		M[n].Position = M[n - 1].Position
		M[1].Position = P0.Position
	end	
	
	P0.Position = P0.Position + Vector3.new(x,y,0)
	
	-- snake dies if it goes outside the border
	if P0.Position.X < -7 or P0.Position.X > 7.5 then 
		print("you ran outside of the border")
		Restart() 		
	end
	
	if P0.Position.Y < 1.5 or P0.Position.Y > 13.5 then 
		print("you ran outside of the border")
		Restart() 		 
	end
	
	--score	    
	Humanoid = workspace.Seat.Occupant
	
	
	if Humanoid then
		local Player = game.Players:GetPlayerFromCharacter(Humanoid.Parent)
		workspace.Info.SurfaceGui.HighScoreValue.Value = Player.leaderstats.Highscore.Value
		workspace.Info.SurfaceGui.HighScoreDisplay.Text = Player.leaderstats.Highscore.Value
		workspace.Info.SurfaceGui.PlayerName.Text = Player.Name
		workspace.SnakeGame.Walls.InvisibleBarrier.Transparency = 1
		workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.TextTransparency = 1
		workspace.SnakeGame.Walls.InvisibleBarrier.SurfaceGui.Counter.Text = ""
		workspace.Seat.SeatGui.SeatText.Visible = false
		workspace.Info.SurfaceGui.ScoreDisplay.Text = (i - 1)
		PreviousScore = workspace.Info.SurfaceGui.ScoreDisplay.Text
		workspace.Info.SurfaceGui.ScoreValue.Value = workspace.Info.SurfaceGui.ScoreDisplay.Text
		if workspace.Info.SurfaceGui.ScoreValue.Value >= workspace.Info.SurfaceGui.HighScoreValue.Value then
			workspace.Info.SurfaceGui.HighScoreDisplay.Text = workspace.Info.SurfaceGui.ScoreDisplay.Text
			workspace.Info.SurfaceGui.HighScoreValue.Value = workspace.Info.SurfaceGui.ScoreValue.Value
		end
	end
	
	-- snake dies if it touches itself
--	if i > 3 then
--		for i = 2, #M do
--			if P0.Position == M[i].Position then 
--				print("you ran into yourself")				    
--				Restart()											
--			end
--		end
--	end
		
--	workspace.Info.SurfaceGui.Time.Text = hourDisplay .. ":" .. minDisplay .. ":" .. secDisplay
	
	wait(0.125)
end