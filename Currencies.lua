------------------------------------------------------------
-- | Depot								    			| --
-- | Stores info about inventory, bank, etc.			| --
-- | Copyright (c) 2014 Malakahh. All Rights Reserved.	| --
------------------------------------------------------------

local _, ns = ...
local Depot = ns.Depot

function Depot:SetupCurrencies()
    self.PlayerDepot["Currencies"] = self.PlayerDepot["Currencies"] or {}
    self.Currencies = self.PlayerDepot["Currencies"]

    self:PLAYER_MONEY()
end

function Depot:PLAYER_MONEY()
    self.Currencies.money = GetMoney()
end