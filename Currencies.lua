------------------------------------------------------------
-- | Depot								    			| --
-- | Stores info about inventory, bank, etc.			| --
-- | Copyright (c) 2014 Malakahh. All Rights Reserved.	| --
------------------------------------------------------------

local _, ns = ...
local Depot = ns.Depot

function Depot:SetupCurrencies()
    self:RegisterEvent("PLAYER_MONEY")

    self.RealmDepot["Currencies"] = self.RealmDepot["Currencies"] or {}
    self.Currencies = self.RealmDepot["Currencies"]

    self:PLAYER_MONEY()
end

function Depot:PLAYER_MONEY()
    self.Currencies.Money = self.Currencies.Money or {}

    self.Currencies.Money[self.PlayerName] = GetMoney()
end