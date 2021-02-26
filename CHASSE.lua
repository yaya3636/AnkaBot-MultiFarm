local currentJob = "chasse au tresor"

local readyToHunt, roadLoaded, teleported = false, false, false

local nextFlagMapId, treasureStartMapId

function move()
    openChest()
    return TreasureHunt()
end

function TreasureHunt()
    if not treasure:isHunting() then
        return getHunt()
    elseif not readyToHunt then
        return goHunt()
    elseif readyToHunt then
        return hunting()
    end
end

function getHunt()
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            havreSac()
        else
            teleported = true
            print("[INFO]["..string.upper(currentJob).."] Go récupérer une chasse")
            return useZaap(142087694)
        end
    end

    if map:currentMapId() == 128452097 and not treasure:isHunting() then -- Map Malle au tresor
        global:delay(getRandomNumber(1526, 2438))
        map:useById(484993,-1)
        global:delay(getRandomNumber(1526, 2438))
        readyToHunt, roadLoaded, teleported = false, false, false
        print("[INFO]["..string.upper(currentJob).."] La chasse a était récupérer")
        return TreasureHunt()
    end

    if not treasure:isHunting() then
        return {
            { map = "142087694", path = "right" },
            { map = "142088206", path = "right" },
            { map = "142088718", door = "343" },
            { map = "128451073", path = "292" }
        }
    else
        return TreasureHunt()
    end
end

function goHunt()
    
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            havreSac()
        else
            teleported = true
            treasureStartMapId = treasure:getStartMapId()
            print("[INFO]["..string.upper(currentJob).."] Go map départ de la chasse")
            return useZaap(treasureStartMapId)
        end
    end

    if not map:onMap(treasureStartMapId) then
        if not roadLoaded then
            map:loadRoadToMapId(treasureStartMapId)
            roadLoaded = true
        end
        while not map:onMap(treasureStartMapId) do
            map:moveRoadNext()
            teleported, roadLoaded = false, false
            return TreasureHunt()      
        end
    else
        print("[INFO]["..string.upper(currentJob).."] Arrivée sur la map de départ de la chasse")
        readyToHunt = true
        roadLoaded = false
        return hunting()         
    end

    return TreasureHunt()
end

function hunting()

    if not roadLoaded then
        nextFlagMapId = treasure:getNextFlagMapId(false)
        if nextFlagMapId ~= -1 and nextFlagMapId ~= 0 then
            map:loadRoadToMapId(nextFlagMapId)
        end
        roadLoaded = true
    end

    if treasure:isReadyToDig() then
        print("[INFO]["..string.upper(currentJob).."] Lancement du combat avec le coffre !")        
        readyToHunt, teleported, roadLoaded = false, false, false
        treasure:huntDig()
        return TreasureHunt()
    end

    if nextFlagMapId == 0 then
        print("[INFO]["..string.upper(currentJob).."] Impossible d'obtenir la mapID du prochain indice", 3)
        local timer = getRandomNumber(610000, 660000)
        local timerminutes = math.floor(timer / 60000)
        print("[INFO]["..string.upper(currentJob).."] Attente avant la reprise d'une mission : "..timerminutes.." minutes", 3)
        readyToHunt, teleported, roadLoaded = false, false, false
        global:delay(timer)
        treasure:quitNow()
        return TreasureHunt()
    elseif nextFlagMapId == -1 then
        return inFlagMap()
    end

    while true do
        local dir = treasure:getNextFlagDirection()
        if treasure:isInFlagMap() then
            return inFlagMap()
        elseif nextFlagMapId == map:currentMapId() then
            roadLoaded = false
            return hunting()
        end  
        map:moveRoadNext()
    end
end

function inFlagMap()
    treasure:huntFlag()
    roadLoaded = false
    print("[INFO]["..string.upper(currentJob).."] Jalon posée sur la carte "..map:currentMap())

    if treasure:isReadyToDig() then
        print("[INFO]["..string.upper(currentJob).."] Tout les indices sont sélectionnés, confirmation de la sélection")
        treasure:huntDig()
    end
    return hunting()
end

function openChest()
    useAllItems(15260) -- Coffre rouillé
    useAllItems(15248) -- Coffre insignifiant 
    useAllItems(15261) -- Coffre intrigant
    useAllItems(15262) -- Coffre surprenant
    useAllItems(15264) -- Coffre solide
    useAllItems(15265) -- Coffre lourd
    useAllItems(15266) -- Coffre étincelant
    useAllItems(15267) -- Coffre imposant
    useAllItems(15268) -- Coffre impressionnant
    useAllItems(15269) -- Coffre magistral
end

function useAllItems(iditem)
    while inventory:itemCount(iditem) > 0 do
        inventory:useItem(iditem)
    end
end

function useZaap(idDest)
    local dest = "zaap("..tostring(idDest)..")"
    return {{ map = map:currentMapId(), path = dest }}
end

function havreSac()
    checkMapBeforeHavreSac()

    if map:currentMap() ~= "0,0" then
        map:changeMap('havenbag')
    end
end

function checkMapBeforeHavreSac()
    local currentMapId = map:currentMapId()

    -- Malle au tresor

    if currentMapId == 128452097 then
        map:changeMap("504")
    end

    if currentMapId == 128451073 then
        map:door(549)
    end

    -- Zone astrub

    if currentMapId == 188745734 then
        map:changeMap("bottom")
    end

    global:delay(5000)
end

function getRandomNumber(min, max)
    local rand = json.parse(developer:getRequest("http://www.randomnumberapi.com/api/v1.0/random?min="..min.."&max="..max.."&count=1" ))  
    return rand[1]
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