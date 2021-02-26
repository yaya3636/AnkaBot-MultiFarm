local currentDirectory = "F:\\DofusBotting\\LuaScript\\SnowScript + IA\\MultiMetier\\v.1.1\\"

local MAPS_BEFORE_HAVENBAG, RETOUR_BANK, PATH_CRAFT, PATH_JOB, PATH_REPLACE = dofile(currentDirectory.."Multi_path.lua")

local MULTIPLE_MAP = {}
MULTIPLE_MAP.CurrentSteps = {}

local index = 1
local teleported = false

GATHER = { 0 }

function move()

    --removeIstai()

    if not teleported then
        print(PATH_JOB.alchimiste[index].name)
        print("Index = "..index)
        return PATH_JOB.alchimiste[index].TP()
    end
    return MULTIPLE_MAP:Run(PATH_JOB.alchimiste[index].PATH())
end

function bouclePlus()
	index = index + 1
	teleported = false
    MULTIPLE_MAP:Reset()
    havreSac()
end


function finDeBoucle()
	index = index + 1
	teleported = false
    MULTIPLE_MAP:Reset()
    havreSac()
end

function setTP()
    teleported = true
end

function havreSac()
    CheckMapBeforeHavreSac()
    
    if map:currentMap() ~= "0,0" then
        map:changeMap('havenbag')
    end
end

function useZaap(idDest)
    local dest = "zaap("..tostring(idDest)..")"
    return {{ map = map:currentMapId(), path = dest }}
end

function CheckMapBeforeHavreSac()
    local currentMapId = map:currentMapId()

    for _, v in pairs(MAPS_BEFORE_HAVENBAG) do
        if not v.map then
            self:Print("map = nil", "CheckMapBeforeHavreSac", "error")
        end
        if currentMapId == v.map then
            if v.path ~= nil then
                map:changeMap(v.path)
                break
            elseif v.door ~= nil then
                map:door(tonumber(v.door))
                break
            else
                self:Print("Impossible de trouvé le changeMap pour la map '"..v.map.."'", "CheckMapBeforeHavreSac", "error")
                break
            end
        end
    end
    global:delay(5000)
end

function MULTIPLE_MAP:Run(tab)
	local currentPos = map:currentMap()
	local currentMapId = tostring(map:currentMapId())

	if not self.CurrentSteps[currentMapId] then
		self.CurrentSteps[currentMapId] = 0
	end

	self.CurrentSteps[currentMapId] = self.CurrentSteps[currentMapId] + 1

	local action = nil
	local firstAction = nil
	local count = 0

	for _, v in pairs(tab) do
		if v.map == currentPos or v.map == currentMapId then
			count = count + 1
			if count == self.CurrentSteps[currentMapId] then
				action = v
				break
			elseif count == 1 then
				firstAction = v
			end
		end
	end

	if not action then
		if firstAction then
			action = firstAction
			self.CurrentSteps[currentMapId] = 1
		else
			print("[AVERTISSEMENT] Aucune action ne donne d'indications pour la carte " .. currentPos .. " (" .. currentMapId .. ")", 3)
			return lost()
		end
	end

	if type(action.path) == "function" then
		action.custom = action.path
		action.path = nil
	end

	return { action }
end

function MULTIPLE_MAP:Reset(tab)
	self.CurrentSteps = {}
end

function print(str, messageType)
	-- 1 = Normal Print, 2 Sucess print, 3 Error print
	if not messageType then
		messageType = 2
	end

	if messageType == 1 then
		global:printMessage(str)
	elseif messageType == 2 then
		global:printSuccess(str)
	else
		global:printError(str)
	end
end