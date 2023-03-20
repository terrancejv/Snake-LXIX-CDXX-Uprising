game.ReplicatedFirst:RemoveDefaultLoadingScreen()

local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:SetTopbarTransparency(0)

local GUI = script.LoadingScreenGui:Clone()
GUI.Parent = PlayerGui

repeat 
	wait(0.5)
	local count = 1
	if count == 1 then
		GUI.LoadingScreenFrame.LoadingScreenLabel.Text = "Loading."
		count = 2
	end
	if count == 2 then
		GUI.LoadingScreenFrame.LoadingScreenLabel.Text = "Loading.."
		count = 3
	end
	if count == 3 then	
		GUI.LoadingScreenFrame.LoadingScreenLabel.Text = "Loading..."
		count = 1
	end
until game:IsLoaded()

GUI.LoadingScreenFrame:TweenPosition(UDim2.new(0,0,1,0),"InOut","Sine",0.5)
wait(0.5)
