------------------------------------------------------------
-- | Depot								    			| --
-- | Stores info about inventory, bank, etc.			| --
-- | Copyright (c) 2014 Malakahh. All Rights Reserved.	| --
------------------------------------------------------------

----
--Equipment, Bags, Bank, Guild Vault and Void Storage is handled here
----

local _, ns = ...
local Depot = ns.Depot

--Constants
local NUM_EQUIPMENTSLOTS = INVSLOT_LAST_EQUIPPED


function Depot:SetupInventory()
    self:RegisterEvent("UNIT_INVENTORY_CHANGED")

    self.RealmDepot["Items"] = self.RealmDepot["Items"] or {}
    self.Items = self.RealmDepot["Items"]
end

function Depot:UNIT_INVENTORY_CHANGED(unit)
    if unit == "player" then
        local itemId, dataStr
        for i = 1, NUM_EQUIPMENTSLOTS do
            itemId, dataStr = self:GenerateItemDataPair(GetInventoryItemLink("player", i))
            if itemId then --item was unequipped, what happens to this item is handled elsewhere
                self.Items[itemId] = dataStr
            end
        end
    end
end