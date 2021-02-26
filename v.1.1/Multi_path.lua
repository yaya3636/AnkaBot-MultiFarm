local currentDirectory = "F:\\DofusBotting\\LuaScript\\SnowScript + IA\\MultiMetier\\v.1.1\\"

local MAPS_BEFORE_HAVENBAG = {

    { map = 165153537, path = "left" },

    --Mine Ebbernard

    { map = 29622275, path = "450" },
    { map = 29622272, path = "450" },
    { map = 29622531, path = "450" },
    { map = 29622534, path = "424" },

    -- Mine manganese ile dragoeuf

    { map = 86246410, path = "431" },

    -- Mine Bwork
 
    { map = 104860165, path = "444" },
    { map = 104859139, path = "444" },
    { map = 104860169, path = "263" },
    { map = 104861193, path = "254" },
    { map = 104859145, path = "457" },
    { map = 104858121, path = "507" },
    { map = 104861189, path = "451" },
    { map = 104862213, path = "376" },
    { map = 104858119, path = "207" },
   
    -- Mine Maksage
   
    { map = 57017861, path = "270" },
    { map = 56886787, path = "396" },
    { map = 56885763, path = "436" },
    { map = 57016837, path = "401" },
    { map = 57016835, path = "409" },
    { map = 57017859, path = "395" },
   
    -- Malle au tresor

    { map = 128452097, path = "504" },
    { map = 128451073, door = "549" },

    -- Zone astrub

    { map = 188745734, path = "bottom" },

    -- Territoire des porco
   
    { map = 72619524, path = "left" },
}

local RETOUR_BANK = {
    ["TP"] = function()
        if map:currentMapId() ~= 162791424
        and map:currentMapId() ~= 191105026
        and map:currentMapId() ~= 191104002
        and map:currentMapId() ~= 192415750 then
            havreSac()

        elseif map:currentMapId() == 191105026
        or map:currentMapId() == 191104002
        or map:currentMapId() == 192415750 then
            setTP()
            setTpBank()
            if map:currentMapId() == 192415750 then
                useBank()
            end      
            return {
                { map = "191105026", path = "left" },
                { map = "191104002", door = "288" }
	        }
        elseif map:currentMapId() == 162791424 then
            Print("Go bank", "bank")
            setTP()
            setTpBank()
            return {{ map = "162791424", path = "zaap(191105026)"}}
        end
    end,
    ["PATH"] = function()
        if map:currentMapId() == 192415750 then
            useBank()
        end
        return {
        { map = "191105026", path = "left" },
        { map = "191104002", door = "288" }
	}
    end
}

local PATH_CRAFT = {
    ["paysan"] = {
        ["TP"] = function()
            if map:currentMapId() ~= 162791424 then
                havreSac()

            elseif map:currentMapId() == 162791424 then
                setTP()
                Print("Go craft !", "craft")
                return useZaap(191105026)
            end
        end,
        ["PATH"] = function()
            if map:currentMapId() == 192939008 then
                useWorkshop()
            end
            return {
                { map = "191105026", path = "left" },
                { map = "191104002", path = "top" },
                { map = "191104000", path = "top" },
                { map = "188745218", path = "top" },
                { map = "188745217", path = "right" },
                { map = "188745729", door = "344" },
                { map = "192939008" }
            }
        end
    },
    ["alchimiste"] = {
        ["TP"] = function()
            if map:currentMapId() ~= 162791424 then
                havreSac()

            elseif map:currentMapId() == 162791424 then
                setTP()
                Print("Go craft !", "craft")
                return useZaap(191105026)
            end
        end,
        ["PATH"] = function()
            if map:currentMapId() == 192937988 then
                useWorkshop()
            end
            return {
                { map = "191105026", path = "left" },
                { map = "191104002", path = "top" },
                { map = "191104000", path = "top" },
                { map = "188745218", path = "top" },
                { map = "188745217", path = "left" },
                { map = "188744705", door = "412" },
                { map = "192937988" }
            }
        end
    },
    ["mineur"] = {
        ["TP"] = function()
            if map:currentMapId() ~= 162791424 then
                havreSac()

            elseif map:currentMapId() == 162791424 then
                setTP()
                idZaapi = "atelierMineur"
                Print("Go craft !", "craft")
                return useZaap(147768)
            end
        end,
        ["PATH"] = function()
            if map:currentMapId() == 7340551 then
                useWorkshop()
            end
            return {
                { map = "147768", path = "zaapi(145209)" },
                { map = "145209", door = "355" },
                { map = "7340551" }
            }
        end
    },
    ["bucheron"] = {
        ["TP"] = function()
            if map:currentMapId() ~= 162791424 then
                havreSac()

            elseif map:currentMapId() == 162791424 then
                setTP()
                Print("Go craft !", "craft")
                return useZaap(191105026)
            end
        end,
        ["PATH"] = function()
            if map:currentMapId() == 192940042 then
                useWorkshop()
            end
            return {
                { map = "191105026", path = "left" },
                { map = "191104002", path = "top" },
                { map = "191104000", path = "top" },
                { map = "188745218", path = "top" },
                { map = "188745217", path = "top" },
                { map = "189792777", path = "top" },
                { map = "189792776", path = "top" },
                { map = "189792775", path = "top" },
                { map = "189792774", path = "left" },
                { map = "189792262", path = "left" },
                { map = "189532164", path = "left" },
                { map = "189531652", path = "left" },
                { map = "189531140", door = "302" }
            }
        end
    } 
}

