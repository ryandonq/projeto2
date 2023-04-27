local KickPlayer = game.ReplicatedStorage.Events.Kick

KickPlayer.OnServerEvent:Connect(function(player, playertokick, reason)
  local pui = player.UserId
  if pui == 123456789 then
    game.Players:FindFirstChild(playertokick):Kick(reason)
  else
    player:Kick("Você não tem permissão para usar esse script.")
  end
end)