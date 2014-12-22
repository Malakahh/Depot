------------------------------------------------------------
-- | Depot								    			| --
-- | Stores info about inventory, bank, etc.			| --
-- | Copyright (c) 2014 Malakahh. All Rights Reserved.	| --
------------------------------------------------------------

local _, ns = ...

local lib = LibStub:NewLibrary("Depot-0.1a", 1)
if not lib then return end

ns.Depot = CreateFrame("Frame")
local Depot = ns.Depot

Depot:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
Depot:RegisterEvent("ADDON_LOADED")

function Depot:ADDON_LOADED()
    self:Init()
    self:SetupCurrencies()

    --Remove event
    self:UnregisterEvent("ADDON_LOADED")
    self.ADDON_LOADED = nil
end

function Depot:Init()
    local playerName = UnitName("player")
    local realmName = GetRealmName()

    Depot_SV = Depot_SV or {}
    Depot_SV[realmName] = Depot_SV[realmName] or {}

    self.RealmDepot = Depot_SV[realmName]
    self.RealmDepot[playerName] = self.RealmDepot[playerName] or {}
    self.PlayerDepot = self.RealmDepot[playerName]
end