local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("MoneyStats") -- Change this with a different name.
 
game.Players.PlayerAdded:Connect(function(Player)
    local Leaderstats = Instance.new("Folder", Player)
    Leaderstats.Name = "leaderstats"
    local Currency = Instance.new("IntValue", Leaderstats)
    Currency.Name = "Coins" -- Change "Money" with your currency.
    Currency.Value = 0
 
    local Data = DataStore:GetAsync(Player.UserId)
    if Data then
        Currency.Value = Data -- Change this if you have added more currencies.
    end
end)
 
game.Players.PlayerRemoving:Connect(function(Player)
    DataStore:SetAsync(Player.UserId, Player.leaderstats.Money.Value) -- Change "Money" with your currency.
end)
 
-- 2 OR MORE CURRENCIES (DON'T COPY THIS DOWN HERE IF YOU ARE GOING TO USE ONLY ONE CURRENCY) --
-- IN THIS EXAMPLE I USED 2 CURRENCIES, BUT YOU CAN ADD MORE.
 
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("MoneyStats") -- Change this with a different name.
 
game.Players.PlayerAdded:Connect(function(Player)
    local Leaderstats = Instance.new("Folder", Player)
    Leaderstats.Name = "leaderstats"
    local Money= Instance.new("IntValue", Leaderstats)
    Money.Name = "Coins" -- Change "Money" with your currency.
    Money.Value = 0
    local Kills= Instance.new("IntValue", Leaderstats)
    Kills.Name = "Gems" -- Change "Kills" with your currency.
    Kills.Value = 0
 
    local Data = DataStore:GetAsync(Player.UserId)
    if Data then
        Money.Value = Data.Coins -- Change "Money" with your currency.
        Kills.Value = Data.Gems -- Change "Kills" with your currency.
    end
end)
 
game.Players.PlayerRemoving:Connect(function(Player)
    DataStore:SetAsync(Player.UserId, {
        ["Coins"] = Player.leaderstats.Coins.Value; -- Change "Money" with your currency.
        ["Gems"] = Player.leaderstats.Gems.Value; -- Change "Kills" with your currency.
    })
end)
