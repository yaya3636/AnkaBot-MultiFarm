local SELL = {
	["availableSpace"] = function()
		return sale:availableSpace()
	end,
	["buyItem"] = function(id, quantity, priceMax)
		sale:buyItem(id, quantity, priceMax)
	end,
	["buyToPNJ"] = function(id, quantity)
		sale:buyToPnj(id, quantity)
	end,
	["editPrice"] = function(uid, price, quantity)
		sale:editPrice(uid, price, quantity)
	end,
	["getAveragePriceItem"] = function(id, lot)
		local lots
		if lot == 100 then
			lots = 3
		elseif lot == 10 then
			lots = 2
		else
			lots = 1
		end
		return sale:getAveragePriceItem(id, lots)
	end,
	["getItemGID"] = function(index)
		return sale:getItemGID(index)
	end,
	["getItemGUID"] = function(index)
		return sale:getItemGUID(index)
	end,
	["getItemPrice"] = function(index)
		return sale:getItemPrice(index)
	end,
	["getItemQuantity"] = function(index)
		return sale:getItemQuantity(index)
	end,
	["getLots"] = function(quantity)
		return sale:getLots(quantity)
	end,
	["getPriceItem"] = function(id, lot)
		local lots
		if lot == 100 then
			lots = 3
		elseif lot == 10 then
			lots = 2
		else
			lots = 1
		end
		return sale:getPriceItem(id, lots)
	end,
	["itemsOnSale"] = function()
		return sale:itemsOnSale()
	end,
	["sellAllItemToPnj"] = function()
		sale:sellAllItemToPnj()
	end,
	["sellAllItemToPnjSecret"] = function()
		sale:sellAllItemToPnjSecret()
	end,
	["sellItem"] = function(id, quantity, price)
		sale:sellItem(id, quantity, price)
	end,
	["sellToPnj"] = function(id, quantity)
		sale:sellToPnj(id, quantity)
	end,
	["updateAllItems"] = function()
		sale:updateAllItems()
	end,
	["PATH"] = {
		["BONTA"] = { 
			["TP"] = function()
				if map:currentMapId() ~= 162791424 then
					havreSac()

				elseif map:currentMapId() == 162791424 then
					setTP()
					return useZaap(147768)
				end
			end,
			["GO_HDV"] = function(dest)
				local currentMapId = map:currentMapId()

				if dest == 'ressource' then
					inHDV = true
					return {{ map = currentMapId, path = "zaapi(146741)" }}
				elseif dest == "consommable" then
					return {{ map = currentMapId, path = "zaapi(146748)" }}
				elseif dest == "equipement" then
					return {{ map = currentMapId, path = "zaapi(145203)" }}
				elseif dest == "rune" then
					return {{ map = currentMapId, path = "zaapi(147767)" }}
				end
			end,
			["HDV"] = function(mode)
				local currentMapId = map:currentMapId()
				local modeId
				if mode == "sell" then
					modeId = 5
				elseif mode == "buy" then
					modeId = 6
				end

				if currentMapId == 146741 then -- Ressource
					npc:npc(515264, modeId)			
				elseif currentMapId == 146748 then -- Consommable
					map:useById(515273, modeId)
				elseif currentMapId == 145203 then -- Equipement
					map:useById(515274, modeId)
				elseif currentMapId == 145203 then -- Rune
					map:useById(516482, modeId)
				end
				global:delay(3000)
				if mode == "sell" then
					sellItem()
				elseif mode == "buy" then
					buyItem()
				end
			end
		}
	}
}

local ITEM_TO_SELL = {
	{
		name = "Ebonite",
		idItem = 746,
		lot = 3,
		minPrice = 110000,
		weight = 20,
		type = "ressource"
	},
	{
		name = "Magnesite",
		idItem = 748,
		lot = 3,
		minPrice = 130000,
		weight = 30,
		type = "ressource"
	},
	{
		name = "Bakelelite",
		idItem = 749,
		lot = 3,
		minPrice = 80000,
		weight = 40,
		type = "ressource"
	},
	{
		name = "Rutile",
		idItem = 7036,
		lot = 2,
		minPrice = 10000,
		weight = 80,
		type = "ressource"
	},
	{
		name = "Pyrute",
		idItem = 7035,
		lot = 2,
		minPrice = 150000,
		weight = 90,
		type = "ressource"
	},
	{
		name = "Substrat de buisson",
		idItem = 2539,
		lot = 3,
		minPrice = 90000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de bocage",
		idItem = 12745,
		lot = 3,
		minPrice = 120000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de futaie",
		idItem = 2540,
		lot = 3,
		minPrice = 100000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de fascine",
		idItem = 2543,
		lot = 3,
		minPrice = 300000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Rose des sables",
		idItem = 15263,
		lot = 3,
		minPrice = 5000,
		weight = 0,
		type = "ressource"
	},	
}

return SELL, ITEM_TO_SELL