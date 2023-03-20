local RemFunc = game.ReplicatedStorage.RemoteFunction
-- a = game.ReplicatedStorage.RemoteFunction


RemFunc.OnServerInvoke = function(player, a1, a2)
	workspace.Head.X.Value = a1
	workspace.Head.Y.Value = a2
end
	