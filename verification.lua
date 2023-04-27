local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local verifyEvent = ReplicatedStorage:WaitForChild("VerifyEvent")
local verifyGui = ReplicatedStorage:WaitForChild("VerifyGui")

local function verifyPlayer(player)
  local verified = false
  local question = "Qual é a soma de 2 + 2?"
  local answer = "4"
  local timeout = 10

  verifyEvent:FireClient(player, question)
  local response = verifyEvent:WaitForChild(player.Name)

  local timer = tick()
  local connection

  connection = response.OnServerEvent:Connect(function(plr, input)
    if plr == player then
      if input == answer then
        verified = true
        connection:Disconnect()
      else
        warn("Resposta incorreta.")
        connection:Disconnect()
      end
    end
  end)

  while not verified and tick() - timer < timeout do
    wait()
  end

  if verified then
    print("Jogador " .. player.Name .. " verificado.")
    return true
  else
    warn("Jogador " .. player.Name .. " não verificado.")
    return false
  end
end

local playerToVerify = Players:FindFirstChild("Player")
local verificationResult = verifyPlayer(playerToVerify)

if verificationResult then
  print("Executando a script...")
else
  print("Não executando a script...")
end