local PATH_JOB = {
    ["paysan"] = {
        [1] = {
            name = "Zone ble amakna coin des Scarafeuille",
            tags = {
                "Ble"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap coin des Scarafeuille
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
                    { map = "88212481", path = "right" }, 
                    { map = "88211969", path = "right" },
                    { map = "88080385", path = "right" }, -- Reboucle
                    { map = "88080897", path = "right" },
                    { map = "88081409", path = "top" },
                    { map = "88081408", path = "left" },
                    { map = "88080896", path = "left" },
                    { map = "88080384", path = "bottom", custom = bouclePlus } -- Reboucle sur 88080385
			    })
            end
        },
        [2] = {
            name = "Zone ble Astrub",
            tags = {
                "Ble"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,191105026)") -- Zaap Astrub
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
                    { map = "191105026", path = "left" },
                    { map = "191104002", path = "top" },
                    { map = "191104000", path = "top" },
                    { map = "188745218", path = "top" },
                    { map = "188745217", path = "top" },
                    { map = "189792777", path = "left" }, -- Reboucle
                    { map = "189792265", path = "top" },
                    { map = "189792264", path = "top" },
                    { map = "189792263", path = "top" },
                    { map = "189792262", path = "top" },
                    { map = "189792261", path = "top" },
                    { map = "189792260", path = "right" },
                    { map = "189792772", path = "top" },
                    { map = "189792771", path = "top" },
                    { map = "189792770", path = "top" },
                    { map = "189792769", path = "right" },
                    { map = "189793281", path = "right" },
                    { map = "189793793", path = "bottom" },
                    { map = "189793794", path = "bottom" },
                    { map = "189793795", path = "bottom" },
                    { map = "189793796", path = "bottom" },
                    { map = "189793797", path = "left" },
                    { map = "189793285", path = "bottom" },
                    { map = "189793286", path = "right" },
                    { map = "189793798", path = "right" },
                    { map = "189794310", path = "bottom" },
                    { map = "189794311", path = "bottom" },
                    { map = "189794312", path = "bottom" },
                    { map = "189794313", path = "bottom" },
                    { map = "188746753", path = "left" },
                    { map = "188746241", path = "left" },
                    { map = "188745729", path = "top" },
                    { map = "189793289", path = "left", custom = bouclePlus } -- Reboucle sur 189792777
			    })
            end
        },
        [3] = {
            name = "Zone ble coin des bouftout",
            tags = {
                "Ble"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "88082704", path = "bottom"},-- Zaap Bouftout ( 5,7 )
		            { map = "5,8", path = "right" },
		            { map = "6,8", path = "bottom" },
		            { map = "6,9", path = "right" },
		            { map = "7,9", path = "right" },
		            { map = "8,9", path = "right" },
		            { map = "9,9", path = "top" },
		            { map = "9,8", path = "right" },
		            { map = "10,8", path = "top" },
		            { map = "10,7", path = "left" },
		            { map = "9,7", path = "top" },
		            { map = "9,6", path = "top" },
		            { map = "9,5", path = "left" },
		            { map = "8,5", path = "bottom" },
		            { map = "8,6", path = "left" },
		            { map = "7,6", path = "left" },
		            { map = "6,6", path = "left" },
		            { map = "5,6", path = "left" },
		            { map = "4,6", path = "bottom" },
		            { map = "4,7", path = "right", custom = bouclePlus }
			    })
            end
        },
        [4] = {
            name = "Zone ble champs de bonta",
            tags = {
                "Ble"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap champ de bonta
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "142087694", path = "top" }, -- Zaap sous bonta ( -27,-36 )
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },
		            { map = "-27,-39", path = "left" },
		            { map = "-28,-39", path = "left" },
		            { map = "-29,-39", path = "left" },
		            { map = "-30,-39", path = "top" },
		            { map = "-30,-40", path = "right" },
		            { map = "-29,-40", path = "right" },
		            { map = "-28,-40", path = "top" },
		            { map = "-28,-41", path = "top" },
		            { map = "-28,-42", path = "top" },
		            { map = "-28,-43", path = "top" },
		            { map = "-28,-44", path = "top" },
		            { map = "-28,-45", path = "right" },
		            { map = "-27,-45", path = "bottom" },
		            { map = "-27,-44", path = "bottom" },
		            { map = "-27,-43", path = "right" },
		            { map = "-26,-43", path = "right" },
		            { map = "-25,-43", path = "right" },
		            { map = "-24,-43", path = "bottom" },
		            { map = "-24,-42", path = "bottom" },
		            { map = "-24,-41", path = "bottom" },
		            { map = "-24,-40", path = "right" },
		            { map = "-23,-40", path = "bottom" },
		            { map = "-23,-39", path = "left" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "top" },
		            { map = "-25,-40", path = "left" },
		            { map = "-26,-40", path = "bottom" },
		            { map = "-26,-39", path = "bottom" },
		            { map = "-26,-38", path = "left", custom = bouclePlus }
			    })
            end 
        },
        [5] = {
            name = "Zone orge coin des bouftout",
            tags = {
                "Orge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap Astrub
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "5,7", path = "right" }, -- Zaap Bouftout ( 5,7 )
		            { map = "6,7", path = "top" }, -- Reboucle
		            { map = "6,6", path = "right" },
		            { map = "7,6", path = "right" },
		            { map = "8,6", path = "right" },
		            { map = "9,6", path = "top" },
		            { map = "9,5", path = "right" },
		            { map = "10,5", path = "right" },
		            { map = "11,5", path = "bottom" },
		            { map = "11,6", path = "left" },
		            { map = "10,6", path = "bottom" },
		            { map = "10,7", path = "bottom" },
		            { map = "10,8", path = "bottom" },
		            { map = "10,9", path = "left" },
		            { map = "9,9", path = "top" },
		            { map = "9,8", path = "left" },
		            { map = "8,8", path = "left" },
		            { map = "7,8", path = "left" },
		            { map = "6,8", path = "top", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [6] = {
            name = "Zone orge coin des Scarafeuille",
            tags = {
                "Orge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap Scara
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-1,24", path = "right" }, -- Zaap Scara ( -1,-24 )
		            { map = "0,24", path = "right" },
		            { map = "1,24", path = "right" },
		            { map = "2,24", path = "bottom" }, -- Reboucle
		            { map = "2,25", path = "right" },
		            { map = "3,25", path = "top" },
		            { map = "3,24", path = "left", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [7] = {
            name = "Zone orge champs de bonta",
            tags = {
                "Orge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap champs de bonta
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" }, -- Zaap Sous bonta ( -27,-36 )
		            { map = "-27,-37", path = "left" }, -- Reboucle
		            { map = "-28,-37", path = "left" }, 
		            { map = "-29,-37", path = "top" },
		            { map = "-29,-38", path = "top" },
		            { map = "-29,-39", path = "right" },
		            { map = "-28,-39", path = "top" },
		            { map = "-28,-40", path = "right" },
		            { map = "-27,-40", path = "top" },
		            { map = "-27,-41", path = "top" },
		            { map = "-27,-42", path = "top" },
		            { map = "-27,-43", path = "top" },
		            { map = "-27,-44", path = "left" },
		            { map = "-28,-44", path = "top" },
		            { map = "-28,-45", path = "right" },
		            { map = "-27,-45", path = "right" },
		            { map = "-26,-45", path = "right" },
		            { map = "-25,-45", path = "bottom" },
		            { map = "-25,-44", path = "bottom" },
		            { map = "-25,-43", path = "right" },
		            { map = "-24,-43", path = "right" },
		            { map = "-23,-43", path = "right" },
		            { map = "-22,-43", path = "bottom" },
		            { map = "-22,-42", path = "left" },
		            { map = "-23,-42", path = "left" },
		            { map = "-24,-42", path = "bottom" },
		            { map = "-24,-41", path = "bottom" },
		            { map = "-24,-40", path = "bottom" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "left" },
		            { map = "-26,-39", path = "bottom" },
		            { map = "-26,-38", path = "bottom" },
		            { map = "-26,-37", path = "left", gather = true, custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [8] = {
            name = "Zone Avoine coin des bouftout",
            tags = {
                "Avoine"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "5,7", path = "right" },  -- Zaap Bouftout
		            { map = "6,7", path = "right" },  -- Reboucle
		            { map = "7,7", path = "right" },
		            { map = "8,7", path = "right" },
		            { map = "9,7", path = "top" },
		            { map = "9,6", path = "right" },
		            { map = "10,6", path = "bottom" },
		            { map = "10,7", path = "bottom" },
		            { map = "10,8", path = "bottom" },
		            { map = "10,9", path = "left" },
		            { map = "9,9", path = "left" },
		            { map = "8,9", path = "left" },
		            { map = "7,9", path = "left" },
		            { map = "6,9", path = "top" },
		            { map = "6,8", path = "top", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [9] = {
            name = "Zone Avoine champs de bonta",
            tags = {
                "Avoine"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap champs de bonta
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top"},  -- Zaap sous bonta
		            { map = "-27,-37", path = "top"},  -- Reboucle
		            { map = "-27,-38", path = "left" },
		            { map = "-28,-38", path = "bottom" },
		            { map = "-28,-37", path = "left" },
		            { map = "-29,-37", path = "top" },
		            { map = "-29,-38", path = "top" },
		            { map = "-29,-39", path = "right" },
		            { map = "-28,-39", path = "right" },
		            { map = "-27,-39", path = "top" },
		            { map = "-27,-40", path = "top" },
		            { map = "-27,-41", path = "top" },
		            { map = "-27,-42", path = "left" },
		            { map = "-28,-42", path = "left" },
		            { map = "-29,-42", path = "left" },
		            { map = "-30,-42", path = "top" },
		            { map = "-30,-43", path = "top" },
		            { map = "-30,-44", path = "right" },
		            { map = "-29,-44", path = "right" },
		            { map = "-28,-44", path = "right" },
		            { map = "-27,-44", path = "bottom" },
		            { map = "-27,-43", path = "right" },
		            { map = "-26,-43", path = "bottom" },
		            { map = "-26,-42", path = "right" },
		            { map = "-25,-42", path = "bottom" },
		            { map = "-25,-41", path = "left" },
		            { map = "-26,-41", path = "bottom" },
		            { map = "-26,-40", path = "bottom" },
		            { map = "-26,-39", path = "bottom" },
		            { map = "-26,-37", path = "left", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [10] = {
            name = "Zone Avoine Lac de cania",
            tags = {
                "Avoine"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,156240386)") -- Zaap Lac de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-3,-42", path = "right"},  -- Zaap Lac de Cania
		            { map = "-2,-42", path = "right" },
		            { map = "-1,-42", path = "right" },
		            { map = "0,-42", path = "top" },
		            { map = "0,-43", path = "top" },
		            { map = "0,-44", path = "top" },
		            { map = "0,-45", path = "top" },  -- Reboucle
		            { map = "0,-46", path = "top" },
		            { map = "0,-47", path = "top" },
		            { map = "0,-48", path = "left" },
		            { map = "-1,-48", path = "bottom" },
		            { map = "-1,-47", path = "bottom" },
		            { map = "-1,-46", path = "bottom" },
		            { map = "-1,-45", path = "right", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [11] = {
            name = "Zone Houblon coin des Scarafeuille",
            tags = {
                "Houblon"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap Coin des Scarafeuille
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-1,24", path = "right" },  -- Zaap Scara
		            { map = "0,24", path = "bottom" },  -- Reboucle
		            { map = "0,25", path = "bottom" },
		            { map = "0,26", path = "bottom" },
		            { map = "0,27", path = "bottom" },
		            { map = "0,28", path = "right" },
		            { map = "1,28", path = "right" },
		            { map = "2,28", path = "right" },
		            { map = "3,28", path = "top" },
		            { map = "3,27", path = "top" },
		            { map = "3,26", path = "top" },
		            { map = "3,25", path = "top" },
		            { map = "3,24", path = "top" },
		            { map = "3,23", path = "top" },
		            { map = "3,22", path = "left" },
		            { map = "2,22", path = "bottom" },
		            { map = "2,23", path = "bottom" },
		            { map = "2,24", path = "bottom" },
		            { map = "2,25", path = "left" },
		            { map = "1,25", path = "top" },
		            { map = "1,24", path = "left", custom = bouclePlus}
			    })
            end
        },
        [12] = {
            name = "Zone Houblon coin des bouftout",
            tags = {
                "Houblon"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap Coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "5,7", path = "right" },  -- Zaap Bouftout
		            { map = "6,7", path = "right" },  -- Reboucle
		            { map = "7,7", path = "right" },
		            { map = "8,7", path = "top" },
		            { map = "8,6", path = "right" },
		            { map = "9,6", path = "bottom" },
		            { map = "9,7", path = "bottom" },
		            { map = "9,8", path = "left" },
		            { map = "8,8", path = "left" },
		            { map = "7,8", path = "left" },
		            { map = "6,8", path = "top", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [13] = {
            name = "Zone Houblon champs de cania",
            tags = {
                "Houblon"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap Champs de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" },  -- Zaap sous Bonta
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },
		            { map = "-27,-39", path = "top" },  -- Reboucle
		            { map = "-27,-40", path = "top" },
		            { map = "-27,-41", path = "left" },
		            { map = "-28,-41", path = "top" },
		            { map = "-28,-42", path = "right" },
		            { map = "-27,-42", path = "right" },
		            { map = "-26,-42", path = "right" },
		            { map = "-25,-42", path = "right" },
		            { map = "-24,-42", path = "right" },
		            { map = "-23,-42", path = "bottom" },
		            { map = "-23,-41", path = "right" },
		            { map = "-22,-41", path = "bottom" },
		            { map = "-22,-40", path = "left" },
		            { map = "-23,-40", path = "left" },
		            { map = "-24,-40", path = "bottom" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "left" },
		            { map = "-26,-39", path = "left", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [14] = {
            name = "Zone Lin coin des Scarafeuille",
            tags = {
                "Lin"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap Coin des Scarafeuille
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-1,24", path = "right" },  -- Zaap Scara
		            { map = "0,24", path = "bottom" },  -- Reboucle
		            { map = "0,25", path = "right" },
		            { map = "1,25", path = "right" },
		            { map = "2,25", path = "bottom" },
		            { map = "2,26", path = "bottom" },
		            { map = "2,27", path = "right" },
		            { map = "3,27", path = "bottom" },
		            { map = "3,28", path = "right" },
		            { map = "4,28", path = "top" },
		            { map = "4,27", path = "top" },
		            { map = "4,26", path = "top" },
		            { map = "4,25", path = "top" },
		            { map = "4,24", path = "left" },
		            { map = "3,24", path = "top" },
		            { map = "3,23", path = "top" },
		            { map = "3,22", path = "left" },
		            { map = "2,22", path = "bottom" },
		            { map = "2,23", path = "bottom" },
		            { map = "2,24", path = "left" },
		            { map = "1,24", path = "left", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [15] = {
            name = "Zone Lin coin des bouftout",
            tags = {
                "Lin"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap Coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "5,7", path = "right" },  -- Zaap Bouftout
		            { map = "6,7", path = "right" },
		            { map = "7,7", path = "bottom" },  -- Reboucle
		            { map = "7,8", path = "bottom" },
		            { map = "7,9", path = "right" },
		            { map = "8,9", path = "right" },
		            { map = "9,9", path = "top" },
		            { map = "9,8", path = "top" },
		            { map = "9,7", path = "top" },
		            { map = "9,6", path = "top" },
		            { map = "9,5", path = "left" },
		            { map = "8,5", path = "top" },
		            { map = "8,4", path = "left" },
		            { map = "7,4", path = "bottom" },
		            { map = "7,5", path = "bottom" },
		            { map = "7,6", path = "bottom", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [16] = {
            name = "Zone Lin champs de cania",
            tags = {
                "Lin"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap Champs de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" },  -- Zaap sous bonta
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },
		            { map = "-27,-39", path = "top" },  -- Reboucle
		            { map = "-27,-40", path = "top" },
		            { map = "-27,-41", path = "right" },
		            { map = "-26,-41", path = "right" },
		            { map = "-25,-41", path = "right" },
		            { map = "-24,-41", path = "bottom" },
		            { map = "-24,-40", path = "right" },
		            { map = "-23,-40", path = "bottom" },
		            { map = "-23,-39", path = "left" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "left" },
		            { map = "-26,-39", path = "left", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [17] = {
            name = "Zone Seigle coin des Scarafeuille",
            tags = {
                "Seigle"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap Coin des Scarafeuille
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-1,24", path = "right" },  -- Zaap scara
		            { map = "0,24", path = "right" },
		            { map = "1,24", path = "right" },
		            { map = "2,24", path = "right" },  -- Reboucle
		            { map = "3,24", path = "right" },
		            { map = "4,24", path = "bottom" },
		            { map = "4,25", path = "bottom" },
		            { map = "4,26", path = "bottom" },
		            { map = "4,27", path = "left" },
		            { map = "3,27", path = "left" },
		            { map = "2,27", path = "top" },
		            { map = "2,26", path = "top" },
		            { map = "2,25", path = "top", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [18] = {
            name = "Zone Seigle coin des bouftout",
            tags = {
                "Seigle"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap Coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            {map = "5,7", path = "right" },  -- Zaap Bouftout
		            {map = "6,7", path = "right" },
		            {map = "7,7", path = "right" },
		            {map = "8,7", path = "right" }, -- Reboucle
		            {map = "9,7", path = "bottom" },
		            {map = "9,8", path = "left" },
		            {map = "8,8", path = "top", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [19] = {
            name = "Zone Seigle champs de cania",
            tags = {
                "Seigle"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap Champs de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" },  -- Zaap sous bonta
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },  -- Reboucle
		            { map = "-27,-39", path = "top" },
		            { map = "-27,-40", path = "left" },
		            { map = "-28,-40", path = "bottom" },
		            { map = "-28,-39", path = "left" },
		            { map = "-29,-39", path = "left" },
		            { map = "-30,-39", path = "top" },
		            { map = "-30,-40", path = "top" },
		            { map = "-30,-41", path = "top" },
		            { map = "-30,-42", path = "top" },
		            { map = "-30,-43", path = "top" },
		            { map = "-30,-44", path = "right" },
		            { map = "-29,-44", path = "right" },
		            { map = "-28,-44", path = "bottom" },
		            { map = "-28,-43", path = "bottom" },
		            { map = "-28,-42", path = "right" },
		            { map = "-27,-42", path = "right" },
		            { map = "-26,-42", path = "right" },
		            { map = "-25,-42", path = "top" },
		            { map = "-25,-43", path = "top" },
		            { map = "-25,-44", path = "right" },
		            { map = "-24,-44", path = "bottom" },
		            { map = "-24,-43", path = "bottom" },
		            { map = "-24,-42", path = "bottom" },
		            { map = "-24,-41", path = "left" },
		            { map = "-25,-41", path = "bottom" },
		            { map = "-25,-40", path = "right" },
		            { map = "-24,-40", path = "right" },
		            { map = "-23,-40", path = "bottom" },
		            { map = "-23,-39", path = "bottom" },
		            { map = "-23,-38", path = "left" },
		            { map = "-24,-38", path = "left" },
		            { map = "-25,-38", path = "left" },
		            { map = "-26,-38", path = "left", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [20] = {
            name = "Zone Malt coin des Scarafeuille",
            tags = {
                "Malt"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88212481)") -- Zaap Coin des Scarafeuille
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-1,24", path = "right" },  -- Zaap scara
		            { map = "0,24", path = "right" },
		            { map = "1,24", path = "right" },
		            { map = "2,24", path = "right" },
		            { map = "3,24", path = "bottom" },
		            { map = "3,25", path = "bottom" },
		            { map = "3,26", path = "bottom" },  -- Reboucle
		            { map = "3,27", path = "right" },
		            { map = "4,27", path = "right" },
		            { map = "5,27", path = "top" },
		            { map = "5,26", path = "left" },
		            { map = "4,26", path = "left", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [21] = {
            name = "Zone Malt coin des bouftout",
            tags = {
                "Malt"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,88082704)") -- Zaap Coin des bouftout
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "5,7", path = "right" },  -- zaap Bouftou
		            { map = "6,7", path = "right" },
		            { map = "7,7", path = "right" },
		            { map = "8,7", path = "top" },  -- Reboucle
		            { map = "8,6", path = "top" },
		            { map = "8,5", path = "right" },
		            { map = "9,5", path = "right" },
		            { map = "10,5", path = "bottom" },
		            { map = "10,6", path = "bottom" },
		            { map = "10,7", path = "bottom" },
		            { map = "10,8", path = "left" },
		            { map = "9,8", path = "left" },
		            { map = "8,8", path = "top", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [22] = {
            name = "Zone Malt champs de cania",
            tags = {
                "Malt"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap Champs de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" },  -- Zaap sous Bonta
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },
		            { map = "-27,-39", path = "top" },
		            { map = "-27,-40", path = "top" },  -- Reboucle
		            { map = "-27,-41", path = "top" },
		            { map = "-27,-42", path = "top" },
		            { map = "-27,-43", path = "right" },
		            { map = "-26,-43", path = "right" },
		            { map = "-25,-43", path = "bottom" },
		            { map = "-25,-42", path = "right" },
		            { map = "-24,-42", path = "right" },
		            { map = "-23,-42", path = "right" },
		            { map = "-22,-42", path = "bottom" },
		            { map = "-22,-41", path = "bottom" },
		            { map = "-22,-40", path = "bottom" },
		            { map = "-22,-39", path = "left" },
		            { map = "-23,-39", path = "left" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "top" },
		            { map = "-25,-40", path = "left" },
		            { map = "-26,-40", path = "left", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [23] = {
            name = "Zone Malt Lac de cania",
            tags = {
                "Malt"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,156240386)") -- Zaap Lac de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-3,-42", path = "right" },  -- Zaap Lac de Cania
		            { map = "-2,-42", path = "right" },
		            { map = "-1,-42", path = "right" },
		            { map = "0,-42", path = "top" },
		            { map = "0,-43", path = "top" },
		            { map = "0,-44", path = "top" },
		            { map = "0,-45", path = "top" },  -- Reboucle
		            { map = "0,-46", path = "left" },
		            { map = "-1,-46", path = "bottom" },
		            { map = "-1,-45", path = "right", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [24] = {
            name = "Zone Chanvre champs de cania",
            tags = {
                "Chanvre"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,142087694)") -- Zaap Champs de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-27,-36", path = "top" },  -- Zaap sous bonta
		            { map = "-27,-37", path = "top" },
		            { map = "-27,-38", path = "top" },
		            { map = "-27,-39", path = "top" },  -- Reboucle
		            { map = "-27,-40", path = "top" },
		            { map = "-27,-41", path = "left" },
		            { map = "-28,-41", path = "top" },
		            { map = "-28,-42", path = "right" },
		            { map = "-27,-42", path = "top" },
		            { map = "-27,-43", path = "right" },
		            { map = "-26,-43", path = "bottom" },
		            { map = "-26,-42", path = "right" },
		            { map = "-25,-42", path = "right" },
		            { map = "-24,-42", path = "right" },
		            { map = "-23,-42", path = "bottom" },
		            { map = "-23,-41", path = "right" },
		            { map = "-22,-41", path = "bottom" },
		            { map = "-22,-40", path = "bottom" },
		            { map = "-22,-39", path = "left" },
		            { map = "-23,-39", path = "left" },
		            { map = "-24,-39", path = "left" },
		            { map = "-25,-39", path = "left" },
		            { map = "-26,-39", path = "left", custom = bouclePlus } -- fin de boucle
			    })
            end
        },
        [25] = {
            name = "Zone Mais Otomai",
            tags = {
                "Mais"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,154642)") -- Zaap Otomai
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-46,18", path = "left" },  -- Zaap otoami 
		            { map = "-47,18", path = "top" },
		            { map = "-47,17", path = "top" },
		            { map = "-47,16", path = "top" },
		            { map = "-47,15", path = "top" },
		            { map = "-47,14", path = "top" },
		            { map = "-47,13", path = "top" },
		            { map = "-47,12", path = "top" },
		            { map = "-47,11", path = "left" },
		            { map = "-48,11", path = "left" },
		            { map = "-49,11", path = "left" },
		            { map = "-50,11", path = "left" },  -- Reboucle
		            { map = "-51,11", path = "top" },
		            { map = "-51,10", path = "top" },
		            { map = "-51,9", path = "top" },
		            { map = "-51,8", path = "left" },
		            { map = "-52,8", path = "top" },
		            { map = "-52,7", path = "top" },
		            { map = "-52,6", path = "top" },
		            { map = "-52,5", path = "top" },
		            { map = "-52,4", path = "left" },
		            { map = "-53,4", path = "left" },
		            { map = "-54,4", path = "left" },
		            { map = "-55,4", path = "top" },
		            { map = "-55,3", path = "right" },
		            { map = "-54,3", path = "right" },
		            { map = "-53,3", path = "right" },
		            { map = "-52,3", path = "right" },
		            { map = "-51,3", path = "bottom" },
		            { map = "-51,4", path = "bottom" },
		            { map = "-51,5", path = "bottom" },
		            { map = "-51,6", path = "right" },
		            { map = "-50,6", path = "bottom" },
		            { map = "-50,7", path = "bottom" },
		            { map = "-50,8", path = "bottom" },
		            { map = "-50,9", path = "bottom" },
		            { map = "-50,10", path = "bottom", custom = bouclePlus }  -- fin de boucle
			    })
            end
        },
        [26] = {
            name = "Zone Millet Lac de cania",
            tags = {
                "Millet"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,156240386)") -- Zaap Lac de cania
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
		            { map = "-3,-42", path = "top" },  -- Zaap Lac de Cania
		            { map = "-3,-43", path = "top" },
		            { map = "-3,-49", path = "left" },
		            { map = "-4,-49", path = "left" },
		            { map = "-5,-49", path = "left" },
		            { map = "-6,-49", path = "top" },
		            { map = "-6,-50", path = "top" },  -- reboucle
		            { map = "-6,-51", path = "top" },
		            { map = "-6,-52", path = "top" },
		            { map = "-6,-53", path = "top" },
		            { map = "-6,-54", path = "top" },
		            { map = "-6,-55", path = "left" },
		            { map = "-7,-55", path = "top" },
		            { map = "-7,-56", path = "right" },
		            { map = "-6,-56", path = "top" },
		            { map = "-6,-57", path = "top" },
		            { map = "-6,-58", path = "top" },
		            { map = "-6,-59", path = "right" },
		            { map = "-5,-59", path = "bottom" },
		            { map = "-5,-58", path = "bottom" },
		            { map = "-5,-57", path = "bottom" },
		            { map = "-5,-56", path = "bottom" },
		            { map = "-5,-55", path = "right" },
		            { map = "-4,-55", path = "top" },
		            { map = "-4,-56", path = "top" },
		            { map = "-4,-57", path = "top" },
		            { map = "-4,-58", path = "top" },
		            { map = "-4,-59", path = "right" },
		            { map = "-3,-59", path = "bottom" },
		            { map = "-3,-58", path = "bottom" },
		            { map = "-3,-57", path = "bottom" },
		            { map = "-3,-56", path = "bottom" },
		            { map = "-3,-55", path = "bottom" },
		            { map = "-3,-54", path = "bottom" },
		            { map = "-3,-52", path = "bottom" },
		            { map = "-3,-51", path = "right" },
		            { map = "-3,-53", path = "bottom" },
		            { map = "-2,-51", path = "bottom" },
		            { map = "-2,-50", path = "left" },
		            { map = "-3,-50", path = "left" },
		            { map = "-4,-50", path = "left" },
		            { map = "-5,-50", path = "left" },
		            { map = "-3,-44", path = "top" },
		            { map = "-3,-45", path = "top" },
		            { map = "-3,-46", path = "top" },
		            { map = "-3,-47", path = "top" },
		            { map = "-3,-48", path = "top", custom = bouclePlus }  -- fin de boucle
			    })
            end
        }, 
    },
    ["alchimiste"] = {
        [1] = {
            name = "Zone Ortie coin des Scarafeuille",
            tags = {
                "Ortie"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-1,24", path = "right", gather = true },  -- Zaap Scara   +  Reboucle ( il reboucle sur le zaap )
		            { map = "0,24", path = "right", gather = true },
		            { map = "1,24", path = "bottom", gather = true },
		            { map = "1,25", path = "bottom", gather = true },
		            { map = "1,26", path = "bottom", gather = true },
		            { map = "1,27", path = "left", gather = true },
		            { map = "0,27", path = "bottom", gather = true },
		            { map = "0,28", path = "right", gather = true },
		            { map = "1,28", path = "bottom", gather = true },
		            { map = "1,29", path = "left", gather = true },
		            { map = "0,29", path = "bottom", gather = true },
		            { map = "0,30", path = "right", gather = true },
		            { map = "1,30", path = "right", gather = true },
		            { map = "2,30", path = "bottom", gather = true },
		            { map = "2,31", path = "bottom", gather = true },
		            { map = "2,32", path = "right", gather = true },
		            { map = "3,32", path = "right", gather = true },
		            { map = "4,32", path = "right", gather = true },
		            { map = "5,32", path = "top", gather = true },
		            { map = "5,31", path = "top", gather = true },
		            { map = "5,30", path = "right", gather = true },
		            { map = "6,30", path = "right", gather = true },
		            { map = "7,30", path = "bottom", gather = true },
		            { map = "7,31", path = "right", gather = true },
		            { map = "8,31", path = "top", gather = true },
		            { map = "8,30", path = "right", gather = true },
		            { map = "9,30", path = "right", gather = true },
		            { map = "10,30", path = "top", gather = true },
		            { map = "10,29", path = "left", gather = true },
		            { map = "9,29", path = "left", gather = true },
		            { map = "8,29", path = "left", gather = true },
		            { map = "7,29", path = "left", gather = true },
		            { map = "6,29", path = "top", gather = true },
		            { map = "6,28", path = "left", gather = true },
		            { map = "5,28", path = "top", gather = true },
		            { map = "5,27", path = "left", gather = true },
		            { map = "4,27", path = "top", gather = true },
		            { map = "4,26", path = "top", gather = true },
		            { map = "4,25", path = "top", gather = true },
		            { map = "4,24", path = "top", gather = true },
		            { map = "4,23", path = "top", gather = true },
		            { map = "4,22", path = "right", gather = true },
		            { map = "5,22", path = "right", gather = true },
		            { map = "6,22", path = "right", gather = true },
		            { map = "7,22", path = "top", gather = true },
		            { map = "7,21", path = "right", gather = true },
		            { map = "8,21", path = "right", gather = true },
		            { map = "9,21", path = "right", gather = true },
		            { map = "10,21", path = "bottom", gather = true },
		            { map = "10,22", path = "right", gather = true },
		            { map = "11,22", path = "right", gather = true },
		            { map = "12,22", path = "top", gather = true },
		            { map = "12,21", path = "left", gather = true },
		            { map = "11,21", path = "top", gather = true },
		            { map = "11,20", path = "left", gather = true },
		            { map = "10,20", path = "left", gather = true },
		            { map = "9,20", path = "top", gather = true },
		            { map = "9,19", path = "left", gather = true },
		            { map = "8,19", path = "left", gather = true },
		            { map = "7,19", path = "top", gather = true },
		            { map = "7,18", path = "left", gather = true },
		            { map = "6,18", path = "bottom", gather = true },
		            { map = "6,19", path = "bottom", gather = true },
		            { map = "6,20", path = "bottom", gather = true },
		            { map = "6,21", path = "left", gather = true },
		            { map = "5,21", path = "left", gather = true },
		            { map = "4,21", path = "left", gather = true },
		            { map = "3,21", path = "top", gather = true },
		            { map = "3,20", path = "left", gather = true },
		            { map = "2,20", path = "bottom", gather = true },
		            { map = "2,21", path = "bottom", gather = true },
		            { map = "2,22", path = "bottom", gather = true },
		            { map = "2,23", path = "left", gather = true },
		            { map = "1,23", path = "left", gather = true },
		            { map = "0,23", path = "left", gather = true },
		            { map = "-1,23", path = "bottom", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        },
        [2] = {
            name = "Zone Ortie coin des bouftout",
            tags = {
                "Ortie"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "5,7", path = "right", gather = true },  -- Zaap Bouftout
		            { map = "6,7", path = "right", gather = true },  -- Reboucle
		            { map = "7,7", path = "top", gather = true },
		            { map = "7,6", path = "right", gather = true },
		            { map = "8,6", path = "right", gather = true },
		            { map = "9,6", path = "right", gather = true },
		            { map = "10,6", path = "right", gather = true },
		            { map = "11,6", path = "bottom", gather = true },
		            { map = "11,7", path = "bottom", gather = true },
		            { map = "11,8", path = "bottom", gather = true },
		            { map = "11,9", path = "left", gather = true },
		            { map = "10,9", path = "bottom", gather = true },
		            { map = "10,10", path = "right", gather = true },
		            { map = "11,10", path = "bottom", gather = true },
		            { map = "11,11", path = "bottom", gather = true },
		            { map = "11,12", path = "left", gather = true },
		            { map = "10,12", path = "left", gather = true },
		            { map = "9,12", path = "left", gather = true },
		            { map = "8,12", path = "left", gather = true },
		            { map = "7,12", path = "left", gather = true },
		            { map = "6,12", path = "left", gather = true },
		            { map = "5,12", path = "bottom", gather = true },
		            { map = "5,13", path = "bottom", gather = true },
		            { map = "5,14", path = "left", gather = true },
		            { map = "4,14", path = "left", gather = true },
		            { map = "3,14", path = "left", gather = true },
		            { map = "2,14", path = "top", gather = true },
		            { map = "2,13", path = "left", gather = true },
		            { map = "1,13", path = "bottom", gather = true },
		            { map = "1,14", path = "left", gather = true },
		            { map = "0,14", path = "left", gather = true },
		            { map = "-1,14", path = "top", gather = true },
		            { map = "-1,13", path = "right", gather = true },
		            { map = "0,13", path = "top", gather = true },
		            { map = "0,12", path = "left", gather = true },
		            { map = "-1,12", path = "top", gather = true },
		            { map = "-1,11", path = "top", gather = true },
		            { map = "-1,10", path = "right", gather = true },
		            { map = "0,10", path = "bottom", gather = true },
		            { map = "0,11", path = "right", gather = true },
		            { map = "1,11", path = "right", gather = true },
		            { map = "2,11", path = "bottom", gather = true },
		            { map = "2,12", path = "right", gather = true },
		            { map = "3,12", path = "top", gather = true },
		            { map = "3,11", path = "top", gather = true },
		            { map = "3,10", path = "right", gather = true },
		            { map = "4,10", path = "right", gather = true },
		            { map = "5,10", path = "right", gather = true },
		            { map = "6,10", path = "top", gather = true },
		            { map = "6,9", path = "right", gather = true },
		            { map = "7,9", path = "right", gather = true },
		            { map = "8,9", path = "top", gather = true },
		            { map = "8,8", path = "left", gather = true },
		            { map = "7,8", path = "left", gather = true },
		            { map = "6,8", path = "top", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        },
        [3] = {
            name = "Zone Ortie village amakna",
            tags = {
                "Ortie"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-2,0", path = "left", gather = true },  -- Zaap Amakna Village  +  Reboucle
		            { map = "-3,0", path = "top", gather = true },
		            { map = "-3,-1", path = "top", gather = true },
		            { map = "-3,-2", path = "right", gather = true },
		            { map = "-2,-2", path = "top", gather = true },
		            { map = "-2,-3", path = "top", gather = true },
		            { map = "-2,-4", path = "right", gather = true },
		            { map = "-1,-4", path = "right", gather = true },
		            { map = "0,-4", path = "right", gather = true },
		            { map = "1,-4", path = "bottom", gather = true },
		            { map = "1,-3", path = "left", gather = true },
		            { map = "0,-3", path = "bottom", gather = true },
		            { map = "0,-2", path = "bottom", gather = true },
		            { map = "0,-1", path = "right", gather = true },
		            { map = "1,-1", path = "right", gather = true },
		            { map = "2,-1", path = "right", gather = true },
		            { map = "3,-1", path = "bottom", gather = true },
		            { map = "3,0", path = "right", gather = true },
		            { map = "4,0", path = "right", gather = true },
		            { map = "5,0", path = "right", gather = true },
		            { map = "6,0", path = "top", gather = true },
		            { map = "6,-1", path = "right", gather = true },
		            { map = "7,-1", path = "bottom", gather = true },
		            { map = "7,0", path = "right", gather = true },
		            { map = "8,0", path = "bottom", gather = true },
		            { map = "8,1", path = "bottom", gather = true },
		            { map = "8,2", path = "bottom", gather = true },
		            { map = "8,3", path = "bottom", gather = true },
		            { map = "8,4", path = "left", gather = true },
		            { map = "7,4", path = "bottom", gather = true },
		            { map = "7,5", path = "left", gather = true },
		            { map = "6,5", path = "left", gather = true },
		            { map = "5,5", path = "top", gather = true },
		            { map = "5,4", path = "right", gather = true },
		            { map = "6,4", path = "top", gather = true },
		            { map = "6,3", path = "top", gather = true },
		            { map = "6,2", path = "right", gather = true },
		            { map = "7,2", path = "top", gather = true },
		            { map = "7,1", path = "left", gather = true },
		            { map = "6,1", path = "left", gather = true },
		            { map = "5,1", path = "left", gather = true },
		            { map = "4,1", path = "left", gather = true },
		            { map = "3,1", path = "left", gather = true },
		            { map = "2,1", path = "top", gather = true },
		            { map = "2,0", path = "left", gather = true },
		            { map = "1,0", path = "bottom", gather = true },
		            { map = "1,1", path = "left", gather = true },
		            { map = "0,1", path = "left", gather = true },
		            { map = "-1,1", path = "top", gather = true },
		            { map = "-1,0", path = "left", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [4] = {
            name = "Zone Ortie plaine des porkass",
            tags = {
                "BUG"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-5,-23", path = "right", gather = true },  -- Zaap Plaines des porkass
		            { map = "-4,-23", path = "top", gather = true },
		            { map = "-4,-24", path = "top", gather = true },
		            { map = "-4,-25", path = "top", gather = true },
		            { map = "-4,-26", path = "top", gather = true },
		            { map = "-4,-27", path = "top", gather = true },
		            { map = "-4,-28", path = "top", gather = true },
		            { map = "-4,-29", path = "left", gather = true },
		            { map = "-5,-29", path = "top", gather = true },
		            { map = "-5,-30", path = "top", gather = true },
		            { map = "-5,-31", path = "top", gather = true },
		            { map = "-5,-32", path = "top", gather = true },
		            { map = "-5,-33", path = "right", gather = true },
		            { map = "-4,-33", path = "top", gather = true },
		            { map = "-4,-34", path = "left", gather = true },
		            { map = "-5,-34", path = "left", gather = true },
		            { map = "-6,-34", path = "left", gather = true },
		            { map = "-7,-34", path = "left", gather = true },
		            { map = "-8,-34", path = "top", gather = true },
		            { map = "-8,-35", path = "left", gather = true },
		            { map = "-9,-35", path = "bottom", gather = true },
		            { map = "-9,-34", path = "bottom", gather = true },
		            { map = "-9,-33", path = "left", gather = true },
		            { map = "-10,-33", path = "top", gather = true },
		            { map = "-10,-34", path = "top", gather = true },
		            { map = "-10,-35", path = "top", gather = true },
		            { map = "-10,-36", path = "left", gather = true },
		            { map = "-11,-36", path = "bottom", gather = true },
		            { map = "-11,-35", path = "left", gather = true },
		            { map = "-12,-35", path = "bottom", gather = true },
		            { map = "-12,-34", path = "right", gather = true },
		            { map = "-11,-34", path = "bottom", gather = true },
		            { map = "-11,-33", path = "bottom", gather = true },
		            { map = "-11,-32", path = "left", gather = true },
		            { map = "-12,-32", path = "left", gather = true },
		            { map = "-13,-32", path = "bottom", gather = true },
		            { map = "-13,-31", path = "left", gather = true },
		            { map = "-14,-31", path = "bottom", gather = true },
		            { map = "-14,-30", path = "right", gather = true },
		            { map = "-13,-30", path = "bottom", gather = true },
		            { map = "-13,-29", path = "left", gather = true },
		            { map = "-14,-29", path = "bottom", gather = true },
		            { map = "-14,-28", path = "right", gather = true },
		            { map = "-13,-28", path = "bottom", gather = true },
		            { map = "-13,-27", path = "left", gather = true },
		            { map = "-14,-27", path = "bottom", gather = true },
		            { map = "-14,-26", path = "bottom", gather = true },
		            { map = "-14,-25", path = "bottom", gather = true },
		            { map = "-14,-24", path = "right", gather = true },
		            { map = "-13,-24", path = "bottom", gather = true },
		            { map = "-13,-23", path = "bottom", gather = true },
		            { map = "-13,-22", path = "right", gather = true },
		            { map = "-12,-22", path = "bottom", gather = true },
		            { map = "-12,-21", path = "right", gather = true },
		            { map = "-11,-21", path = "bottom", gather = true },
		            { map = "-11,-20", path = "right", gather = true },
		            { map = "-10,-20", path = "bottom", gather = true },
		            { map = "-10,-19", path = "bottom", gather = true },
		            { map = "-10,-18", path = "right", gather = true },
		            { map = "-9,-18", path = "top", gather = true },
		            { map = "-9,-19", path = "right", gather = true },
		            { map = "-8,-19", path = "bottom", gather = true },
		            { map = "-8,-18", path = "right", gather = true },
		            { map = "-7,-18", path = "top", gather = true },
		            { map = "-7,-19", path = "right", gather = true },
		            { map = "-6,-19", path = "right", gather = true },
		            { map = "-5,-19", path = "top", gather = true },
		            { map = "-5,-20", path = "top", gather = true },
		            { map = "-5,-21", path = "top", gather = true},
		            { map = "-5,-22", path = "top", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [5] = {
            name = "Zone Sauge champs de cania",
            tags = {
                "Sauge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(142087694)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-27,-36", path = "bottom", gather = true },  -- Zaap sous bonta
		            { map = "-27,-35", path = "left", gather = true },  -- Reboucle
		            { map = "-28,-35", path = "left", gather = true }, 
		            { map = "-29,-35", path = "left", gather = true },
		            { map = "-30,-35", path = "top", gather = true },
		            { map = "-30,-36", path = "top", gather = true },
		            { map = "-30,-37", path = "top", gather = true },
		            { map = "-30,-38", path = "left", gather = true },
		            { map = "-31,-38", path = "top", gather = true },
		            { map = "-31,-39", path = "top", gather = true },
		            { map = "-31,-40", path = "right", gather = true },
		            { map = "-30,-40", path = "bottom", gather = true },
		            { map = "-30,-39", path = "right", gather = true },
		            { map = "-29,-39", path = "right", gather = true },
		            { map = "-28,-39", path = "right", gather = true },
		            { map = "-27,-39", path = "top", gather = true },
		            { map = "-27,-40", path = "left", gather = true },
		            { map = "-28,-40", path = "top", gather = true },
		            { map = "-28,-41", path = "right", gather = true },
		            { map = "-27,-41", path = "right", gather = true },
		            { map = "-26,-41", path = "top", gather = true },
		            { map = "-26,-42", path = "right", gather = true },
		            { map = "-25,-42", path = "right", gather = true },
		            { map = "-24,-42", path = "bottom", gather = true },
		            { map = "-24,-41", path = "right", gather = true },
		            { map = "-23,-41", path = "top", gather = true },
		            { map = "-23,-42", path = "right", gather = true },
		            { map = "-22,-42", path = "right", gather = true },
		            { map = "-21,-42", path = "bottom", gather = true },
		            { map = "-21,-41", path = "bottom", gather = true },
		            { map = "-21,-40", path = "left", gather = true },
		            { map = "-22,-40", path = "bottom", gather = true },
		            { map = "-22,-39", path = "bottom", gather = true },
		            { map = "-22,-38", path = "bottom", gather = true },
		            { map = "-22,-37", path = "left", gather = true },
		            { map = "-23,-37", path = "top", gather = true },
		            { map = "-23,-38", path = "top", gather = true },
		            { map = "-23,-39", path = "left", gather = true },
		            { map = "-24,-39", path = "left", gather = true },
		            { map = "-25,-39", path = "left", gather = true },
		            { map = "-26,-39", path = "bottom", gather = true },
		            { map = "-26,-38", path = "right", gather = true },
		            { map = "-25,-38", path = "bottom", gather = true },
		            { map = "-25,-37", path = "bottom", gather = true },
		            { map = "-25,-36", path = "right", gather = true },
		            { map = "-24,-36", path = "bottom", gather = true },
		            { map = "-24,-35", path = "left", gather = true },
		            { map = "-25,-35", path = "left", gather = true },
		            { map = "-26,-35", path = "left", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [6] = {
            name = "Zone Sauge plaine des porkass",
            tags = {
                "Sauge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-5,-23", path = "top", gather = true },  -- Zaap porkass  + Reboucle
		            { map = "-5,-24", path = "top", gather = true },
		            { map = "-5,-25", path = "left", gather = true },
		            { map = "-6,-25", path = "top", gather = true },
		            { map = "-6,-26", path = "top", gather = true },
		            { map = "-6,-27", path = "top", gather = true },
		            { map = "-6,-28", path = "right", gather = true },
		            { map = "-5,-28", path = "right", gather = true },
		            { map = "-4,-28", path = "right", gather = true },
		            { map = "-3,-28", path = "bottom", gather = true },
		            { map = "-3,-27", path = "right", gather = true },
		            { map = "-2,-27", path = "right", gather = true },
		            { map = "-1,-27", path = "right", gather = true },
		            { map = "0,-27", path = "right", gather = true },
		            { map = "1,-27", path = "bottom", gather = true },
		            { map = "1,-26", path = "left", gather = true },
		            { map = "0,-26", path = "left", gather = true },
		            { map = "-1,-26", path = "left", gather = true },
		            { map = "-2,-26", path = "bottom", gather = true },
		            { map = "-2,-25", path = "right", gather = true },
		            { map = "-1,-25", path = "right", gather = true },
		            { map = "0,-25", path = "right", gather = true },
		            { map = "1,-25", path = "bottom", gather = true },
		            { map = "1,-24", path = "left", gather = true },
		            { map = "0,-24", path = "left", gather = true },
		            { map = "-1,-24", path = "left", gather = true },
		            { map = "-2,-24", path = "bottom", gather = true },
		            { map = "-2,-23", path = "left", gather = true },
		            { map = "-3,-23", path = "top", gather = true },
		            { map = "-3,-24", path = "left", gather = true },
		            { map = "-4,-24", path = "bottom", gather = true },
		            { map = "-4,-23", path = "left", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [7] = {
            name = "Zone Sauge routes rocailleuse",
            tags = {
                "Sauge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(164364304)
                end
            end,
            ["PATH"] = function()
                return {
		            {map = "-20,-20", path = "right" },  -- Zaap Routes rocailleuse  ID zaap 164364304 
		            {map = "-19,-20", path = "right", gather = true },  -- Rebouble
		            {map = "-18,-20", path = "top", gather = true },
		            {map = "-18,-21", path = "top", gather = true },
		            {map = "-18,-22", path = "top", gather = true },
		            {map = "-18,-23", path = "top", gather = true },
		            {map = "-18,-24", path = "right", gather = true },
		            {map = "-17,-24", path = "bottom", gather = true },
		            {map = "-17,-23", path = "bottom", gather = true },
		            {map = "-17,-22", path = "right", gather = true },
		            {map = "-16,-22", path = "bottom", gather = true },
		            {map = "-16,-21", path = "right", gather = true },
		            {map = "-15,-21", path = "bottom", gather = true },
		            {map = "-15,-20", path = "right", gather = true },
		            {map = "-14,-20", path = "bottom", gather = true },
		            {map = "-14,-19", path = "bottom", gather = true },
		            {map = "-14,-18", path = "left", gather = true },
		            {map = "-15,-18", path = "top", gather = true },
		            {map = "-15,-19", path = "left", gather = true },
		            {map = "-16,-19", path = "left", gather = true },
		            {map = "-17,-19", path = "bottom", gather = true },
		            {map = "-17,-18", path = "bottom", gather = true },
		            {map = "-17,-17", path = "bottom", gather = true },
		            {map = "-17,-16", path = "bottom", gather = true },
		            {map = "-17,-15", path = "bottom", gather = true },
		            {map = "-17,-14", path = "left", gather = true },
		            {map = "-18,-14", path = "left", gather = true },
		            {map = "-19,-14", path = "top", gather = true },
		            {map = "-19,-15", path = "top", gather = true },
		            {map = "-19,-16", path = "top", gather = true },
		            {map = "-19,-17", path = "top", gather = true },
		            {map = "-19,-18", path = "top", gather = true },
		            {map = "-19,-19", path = "top", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [8] = {
            name = "Zone Sauge coin des bouftout",
            tags = {
                "Sauge"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "5,7", path = "right", gather = true },  -- Zaap bouftout  +  Reboucle
		            { map = "6,7", path = "bottom", gather = true },
		            { map = "6,8", path = "right", gather = true },
		            { map = "7,8", path = "top", gather = true },
		            { map = "7,7", path = "top", gather = true },
		            { map = "7,6", path = "top", gather = true },
		            { map = "6,5", path = "top", gather = true },
		            { map = "6,4", path = "right", gather = true },
		            { map = "7,4", path = "right", gather = true },
		            { map = "8,4", path = "top", gather = true },
		            { map = "8,3", path = "top", gather = true },
		            { map = "8,2", path = "top", gather = true },
		            { map = "8,1", path = "left", gather = true },
		            { map = "7,1", path = "left", gather = true },
		            { map = "6,1", path = "top", gather = true },
		            { map = "6,0", path = "left", gather = true },
		            { map = "5,0", path = "bottom", gather = true },
		            { map = "5,1", path = "bottom", gather = true },
		            { map = "5,2", path = "bottom", gather = true },
		            { map = "5,3", path = "left", gather = true },
		            { map = "4,3", path = "left", gather = true },
		            { map = "3,3", path = "left", gather = true },
		            { map = "2,3", path = "left", gather = true },
		            { map = "1,3", path = "left", gather = true },
		            { map = "0,3", path = "left", gather = true },
		            { map = "-1,3", path = "left", gather = true },
		            { map = "-2,3", path = "bottom", gather = true },
		            { map = "-2,4", path = "right", gather = true },
		            { map = "-1,4", path = "right", gather = true },
		            { map = "0,4", path = "right", gather = true },
		            { map = "1,4", path = "right", gather = true },
		            { map = "2,4", path = "bottom", gather = true },
		            { map = "2,5", path = "right", gather = true },
		            { map = "3,5", path = "bottom", gather = true },
		            { map = "3,6", path = "right", gather = true },
		            { map = "7,5", path = "left", gather = true },
		            { map = "4,6", path = "bottom", gather = true },
		            { map = "4,7", path = "right", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [9] = {
            name = "Zone Trefle a 5 feuille coin des Scarafeuille",
            tags = {
                "Trefle a 5 feuille"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-1,24", path = "left", gather = true },  -- Zaap scara
		            { map = "-2,24", path = "left", gather = true },  -- Reboucle
		            { map = "-3,24", path = "left", gather = true },
		            { map = "-4,24", path = "bottom", gather = true },
		            { map = "-4,25", path = "bottom", gather = true },
		            { map = "-4,26", path = "bottom", gather = true },
		            { map = "-4,27", path = "left", gather = true },
		            { map = "-5,27", path = "left", gather = true },
		            { map = "-6,27", path = "bottom", gather = true },
		            { map = "-6,28", path = "bottom", gather = true },
		            { map = "-6,29", path = "right", gather = true },
		            { map = "-5,29", path = "bottom", gather = true },
		            { map = "-5,30", path = "bottom", gather = true },
		            { map = "-5,31", path = "bottom", gather = true },
		            { map = "-5,32", path = "right", gather = true },
		            { map = "-4,32", path = "top", gather = true },
		            { map = "-4,31", path = "top", gather = true },
		            { map = "-4,30", path = "right", gather = true },
		            { map = "-3,30", path = "right", gather = true },
		            { map = "-2,30", path = "top", gather = true },
		            { map = "-2,29", path = "left", gather = true },
		            { map = "-3,29", path = "top", gather = true },
		            { map = "-3,28", path = "top", gather = true },
		            { map = "-3,27", path = "top", gather = true },
		            { map = "-3,26", path = "right", gather = true },
		            { map = "-2,26", path = "top", gather = true },
		            { map = "-2,25", path = "top", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [10] = {
            name = "Zone Trefle a 5 feuille coin des bouftout",
            tags = {
                "Trefle a 5 feuille"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "5,7", path = "right", gather = true },  -- Zaap Bouftout  +  Reboucle
		            { map = "6,7", path = "right", gather = true },
		            { map = "7,7", path = "bottom", gather = true },
		            { map = "7,8", path = "right", gather = true },
		            { map = "8,8", path = "right", gather = true },
		            { map = "9,8", path = "right", gather = true },
		            { map = "10,8", path = "top", gather = true },
		            { map = "10,7", path = "top", gather = true },
		            { map = "10,6", path = "right", gather = true },
		            { map = "11,6", path = "top", gather = true },
		            { map = "11,5", path = "left", gather = true },
		            { map = "10,5", path = "left", gather = true },
		            { map = "9,5", path = "left", gather = true },
		            { map = "7,5", path = "left", gather = true },
		            { map = "8,5", path = "left", gather = true },
		            { map = "6,5", path = "left", gather = true },
		            { map = "5,5", path = "left", gather = true },
		            { map = "4,5", path = "left", gather = true },
		            { map = "3,5", path = "left", gather = true },
		            { map = "2,5", path = "left", gather = true },
		            { map = "1,5", path = "left", gather = true },
		            { map = "0,5", path = "bottom", gather = true },
		            { map = "0,6", path = "right", gather = true },
		            { map = "1,6", path = "right", gather = true },
		            { map = "2,6", path = "bottom", gather = true },
		            { map = "2,7", path = "left", gather = true },
		            { map = "1,7", path = "bottom", gather = true },
		            { map = "1,8", path = "bottom", gather = true },
		            { map = "1,9", path = "right", gather = true },
		            { map = "2,9", path = "bottom", gather = true },
		            { map = "2,10", path = "bottom", gather = true },
		            { map = "2,11", path = "left", gather = true },
		            { map = "1,11", path = "bottom", gather = true },
		            { map = "1,12", path = "bottom", gather = true },
		            { map = "1,13", path = "bottom", gather = true },
		            { map = "1,14", path = "bottom", gather = true },
		            { map = "1,15", path = "bottom", gather = true },
		            { map = "1,16", path = "right", gather = true },
		            { map = "2,16", path = "top", gather = true },
		            { map = "2,15", path = "top", gather = true },
		            { map = "2,14", path = "top", gather = true },
		            { map = "2,13", path = "right", gather = true },
		            { map = "3,13", path = "bottom", gather = true },
		            { map = "3,14", path = "bottom", gather = true },
		            { map = "3,15", path = "right", gather = true },
		            { map = "4,15", path = "top", gather = true },
		            { map = "4,14", path = "top", gather = true },
		            { map = "4,13", path = "top", gather = true },
		            { map = "4,12", path = "right", gather = true },
		            { map = "5,12", path = "top", gather = true },
		            { map = "5,11", path = "top", gather = true },
		            { map = "5,10", path = "top", gather = true },
		            { map = "5,9", path = "top", gather = true },
		            { map = "5,8", path = "top", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [11] = {
            name = "Zone Trefle a 5 feuille village amakna",
            tags = {
                "Trefle a 5 feuille"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-2,0", path = "right", gather = true },  -- Zaap Amakna village
		            { map = "-1,0", path = "top", gather = true },  -- Reboucle
		            { map = "-1,-1", path = "top", gather = true },
		            { map = "-1,-2", path = "top", gather = true },
		            { map = "-1,-3", path = "top", gather = true },
		            { map = "-1,-4", path = "right", gather = true },
		            { map = "0,-4", path = "bottom", gather = true },
		            { map = "0,-3", path = "bottom", gather = true },
		            { map = "0,-2", path = "right", gather = true },
		            { map = "1,-2", path = "top", gather = true },
		            { map = "1,-3", path = "right", gather = true },
		            { map = "2,-3", path = "bottom", gather = true },
		            { map = "2,-2", path = "right", gather = true },
		            { map = "3,-2", path = "bottom", gather = true },
		            { map = "3,-1", path = "right", gather = true },
		            { map = "4,-1", path = "right", gather = true },
		            { map = "5,-1", path = "top", gather = true },
		            { map = "5,-2", path = "top", gather = true },
		            { map = "5,-3", path = "right", gather = true },
		            { map = "6,-3", path = "right", gather = true },
		            { map = "7,-3", path = "bottom", gather = true },
		            { map = "7,-2", path = "bottom", gather = true },
		            { map = "7,-1", path = "right", gather = true },
		            { map = "8,-1", path = "top", gather = true },
		            { map = "8,-2", path = "right", gather = true },
		            { map = "9,-2", path = "bottom", gather = true },
		            { map = "9,-1", path = "bottom", gather = true },
		            { map = "9,0", path = "right", gather = true },
		            { map = "10,0", path = "right", gather = true },
		            { map = "11,0", path = "right", gather = true },
		            { map = "12,0", path = "right", gather = true },
		            { map = "13,0", path = "bottom", gather = true },
		            { map = "13,1", path = "left", gather = true },
		            { map = "12,1", path = "left", gather = true },
		            { map = "11,1", path = "left", gather = true },
		            { map = "10,1", path = "bottom", gather = true },
		            { map = "10,2", path = "left", gather = true },
		            { map = "9,2", path = "left", gather = true },
		            { map = "8,2", path = "left", gather = true },
		            { map = "7,2", path = "left", gather = true },
		            { map = "6,2", path = "top", gather = true },
		            { map = "6,1", path = "top", gather = true },
		            { map = "6,0", path = "left", gather = true },
		            { map = "5,0", path = "left", gather = true },
		            { map = "4,0", path = "bottom", gather = true },
		            { map = "4,1", path = "bottom", gather = true },
		            { map = "4,2", path = "left", gather = true },
		            { map = "3,2", path = "bottom", gather = true },
		            { map = "3,3", path = "left", gather = true },
		            { map = "2,3", path = "bottom", gather = true },
		            { map = "2,4", path = "left", gather = true },
		            { map = "1,4", path = "left", gather = true },
		            { map = "0,4", path = "left", gather = true },
		            { map = "-1,4", path = "top", gather = true },
		            { map = "-1,3", path = "top", gather = true },
		            { map = "-1,2", path = "top", gather = true },
		            { map = "-1,1", path = "top", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [12] = {
            name = "Zone Menthe sauvage coin des bouftout",
            tags = {
                "Menthe sauvage"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "5,7", path = "top", gather = true }, -- Zaap bouftout  +  Reboucle
		            { map = "5,6", path = "top", gather = true },
		            { map = "5,5", path = "top", gather = true },
		            { map = "5,4", path = "top", gather = true },
		            { map = "5,3", path = "top", gather = true },
		            { map = "5,2", path = "left", gather = true },
		            { map = "4,2", path = "top", gather = true },
		            { map = "4,1", path = "right", gather = true },
		            { map = "5,1", path = "top", gather = true },
		            { map = "5,0", path = "top", gather = true },
		            { map = "5,-1", path = "left", gather = true },
		            { map = "4,-1", path = "left", gather = true },
		            { map = "3,-1", path = "left", gather = true },
		            { map = "2,-1", path = "left", gather = true },
		            { map = "1,-1", path = "left", gather = true },
		            { map = "0,-1", path = "left", gather = true },
		            { map = "-1,-1", path = "left", gather = true },
		            { map = "-2,-1", path = "left", gather = true },
		            { map = "-3,-1", path = "bottom", gather = true },
		            { map = "-3,0", path = "left", gather = true },
		            { map = "-4,0", path = "bottom", gather = true },
		            { map = "-4,1", path = "right", gather = true },
		            { map = "-3,1", path = "bottom", gather = true },
		            { map = "-3,2", path = "right", gather = true },
		            { map = "-2,2", path = "bottom", gather = true },
		            { map = "-2,3", path = "bottom", gather = true },
		            { map = "-2,4", path = "bottom", gather = true },
		            { map = "-2,5", path = "bottom", gather = true },
		            { map = "-2,6", path = "right", gather = true },
		            { map = "-1,6", path = "bottom", gather = true },
		            { map = "-1,7", path = "right", gather = true },
		            { map = "0,7", path = "bottom", gather = true },
		            { map = "0,8", path = "bottom", gather = true },
		            { map = "0,9", path = "left", gather = true },
		            { map = "-1,9", path = "left", gather = true },
		            { map = "-2,9", path = "left", gather = true },
		            { map = "-3,9", path = "bottom", gather = true },
		            { map = "-3,10", path = "right", gather = true },
		            { map = "-2,10", path = "right", gather = true },
		            { map = "-1,10", path = "right", gather = true },
		            { map = "0,10", path = "bottom", gather = true },
		            { map = "0,11", path = "right", gather = true },
		            { map = "1,11", path = "right", gather = true },
		            { map = "2,11", path = "right", gather = true },
		            { map = "3,11", path = "right", gather = true },
		            { map = "4,11", path = "right", gather = true },
		            { map = "5,11", path = "right", gather = true },
		            { map = "6,11", path = "right", gather = true },
		            { map = "7,11", path = "top", gather = true },
		            { map = "7,10", path = "top", gather = true },
		            { map = "7,9", path = "left", gather = true },
		            { map = "6,9", path = "top", gather = true },
		            { map = "6,8", path = "left", gather = true },
		            { map = "5,8", path = "top", gather = true, custom = bouclePlus }
                }
            end
        },
        [13] = {
            name = "Zone Menthe sauvage coin des Scarafeuille",
            tags = {
                "Menthe sauvage"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-1,24", path = "right", gather = true },  -- Zaap Scara
		            { map = "0,24", path = "bottom", gather = true }, -- Reboucle
		            { map = "0,25", path = "bottom", gather = true },
		            { map = "0,26", path = "bottom", gather = true },
		            { map = "0,27", path = "bottom", gather = true },
		            { map = "0,28", path = "bottom", gather = true },
		            { map = "0,29", path = "right", gather = true },
		            { map = "1,29", path = "right", gather = true },
		            { map = "2,29", path = "top", gather = true },
		            { map = "2,28", path = "right", gather = true },
		            { map = "3,28", path = "bottom", gather = true },
		            { map = "3,29", path = "bottom", gather = true },
		            { map = "3,30", path = "bottom", gather = true },
		            { map = "3,31", path = "bottom", gather = true },
		            { map = "3,32", path = "right", gather = true },
		            { map = "4,32", path = "right", gather = true },
		            { map = "5,32", path = "top", gather = true },
		            { map = "5,31", path = "top", gather = true },
		            { map = "5,30", path = "right", gather = true },
		            { map = "6,30", path = "right", gather = true },
		            { map = "7,30", path = "top", gather = true },
		            { map = "7,29", path = "left", gather = true },
		            { map = "6,29", path = "top", gather = true },
		            { map = "6,28", path = "left", gather = true },
		            { map = "5,28", path = "left", gather = true },
		            { map = "4,28", path = "top", gather = true },
		            { map = "4,27", path = "top", gather = true },
		            { map = "4,26", path = "top", gather = true },
		            { map = "4,25", path = "top", gather = true },
		            { map = "4,24", path = "top", gather = true },
		            { map = "4,23", path = "top", gather = true },
		            { map = "4,22", path = "right", gather = true },
		            { map = "5,22", path = "right", gather = true },
		            { map = "6,22", path = "right", gather = true },
		            { map = "7,22", path = "top", gather = true },
		            { map = "7,21", path = "right", gather = true },
		            { map = "8,21", path = "right", gather = true },
		            { map = "9,21", path = "right", gather = true },
		            { map = "10,21", path = "right", gather = true },
		            { map = "11,21", path = "right", gather = true },
		            { map = "12,21", path = "right", gather = true },
		            { map = "13,21", path = "right", gather = true },
		            { map = "14,21", path = "top", gather = true },
		            { map = "14,20", path = "top", gather = true },
		            { map = "14,19", path = "left", gather = true },
		            { map = "13,19", path = "bottom", gather = true },
		            { map = "13,20", path = "left", gather = true },
		            { map = "12,20", path = "left", gather = true },
		            { map = "11,20", path = "left", gather = true },
		            { map = "10,20", path = "left", gather = true },
		            { map = "9,20", path = "left", gather = true },
		            { map = "8,20", path = "left", gather = true },
		            { map = "7,20", path = "top", gather = true },
		            { map = "7,19", path = "top", gather = true },
		            { map = "7,18", path = "top", gather = true },
		            { map = "7,17", path = "top", gather = true },
		            { map = "7,16", path = "top", gather = true },
		            { map = "7,15", path = "top", gather = true },
		            { map = "7,14", path = "right", gather = true },
		            { map = "8,14", path = "top", gather = true },
		            { map = "8,13", path = "top", gather = true },
		            { map = "8,12", path = "left", gather = true },
		            { map = "7,12", path = "bottom", gather = true },
		            { map = "7,13", path = "left", gather = true },
		            { map = "6,13", path = "top", gather = true },
		            { map = "6,12", path = "left", gather = true },
		            { map = "5,12", path = "left", gather = true },
		            { map = "4,12", path = "left", gather = true },
		            { map = "3,12", path = "bottom", gather = true },
		            { map = "3,13", path = "left", gather = true },
		            { map = "2,13", path = "left", gather = true },
		            { map = "1,13", path = "left", gather = true },
		            { map = "0,13", path = "bottom", gather = true },
		            { map = "0,14", path = "right", gather = true },
		            { map = "1,14", path = "bottom", gather = true },
		            { map = "1,15", path = "right", gather = true },
		            { map = "2,15", path = "bottom", gather = true },
		            { map = "2,16", path = "left", gather = true },
		            { map = "1,16", path = "bottom", gather = true },
		            { map = "1,17", path = "right", gather = true },
		            { map = "2,17", path = "right", gather = true },
		            { map = "3,17", path = "bottom", gather = true },
		            { map = "3,18", path = "bottom", gather = true },
		            { map = "3,19", path = "bottom", gather = true },
		            { map = "3,20", path = "left", gather = true },
		            { map = "2,20", path = "left", gather = true },
		            { map = "1,20", path = "bottom", gather = true },
		            { map = "1,21", path = "bottom", gather = true },
		            { map = "1,22", path = "bottom", gather = true },
		            { map = "1,23", path = "bottom", gather = true },
		            { map = "1,24", path = "left", gather = true, custom = bouclePlus }
                }
            end
        },
        [14] = {
            name = "Zone Menthe sauvage Tainela",
            tags = {
                "Menthe sauvage"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(120062979)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "1,-32", path = "right", gather = true },  -- Zaap Tainela  +  Reboucle
		            { map = "2,-32", path = "right", gather = true },
		            { map = "3,-32", path = "top", gather = true },
		            { map = "3,-33", path = "left", gather = true },
		            { map = "2,-33", path = "top", gather = true },
		            { map = "2,-34", path = "left", gather = true },
		            { map = "1,-34", path = "left", gather = true },
		            { map = "0,-34", path = "bottom", gather = true },
		            { map = "0,-33", path = "left", gather = true },
		            { map = "-1,-33", path = "bottom", gather = true},
		            { map = "-1,-32", path = "left", gather = true },
		            { map = "-2,-32", path = "bottom", gather = true },
		            { map = "-2,-31", path = "bottom", gather = true },
		            { map = "-2,-30", path = "right", gather = true },
		            { map = "-1,-30", path = "bottom", gather = true },
		            { map = "-1,-29", path = "right", gather = true },
		            { map = "0,-29", path = "right", gather = true },
		            { map = "1,-29", path = "top", gather = true },
		            { map = "1,-30", path = "top", gather = true },
		            { map = "1,-31", path = "top", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        },
        [15] = {
            name = "Zone Orchidee freyesque Village des eleveur",
            tags = {
                "Orchidee freyesque"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(73400320)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-16,1", path = "right", gather = true },  -- Zaap eleveur
		            { map = "-15,1", path = "bottom", gather = true },
		            { map = "-15,2", path = "right", gather = true },
		            { map = "-14,2", path = "bottom", gather = true },
		            { map = "-14,3", path = "left", gather = true },
		            { map = "-15,3", path = "left", gather = true },
		            { map = "-16,3", path = "top", gather = true },
		            { map = "-16,2", path = "left", gather = true },
		            { map = "-17,2", path = "left", gather = true },
		            { map = "-18,2", path = "bottom", gather = true },
		            { map = "-18,3", path = "bottom", gather = true }, --- Reboucle
		            { map = "-18,4", path = "left", gather = true },
		            { map = "-19,4", path = "left", gather = true },
		            { map = "-20,4", path = "left", gather = true },
		            { map = "-21,4", path = "left", gather = true },
		            { map = "-22,4", path = "top", gather = true },
		            { map = "-22,3", path = "top", gather = true },
		            { map = "-22,2", path = "left", gather = true },
		            { map = "-23,2", path = "top", gather = true },
		            { map = "-23,1", path = "right", gather = true },
		            { map = "-22,1", path = "top", gather = true },
		            { map = "-22,0", path = "right", gather = true },
		            { map = "-21,0", path = "bottom", gather = true },
		            { map = "-21,1", path = "bottom", gather = true },
		            { map = "-21,2", path = "bottom", gather = true },
		            { map = "-21,3", path = "right", gather = true },
		            { map = "-20,3", path = "top", gather = true },
		            { map = "-20,2", path = "top", gather = true },
		            { map = "-20,1", path = "top", gather = true },
		            { map = "-20,0", path = "top", gather = true },
		            { map = "-20,-1", path = "right", gather = true },
		            { map = "-19,-1", path = "bottom", gather = true },
		            { map = "-19,0", path = "bottom", gather = true },
		            { map = "-19,1", path = "bottom", gather = true },
		            { map = "-19,2", path = "bottom", gather = true },
		            { map = "-19,3", path = "right", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        },
        [16] = {
            name = "Zone Orchidee freyesque coin des Scarafeuille",
            tags = {
                "Orchidee freyesque"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-1,24", path = "left", gather = true },  -- Zaap Scara
		            { map = "-2,24", path = "left", gather = true }, -- Reboucle
		            { map = "-3,24", path = "left", gather = true },
		            { map = "-4,24", path = "left", gather = true },
		            { map = "-5,24", path = "left", gather = true },
		            { map = "-6,24", path = "bottom", gather = true },
		            { map = "-6,25", path = "bottom", gather = true },
		            { map = "-6,26", path = "right", gather = true },
		            { map = "-5,26", path = "bottom", gather = true },
		            { map = "-5,27", path = "left", gather = true },
		            { map = "-6,27", path = "bottom", gather = true },
		            { map = "-6,28", path = "right", gather = true },
		            { map = "-5,28", path = "right", gather = true },
		            { map = "-4,28", path = "right", gather = true },
		            { map = "-3,28", path = "right", gather = true },
		            { map = "-2,28", path = "top", gather = true },
		            { map = "-2,27", path = "top", gather = true },
		            { map = "-2,26", path = "right", gather = true},
		            { map = "-1,26", path = "top", gather = true },
		            { map = "-1,25", path = "left", gather = true },
		            { map = "-2,25", path = "top", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        },
        [17] = {
            name = "Zone Edelweiss Port de madrestam",
            tags = {
                "Edelweiss"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(68419587)
                end
            end,
            ["PATH"] = function()
                return MULTIPLE_MAP:Run({
		            { map = "68419587", path = "left", gather = true },
		            { map = "68551171", path = "bottom", gather = true },
		            { map = "68551172", path = "bottom", gather = true },
		            { map = "68551173", path = "right", gather = true },
		            { map = "68419589", path = "bottom", gather = true },
		            { map = "68419590", path = "right", gather = true },
		            { map = "68420102", path = "bottom", gather = true },
		            { map = "68420103", path = "right", gather = true },
		            { map = "68420615", path = "right", gather = true },
		            { map = "68421127", path = "right", gather = true },
		            { map = "68421639", path = "bottom", gather = true },
		            { map = "68421640", path = "bottom", gather = true },
		            { map = "68421641", path = "top", gather = true },
		            { map = "68421640", path = "top", gather = true },
		            { map = "68421639", path = "top", gather = true },
		            { map = "68421127", path = "left", gather = true },
		            { map = "68420615", path = "left", gather = true },
		            { map = "68420103", path = "left", gather = true },
		            { map = "68420102", path = "top", gather = true },
		            { map = "68419590", path = "left", gather = true },
		            { map = "68419589", path = "top", gather = true },
		            { map = "68551173", path = "right", gather = true },
		            { map = "68551172", path = "bottom", gather = true, custom = bouclePlus}
                })
            end
        },
        [19] = {
            name = "Zone Ginseng Otomai",
            tags = {
                "Ginseng"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(154642)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-46,18", path = "bottom", gather = true },  -- Zaap otomai
		            { map = "-46,19", path = "left", gather = true },
		            { map = "-47,19", path = "left", gather = true },
		            { map = "-48,19", path = "left", gather = true },
		            { map = "-49,19", path = "bottom", gather = true },
		            { map = "-49,20", path = "bottom", gather = true },
		            { map = "-49,21", path = "left", gather = true },
		            { map = "-50,21", path = "left", gather = true },
		            { map = "-51,21", path = "top", gather = true },
		            { map = "-51,20", path = "top", gather = true },  -- Reboucle
		            { map = "-51,19", path = "top", gather = true },
		            { map = "-51,18", path = "right", gather = true },
		            { map = "-50,18", path = "top", gather = true },
		            { map = "-50,17", path = "left", gather = true },
		            { map = "-51,17", path = "top", gather = true },
		            { map = "-51,16", path = "right", gather = true },
		            { map = "-50,16", path = "top", gather = true },
		            { map = "-50,15", path = "top", gather = true },
		            { map = "-50,14", path = "left", gather = true },
		            { map = "-51,14", path = "top", gather = true },
		            { map = "-51,13", path = "top", gather = true },
		            { map = "-51,12", path = "left", gather = true },
		            { map = "-52,12", path = "bottom", gather = true },
		            { map = "-52,13", path = "left", gather = true },
		            { map = "-53,13", path = "top", gather = true },
		            { map = "-53,12", path = "top", gather = true },
		            { map = "-53,11", path = "right", gather = true },
		            { map = "-52,11", path = "top", gather = true },
		            { map = "-52,10", path = "left", gather = true },
		            { map = "-53,10", path = "left", gather = true },
		            { map = "-54,10", path = "left", gather = true },
		            { map = "-55,10", path = "bottom", gather = true },
		            { map = "-55,11", path = "right", gather = true },
		            { map = "-54,11", path = "bottom", gather = true },
		            { map = "-54,12", path = "left", gather = true },
		            { map = "-55,12", path = "bottom", gather = true },
		            { map = "-55,13", path = "left", gather = true },
		            { map = "-56,13", path = "bottom", gather = true },
		            { map = "-56,14", path = "bottom", gather = true },
		            { map = "-56,15", path = "right", gather = true },
		            { map = "-55,15", path = "right", gather = true },
		            { map = "-54,15", path = "right", gather = true },
		            { map = "-53,15", path = "right", gather = true },
		            { map = "-52,15", path = "bottom", gather = true },
		            { map = "-52,16", path = "bottom", gather = true },
		            { map = "-52,17", path = "bottom", gather = true },
		            { map = "-52,18", path = "bottom", gather = true },
		            { map = "-52,19", path = "bottom", gather = true },
		            { map = "-52,20", path = "right", gather = true, custom = bouclePlus }  -- fin de boucle
                } 
            end
        },
        [20] = {
            name = "Zone Belladone Otomai",
            tags = {
                "Belladone"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(154642)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-46,18", path = "bottom", gather = true },  --zaap otomai
		            { map = "-46,19", path = "right", gather = true },  -- Reboucle
		            { map = "-45,19", path = "top", gather = true },
		            { map = "-45,18", path = "top", gather = true },
		            { map = "-45,17", path = "left", gather = true },
		            { map = "-46,17", path = "left", gather = true },
		            { map = "-47,17", path = "top", gather = true },
		            { map = "-47,16", path = "right", gather = true },
		            { map = "-46,16", path = "top", gather = true },
		            { map = "-46,15", path = "left", gather = true },
		            { map = "-47,15", path = "top", gather = true },
		            { map = "-47,14", path = "left", gather = true },
		            { map = "-48,14", path = "bottom", gather = true },
		            { map = "-48,15", path = "bottom", gather = true },
		            { map = "-48,16", path = "bottom", gather = true },
		            { map = "-48,17", path = "bottom", gather = true },
		            { map = "-48,18", path = "left", gather = true },
		            { map = "-49,18", path = "top", gather = true },
		            { map = "-49,17", path = "top", gather = true },
		            { map = "-49,16", path = "top", gather = true },
		            { map = "-49,15", path = "top", gather = true },
		            { map = "-49,14", path = "top", gather = true },
		            { map = "-49,13", path = "right", gather = true },
		            { map = "-48,13", path = "top", gather = true },
		            { map = "-48,12", path = "left", gather = true },
		            { map = "-49,12", path = "left", gather = true },
		            { map = "-50,12", path = "top", gather = true },
		            { map = "-50,11", path = "top", gather = true },
		            { map = "-50,10", path = "top", gather = true },
		            { map = "-50,9", path = "left", gather = true },
		            { map = "-51,9", path = "top", gather = true },
		            { map = "-51,8", path = "top", gather = true },
		            { map = "-51,7", path = "top", gather = true },
		            { map = "-51,6", path = "top", gather = true },
		            { map = "-51,5", path = "left", gather = true },
		            { map = "-52,5", path = "left", gather = true },
		            { map = "-53,5", path = "top", gather = true },
		            { map = "-53,4", path = "top", gather = true },
		            { map = "-53,3", path = "top", gather = true },
		            { map = "-53,2", path = "left", gather = true },
		            { map = "-54,2", path = "left", gather = true },
		            { map = "-55,2", path = "left", gather = true },
		            { map = "-56,2", path = "left", gather = true },
		            { map = "-57,2", path = "left", gather = true },
		            { map = "-58,2", path = "bottom", gather = true },
		            { map = "-58,3", path = "bottom", gather = true },
		            { map = "-58,4", path = "bottom", gather = true },
		            { map = "-58,5", path = "bottom", gather = true },
		            { map = "-58,6", path = "bottom", gather = true },
		            { map = "-58,7", path = "bottom", gather = true },
		            { map = "-58,8", path = "bottom", gather = true },
		            { map = "-58,9", path = "bottom", gather = true },
		            { map = "-58,10", path = "bottom", gather = true },
		            { map = "-58,11", path = "bottom", gather = true },
		            { map = "-58,12", path = "bottom", gather = true },
		            { map = "-58,13", path = "bottom", gather = true },
		            { map = "-58,14", path = "bottom", gather = true },
		            { map = "-58,15", path = "bottom", gather = true },
		            { map = "-58,16", path = "bottom", gather = true },
		            { map = "-58,17", path = "bottom", gather = true },
		            { map = "-58,18", path = "bottom", gather = true },
		            { map = "-58,19", path = "bottom", gather = true },
		            { map = "-58,20", path = "bottom", gather = true },
		            { map = "-58,21", path = "right", gather = true },
		            { map = "-57,21", path = "bottom", gather = true },
		            { map = "-57,22", path = "bottom", gather = true },
		            { map = "-57,23", path = "right", gather = true },
		            { map = "-56,23", path = "top", gather = true },
		            { map = "-56,22", path = "top", gather = true },
		            { map = "-56,21", path = "top", gather = true },
		            { map = "-56,20", path = "top", gather = true },
		            { map = "-56,19", path = "top", gather = true },
		            { map = "-56,18", path = "top", gather = true },
		            { map = "-56,17", path = "top", gather = true },
		            { map = "-56,16", path = "top", gather = true },
		            { map = "-56,15", path = "right", gather = true },
		            { map = "-55,15", path = "right", gather = true },
		            { map = "-54,15", path = "bottom", gather = true },
		            { map = "-54,16", path = "left", gather = true },
		            { map = "-55,16", path = "bottom", gather = true },
		            { map = "-55,17", path = "bottom", gather = true },
		            { map = "-55,18", path = "bottom", gather = true },
		            { map = "-55,19", path = "bottom", gather = true },
		            { map = "-55,20", path = "bottom", gather = true },
		            { map = "-55,21", path = "right", gather = true },
		            { map = "-54,21", path = "top", gather = true },
		            { map = "-54,20", path = "top", gather = true },
		            { map = "-54,19", path = "top", gather = true },
		            { map = "-54,18", path = "right", gather = true },
		            { map = "-53,18", path = "bottom", gather = true },
		            { map = "-53,19", path = "bottom", gather = true },
		            { map = "-53,20", path = "right", gather = true },
		            { map = "-52,20", path = "top", gather = true },
		            { map = "-52,19", path = "top", gather = true },
		            { map = "-52,18", path = "top", gather = true },
		            { map = "-52,17", path = "top", gather = true },
		            { map = "-52,16", path = "top", gather = true },
		            { map = "-52,15", path = "top", gather = true },
		            { map = "-52,14", path = "right", gather = true },
		            { map = "-51,14", path = "right", gather = true },
		            { map = "-50,14", path = "bottom", gather = true },
		            { map = "-50,15", path = "left", gather = true },
		            { map = "-51,15", path = "bottom", gather = true },
		            { map = "-51,16", path = "bottom", gather = true },
		            { map = "-51,17", path = "bottom", gather = true },
		            { map = "-51,18", path = "bottom", gather = true },
		            { map = "-51,19", path = "bottom", gather = true },
		            { map = "-51,20", path = "bottom", gather = true },
		            { map = "-51,21", path = "left", gather = true },
		            { map = "-52,21", path = "bottom", gather = true },
		            { map = "-52,22", path = "left", gather = true },
		            { map = "-53,22", path = "left", gather = true },
		            { map = "-54,22", path = "bottom", gather = true },
		            { map = "-54,23", path = "right", gather = true },
		            { map = "-53,23", path = "right", gather = true },
		            { map = "-52,23", path = "right", gather = true },
		            { map = "-51,23", path = "right", gather = true },
		            { map = "-50,23", path = "top", gather = true },
		            { map = "-50,22", path = "top", gather = true },
		            { map = "-50,21", path = "top", gather = true },
		            { map = "-50,20", path = "right", gather = true },
		            { map = "-49,20", path = "top", gather = true },
		            { map = "-49,19", path = "right", gather = true },
		            { map = "-48,19", path = "right", gather = true },
		            { map = "-47,19", path = "right", gather = true, custom = bouclePlus }  -- fin de boucle
                }
            end
        },
        [21] = {
            name = "Zone Mandragore coin des bouftout",
            tags = {
                "Mandragore"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "5,7", path = "right", gather = true }, -- Zaap Bouftou
		            { map = "6,7", path = "right", gather = true },
		            { map = "7,7", path = "right", gather = true },
		            { map = "8,7", path = "right", gather = true },
		            { map = "9,7", path = "right", gather = true },
		            { map = "10,7", path = "right", gather = true },
		            { map = "11,7", path = "right", gather = true },
		            { map = "12,7", path = "bottom", gather = true },
		            { map = "12,8", path = "bottom", gather = true },
		            { map = "12,9", path = "bottom", gather = true },
		            { map = "12,10", path = "bottom", gather = true },
		            { map = "12,11", path = "bottom", gather = true },
		            { map = "12,12", path = "right", gather = true },
		            { map = "13,12", path = "bottom", gather = true },
		            { map = "13,13", path = "bottom", gather = true },
		            { map = "13,14", path = "bottom", gather = true },
		            { map = "13,15", path = "bottom", gather = true },
		            { map = "13,16", path = "left", gather = true },
		            { map = "12,16", path = "left", gather = true },
		            { map = "11,16", path = "top", gather = true }, -- Reboucle
		            { map = "11,15", path = "left", gather = true },
		            { map = "10,15", path = "top", gather = true },
		            { map = "10,14", path = "left", gather = true },
		            { map = "9,14", path = "bottom", gather = true },
		            { map = "9,15", path = "bottom", gather = true },
		            { map = "9,16", path = "left", gather = true },
		            { map = "8,16", path = "bottom", gather = true },
		            { map = "8,17", path = "right", gather = true },
		            { map = "9,17", path = "right", gather = true },
		            { map = "10,17", path = "top", gather = true },
		            { map = "10,16", path = "right", gather = true, custom = bouclePlus }
                }
            end
        },
        [22] = { -- Bug
            name = "Zone Mandragore Brakmar",
            tags = {
                "BUG"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(144419)
                end
            end,
            ["PATH"] = function()
                return {
		            { map = "-26,35", path = "right", gather = true }, -- Zaap Brakmar
		            { map = "-25,35", path = "right", gather = true },
		            { map = "-24,35", path = "right", gather = true },
		            { map = "-23,35", path = "right", gather = true },
		            { map = "-22,35", path = "right", gather = true },
		            { map = "-21,35", path = "right", gather = true },
		            { map = "-20,35", path = "top", gather = true },
		            { map = "-20,34", path = "right", gather = true },
		            { map = "-19,34", path = "right", gather = true },
		            { map = "-18,34", path = "bottom", gather = true },
		            { map = "-18,35", path = "bottom", gather = true },
		            { map = "-18,36", path = "bottom", gather = true },
		            { map = "-18,37", path = "bottom", gather = true },
		            { map = "-18,38", path = "bottom", gather = true },
		            { map = "-18,39", path = "right", gather = true },
		            { map = "-17,39", path = "right", gather = true },
		            { map = "-16,39", path = "right", gather = true },
		            { map = "-15,39", path = "right", gather = true }, -- Reboucle
		            { map = "-14,39", path = "right", gather = true },
		            { map = "-13,39", path = "top", gather = true },
		            { map = "-13,38", path = "top", gather = true },
		            { map = "-13,37", path = "left", gather = true },
		            { map = "-14,37", path = "left", gather = true },
		            { map = "-15,37", path = "bottom", gather = true },
		            { map = "-15,38", path = "bottom", gather = true, custom = bouclePlus } -- fin de boucle
                }
            end
        }
    },
    ["mineur"] = {
	    [1] = { -- Mine Scara F
            name = "Mine Scara",
            tags = {
                "Fer"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
		    end,
		    ["PATH"] = function()
			    return {
				    { map = "88212481", path = "right", gather = true },
				    { map = "88211969", path = "bottom", gather = true },
				    { map = "88211970", path = "right", gather = true },
				    { map = "88080386", path = "bottom", gather = true },
				    { map = "88080387", path = "right", gather = true },
				    { map = "88080899", path = "bottom", gather = true },
				    { map = "88080900", path = "right", gather = true },
				    { map = "88081412", path = "bottom", gather = true },
				    { map = "88081413", path = "right", gather = true },
				    { map = "88081925", door = "164", gather = true },
				    { map = "97255937", path = "360", gather = true },
				    { map = "97256961", path = "276", gather = true },
				    { map = "97257985", path = "436", gather = true },
				    { map = "97256961", path = "351", gather = true },
				    { map = "97255937", path = "360", gather = true, custom = bouclePlus }
			    }
		    end			
	    },
        [2] = { -- Mine Herale f
            name = "Mine Herale",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Or"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88085249)
                end
            end,
            ["PATH"] = function()
                return {
				    { map = "88085249", path = "left", gather = true },
				    { map = "88084737", path = "left", gather = true },
				    { map = "88084225", path = "top", gather = true },
				    { map = "88084226", path = "top", gather = true },
				    { map = "88084227", path = "left", gather = true },
				    { map = "88083715", path = "left", gather = true },
				    { map = "88083203", path = "top", gather = true },
				    { map = "88083204", path = "left", gather = true },
				    { map = "88082692", door = "332", gather = true },
				    { map = "97260033", path = "405", gather = true },
				    { map = "97261057", path = "421", gather = true },
				    { map = "97259011", path = "276", gather = true },
				    { map = "97261057", path = "235", gather = true },
				    { map = "97255939", path = "446", gather = true },
                    { map = "97256963", path = "492", gather = true },
                    { map = "97257987", path = "212", gather = true },
				    { map = "97261057", path = "227", gather = true },
				    { map = "97260033", path = "183", gather = true },
				    { map = "97261059", path = "417", gather = true, custom = bouclePlus }
                }
            end
        },
        [3] = { -- Mine Astirite f
            name = "Mine Astirite",
            tags = {
                "Fer",
                "Manganese"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88213271", path = "top", gather = true },
                    { map = "88213272", path = "top", gather = true },
                    { map = "88213273", path = "top", gather = true },
                    { map = "88213274", path = "top", gather = true },
                    { map = "185862149", path = "top", gather = true },
                    { map = "185862148", door = "367", gather = true },
                    { map = "97255951", path = "203", gather = true },
                    { map = "97256975", path = "323", gather = true },
                    { map = "97257999", path = "268", gather = true },
                    { map = "97260047", path = "432", gather = true, custom = finDeBoucle }
                }
            end
        },
        [4] = { -- Mine Istairameur f
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus }
                }
            end
        },
        [5] = { -- Mine Astrub f
            name = "Mine Astrub",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Etain",
                "Silicate"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(191105026)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "191105026", path = "left", gather = true },
                    { map = "191104002", path = "left", gather = true },
                    { map = "191102978", path = "left", gather = true },
                    { map = "188744196", path = "left", gather = true },
                    { map = "188743684", path = "bottom", gather = true },
                    { map = "188743685", door = "400", gather = true },
                    { map = "188482052", door = "153", gather = true },
                    { map = "188483076", door = "362", gather = true },
                    { map = "188484100", door = "155", gather = true },
                    { map = "188483076", door = "476", gather = true, custom = bouclePlus }
                }
            end
        },
        [6] = { -- Mine de Cania f
            name = "Mine de Cania",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(156240386)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "156240386", path = "right", gather = true },
                    { map = "156240898", path = "right", gather = true },
                    { map = "156241410", door = "149", gather = true },
                    { map = "133431302", door = "179", gather = true },
                    { map = "133431300", door = "165", gather = true }, -- Reboucle
                    { map = "133431298", door = "432", gather = true },
                    { map = "133432322", door = "116", gather = true },
                    { map = "133432320", door = "134", gather = true },
                    { map = "133432578", door = "423", gather = true },
                    { map = "133432320", door = "351", gather = true },
                    { map = "133431296", door = "306", gather = true },
                    { map = "133432320", door = "416", gather = true },
                    { map = "133432322", door = "348", gather = true },
                    { map = "133433346", door = "338", gather = true },
                    { map = "133432322", door = "338", gather = true },
                    { map = "133431298", door = "491", gather = true, custom = bouclePlus }
                }
            end
        },
        [7] = { -- Mine Porco 1 f
            name = "Mine Porco 1",
            tags = {
                "Fer",
                "Cuivre",
                "Kobalte",
                "Etain"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "bottom", gather = true },
                    { map = "88080386", path = "bottom", gather = true },
                    { map = "88080387", path = "bottom", gather = true },
                    { map = "88080388", path = "bottom", gather = true },
                    { map = "88080389", path = "bottom", gather = true },
                    { map = "88080390", path = "bottom", gather = true },
                    { map = "88080391", path = "bottom", gather = true },
                    { map = "72619521", path = "bottom", gather = true },
                    { map = "72619522", door = "132", gather = true },
                    { map = "30672658", path = "362", gather = true },
                    { map = "30672655", path = "221", gather = true },
                    { map = "30672649", path = "408", gather = true },
                    { map = "30672655", path = "270", gather = true, custom = bouclePlus }
                }
            end
        },
        [8] = { -- Mine Porco 2 f
            name = "Mine Porco 2",
            tags = {
                "Fer",
                "Etain",
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "bottom", gather = true },
                    { map = "88080386", path = "bottom", gather = true },
                    { map = "88080387", path = "bottom", gather = true },
                    { map = "88080388", path = "bottom", gather = true },
                    { map = "88080389", path = "bottom", gather = true },
                    { map = "88080390", path = "bottom", gather = true },
                    { map = "88080391", path = "bottom", gather = true },
                    { map = "72619521", path = "bottom", gather = true },
                    { map = "72619522", path = "bottom", gather = true },
                    { map = "72619523", path = "left", gather = true },
                    { map = "72619011", path = "left", gather = true },
                    { map = "72618499", door = "71", gather = true },
                    { map = "30671116", path = "292", gather = true },
                    { map = "30671110", path = "479", gather = true },
                    { map = "30671107", path = "298", gather = true },
                    { map = "30670848", path = "344", gather = true },
                    { map = "30671107", path = "247", gather = true },
                    { map = "30671110", path = "188", gather = true, custom = bouclePlus }
                }
            end
        },
        [9] = { -- Mine Auderie f
            name = "Mine Auderie",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Kobalte"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88213271", path = "bottom", gather = true },
                    { map = "88213270", path = "bottom", gather = true },
                    { map = "88213269", path = "bottom", gather = true },
                    { map = "88213268", path = "bottom", gather = true },
                    { map = "88213267", door = "236", gather = true },
                    { map = "97255949", path = "376", gather = true },
                    { map = "97256973", path = "537", gather = true },
                    { map = "97260045", path = "254", gather = true },
                    { map = "97261069", path = "348", gather = true },
                    { map = "97260045", path = "291", gather = true },
                    { map = "97256973", path = "122", gather = true },
                    { map = "97257997", path = "235", gather = true },
                    { map = "97259021", path = "323", gather = true },
                    { map = "97257997", path = "451", gather = true },
                    { map = "97256973", path = "157", gather = true, custom = bouclePlus }
                }
            end
        },
        [10] = { -- Mine de la grotte hative f
            name = "Mine De la Grotte Hative",
            tags = {
                "Bronze",
                "Cuivre"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(144419)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "144419", path = "zaapi(144425)" },
                    { map = "144425", path = "bottom", gather = true },
                    { map = "172231693", path = "bottom", gather = true },
                    { map = "172231694", path = "bottom", gather = true },
                    { map = "172231695", path = "bottom", gather = true },
                    { map = "172231696", path = "right", gather = true },
                    { map = "172232208", door = "180", gather = true },
                    { map = "178784266", door = "114", gather = true },
                    { map = "178785290", door = "530", gather = true, custom = bouclePlus }
                }
            end
        }, 
        [11] = { -- Mine Ebbernard f
            name = "Mine Ebbernard",
            tags = {
                "Manganese",
                "Bronze",
                "Kobalte",
                "Cuivre"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(144419)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "144419", path = "zaapi(142880)" },
                    { map = "142880", path = "top", gather = true },
                    { map = "142879", door = "529", gather = true },
                    { map = "28312325", path = "bottom", gather = true },
                    { map = "28312324", path = "right", gather = true },
                    { map = "28312836", door = "432", gather = true },
                    { map = "29622534", path = "275", gather = true },
                    { map = "29622531", path = "180", gather = true },
                    { map = "29622272", path = "180", gather = true },
                    { map = "29622275", path = "450", gather = true },
                    { map = "29622275", path = "450", gather = true },
                    { map = "29622272", path = "450", gather = true, custom = bouclePlus }
                }
            end
        }, 
        [12] = { -- Mine secrete de bronze a brakmar f
            name = "Mine secrete de bronze",
            tags = {
                "Bronze"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(144419)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "144419", path = "zaapi(144928)" },
                    { map = "144928", path = "right", gather = true },
                    { map = "144416", path = "top", gather = true },
                    { map = "144415", door = "125", gather = true },
                    { map = "172232193", path = "top", gather = true },
                    { map = "172232192", path = "left", gather = true },
                    { map = "172231680", path = "left", gather = true },
                    { map = "172231168", path = "left", gather = true },
                    { map = "172230656", path = "top", gather = true },
                    { map = "173016076", path = "51", gather = true },
                    { map = "178785280", door = "447", gather = true },
                    { map = "178785284", gather = true, custom = finDeBoucle }
                }
            end
        }, 
        [13] = { -- Mine Hipouce f
            name = "Mine Hipouce",
            tags = {
                "Bronze",
                "Kobalte"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(171967506)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "171967506", path = "bottom", gather = true },
                    { map = "171967507", path = "bottom", gather = true },
                    { map = "171967508", path = "bottom", gather = true },
                    { map = "173017857", path = "bottom", gather = true },
                    { map = "173017600", path = "bottom", gather = true },
                    { map = "173017601", door = "449", gather = true },
                    { map = "173017602", door = "498", gather = true },
                    { map = "173017603", path = "bottom", gather = true },
                    { map = "173017604", path = "right", gather = true },
                    { map = "173018116", path = "bottom", gather = true },
                    { map = "173018117", path = "left", gather = true },
                    { map = "173017605", door = "493", gather = true },
                    { map = "173017606", door = "282", gather = true },
                    { map = "178782208", door = "316", gather = true },
                    { map = "178782210", door = "185", gather = true },
                    { map = "178782208", door = "138", gather = true },
                    { map = "178783232", door = "204", gather = true },
                    { map = "178784256", door = "505", gather = true },
                    { map = "178783232", door = "200", gather = true },
                    { map = "178783236", door = "138", gather = true },
                    { map = "178784260", door = "421", gather = true },
                    { map = "178783236", door = "309", gather = true },
                    { map = "178782214", door = "507", gather = true },
                    { map = "178782216", door = "422", gather = true },
                    { map = "178782218", door = "476", gather = true },
                    { map = "178782220", door = "57", gather = true },
                    { map = "178782218", door = "122", gather = true },
                    { map = "178782216", door = "122", gather = true },
                    { map = "178782214", door = "150", gather = true },
                    { map = "178783236", door = "555", gather = true },
                    { map = "178783232", path = "406", gather = true, custom = bouclePlus }
                }
            end
        }, 
        [14] = { -- Mine plaine rocheuse au dessus du zaap f
            name = "Mine Plaine rocheuse au dessus du zaap",
            tags = {
                "Or",
                "Bronze",
                "Manganese",
                "Kobalte"

            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(147590153)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "147590153", path = "top", gather = true },
                    { map = "147590152", path = "top", gather = true },
                    { map = "147590151", door = "113", gather = true },
                    { map = "164758273", gather = true, custom = finDeBoucle }
                }
            end
        }, 
        [15] = { -- Mine du chemin vers kartonpath f
            name = "Mine Du chemin vers KartonPath",
            tags = {
                "Kobalte",
                "Manganese",
                "Cuivre",
                "Or"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88085249)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "88085249", path = "right", gather = true },
                    { map = "88085761", path = "right", gather = true },
                    { map = "88086273", path = "right", gather = true },
                    { map = "88086785", path = "right", gather = true },
                    { map = "88087297", path = "top", gather = true },
                    { map = "88087298", path = "top", gather = true },
                    { map = "88087299", path = "top", gather = true },
                    { map = "88087300", path = "top", gather = true },
                    { map = "88087301", path = "top", gather = true },
                    { map = "88087302", path = "top", gather = true },
                    { map = "88087303", path = "top", gather = true },
                    { map = "88087304", path = "top", gather = true },
                    { map = "88087305", door = "403", gather = true },
                    { map = "117440512", door = "222", gather = true },
                    { map = "117441536", door = "167", gather = true },
                    { map = "117442560", door = "488", gather = true },
                    { map = "117443584", door = "221", gather = true },
                    { map = "117440514", door = "293", gather = true },
                    { map = "117441538", door = "251", gather = true },
                    { map = "117442562", door = "436", gather = true },
                    { map = "117441538", door = "434", gather = true },
                    { map = "117440514", door = "434", gather = true },
                    { map = "117443584", door = "281", gather = true },
                    { map = "117442560", door = "462", gather = true, custom = bouclePlus }
                }
            end
        }, 
        [16] = { -- Mine Estrone f
            name = "Mine Estrone",
            tags = {
                "Manganese",
                "Etain"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(171967506)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "171967506", path = "top", gather = true },
                    { map = "171967505", path = "top", gather = true },
                    { map = "171967504", path = "top", gather = true },
                    { map = "171967503", path = "top", gather = true },
                    { map = "171967502", path = "top", gather = true },
                    { map = "171967501", path = "top", gather = true },
                    { map = "171967500", path = "top", gather = true },
                    { map = "171967499", path = "left", gather = true },
                    { map = "171966987", door = "397", gather = true },
                    { map = "178785286", door = "99", gather = true },
                    { map = "178785288", gather = true, custom = finDeBoucle }
                }
            end
        }, 
        [17] = { -- Mine Manganese ile dragoeuf f
            name = "Mine Manganese ile dragoeuf",
            tags = {
                "Bug",
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
		    end,
            ["PATH"] = function()
                if map:currentMapId() == 84410368 then
                    map:moveToCell(361)
                    global:delay(2000)
                    map:moveToCell(342)
                end

                return {
                    { map = "88212481", path = "left" },
                    { map = "84412416", path = "left" },
                    { map = "84411904", path = "left" },
                    { map = "84411392", path = "left(308)" },
                    { map = "84410880", path = "left" },
                    { map = "84410368" },
                    { map = "86246410", path = "431" },
                    { map = "84410368", custom = finDeBoucle }
                }
            end
        }, 
        [18] = { -- Mine Haut hurlement f
            name = "Mine Haut hurlement",
            tags = {
                "Etain",
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(164364304)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "164364304", path = "bottom", gather = true },
                    { map = "164364305", path = "bottom", gather = true },
                    { map = "164364306", path = "bottom", gather = true },
                    { map = "164364307", path = "bottom", gather = true },
                    { map = "164364308", path = "bottom", gather = true },
                    { map = "164364309", path = "bottom", gather = true },
                    { map = "164364310", path = "bottom", gather = true },
                    { map = "164364311", path = "bottom", gather = true },
                    { map = "164364312", path = "bottom", gather = true },
                    { map = "171708416", path = "bottom", gather = true },
                    { map = "171708417", path = "left", gather = true },
                    { map = "171707905", path = "bottom", gather = true },
                    { map = "171707906", path = "bottom", gather = true },
                    { map = "171707907", path = "bottom", gather = true },
                    { map = "171707908", door = "166", gather = true },
                    { map = "178784264", gather = true, custom = finDeBoucle }
                }
            end
        },
        [19] = { -- Mine Bwork f
            name = "Mine Bwork",
            tags = {
                "Etain",
                "Bronze",
                "Or",
                "Bauxite"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "top", gather = true },
                    { map = "88212751", door = "369", gather = true },
                    { map = "104073218", path = "left", gather = true },
                    { map = "104072706", path = "left", gather = true },
                    { map = "104072194", path = "top", gather = true },
                    { map = "104072193", path = "top", gather = true },
                    { map = "104072192", path = "left", gather = true },
                    { map = "104071680", path = "left", gather = true },
                    { map = "104071168", door = "213", gather = true },
                    { map = "104860165", path = "444", gather = true },
                    { map = "104071168", path = "top", gather = true },
                    { map = "104071425", door = "199", gather = true },
                    { map = "104859139", path = "444", gather = true },
                    { map = "104071425", path = "right", gather = true },
                    { map = "104071937", path = "right", gather = true },
                    { map = "104072449", path = "top", gather = true },
                    { map = "104072450", path = "top", gather = true },
                    { map = "104072451", path = "top", gather = true },
                    { map = "104072452", door = "248", gather = true },
                    { map = "104858121", path = "348", gather = true },
                    { map = "104860169", path = "263", gather = true },
                    { map = "104861193", path = "248", gather = true },
                    { map = "104862217", path = "369", gather = true },
                    { map = "104861193", path = "254", gather = true },
                    { map = "104859145", path = "457", gather = true },
                    { map = "104858121", path = "507", gather = true },
                    { map = "104072452", path = "bottom", gather = true },
                    { map = "104072451", path = "bottom", gather = true },
                    { map = "104072450", path = "bottom", gather = true },
                    { map = "104072449", path = "bottom", gather = true },
                    { map = "104072192", path = "left", gather = true },
                    { map = "104071680", path = "left", gather = true, custom = bouclePlus }
                }
            end
        },
        [20] = { -- Mine du bois arak'hai f
            name = "Mine du bois arak'hai",
            tags = {
                "Argent",
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "bottom", gather = true },
                    { map = "84806144", path = "bottom", gather = true },
                    { map = "84806145", path = "bottom", gather = true },
                    { map = "84806146", path = "bottom", gather = true },
                    { map = "165156368", path = "bottom", gather = true },
                    { map = "147854083", path = "bottom", gather = true },
                    { map = "147854082", path = "left", gather = true },
                    { map = "147853570", path = "left", gather = true },
                    { map = "147853058", path = "left", gather = true },
                    { map = "147852546", path = "bottom", gather = true },
                    { map = "147852545", path = "bottom", gather = true },
                    { map = "147852288", path = "bottom", gather = true },
                    { map = "147852289", path = "bottom", gather = true },
                    { map = "147852290", door = "304", gather = true },
                    { map = "149949440", gather = true, custom = finDeBoucle }
                }
            end
        },
        [21] = { -- Mine Imale f
            name = "Mine Imale",
            tags = {
                "Argent",
                "Bauxite"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(171967506)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "171967506", path = "bottom", gather = true },
                    { map = "171967507", path = "bottom", gather = true },
                    { map = "171967508", path = "bottom", gather = true },
                    { map = "173017857", path = "bottom", gather = true },
                    { map = "173017600", path = "bottom", gather = true },
                    { map = "173017601", path = "right", gather = true },
                    { map = "173018113", path = "right", gather = true },
                    { map = "173018625", path = "right", gather = true },
                    { map = "173019137", path = "right", gather = true },
                    { map = "173019649", path = "bottom", gather = true },
                    { map = "173019650", path = "bottom", gather = true },
                    { map = "173019651", path = "bottom", gather = true },
                    { map = "173019652", path = "bottom", gather = true },
                    { map = "173019653", path = "right", gather = true },
                    { map = "173020165", path = "right", gather = true },
                    { map = "172490758", path = "right", gather = true },
                    { map = "172491270", path = "right", gather = true },
                    { map = "172491782", door = "373", gather = true },
                    { map = "178783240", door = "277", gather = true },
                    { map = "178783242", gather = true, custom = finDeBoucle }
                }
            end
        }
    },
    ["bucheron"] = {
        [1] = {
            name = "Zone frene #1",
            tags = {
                "Frene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "bottom", gather = true },
                    { map = "84806144", path = "right", gather = true },
                    { map = "84805632", path = "right", gather = true },
                    { map = "189661703", path = "bottom", gather = true }, -- Reboucle
                    { map = "189661704", path = "bottom", gather = true },
                    { map = "189661705", path = "bottom", gather = true },
                    { map = "189661706", path = "bottom", gather = true },
                    { map = "189661707", path = "bottom", gather = true },
                    { map = "189661708", path = "bottom", gather = true },
                    { map = "189661709", path = "bottom", gather = true },
                    { map = "189661710", path = "right", gather = true },
                    { map = "189530126", path = "right", gather = true },
                    { map = "189530638", path = "top", gather = true },
                    { map = "189530637", path = "left", gather = true },
                    { map = "189530125", path = "top", gather = true },
                    { map = "189530124", path = "right", gather = true },
                    { map = "189530636", path = "top", gather = true },
                    { map = "189530635", path = "left", gather = true },
                    { map = "189530123", path = "top", gather = true },
                    { map = "189530122", path = "right", gather = true },
                    { map = "189530634", path = "top", gather = true },
                    { map = "189530633", path = "left", gather = true },
                    { map = "189530121", path = "top", gather = true },
                    { map = "189530120", path = "right", gather = true },
                    { map = "189530632", path = "top", gather = true },
                    { map = "189530631", path = "left", gather = true },
                    { map = "189530119", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 189661703
                }
            end
        },
        [2] = {
            name = "Zone frene #2",
            tags = {
                "Frene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "right", gather = true },
                    { map = "84805889", path = "right", gather = true },
                    { map = "84805377", path = "right", gather = true },
                    { map = "189530118", path = "right", gather = true }, -- Reboucle
                    { map = "189530630", path = "right", gather = true },
                    { map = "189531142", path = "right", gather = true },
                    { map = "189531654", path = "right", gather = true },
                    { map = "189532166", path = "top", gather = true },
                    { map = "189532165", path = "left", gather = true },
                    { map = "189531653", path = "left", gather = true },
                    { map = "189531141", path = "left", gather = true },
                    { map = "189530629", path = "top", gather = true },
                    { map = "189530628", path = "right", gather = true },
                    { map = "189531140", path = "right", gather = true },
                    { map = "189531652", path = "right", gather = true },
                    { map = "189532164", path = "top", gather = true },
                    { map = "189532163", path = "left", gather = true },
                    { map = "189531651", path = "left", gather = true },
                    { map = "189531139", path = "left", gather = true },
                    { map = "189530627", path = "top", gather = true },
                    { map = "189530626", path = "right", gather = true },
                    { map = "189531138", path = "right", gather = true },
                    { map = "189531650", path = "right", gather = true },
                    { map = "189532162", path = "top", gather = true },
                    { map = "189532161", path = "left", gather = true },
                    { map = "189531649", path = "left", gather = true },
                    { map = "189531137", path = "left", gather = true },
                    { map = "189530625", path = "left", gather = true },
                    { map = "189530113", path = "bottom", gather = true },
                    { map = "189530114", path = "bottom", gather = true },
                    { map = "189530115", path = "bottom", gather = true },
                    { map = "189530116", path = "bottom", gather = true },
                    { map = "189530117", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 189530118
                }
            end
        },
        [3] = {
            name = "Zone Chataignier #1",
            tags = {
                "Chataignier"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "bottom", gather = true },
                    { map = "84806144", path = "right", gather = true },
                    { map = "84805632", path = "right", gather = true },
                    { map = "189661703", path = "bottom", gather = true }, -- Reboucle
                    { map = "189661704", path = "bottom", gather = true },
                    { map = "189661705", path = "bottom", gather = true },
                    { map = "189661706", path = "bottom", gather = true },
                    { map = "189661707", path = "bottom", gather = true },
                    { map = "189661708", path = "bottom", gather = true },
                    { map = "189661709", path = "bottom", gather = true },
                    { map = "189661710", path = "right", gather = true },
                    { map = "189530126", path = "right", gather = true },
                    { map = "189530638", path = "top", gather = true },
                    { map = "189530637", path = "left", gather = true },
                    { map = "189530125", path = "top", gather = true },
                    { map = "189530124", path = "right", gather = true },
                    { map = "189530636", path = "top", gather = true },
                    { map = "189530635", path = "left", gather = true },
                    { map = "189530123", path = "top", gather = true },
                    { map = "189530122", path = "right", gather = true },
                    { map = "189530634", path = "top", gather = true },
                    { map = "189530633", path = "left", gather = true },
                    { map = "189530121", path = "top", gather = true },
                    { map = "189530120", path = "right", gather = true },
                    { map = "189530632", path = "top", gather = true },
                    { map = "189530631", path = "left", gather = true },
                    { map = "189530119", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 189661703
                }
            end
        },
        [4] = {
            name = "Zone Chataignier #2",
            tags = {
                "Chataignier"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "right", gather = true },
                    { map = "84805889", path = "right", gather = true },
                    { map = "84805377", path = "right", gather = true },
                    { map = "189530118", path = "right", gather = true }, -- Reboucle
                    { map = "189530630", path = "right", gather = true },
                    { map = "189531142", path = "right", gather = true },
                    { map = "189531654", path = "right", gather = true },
                    { map = "189532166", path = "top", gather = true },
                    { map = "189532165", path = "left", gather = true },
                    { map = "189531653", path = "left", gather = true },
                    { map = "189531141", path = "left", gather = true },
                    { map = "189530629", path = "top", gather = true },
                    { map = "189530628", path = "right", gather = true },
                    { map = "189531140", path = "right", gather = true },
                    { map = "189531652", path = "right", gather = true },
                    { map = "189532164", path = "top", gather = true },
                    { map = "189532163", path = "left", gather = true },
                    { map = "189531651", path = "left", gather = true },
                    { map = "189531139", path = "left", gather = true },
                    { map = "189530627", path = "top", gather = true },
                    { map = "189530626", path = "right", gather = true },
                    { map = "189531138", path = "right", gather = true },
                    { map = "189531650", path = "right", gather = true },
                    { map = "189532162", path = "top", gather = true },
                    { map = "189532161", path = "left", gather = true },
                    { map = "189531649", path = "left", gather = true },
                    { map = "189531137", path = "left", gather = true },
                    { map = "189530625", path = "left", gather = true },
                    { map = "189530113", path = "bottom", gather = true },
                    { map = "189530114", path = "bottom", gather = true },
                    { map = "189530115", path = "bottom", gather = true },
                    { map = "189530116", path = "bottom", gather = true },
                    { map = "189530117", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 189530118
                }
            end
        },
        [5] = {
            name = "Zone Noyer #1",
            tags = {
                "Noyer"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "right", gather = true },
                    { map = "88080897", path = "right", gather = true },
                    { map = "88081409", path = "bottom", gather = true },
                    { map = "88081410", path = "bottom", gather = true },
                    { map = "88081411", path = "bottom", gather = true },
                    { map = "88081412", path = "bottom", gather = true },
                    { map = "88081413", path = "bottom", gather = true },
                    { map = "88081414", path = "bottom", gather = true }, -- Reboucle
                    { map = "88081415", path = "bottom", gather = true },
                    { map = "88081416", path = "bottom", gather = true },
                    { map = "88081417", path = "right", gather = true },
                    { map = "88081929", path = "top", gather = true },
                    { map = "88081928", path = "top", gather = true },
                    { map = "88081927", path = "right", gather = true },
                    { map = "88082439", path = "right", gather = true },
                    { map = "88082951", path = "right", gather = true },
                    { map = "88083463", path = "right", gather = true },
                    { map = "88083975", path = "right", gather = true },
                    { map = "88084487", path = "top", gather = true },
                    { map = "88084486", path = "left", gather = true },
                    { map = "88083974", path = "left", gather = true },
                    { map = "88083462", path = "left", gather = true },
                    { map = "88082950", path = "left", gather = true },
                    { map = "88082438", path = "left", gather = true },
                    { map = "88081926", path = "left", gather = true },
                    { map = "88084486", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 88081414
                }
            end
        },
        [6] = {
            name = "Zone Noyer #2",
            tags = {
                "Noyer"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88082704)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88082704", path = "bottom", gather = true },
                    { map = "88082703", path = "bottom", gather = true },
                    { map = "88082702", path = "bottom", gather = true },
                    { map = "88082701", path = "bottom", gather = true },
                    { map = "88082700", path = "bottom", gather = true },
                    { map = "88082699", path = "bottom", gather = true },
                    { map = "88082698", path = "bottom", gather = true },
                    { map = "88082697", path = "bottom", gather = true }, -- Reboucle
                    { map = "88082696", path = "bottom", gather = true },
                    { map = "88082695", path = "bottom", gather = true },
                    { map = "88082694", path = "bottom", gather = true },
                    { map = "88082693", path = "right", gather = true },
                    { map = "88083205", path = "top", gather = true },
                    { map = "88083206", path = "top", gather = true },
                    { map = "88083207", path = "top", gather = true },
                    { map = "88083208", path = "top", gather = true },
                    { map = "88083209", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 88082697
                }
            end
        },
        [7] = {
            name = "Zone Noyer #3",
            tags = {
                "Noyer"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88085249)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88085249", path = "right", gather = true },
                    { map = "88085761", path = "right", gather = true },
                    { map = "88086273", path = "right", gather = true },
                    { map = "88086785", path = "right", gather = true },
                    { map = "88087297", path = "top", gather = true },
                    { map = "88087298", path = "top", gather = true }, -- Reboucle
                    { map = "88087299", path = "top", gather = true },
                    { map = "88087300", path = "top", gather = true },
                    { map = "88087301", path = "top", gather = true },
                    { map = "88087302", path = "top", gather = true },
                    { map = "88087303", path = "top", gather = true },
                    { map = "88087304", path = "left", gather = true },
                    { map = "88086792", path = "bottom", gather = true },
                    { map = "88086791", path = "bottom", gather = true },
                    { map = "88086790", path = "bottom", gather = true },
                    { map = "88086789", path = "bottom", gather = true },
                    { map = "88086788", path = "bottom", gather = true },
                    { map = "88086787", path = "bottom", gather = true },
                    { map = "88086786", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 88087298

                }
            end
        },
        [8] = {
            name = "Zone Chene #1",
            tags = {
                "Chene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "right", gather = true },
                    { map = "88080897", path = "bottom", gather = true },
                    { map = "88080898", path = "bottom", gather = true },
                    { map = "88080899", path = "bottom", gather = true },
                    { map = "88080900", path = "bottom", gather = true },
                    { map = "88080901", path = "bottom", gather = true },
                    { map = "88080902", path = "bottom", gather = true },
                    { map = "88080903", path = "bottom", gather = true }, -- Reboucle
                    { map = "88080904", path = "right", gather = true },
                    { map = "88081416", path = "right", gather = true },
                    { map = "88081928", path = "right", gather = true },
                    { map = "88082440", path = "right", gather = true },
                    { map = "88082952", path = "right", gather = true },
                    { map = "88083464", path = "top", gather = true },
                    { map = "88083463", path = "left", gather = true },
                    { map = "88082951", path = "left", gather = true },
                    { map = "88082439", path = "left", gather = true },
                    { map = "88081927", path = "left", gather = true },
                    { map = "88081415", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 88080903
                }
            end
        },
        [9] = {
            name = "Zone Chene #2",
            tags = {
                "Chene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(147590153)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "147590153", path = "bottom", gather = true },
                    { map = "147590154", path = "bottom", gather = true },
                    { map = "147590155", path = "right", gather = true },
                    { map = "147590667", path = "right", gather = true },
                    { map = "155975694", path = "top", gather = true }, -- Reboucle
                    { map = "155975693", path = "top", gather = true },
                    { map = "155975692", path = "top", gather = true },
                    { map = "155975691", path = "top", gather = true },
                    { map = "155975690", path = "top", gather = true },
                    { map = "155975689", path = "top", gather = true },
                    { map = "155975688", path = "top", gather = true },
                    { map = "155975687", path = "top", gather = true },
                    { map = "155975686", path = "top", gather = true },
                    { map = "155975685", path = "top", gather = true },
                    { map = "155975684", path = "top", gather = true },
                    { map = "155975683", path = "top", gather = true },
                    { map = "155975682", path = "top", gather = true },
                    { map = "155975681", path = "top", gather = true },
                    { map = "155975680", path = "right", gather = true },
                    { map = "155976192", path = "right", gather = true },
                    { map = "155976704", path = "bottom", gather = true },
                    { map = "155976705", path = "left", gather = true },
                    { map = "155976193", path = "bottom", gather = true },
                    { map = "155976194", path = "right", gather = true },
                    { map = "155976706", path = "bottom", gather = true },
                    { map = "155976707", path = "left", gather = true },
                    { map = "155976195", path = "bottom", gather = true },
                    { map = "155976196", path = "bottom", gather = true },
                    { map = "155976197", path = "right", gather = true },
                    { map = "155976709", path = "bottom", gather = true },
                    { map = "155976710", path = "left", gather = true },
                    { map = "155976198", path = "bottom", gather = true },
                    { map = "155976199", path = "right", gather = true },
                    { map = "155976711", path = "bottom", gather = true },
                    { map = "155976712", path = "left", gather = true },
                    { map = "155976200", path = "bottom", gather = true },
                    { map = "155976201", path = "right", gather = true },
                    { map = "155976713", path = "bottom", gather = true },
                    { map = "155976714", path = "left", gather = true },
                    { map = "155976202", path = "bottom", gather = true },
                    { map = "155976203", path = "bottom", gather = true },
                    { map = "155976204", path = "bottom", gather = true },
                    { map = "155976205", path = "bottom", gather = true },
                    { map = "155976206", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 155975694
                }
            end
        },
        [10] = {
            name = "Zone Bombu #1",
            tags = {
                "Bombu"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(84806401)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "84806401", path = "left", gather = true },
                    { map = "84806913", path = "left", gather = true },
                    { map = "165155340", path = "top", gather = true }, -- Reboucle
                    { map = "165155339", path = "top", gather = true },
                    { map = "165155338", path = "top", gather = true },
                    { map = "165155337", path = "top", gather = true },
                    { map = "165155336", path = "top", gather = true },
                    { map = "165155335", path = "top", gather = true },
                    { map = "165155334", path = "top", gather = true },
                    { map = "165155333", path = "top", gather = true },
                    { map = "165155332", path = "top", gather = true },
                    { map = "165155331", path = "top", gather = true },
                    { map = "156238347", path = "left", gather = true },
                    { map = "156237835", path = "bottom", gather = true },
                    { map = "165154819", path = "bottom", gather = true },
                    { map = "165154820", path = "bottom", gather = true },
                    { map = "165154821", path = "bottom", gather = true },
                    { map = "165154822", path = "bottom", gather = true },
                    { map = "165154823", path = "bottom", gather = true },
                    { map = "165154824", path = "bottom", gather = true },
                    { map = "165154825", path = "bottom", gather = true },
                    { map = "165154826", path = "bottom", gather = true },
                    { map = "165154827", path = "bottom", gather = true },
                    { map = "165154828", path = "bottom", gather = true },
                    { map = "165154829", path = "bottom", gather = true },
                    { map = "165154830", path = "bottom", gather = true },
                    { map = "165154831", path = "bottom", gather = true },
                    { map = "165154832", path = "right", gather = true },
                    { map = "165155344", path = "top", gather = true },
                    { map = "165155343", path = "top", gather = true },
                    { map = "165155342", path = "top", gather = true },
                    { map = "165155341", path = "top", gather = true, custom = bouclePlus } -- Reboucle sur 165155340
                }
            end
        },
        [11] = {
            name = "Zone Bombu #2",
            tags = {
                "Bombu"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(165152263)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "165152263", path = "right", gather = true },
                    { map = "165152775", path = "top", gather = true },
                    { map = "165152774", path = "right", gather = true },
                    { map = "165153286", path = "top", gather = true },
                    { map = "165153285", path = "top", gather = true },
                    { map = "165153284", path = "top", gather = true },
                    { map = "165153283", path = "top", gather = true },
                    { map = "165153282", path = "right", gather = true }, -- Reboucle
                    { map = "165153794", path = "top", gather = true },
                    { map = "165153793", path = "right", gather = true },
                    { map = "165154305", path = "top", gather = true },
                    { map = "165154304", path = "top", gather = true },
                    { map = "165154561", path = "left", gather = true },
                    { map = "165154049", path = "left", gather = true },
                    { map = "165153537", path = "left", gather = true },
                    { map = "165153025", path = "left", gather = true },
                    { map = "165152513", path = "left", gather = true },
                    { map = "139464201", path = "left", gather = true },
                    { map = "139463689", path = "left", gather = true },
                    { map = "139463177", path = "bottom", gather = true },
                    { map = "165150720", path = "right", gather = true },
                    { map = "165151232", path = "right", gather = true },
                    { map = "165151744", path = "right", gather = true },
                    { map = "165152256", path = "right", gather = true },
                    { map = "165152768", path = "bottom", gather = true },
                    { map = "165152769", path = "bottom", gather = true },
                    { map = "165152770", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 165153282
                }
            end
        },
        [12] = {
            name = "Zone Erable #1",
            tags = {
                "Erable"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(147590153)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "147590153", path = "bottom", gather = true },
                    { map = "147590154", path = "bottom", gather = true },
                    { map = "147590155", path = "right", gather = true },
                    { map = "147590667", path = "right", gather = true },
                    { map = "155975694", path = "top", gather = true }, -- Reboucle
                    { map = "155975693", path = "top", gather = true },
                    { map = "155975692", path = "top", gather = true },
                    { map = "155975691", path = "top", gather = true },
                    { map = "155975690", path = "top", gather = true },
                    { map = "155975689", path = "top", gather = true },
                    { map = "155975688", path = "top", gather = true },
                    { map = "155975687", path = "top", gather = true },
                    { map = "155975686", path = "top", gather = true },
                    { map = "155975685", path = "top", gather = true },
                    { map = "155975684", path = "top", gather = true },
                    { map = "155975683", path = "top", gather = true },
                    { map = "155975682", path = "top", gather = true },
                    { map = "155975681", path = "top", gather = true },
                    { map = "155975680", path = "right", gather = true },
                    { map = "155976192", path = "right", gather = true },
                    { map = "155976704", path = "bottom", gather = true },
                    { map = "155976705", path = "left", gather = true },
                    { map = "155976193", path = "bottom", gather = true },
                    { map = "155976194", path = "right", gather = true },
                    { map = "155976706", path = "bottom", gather = true },
                    { map = "155976707", path = "left", gather = true },
                    { map = "155976195", path = "bottom", gather = true },
                    { map = "155976196", path = "bottom", gather = true },
                    { map = "155976197", path = "right", gather = true },
                    { map = "155976709", path = "bottom", gather = true },
                    { map = "155976710", path = "left", gather = true },
                    { map = "155976198", path = "bottom", gather = true },
                    { map = "155976199", path = "right", gather = true },
                    { map = "155976711", path = "bottom", gather = true },
                    { map = "155976712", path = "left", gather = true },
                    { map = "155976200", path = "bottom", gather = true },
                    { map = "155976201", path = "right", gather = true },
                    { map = "155976713", path = "bottom", gather = true },
                    { map = "155976714", path = "left", gather = true },
                    { map = "155976202", path = "bottom", gather = true },
                    { map = "155976203", path = "bottom", gather = true },
                    { map = "155976204", path = "bottom", gather = true },
                    { map = "155976205", path = "bottom", gather = true },
                    { map = "155976206", path = "left", gather = true, custom = bouclePlus } -- Reboucle sur 155975694
                }
            end
        },
        [13] = {
            name = "Zone Erable #2",
            tags = {
                "Erable"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(191105026)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "191105026", path = "right", gather = true },
                    { map = "191106050", path = "right", gather = true },
                    { map = "188746756", path = "bottom", gather = true },
                    { map = "188746757", path = "bottom", gather = true },
                    { map = "188746758", path = "bottom", gather = true }, -- Reboucle
                    { map = "188746759", path = "left", gather = true },
                    { map = "188746247", path = "left", gather = true },
                    { map = "188745735", path = "left", gather = true },
                    { map = "188745223", path = "left", gather = true },
                    { map = "188744711", path = "left", gather = true },
                    { map = "188744199", path = "left", gather = true },
                    { map = "188743687", path = "top", gather = true },
                    { map = "188743686", path = "top", gather = true },
                    { map = "188743685", path = "top", gather = true },
                    { map = "188743684", path = "top", gather = true },
                    { map = "188743683", path = "left", gather = true },
                    { map = "189531146", path = "left", gather = true },
                    { map = "189530634", path = "top", gather = true },
                    { map = "189530633", path = "top", gather = true },
                    { map = "189530632", path = "right", gather = true },
                    { map = "189531144", path = "right", gather = true },
                    { map = "188743681", path = "bottom", gather = true },
                    { map = "188743682", path = "right", gather = true },
                    { map = "188744194", path = "bottom", gather = true },
                    { map = "188744195", path = "bottom", gather = true },
                    { map = "188744196", path = "bottom", gather = true },
                    { map = "188744197", path = "bottom", gather = true },
                    { map = "188744198", path = "right", gather = true },
                    { map = "188744710", path = "right", gather = true },
                    { map = "188745222", path = "right", gather = true },
                    { map = "188745734", path = "right", gather = true },
                    { map = "188746246", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 188746758
                }
            end
        },
        [14] = {
            name = "Zone Oliviolet #1",
            tags = {
                "Oliviolet"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(171967506)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "171967506", path = "top", gather = true },
                    { map = "171967505", path = "top", gather = true },
                    { map = "171967504", path = "right", gather = true }, -- Reboucle
                    { map = "171968016", path = "top", gather = true },
                    { map = "171968015", path = "top", gather = true },
                    { map = "171968014", path = "top", gather = true },
                    { map = "171968013", path = "top", gather = true },
                    { map = "171968012", path = "left", gather = true },
                    { map = "171967500", path = "top", gather = true },
                    { map = "171967499", path = "top", gather = true },
                    { map = "171967498", path = "top", gather = true },
                    { map = "171967497", path = "right", gather = true },
                    { map = "171968009", path = "top", gather = true },
                    { map = "171968008", path = "left", gather = true },
                    { map = "171967496", path = "top", gather = true },
                    { map = "171967495", path = "top", gather = true },
                    { map = "171705867", path = "top", gather = true },
                    { map = "171705866", path = "top", gather = true },
                    { map = "171705865", path = "right", gather = true },
                    { map = "171706377", path = "top", gather = true },
                    { map = "171706376", path = "left", gather = true },
                    { map = "171705864", path = "left", gather = true },
                    { map = "171705352", path = "left", gather = true },
                    { map = "171704840", path = "bottom", gather = true },
                    { map = "171704841", path = "bottom", gather = true },
                    { map = "171704842", path = "left", gather = true },
                    { map = "171704330", path = "bottom", gather = true },
                    { map = "171704331", path = "right", gather = true },
                    { map = "171704843", path = "right", gather = true },
                    { map = "171705355", path = "bottom", gather = true },
                    { map = "171966983", path = "bottom", gather = true },
                    { map = "171966984", path = "bottom", gather = true },
                    { map = "171966985", path = "bottom", gather = true },
                    { map = "171966986", path = "bottom", gather = true },
                    { map = "171966987", path = "bottom", gather = true },
                    { map = "171966988", path = "bottom", gather = true },
                    { map = "171966989", path = "bottom", gather = true },
                    { map = "171966990", path = "bottom", gather = true },
                    { map = "171966991", path = "bottom", gather = true },
                    { map = "171966992", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 171967504
                }
            end
        },
        [15] = {
            name = "Zone Oliviolet #2",
            tags = {
                "Oliviolet"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(144419)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "144419", path = "zaapi(144425)" },
                    { map = "144425", path = "bottom", gather = true }, -- Reboucle
                    { map = "172231693", path = "right", gather = true },
                    { map = "172232205", path = "right", gather = true },
                    { map = "172232717", path = "bottom", gather = true },
                    { map = "172232718", path = "bottom", gather = true },
                    { map = "172232719", path = "left", gather = true },
                    { map = "172232207", path = "bottom", gather = true },
                    { map = "172232208", path = "left", gather = true },
                    { map = "172231696", path = "left", gather = true },
                    { map = "172231184", path = "bottom", gather = true },
                    { map = "172231185", path = "left", gather = true },
                    { map = "172230673", path = "left", gather = true },
                    { map = "172230161", path = "left", gather = true },
                    { map = "172229649", path = "top", gather = true },
                    { map = "172229648", path = "top", gather = true },
                    { map = "172229647", path = "top", gather = true },
                    { map = "172229646", path = "top", gather = true },
                    { map = "172229645", path = "right", gather = true },
                    { map = "172230157", path = "right", gather = true },
                    { map = "172230669", path = "top", gather = true },
                    { map = "172230668", path = "right", gather = true },
                    { map = "172231180", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 144425
                }
            end
        },
        [16] = {
            name = "Zone If #1",
            tags = {
                "If"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(147590153)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "147590153", path = "right", gather = true },
                    { map = "147590665", path = "right", gather = true },
                    { map = "155975692", path = "right", gather = true },
                    { map = "155976204", path = "right", gather = true }, -- Reboucle
                    { map = "155976716", path = "right", gather = true },
                    { map = "155977228", path = "top", gather = true },
                    { map = "155977227", path = "top", gather = true },
                    { map = "155977226", path = "top", gather = true },
                    { map = "155977225", path = "top", gather = true },
                    { map = "155977224", path = "top", gather = true },
                    { map = "155977223", path = "top", gather = true },
                    { map = "155977222", path = "top", gather = true },
                    { map = "155977221", path = "top", gather = true },
                    { map = "155977220", path = "top", gather = true },
                    { map = "155977219", path = "right", gather = true },
                    { map = "155977731", path = "top", gather = true },
                    { map = "155977730", path = "left", gather = true },
                    { map = "155977218", path = "top", gather = true },
                    { map = "155977217", path = "right", gather = true },
                    { map = "155977729", path = "top", gather = true },
                    { map = "155977728", path = "left", gather = true },
                    { map = "155977216", path = "left", gather = true },
                    { map = "155976704", path = "bottom", gather = true },
                    { map = "155976705", path = "bottom", gather = true },
                    { map = "155976706", path = "bottom", gather = true },
                    { map = "155976707", path = "left", gather = true },
                    { map = "155976195", path = "bottom", gather = true },
                    { map = "155976196", path = "bottom", gather = true },
                    { map = "155976197", path = "right", gather = true },
                    { map = "155976709", path = "bottom", gather = true },
                    { map = "155976710", path = "left", gather = true },
                    { map = "155976198", path = "bottom", gather = true },
                    { map = "155976199", path = "bottom", gather = true },
                    { map = "155976200", path = "bottom", gather = true },
                    { map = "155976201", path = "bottom", gather = true },
                    { map = "155976202", path = "bottom", gather = true },
                    { map = "155976203", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 155976204
                }
            end
        },
        [17] = {
            name = "Zone If #2",
            tags = {
                "If"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(156240386)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "156240386", path = "right", gather = true  },
                    { map = "156240898", path = "top", gather = true  },
                    { map = "156240897", path = "top", gather = true  },
                    { map = "156240896", path = "top", gather = true },
                    { map = "127928335", path = "top", gather = true },
                    { map = "127928334", path = "top", gather = true },
                    { map = "127928333", path = "top", gather = true },
                    { map = "127928332", path = "top", gather = true },
                    { map = "126093076", path = "top", gather = true }, -- Reboucle
                    { map = "126093077", path = "left", gather = true },
                    { map = "126092565", path = "left", gather = true },
                    { map = "126092053", path = "left", gather = true },
                    { map = "126091541", path = "top", gather = true },
                    { map = "126091542", path = "left", gather = true },
                    { map = "126223126", path = "left", gather = true },
                    { map = "126223638", path = "top", gather = true  },
                    { map = "126223639", path = "top", gather = true },
                    { map = "126223640", path = "right", gather = true },
                    { map = "126223128", path = "top", gather = true },
                    { map = "126223129", path = "left", gather = true },
                    { map = "126223641", path = "left", gather = true },
                    { map = "126224153", path = "bottom", gather = true },
                    { map = "126224152", path = "bottom", gather = true },
                    { map = "126224151", path = "bottom", gather = true },
                    { map = "126224150", path = "bottom", gather = true },
                    { map = "126224149", path = "bottom", gather = true },
                    { map = "126224148", path = "right", gather = true },
                    { map = "126223636", path = "right", gather = true },
                    { map = "126223124", path = "right", gather = true },
                    { map = "126091540", path = "right", gather = true },
                    { map = "126092052", path = "right", gather = true },
                    { map = "126092564", path = "right", gather = true, custom = bouclePlus } -- Reboucle sur 126093076
                }
            end
        },
        [18] = {
            name = "Zone Merisier #1",
            tags = {
                "Merisier"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(147590153)
                end
            end,
            ["PATH"] = function()
                return{
                    { map = "147590153", path = "bottom", gather = true },
                    { map = "147590154", path = "bottom", gather = true },
                    { map = "147590155", path = "bottom", gather = true },
                    { map = "139462657", path = "bottom", gather = true },
                    { map = "139462658", path = "bottom", gather = true },
                    { map = "139462659", path = "right", gather = true },
                    { map = "139463171", path = "right", gather = true },
                    { map = "139463683", path = "right", gather = true },
                    { map = "139464195", path = "right", gather = true },
                    { map = "132121093", path = "right", gather = true }, -- Reboucle
                    { map = "132121605", path = "right", gather = true },
                    { map = "132122117", path = "right", gather = true },
                    { map = "132122629", path = "top", gather = true },
                    { map = "132122628", path = "right", gather = true },
                    { map = "132123140", path = "top", gather = true },
                    { map = "132123139", path = "top", gather = true },
                    { map = "132123138", path = "top", gather = true },
                    { map = "132123137", path = "left", gather = true },
                    { map = "132122625", path = "bottom", gather = true },
                    { map = "132122626", path = "left", gather = true },
                    { map = "132122114", path = "top", gather = true },
                    { map = "132122113", path = "left", gather = true },
                    { map = "132121601", path = "top", gather = true },
                    { map = "155977228", path = "top", gather = true },
                    { map = "155977227", path = "top", gather = true },
                    { map = "155977226", path = "top", gather = true },
                    { map = "155977225", path = "top", gather = true },
                    { map = "155977224", path = "top", gather = true },
                    { map = "155977223", path = "top", gather = true },
                    { map = "155977222", path = "top", gather = true },
                    { map = "155977221", path = "top", gather = true  },
                    { map = "155977220", path = "top", gather = true },
                    { map = "155977219", path = "right", gather = true },
                    { map = "155977731", path = "top", gather = true },
                    { map = "155977730", path = "left", gather = true },
                    { map = "155977218", path = "top", gather = true },
                    { map = "155977217", path = "left", gather = true },
                    { map = "155976705", path = "bottom", gather = true },
                    { map = "155976706", path = "bottom", gather = true },
                    { map = "155976707", path = "bottom", gather = true },
                    { map = "155976708", path = "bottom", gather = true },
                    { map = "155976709", path = "bottom", gather = true },
                    { map = "155976710", path = "bottom", gather = true },
                    { map = "155976711", path = "bottom", gather = true },
                    { map = "155976712", path = "bottom", gather = true },
                    { map = "155976713", path = "bottom", gather = true },
                    { map = "155976714", path = "bottom", gather = true },
                    { map = "155976715", path = "bottom", gather = true },
                    { map = "155976716", path = "bottom", gather = true },
                    { map = "132121089", path = "bottom", gather = true },
                    { map = "132121090", path = "bottom", gather = true },
                    { map = "132121091", path = "bottom", gather = true },
                    { map = "132121092", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 132121093
                }
            end
        },
        [19] = {
            name = "Zone Ebene #1",
            tags = {
                "Ebene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return{
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "bottom", gather = true },
                    { map = "88080386", path = "bottom", gather = true },
                    { map = "88080387", path = "bottom", gather = true },
                    { map = "88080388", path = "bottom", gather = true  },
                    { map = "88080389", path = "bottom", gather = true },
                    { map = "88080390", path = "bottom", gather = true },
                    { map = "88080391", path = "bottom", gather = true },
                    { map = "72619521", path = "bottom", gather = true },
                    { map = "72619522", path = "left", gather = true },
                    { map = "72619010", path = "bottom", gather = true }, -- Reboucle
                    { map = "72619011", path = "bottom", gather = true },
                    { map = "72619012", path = "left", gather = true },
                    { map = "72618500", path = "top", gather = true },
                    { map = "72618499", path = "top", gather = true },
                    { map = "72618498", path = "right", gather = true, custom = bouclePlus }

                }
            end
        },
        [20] = {
            name = "Zone Noisetier #1",
            tags = {
                "Noisetier"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(156240386)
                end
            end,
            ["PATH"] = function()
                return{
                    { map = "156240386", path = "left", gather = true },
                    { map = "156239874", path = "left", gather = true },
                    { map = "156239362", path = "left", gather = true },
                    { map = "156238850", path = "left", gather = true },
                    { map = "156238338", path = "left", gather = true },
                    { map = "156237826", path = "left", gather = true },
                    { map = "132123141", path = "left", gather = true }, -- Reboucle
                    { map = "132122629", path = "left", gather = true },
                    { map = "132122117", path = "left", gather = true },
                    { map = "132121605", path = "left", gather = true },
                    { map = "132121093", path = "top", gather = true },
                    { map = "132121092", path = "top", gather = true },
                    { map = "132121091", path = "top", gather = true },
                    { map = "132121090", path = "top", gather = true },
                    { map = "132121089", path = "right", gather = true },
                    { map = "132121601", path = "bottom", gather = true },
                    { map = "132121602", path = "right", gather = true },
                    { map = "132122114", path = "top", gather = true },
                    { map = "132122113", path = "right", gather = true },
                    { map = "132122625", path = "right", gather = true },
                    { map = "132123137", path = "bottom", gather = true },
                    { map = "132123138", path = "bottom", gather = true },
                    { map = "132123139", path = "bottom", gather = true },
                    { map = "132123140", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 132123141
                }
            end
        }
    }
}

local PATH_REPLACE = {
    ["mineur"] = {
        -- lvl 20 a 40
        [1] = { -- Mine Istairameur
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "296", gather = true },
                    { map = "97255945", path = "416", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus }
                }
            end
        },
        [2] = { -- Mine Astirite
            name = "Mine Astirite",
            tags = {
                "Fer",
                "Manganese",
                "Kobalte",
                "Cuivre"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88213271", path = "top", gather = true },
                    { map = "88213272", path = "top", gather = true },
                    { map = "88213273", path = "top", gather = true },
                    { map = "88213274", path = "top", gather = true },
                    { map = "185862149", path = "top", gather = true },
                    { map = "185862148", door = "367", gather = true },
                    { map = "97255951", path = "203", gather = true },
                    { map = "97256975", path = "323", gather = true },
                    { map = "97257999", path = "268", gather = true },
                    { map = "97260047", path = "432", gather = true },
                    { map = "97257999", path = "403", gather = true, custom = bouclePlus }
                }
            end
        },
        -- lvl 40 a 60
        [3] = { -- Mine Istairameur
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "290", gather = true },
                    { map = "97259015", path = "451", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "303", gather = true },
                    { map = "97257991", path = "464", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "296", gather = true },
                    { map = "97255945", path = "416", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus }
                }
            end
        },
        [4] = { -- Mine de Cania
            name = "Mine de Cania",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(156240386)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "156240386", path = "right", gather = true },
                    { map = "156240898", path = "right", gather = true },
                    { map = "156241410", door = "149", gather = true },
                    { map = "133431302", door = "179", gather = true },
                    { map = "133431300", door = "165", gather = true }, -- Reboucle
                    { map = "133431298", door = "432", gather = true },
                    { map = "133432322", door = "116", gather = true },
                    { map = "133432320", door = "134", gather = true },
                    { map = "133432578", door = "423", gather = true },
                    { map = "133432320", door = "351", gather = true },
                    { map = "133431296", door = "306", gather = true },
                    { map = "133432320", door = "416", gather = true },
                    { map = "133432322", door = "348", gather = true },
                    { map = "133433346", door = "177", gather = true },
                    { map = "133433344", door = "515", gather = true },
                    { map = "133433346", door = "338", gather = true },
                    { map = "133432322", door = "338", gather = true },
                    { map = "133431298", door = "491", gather = true, custom = bouclePlus }
                }
            end
        },
        -- lvl 60 a 80
        [5] = { -- Mine Astirite
            name = "Mine Astirite",
            tags = {
                "Fer",
                "Manganese",
                "Kobalte"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88213271", path = "top", gather = true },
                    { map = "88213272", path = "top", gather = true },
                    { map = "88213273", path = "top", gather = true },
                    { map = "88213274", path = "top", gather = true },
                    { map = "185862149", path = "top", gather = true },
                    { map = "185862148", door = "367", gather = true },
                    { map = "97255951", path = "203", gather = true },
                    { map = "97256975", path = "323", gather = true },
                    { map = "97257999", path = "268", gather = true },
                    { map = "97260047", path = "379", gather = true },
                    { map = "97261071", path = "248", gather = true },
                    { map = "97260047", path = "432", gather = true },
                    { map = "97257999", path = "403", gather = true, custom = bouclePlus }
                }
            end
        },
        [6] = { -- Mine Istairameur
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "290", gather = true },
                    { map = "97259015", path = "451", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "303", gather = true },
                    { map = "97257991", path = "464", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "234", gather = true },
                    { map = "97261067", path = "521", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "296", gather = true },
                    { map = "97255945", path = "416", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus }
                }
            end
        },
        [7] = { -- Mine Hipouce
            name = "Mine Hipouce",
            tags = {
                "Bronze",
                "Kobalte"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(171967506)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "171967506", path = "bottom", gather = true },
                    { map = "171967507", path = "bottom", gather = true },
                    { map = "171967508", path = "bottom", gather = true },
                    { map = "173017857", path = "bottom", gather = true },
                    { map = "173017600", path = "bottom", gather = true },
                    { map = "173017601", door = "449", gather = true },
                    { map = "173017602", door = "498", gather = true },
                    { map = "173017603", path = "bottom", gather = true },
                    { map = "173017604", path = "right", gather = true },
                    { map = "173018116", path = "bottom", gather = true },
                    { map = "173018117", path = "left", gather = true },
                    { map = "173017605", door = "493", gather = true },
                    { map = "173017606", door = "282", gather = true },
                    { map = "178782208", door = "316", gather = true },
                    { map = "178782210", door = "207", gather = true },
                    { map = "178783234", door = "203", gather = true },
                    { map = "178783232", door = "204", gather = true },
                    { map = "178784256", door = "505", gather = true },
                    { map = "178783232", door = "200", gather = true },
                    { map = "178783236", door = "138", gather = true },
                    { map = "178784260", door = "421", gather = true },
                    { map = "178783236", door = "309", gather = true },
                    { map = "178782214", door = "507", gather = true },
                    { map = "178782216", door = "422", gather = true },
                    { map = "178782218", door = "476", gather = true },
                    { map = "178782220", door = "57", gather = true },
                    { map = "178782218", door = "122", gather = true },
                    { map = "178782216", door = "122", gather = true },
                    { map = "178782214", door = "150", gather = true },
                    { map = "178783236", door = "555", gather = true },
                    { map = "178783232", door = "406", gather = true, custom = bouclePlus }
                }
            end
        },
        -- lvl 80 a 120
        [8] = { -- Mine Astirite
            name = "Mine Astirite",
            tags = {
                "Fer",
                "Manganese",
                "Kobalte"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88213271)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88213271", path = "top", gather = true },
                    { map = "88213272", path = "top", gather = true },
                    { map = "88213273", path = "top", gather = true },
                    { map = "88213274", path = "top", gather = true },
                    { map = "185862149", path = "top", gather = true },
                    { map = "185862148", door = "367", gather = true },
                    { map = "97255951", path = "203", gather = true },
                    { map = "97256975", path = "323", gather = true },
                    { map = "97257999", path = "268", gather = true },
                    { map = "97260047", path = "379", gather = true },
                    { map = "97261071", path = "248", gather = true },
                    { map = "97260047", path = "432", gather = true },
                    { map = "97257999", path = "247", gather = true },
                    { map = "97259023", path = "451", gather = true },
                    { map = "97257999", gather = true, custom = finDeBoucle }
                }
            end
        },
        [9] = { -- Mine Istairameur
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "290", gather = true },
                    { map = "97259015", path = "451", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "303", gather = true },
                    { map = "97257991", path = "464", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "234", gather = true },
                    { map = "97261067", path = "521", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "296", gather = true },
                    { map = "97255945", path = "332", gather = true },
                    { map = "97260041", path = "354", gather = true },
                    { map = "97255945", path = "416", gather = true },
                    { map = "97261063", path = "331", gather = true },
                    { map = "97259017", path = "436", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus },
                }
            end
        },
        [10] = { -- Mine Herale
            name = "Mine Herale",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Or"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88085249)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88085249", path = "left", gather = true },
                    { map = "88084737", path = "left", gather = true },
                    { map = "88084225", path = "top", gather = true },
                    { map = "88084226", path = "top", gather = true },
                    { map = "88084227", path = "left", gather = true },
                    { map = "88083715", path = "left", gather = true },
                    { map = "88083203", path = "top", gather = true },
                    { map = "88083204", path = "left", gather = true },
                    { map = "88082692", door = "332", gather = true },
                    { map = "97260033", path = "183", gather = true },
                    { map = "97261059", path = "417", gather = true },
                    { map = "97260033", path = "405", gather = true },
                    { map = "97261057", path = "235", gather = true },
                    { map = "97255939", path = "446", gather = true },
                    { map = "97256963", path = "492", gather = true },
                    { map = "97257987", path = "492", gather = true },
                    { map = "97260035", path = "288", gather = true },
                    { map = "97257987", path = "212", gather = true },
                    { map = "97261057", path = "421", gather = true },
                    { map = "97259011", path = "276", gather = true },
                    { map = "97261057", path = "227", gather = true, custom = bouclePlus },
                }
            end
        },
        -- lvl 120 a 160
        [11] = { -- Mine Istairameur
            name = "Mine Istairameur",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Kobalte",
                "Argent"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "left", gather = true },
                    { map = "88213262", path = "left", gather = true },
                    { map = "88213774", door = "353", gather = true },
                    { map = "97259013", path = "258", gather = true },
                    { map = "97260037", path = "352", gather = true },
                    { map = "97261061", path = "284", gather = true },
                    { map = "97255943", path = "403", gather = true },
                    { map = "97261061", path = "290", gather = true },
                    { map = "97259015", path = "451", gather = true },
                    { map = "97261061", path = "458", gather = true },
                    { map = "97260037", path = "303", gather = true },
                    { map = "97257991", path = "464", gather = true },
                    { map = "97260037", path = "430", gather = true },
                    { map = "97259013", path = "276", gather = true },
                    { map = "97256967", path = "194", gather = true },
                    { map = "97260039", path = "262", gather = true },
                    { map = "97257993", path = "122", gather = true },
                    { map = "97261065", path = "236", gather = true },
                    { map = "97259019", path = "276", gather = true },
                    { map = "97260043", path = "451", gather = true },
                    { map = "97259019", path = "438", gather = true },
                    { map = "97261065", path = "213", gather = true },
                    { map = "97255947", path = "199", gather = true },
                    { map = "97256971", path = "239", gather = true },
                    { map = "97257995", path = "374", gather = true },
                    { map = "97256971", path = "234", gather = true },
                    { map = "97261067", path = "521", gather = true },
                    { map = "97256971", path = "503", gather = true },
                    { map = "97255947", path = "500", gather = true },
                    { map = "97261065", path = "479", gather = true },
                    { map = "97257993", path = "537", gather = true },
                    { map = "97260039", path = "241", gather = true },
                    { map = "97261063", path = "296", gather = true },
                    { map = "97255945", path = "213", gather = true },
                    { map = "97256969", path = "401", gather = true },
                    { map = "97255945", path = "332", gather = true },
                    { map = "97260041", path = "354", gather = true },
                    { map = "97255945", path = "416", gather = true },
                    { map = "97261063", path = "331", gather = true },
                    { map = "97259017", path = "436", gather = true },
                    { map = "97261063", path = "459", gather = true },
                    { map = "97260039", path = "451", gather = true },
                    { map = "97256967", path = "518", gather = true, custom = bouclePlus },
                }
            end
        },
        -- lvl 160 a 200
        [12] = { -- Mine Herale
            name = "Mine Herale",
            tags = {
                "Fer",
                "Cuivre",
                "Bronze",
                "Manganese",
                "Or"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88085249)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88085249", path = "left", gather = true },
                    { map = "88084737", path = "left", gather = true },
                    { map = "88084225", path = "top", gather = true },
                    { map = "88084226", path = "top", gather = true },
                    { map = "88084227", path = "left", gather = true },
                    { map = "88083715", path = "left", gather = true },
                    { map = "88083203", path = "top", gather = true },
                    { map = "88083204", path = "left", gather = true },
                    { map = "88082692", door = "332", gather = true },
                    { map = "97260033", path = "183", gather = true },
                    { map = "97261059", path = "417", gather = true },
                    { map = "97260033", path = "405", gather = true },
                    { map = "97261057", path = "235", gather = true },
                    { map = "97255939", path = "446", gather = true },
                    { map = "97256963", path = "492", gather = true },
                    { map = "97257987", path = "492", gather = true },
                    { map = "97260035", path = "288", gather = true },
                    { map = "97257987", path = "212", gather = true },
                    { map = "97261057", path = "421", gather = true },
                    { map = "97259011", path = "276", gather = true },
                    { map = "97261057", path = "227", gather = true, custom = bouclePlus },
                }
            end
        },

        -- Ajout Mines par condition
        [13] = { -- Pandala
            name = "Mine Pandala",
            tags = {
                "Silicate",
                "Dolomite"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(207619076)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "207619076", path = "436" },
                    { map = "206307842", path = "right" },
                    { map = "206308354", path = "right" },
                    { map = "206308866", path = "bottom" },
                    { map = "206308867", path = "right" },
                    { map = "206309379", path = "bottom" },
                    { map = "206309380", path = "right" },
                    { map = "205260033", path = "right", gather = true },
                    { map = "205260545", path = "right", gather = true },
                    { map = "205261057", path = "right", gather = true },
                    { map = "205261569", path = "top", gather = true },
                    { map = "205261570", path = "bottom", gather = true },
                    { map = "205261569", path = "bottom", gather = true },
                    { map = "205261312", path = "left", gather = true },
                    { map = "205260800", path = "left", gather = true },
                    { map = "205260288", path = "left", gather = true },
                    { map = "205259776", path = "left", gather = true },
                    { map = "205259264", path = "left", gather = true },
                    { map = "205258752", path = "bottom", gather = true },
                    { map = "205258753", path = "right", gather = true },
                    { map = "205259265", path = "right", gather = true },
                    { map = "205259777", path = "right", gather = true },
                    { map = "205260289", path = "right", gather = true },
                    { map = "205260801", path = "bottom", gather = true },
                    { map = "205260802", path = "left", gather = true },
                    { map = "205260290", path = "left", gather = true },
                    { map = "205259778", path = "left", gather = true },
                    { map = "205259266", path = "right", gather = true },
                    { map = "205259778", path = "bottom", gather = true },
                    { map = "205259779", path = "bottom", gather = true },
                    { map = "205259780", path = "right" , gather = true },
                    { map = "205260292", door = "303" , gather = true },
                    { map = "207619084", door = "220", gather = true },
                    { map = "207620108", gather = true , custom = finDeBoucle }
                }
            end
        },
        [14] = { -- Mine Himum Saharach
            name = "Mine Himum",
            tags = {
                "Argent",
                "Bauxite",
                "Or"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(173278210)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "173278210", path = "top", gather = true },
                    { map = "173278209", path = "top", gather = true },
                    { map = "173278208", path = "right", gather = true },
                    { map = "173278720", door = "133", gather = true },
                    { map = "173935364", door = "297", gather = true },
                    { map = "173936388", door = "450", gather = true },
                    { map = "173937412", door = "382", gather = true },
                    { map = "173938436", door = "367", gather = true },
                    { map = "173939460", door = "418", gather = true },
                    { map = "173938436", door = "276", gather = true },
                    { map = "173937412", door = "264", gather = true },
                    { map = "173936388", door = "417", gather = true, custom = bouclePlus }
                }
            end
        },
        [15] = { -- Mine Sakai
            name = "Mine Sakai",
            tags = {
                "Etain",
                "Obsidienne",
                "Or",
                "Bauxite"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    idTransporteur = "sakai"
                    setTP()
                    map:path("zaap(110,190,54172969)") -- Frigost
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "54172969", path = "right" },
                    { map = "54172457", path = "right" },
                    { map = "54171945", path = "right" },
                    { map = "54171433", path = "right" },
                    { map = "54170921", path = "right" },
                    { map = "54170409", path = "bottom" },
                    { map = "54170408", path = "bottom" },
                    { map = "54170407", path = "bottom" },
                    { map = "54170406", path = "bottom" },
                    { map = "54170405", path = "bottom" },
                    { map = "54170404", path = "bottom" },
                    { map = "54170403", path = "bottom" },
                    { map = "54170402", path = "right" },
                    { map = "54169890", path = "right" },
                    { map = "54169378", path = "right" },
                    { map = "54168866", path = "right" },
                    { map = "54168354", path = "right" },
                    { map = "54167842", custom = transporteurFrigostien },
                    { map = "54161193", path = "right" },
                    { map = "54160681", path = "right" },
                    { map = "54160169", path = "top" },
                    { map = "54160170", path = "top" },
                    { map = "54160171", path = "top" },
                    { map = "54160172", path = "right" },
                    { map = "54159660", path = "right" },
                    { map = "54159148", path = "173" },
                    { map = "57017863", path = "429" },        
                    { map = "54159148", path = "top" },
                    { map = "54159149", path = "right" },
                    { map = "54158637", path = "377" }, 
                    { map = "57016839", path = "298" }, 
                    { map = "56886791", path = "442" }, 
                    { map = "57016839", path = "262" }, 
                    { map = "56885767", path = "410" }, 
                    { map = "57016839", custom = finDeBoucle }
                }
            end
        },
        [16] = { -- Mine Maksage
            name = "Mine Maksage",
            tags = {
                "Obsidienne",
                "Or",
                "Bauxite"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    idTransporteur = "maksage"
                    setTP()
                    map:path("zaap(110,190,54172969)") -- Frigost
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "54172969", path = "right" },
                    { map = "54172457", path = "right" },
                    { map = "54171945", path = "right" },
                    { map = "54171433", path = "right" },
                    { map = "54170921", path = "right" },
                    { map = "54170409", path = "bottom" },
                    { map = "54170408", path = "bottom" },
                    { map = "54170407", path = "bottom" },
                    { map = "54170406", path = "bottom" },
                    { map = "54170405", path = "bottom" },
                    { map = "54170404", path = "bottom" },
                    { map = "54170403", path = "bottom" },
                    { map = "54170402", path = "right" },
                    { map = "54169890", path = "right" },
                    { map = "54169378", path = "right" },
                    { map = "54168866", path = "right" },
                    { map = "54168354", path = "right" },
                    { map = "54167842", custom = transporteurFrigostien },
                    { map = "54161738", path = "bottom" },
                    { map = "54161737", path = "left" },
                    { map = "54162249", path = "left" },
                    { map = "54162761", path = "left" },
                    { map = "54163273", path = "198" },
                    { map = "56885760", path = "212" },
                    { map = "57016832", path = "256" },
                    { map = "54162757", path = "bottom" },
                    { map = "54162756", path = "bottom" },
                    { map = "54162755", path = "bottom" },
                    { map = "54162754", path = "bottom" },
                    { map = "54162753", path = "bottom" },               
                    { map = "54162752", path = "right" },
                    { map = "54162240", path = "right" },
                    { map = "54161728", path = "right" },
                    { map = "54161216", path = "275" },
                    { map = "57017859", path = "359" },
                    { map = "57017861", path = "270"}, -- rt
                    { map = "57017859", path = "206" },
                    { map = "57016835", path = "220" },               
                    { map = "56885763", path = "207" },
                    { map = "56886787", path = "396" }, -- rt
                    { map = "56885763", path = "436" }, -- rt
                    { map = "57016835", path = "257" },               
                    { map = "57016837", path = "401" }, --rt              
                    { map = "57016835", path = "409" }, -- rt 
                    { map = "57017859", path = "395" }, -- rt
                    { map = "54161216", custom = finDeBoucle }          
                }
            end
        },
        [17] = { -- Mine Hissoire
            name = "Mine Hissoire",
            tags = {
                "Obsidienne",
                "Bauxite"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    idTransporteur = "hissoire"
                    setTP()
                    map:path("zaap(110,190,54172969)") -- Frigost
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "54172969", path = "right" },
                    { map = "54172457", path = "right" },
                    { map = "54171945", path = "right" },
                    { map = "54171433", path = "right" },
                    { map = "54170921", path = "right" },
                    { map = "54170409", path = "bottom" },
                    { map = "54170408", path = "bottom" },
                    { map = "54170407", path = "bottom" },
                    { map = "54170406", path = "bottom" },
                    { map = "54170405", path = "bottom" },
                    { map = "54170404", path = "bottom" },
                    { map = "54170403", path = "bottom" },
                    { map = "54170402", path = "right" },
                    { map = "54169890", path = "right" },
                    { map = "54169378", path = "right" },
                    { map = "54168866", path = "right" },
                    { map = "54168354", path = "right" },
                    { map = "54167842", custom = transporteurFrigostien },
                    { map = "54161738", path = "top" },
                    { map = "54161739", path = "top" },
                    { map = "54161740", path = "220" },
                    { map = "57017865", path = "386" },
                    { map = "56886793", path = "270" },
                    { map = "57017865", path = "299" },
                    { map = "57016841", path = "260" },
                    { map = "56885769", custom = finDeBoucle }   
                }
            end
        },
        [18] = { -- Mine Ouronigride
            name = "Mine Ouronigride",
            tags = {
                "Obsidienne"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    idTransporteur = "ouronigride"
                    setTP()
                    map:path("zaap(110,190,54172969)") -- Frigost
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "54172969", path = "right" },
                    { map = "54172457", path = "right" },
                    { map = "54171945", path = "right" },
                    { map = "54171433", path = "right" },
                    { map = "54170921", path = "right" },
                    { map = "54170409", path = "bottom" },
                    { map = "54170408", path = "bottom" },
                    { map = "54170407", path = "bottom" },
                    { map = "54170406", path = "bottom" },
                    { map = "54170405", path = "bottom" },
                    { map = "54170404", path = "bottom" },
                    { map = "54170403", path = "bottom" },
                    { map = "54170402", path = "right" },
                    { map = "54169890", path = "right" },
                    { map = "54169378", path = "right" },
                    { map = "54168866", path = "right" },
                    { map = "54168354", path = "right" },
                    { map = "54167842", custom = transporteurFrigostien },
                    { map = "54168407", path = "bottom" },
                    { map = "54168406", path = "bottom" },
                    { map = "54168405", path = "left" },
                    { map = "54168917", path = "left" },
                    { map = "54169429", path = "left" },
                    { map = "54169941", path = "left" },
                    { map = "54170453", path = "left" },
                    { map = "54170965", path = "left" },
                    { map = "54171477", path = "left" },
                    { map = "54171989", path = "96" },
                    { map = "57017867", custom = finDeBoucle }
                }
            end
        },
        [19] = { -- Mine bwork
            name = "Mine Bwork",
            tags = {
                "Etain",
                "Bronze",
                "Or",
                "Bauxite"
            },
		    ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212746)
                end
		    end,
            ["PATH"] = function()
                return {
                    { map = "88212746", path = "top", gather = true },
                    { map = "88212747", path = "top", gather = true },
                    { map = "88212748", path = "top", gather = true },
                    { map = "88212749", path = "top", gather = true },
                    { map = "88212750", path = "top", gather = true },
                    { map = "88212751", door = "369", gather = true },
                    { map = "104073218", path = "left", gather = true },
                    { map = "104072706", path = "left", gather = true },
                    { map = "104072194", path = "top", gather = true },
                    { map = "104072193", path = "top", gather = true },
                    { map = "104072192", path = "left", gather = true },
                    { map = "104071680", path = "left", gather = true },
                    { map = "104071168", door = "213", gather = true },
                    { map = "104860165", path = "242", gather = true },
                    { map = "104861189", path = "451", gather = true },
                    { map = "104862213", path = "376", gather = true },
                    { map = "104858119", path = "207", gather = true },
                    { map = "104860165", path = "444", gather = true },
                    { map = "104071168", path = "top", gather = true },
                    { map = "104071425", door = "199", gather = true },
                    { map = "104859139", path = "444", gather = true },
                    { map = "104071425", path = "right", gather = true },
                    { map = "104071937", path = "right", gather = true },
                    { map = "104072449", path = "top", gather = true },
                    { map = "104072450", path = "top", gather = true },
                    { map = "104072451", path = "top", gather = true },
                    { map = "104072452", door = "248", gather = true },
                    { map = "104858121", path = "348", gather = true },
                    { map = "104860169", path = "263", gather = true },
                    { map = "104861193", path = "248", gather = true },
                    { map = "104862217", path = "369", gather = true },
                    { map = "104861193", path = "254", gather = true },
                    { map = "104859145", path = "457", gather = true },
                    { map = "104858121", path = "507", gather = true },
                    { map = "104072452", path = "bottom", gather = true },
                    { map = "104072451", path = "bottom", gather = true },
                    { map = "104072450", path = "bottom", gather = true },
                    { map = "104072449", path = "bottom", gather = true },
                    { map = "104072192", path = "left", gather = true },
                    { map = "104071680", path = "left", gather = true, custom = bouclePlus }
                }
            end
        },
        [20] = { -- Mine porco 1
            name = "Mine Porco 1",
            tags = {
                "Fer",
                "Cuivre",
                "Kobalte",
                "Etain"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(88212481)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "88212481", path = "right", gather = true },
                    { map = "88211969", path = "right", gather = true },
                    { map = "88080385", path = "bottom", gather = true },
                    { map = "88080386", path = "bottom", gather = true },
                    { map = "88080387", path = "bottom", gather = true },
                    { map = "88080388", path = "bottom", gather = true },
                    { map = "88080389", path = "bottom", gather = true },
                    { map = "88080390", path = "bottom", gather = true },
                    { map = "88080391", path = "bottom", gather = true },
                    { map = "72619521", path = "bottom", gather = true },
                    { map = "72619522", door = "132", gather = true },
                    { map = "30672658", path = "362", gather = true },
                    { map = "30672655", path = "221", gather = true },
                    { map = "30672649", path = "408", gather = true },
                    { map = "30672655", path = "492", gather = true },
                    { map = "30672652", path = "289", gather = true },
                    { map = "30672655", path = "270", gather = true, custom = bouclePlus }
                }
            end
        }
    },
    ["paysan"] = {
        [1] = {
            name = "Zone Riz Pandala",
            tags = {
                "Riz"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    map:path("zaap(110,190,207619076)") -- Zaap Pandala
                end
            end,
            ["PATH"] = function()
			    return MULTIPLE_MAP:Run({
                    { map = "207619076", path = "436" },  
                    { map = "20,-29", path = "bottom" }, 
                    { map = "20,-28", path = "bottom" }, 
                    { map = "20,-27", path = "bottom" }, 
                    { map = "20,-26", path = "bottom" },-- reboucle
                    { map = "20,-25", path = "right" }, 
                    { map = "21,-25", path = "top" }, 
                    { map = "21,-26", path = "left", custom = bouclePlus },-- boucle fini
			    })
            end
        },
    },
    ["alchimiste"] = {
        [1] = {
            name = "Zone Graine de pandouille Pandala",
            tags = {
                "Graine de pandouille"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 and not vHavre then
                    havreSac()
               
                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(207619076)
                end
            end,
            ["PATH"] = function()
                return {
                    { map = "207619076", path = "436" },  -- Zaap Pandala
    	            { map = "20,-29", path = "right" }, 
                    { map = "21,-29", path = "right" }, 
                    { map = "22,-29", path = "right" },
                    { map = "23,-29", path = "right" },  
                    { map = "25,-28", path = "right" }, 
                    { map = "26,-28", path = "top" }, 
                    { map = "26,-29", path = "right" }, 
                    { map = "27,-29", path = "top" }, 
                    { map = "27,-30", path = "top" }, 
                    { map = "27,-31", path = "left" }, 
                    { map = "25,-31", path = "bottom" }, 
                    { map = "25,-30", path = "bottom" }, 
                    { map = "24,-29", path = "top" }, 
                    { map = "24,-30", path = "top" }, 
                    { map = "23,-36", path = "top" }, 
                    { map = "24,-31", path = "right" }, 
                    { map = "25,-29", path = "bottom" }, 
                    { map = "26,-31", path = "top" }, 
                    { map = "26,-32", path = "left" }, 
                    { map = "25,-32", path = "left" }, 
                    { map = "24,-32", path = "top" }, 
                    { map = "24,-33", path = "right" }, 
                    { map = "25,-33", path = "top" }, 
                    { map = "25,-34", path = "left" },
                    { map = "24,-34", custom = pandalaTP1},
                    { map = "23,-34", path = "left" }, 
                    { map = "22,-34", path = "top" }, 
                    { map = "22,-35", path = "left" }, 
                    { map = "21,-35", path = "top" }, 
                    { map = "21,-36", path = "top" }, 
                    { map = "21,-37", path = "left" }, 
                    { map = "20,-37", path = "bottom" }, 
                    { map = "20,-36", path = "left" }, 
                    { map = "19,-36", path = "bottom" }, 
                    { map = "19,-35", path = "bottom" }, 
                    { map = "19,-34", path = "bottom" }, 
                    { map = "19,-33", path = "bottom" }, 
                    { map = "19,-32", path = "right" }, 
                    { map = "20,-32", path = "bottom" }, 
                    { map = "20,-31", path = "left" }, 
                    { map = "19,-31", path = "bottom" }, 
                    { map = "19,-30", path = "bottom" }, 
                    { map = "19,-29", path = "bottom" }, 
                    { map = "19,-28", path = "right" }, 
                    { map = "20,-28", path = "right" }, 
                    { map = "21,-28", path = "right" }, 
                    { map = "22,-28", path = "right" }, 
                    { map = "23,-28", path = "bottom" }, 
                    { map = "23,-27", path = "left" }, 
                    { map = "22,-27", path = "left" }, 
                    { map = "21,-27", path = "left" }, 
                    { map = "20,-27", path = "bottom" }, 
                    { map = "20,-26", path = "left" }, 
                    { map = "19,-26", path = "bottom" }, 
                    { map = "19,-25", path = "bottom" }, 
                    { map = "19,-24", path = "right" }, 
                    { map = "20,-24", path = "top"}, 
                    { map = "20,-25", path = "right" }, 
                    { map = "21,-25", path = "top" }, 
                    { map = "21,-26", path = "right" },
                    { map = "22,-26", custom = pandalaReturn}
                }
            end
        },
    },
    ["bucheron"] = {
        [1] = { -- Otomai
            name = "Zone Ebene #2",
            tags = {
                "Ebene"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(154642)
                end
            end,
            ["PATH"] = function()
                return{
                    { map = "154642", path = "bottom", gather = true },
                    { map = "154643", path = "left", gather = true },
                    { map = "155155", path = "left", gather = true },
                    { map = "155667", path = "left", gather = true },
                    { map = "156179", path = "left", gather = true },
                    { map = "156691", path = "bottom", gather = true },
                    { map = "156692", path = "bottom", gather = true },
                    { map = "156693", path = "left", gather = true },
                    { map = "157205", path = "top", gather = true },
                    { map = "63965696", path = "top", gather = true },
                    { map = "63965953", path = "left", gather = true }, -- Reboucle
                    { map = "63965441", path = "left", gather = true },
                    { map = "63964929", path = "top", gather = true },
                    { map = "63964930", path = "left", gather = true },
                    { map = "63964418", path = "left", gather = true },
                    { map = "63963906", path = "top", gather = true },
                    { map = "63963907", path = "right", gather = true },
                    { map = "63964419", path = "top", gather = true },
                    { map = "63964420", path = "left", gather = true },
                    { map = "63963908", path = "left", gather = true },
                    { map = "63963396", path = "top", gather = true },
                    { map = "63963397", path = "top", gather = true },
                    { map = "63963398", path = "right", gather = true },
                    { map = "63963910", path = "right", gather = true },
                    { map = "63964422", path = "right", gather = true },
                    { map = "63964934", path = "bottom", gather = true },
                    { map = "63964933", path = "right", gather = true },
                    { map = "63965445", path = "top", gather = true },
                    { map = "63965446", path = "right", gather = true },
                    { map = "63965958", path = "bottom", gather = true },
                    { map = "63965957", path = "right", gather = true },
                    { map = "63966469", path = "bottom", gather = true },
                    { map = "63966468", path = "left", gather = true },
                    { map = "63965956", path = "bottom", gather = true },
                    { map = "63965955", path = "right", gather = true },
                    { map = "63966467", path = "bottom", gather = true },
                    { map = "63966466", path = "left", gather = true },
                    { map = "63965954", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 63965953
                }
            end
        },
        [2] = {
            name = "Zone Noisetier #2",
            tags = {
                "Noisetier"
            },
            ["TP"] = function()
                if map:currentMapId() ~= 162791424 then
                    havreSac()

                elseif map:currentMapId() == 162791424 then
                    setTP()
                    return useZaap(154642)
                end
            end,
            ["PATH"] = function()
                return{
                    { map = "154642", path = "bottom", gather = true },
                    { map = "154643", path = "left", gather = true },
                    { map = "155155", path = "left", gather = true },
                    { map = "155667", path = "left", gather = true },
                    { map = "156179", path = "left", gather = true },
                    { map = "156691", path = "bottom", gather = true },
                    { map = "156692", path = "bottom", gather = true },
                    { map = "156693", path = "left", gather = true },
                    { map = "157205", path = "top", gather = true },
                    { map = "63965696", path = "left", gather = true }, -- Reboucle
                    { map = "63965184", path = "left", gather = true },
                    { map = "63964672", path = "bottom", gather = true },
                    { map = "63964673", path = "left", gather = true },
                    { map = "63964161", path = "top", gather = true },
                    { map = "63964160", path = "left", gather = true },
                    { map = "63963648", path = "left", gather = true },
                    { map = "63963136", path = "top", gather = true },
                    { map = "63963393", path = "top", gather = true },
                    { map = "63963394", path = "top", gather = true },
                    { map = "63963395", path = "top", gather = true },
                    { map = "63963396", path = "top", gather = true },
                    { map = "63963397", path = "right", gather = true },
                    { map = "63963909", path = "bottom", gather = true },
                    { map = "63963908", path = "bottom", gather = true },
                    { map = "63963907", path = "right", gather = true },
                    { map = "63964419", path = "top", gather = true },
                    { map = "63964420", path = "top", gather = true },
                    { map = "63964421", path = "top", gather = true },
                    { map = "63964422", path = "top", gather = true },
                    { map = "63964423", path = "left", gather = true },
                    { map = "63963911", path = "top", gather = true },
                    { map = "63963912", path = "top", gather = true },
                    { map = "63963913", path = "top", gather = true },
                    { map = "63963914", path = "top", gather = true },
                    { map = "63963915", path = "right", gather = true },
                    { map = "63964427", path = "right", gather = true },
                    { map = "63964939", path = "bottom", gather = true },
                    { map = "63964938", path = "bottom", gather = true },
                    { map = "63964937", path = "right", gather = true },
                    { map = "63965449", path = "bottom", gather = true },
                    { map = "63965448", path = "bottom", gather = true },
                    { map = "63965447", path = "right", gather = true },
                    { map = "63965959", path = "bottom", gather = true },
                    { map = "63965958", path = "bottom", gather = true },
                    { map = "63965957", path = "bottom", gather = true },
                    { map = "63965956", path = "bottom", gather = true },
                    { map = "63965955", path = "bottom", gather = true },
                    { map = "63965954", path = "bottom", gather = true },
                    { map = "63965953", path = "bottom", gather = true, custom = bouclePlus } -- Reboucle sur 63965696
                }
            end
        },

    }
}

function bouclePlus() -- Incremente une boucle
    nbBoucle = nbBoucle + 1
    MULTIPLE_MAP:Reset()
end

function finDeBoucle() -- Reset de variables et teleporte au havre pour une nouvelle boucle
    nbBoucle = 0
    MULTIPLE_MAP:Reset()
    setPathToFarm = false
    teleported = false
    resetFuncTimeZone()
    havreSac()
    global:delay(mediumDelay)
end

--[[ function bouclePlus()
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
end ]]

return MAPS_BEFORE_HAVENBAG, RETOUR_BANK, PATH_CRAFT, PATH_JOB, PATH_REPLACE