local CRAFT = {
    ["paysan"] = {
        {
            name = "Pain d'incarnam",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 10,
            toolCraft = "four",
            minLevel = 1,
            idItem = 468,
            weight = 2,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Ble", nbIng = 4, idItem = 289, job = "paysan" },
            }
        },
        {
            name = "Michette",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 20,
            toolCraft = "four",
            minLevel = 10,
            idItem = 521,
            weight = 10,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Ble", nbIng = 5, idItem = 289, job = "paysan" },
            }            
        },
        {  
            name = "Carasau",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 30,
            toolCraft = "four",
            minLevel = 20,
            idItem = 528,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Orge", nbIng = 4, idItem = 400, job = "paysan" },
                { name = "Ortie", nbIng = 1, idItem = 421 },
            }            
        },
        {  
            name = "Fougasse",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 40,
            toolCraft = "four",
            minLevel = 30,
            idItem = 524,
            weight = 11,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Orge", nbIng = 5, idItem = 400, job = "paysan" },
                { name = "Ortie", nbIng = 1, idItem = 421 },
            }            
        },
        {  
            name = "Pain d'avoine",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 60,
            toolCraft = "four",
            minLevel = 40,
            idItem = 524,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Avoine", nbIng = 5, idItem = 533, job = "paysan" },
                { name = "Aubergine", nbIng = 1, idItem = 2331, job = "divers" },
                { name = "Sauge", nbIng = 1, idItem = 428 },
            }            
        },
        {  
            name = "Briochette",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 70,
            toolCraft = "four",
            minLevel = 60,
            idItem = 2024,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Houblon", nbIng = 5, idItem = 401, job = "paysan" },
                { name = "Cendre eternelle", nbIng = 1, idItem = 1984, job = "divers" },
                { name = "Trefle a 5 feuille", nbIng = 1, idItem = 395 },
            }            
        },
        {  
            name = "Pain consistant",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 80,
            toolCraft = "four",
            minLevel = 70,
            idItem = 692,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Houblon", nbIng = 5, idItem = 401, job = "paysan" },
                { name = "Cerise", nbIng = 1, idItem = 1734, job = "divers" },
                { name = "Trefle a 5 feuille", nbIng = 1, idItem = 395 },
            }            
        },
        {  
            name = "Biscotte",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 90,
            toolCraft = "four",
            minLevel = 80,
            idItem = 522,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Lin", nbIng = 5, idItem = 423, job = "paysan" },
                { name = "Sang de scorbute", nbIng = 1, idItem = 2012, job = "divers" },
                { name = "Menthe sauvage", nbIng = 1, idItem = 380 },
            }            
        },
        {  
            name = "Pain d'epices",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 100,
            toolCraft = "four",
            minLevel = 90,
            idItem = 16432,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Lin", nbIng = 5, idItem = 423, job = "paysan" },
                { name = "Epices", nbIng = 1, idItem = 1977, job = "divers" },
                { name = "Menthe sauvage", nbIng = 1, idItem = 380 },
            }            
        },
        {  
            name = "Pain de seigle",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 110,
            toolCraft = "four",
            minLevel = 100,
            idItem = 539,
            weight = 14,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Seigle", nbIng = 6, idItem = 532, job = "paysan" },
                { name = "Eau potable", nbIng = 1, idItem = 532, job = "divers" },
                { name = "Orchidee freyesque", nbIng = 1, idItem = 593 },
            }            
        },
        {  
            name = "Gaufre",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 110,
            toolCraft = "four",
            minLevel = 100,
            idItem = 16433,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Riz", nbIng = 6, idItem = 7018, job = "paysan" },
                { name = "Eau potable", nbIng = 1, idItem = 532, job = "divers" },
                { name = "Orchidee freyesque", nbIng = 1, idItem = 593 },
            }            
        },
    },
    ["alchimiste"] = {
        {
            name = "Potion de mini soin",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 10,
            minLevel = 1,
            idItem = 1182,
            weight = 4,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Ortie", nbIng = 4, idItem = 421, job = "alchimiste" },
            }
        },
        {
            name = "Potion de rappel",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 20,
            minLevel = 10,
            idItem = 548,
            weight = 5,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Sauge", nbIng = 4, idItem = 428, job = "alchimiste" },
                { name = "Eau potable", nbIng = 1, idItem = 311, job = "divers" },
            }
        },
        {
            name = "Potion raide mhor",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 20,
            minLevel = 10,
            idItem = 16402,
            weight = 5,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Ortie", nbIng = 5, idItem = 421, job = "alchimiste" },
            }
        },
        {
            name = "Potion de mini soin superieur",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 30,
            minLevel = 20,
            idItem = 1183,
            weight = 7,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Sauge", nbIng = 4, idItem = 428, job = "alchimiste" },
                { name = "Ble", nbIng = 1, idItem = 289 },
            }
        },
        {
            name = "Potion de souvenir",
            lot = 100,
            nbItemsBeforeNextCraft = 500,
            active = true,
            lvlToDesactive = 201,
            minLevel = 30,
            idItem = 7652,
            weight = 30,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Sauge", nbIng = 10, idItem = 428, job = "alchimiste" },
                { name = "Ortie", nbIng = 20, idItem = 421, job = "alchimiste" },
            }
        },
        {
            name = "Potion de soin",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 50,
            minLevel = 40,
            idItem = 283,
            weight = 30,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Trefle a 5 feuille", nbIng = 5, idItem = 395, job = "alchimiste" },
                { name = "Oignon", nbIng = 1, idItem = 1975, job = "divers", autoBuy = true },
                { name = "Orge", nbIng = 1, idItem = 400 },
            }
        },
        {
            name = "Potion ghetto raide",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 60,
            minLevel = 50,
            idItem = 580,
            weight = 8,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Trefle a 5 feuille", nbIng = 5, idItem = 395, job = "alchimiste" },
                { name = "Graisse gelatineuse", nbIng = 1, idItem = 1983, job = "divers" },
                { name = "Orge", nbIng = 1, idItem = 400 },
            }
        },
        {
            name = "Potion de soin superieure",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 70,
            minLevel = 60,
            idItem = 1183,
            weight = 8,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Menthe sauvage", nbIng = 5, idItem = 380, job = "alchimiste" },
                { name = "Dose de jus goutus", nbIng = 1, idItem = 1731, job = "divers" },
                { name = "Avoine", nbIng = 1, idItem = 533 },
            }
        },
        {
            name = "Potion pahoa raide",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 80,
            minLevel = 70,
            idItem = 1712,
            weight = 8,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Menthe sauvage", nbIng = 5, idItem = 380, job = "alchimiste" },
                { name = "Aubergine", nbIng = 1, idItem = 2331, job = "divers" },
                { name = "Avoine", nbIng = 1, idItem = 533 },
            }
        },
        {
            name = "Potion eau de fee",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 90,
            minLevel = 80,
            idItem = 1405,
            weight = 8,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Orchidee freyesque", nbIng = 5, idItem = 593, job = "alchimiste" },
                { name = "Haricot", nbIng = 1, idItem = 6671, job = "divers" },
                { name = "Houblon", nbIng = 1, idItem = 401 },
            }
        },
        {
            name = "Potion raide boule",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 100,
            minLevel = 90,
            idItem = 1713,
            weight = 8,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Orchidee freyesque", nbIng = 5, idItem = 593, job = "alchimiste" },
                { name = "Cendre eternelle", nbIng = 1, idItem = 1984, job = "divers" },
                { name = "Houblon", nbIng = 1, idItem = 401 },
            }
        },
        {
            name = "Sang de likrone",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 110,
            minLevel = 100,
            idItem = 1406,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Cerise", nbIng = 1, idItem = 1734, job = "divers" },
                { name = "Edelweiss", nbIng = 6, idItem = 594, job = "alchimiste" },
                { name = "Lin", nbIng = 1, idItem = 423 },
            }
        },
        {
            name = "Potion jeud raide",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 120,
            minLevel = 110,
            idItem = 16409,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Edelweiss", nbIng = 6, idItem = 594, job = "alchimiste" },
                { name = "Sang de scorbute", nbIng = 1, idItem = 2012, job = "divers" },
                { name = "Lin", nbIng = 1, idItem = 423 },
            }
        },
        {
            name = "Sang de trooll",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 130,
            minLevel = 120,
            idItem = 16410,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Graine de pandouille", nbIng = 6, idItem = 7059, job = "alchimiste" },
                { name = "Epices", nbIng = 1, idItem = 1977, job = "divers" },
                { name = "Seigle", nbIng = 1, idItem = 532 },
            }
        },
        {
            name = "Potion raide emption",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 140,
            minLevel = 130,
            idItem = 16412,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Graine de pandouille", nbIng = 6, idItem = 7059, job = "alchimiste" },
                { name = "Eau potable", nbIng = 1, idItem = 311, job = "divers" },
                { name = "Seigle", nbIng = 1, idItem = 532 },
            }
        },
        {
            name = "Potion des ancetre",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 200,
            minLevel = 135,
            idItem = 16419,
            weight = 60,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Malt", nbIng = 10, idItem = 405 },
                { name = "Seigle", nbIng = 10, idItem = 532 },
            }
        },
        {
            name = "Potion bulbique",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 150,
            minLevel = 140,
            idItem = 16419,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Poudre de perlinpainpain", nbIng = 1, idItem = 519, job = "divers" },
                { name = "Ginseng", nbIng = 6, idItem = 16385, job = "alchimiste" },
                { name = "Malt", nbIng = 1, idItem = 405 },
            }
        },
        {
            name = "Potion raide izdaide",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 160,
            minLevel = 150,
            idItem = 16414,
            weight = 9,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Ginseng", nbIng = 6, idItem = 16385, job = "alchimiste" },
                { name = "Poude temporelle", nbIng = 1, idItem = 1986, job = "divers" },
                { name = "Malt", nbIng = 1, idItem = 405 },
            }
        },
        {
            name = "Larme d'eniripsa",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 170,
            minLevel = 160,
            idItem = 16415,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Belladone", nbIng = 7, idItem = 16387, job = "alchimiste" },
                { name = "Resine", nbIng = 1, idItem = 1985, job = "divers" },
                { name = "Chanvre", nbIng = 2, idItem = 425 },
            }
        },
        {
            name = "Potion axel raide",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 180,
            minLevel = 170,
            idItem = 16722,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Belladone", nbIng = 7, idItem = 16387, job = "alchimiste" },
                { name = "Mesure de sel", nbIng = 1, idItem = 1730, job = "divers" },
                { name = "Chanvre", nbIng = 2, idItem = 425 },
            }
        },
        {
            name = "Potion revitalisante",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 190,
            minLevel = 180,
            idItem = 16417,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Mandragore", nbIng = 7, idItem = 16389, job = "alchimiste" },
                { name = "Mesure de poivre", nbIng = 1, idItem = 1978, job = "divers" },
                { name = "Mais", nbIng = 2, idItem = 16454 },
            }
        },
        {
            name = "Potion raide reve",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 200,
            minLevel = 190,
            idItem = 11506,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Mandragore", nbIng = 7, idItem = 16389, job = "alchimiste" },
                { name = "Citron", nbIng = 1, idItem = 1736, job = "divers" },
                { name = "Mais", nbIng = 2, idItem = 16454 }
            }
        },
    },
    ["mineur"] = {
        {
            name = "Ferrite",
            lot = nil, 
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 20,
            minLevel = 1,
            idItem = 16440,
            weight = 80,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Fer", nbIng = 6, idItem = 312, job = "mineur" },
                { name = "Frene", nbIng = 10, idItem = 303 }
            }
        },
        {
            name = "Aluminite",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 40,
            minLevel = 20,
            idItem = 747,
            weight = 100,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Fer", nbIng = 10, idItem = 312, job = "mineur" },
                { name = "Cuivre", nbIng = 10, idItem = 441, job = "mineur" }
            }
        },
        {
            name = "Ebonite",
            lot = 25,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 40,
            idItem = 746,
            weight = 150,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Fer", nbIng = 10, idItem = 312, job = "mineur" },
                { name = "Cuivre", nbIng = 10, idItem = 441, job = "mineur" },
                { name = "Bronze", nbIng = 10, idItem = 442, job = "mineur" }
            }
        },
        {
            name = "Magnesite",
            lot = 25,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 60,
            idItem = 748,
            weight = 200,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Fer", nbIng = 10, idItem = 312, job = "mineur" },
                { name = "Cuivre", nbIng = 10, idItem = 441, job = "mineur" },
                { name = "Bronze", nbIng = 10, idItem = 442, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" }
            }
        },
        {
            name = "Bakelelite",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 160,
            minLevel = 80,
            idItem = 749,
            weight = 200,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Cuivre", nbIng = 10, idItem = 441, job = "mineur" },
                { name = "Bronze", nbIng = 10, idItem = 442, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" },
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" }
            }
        },
        {
            name = "Kouartz",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 120,
            minLevel = 100,
            idItem = 750,
            weight = 250,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" },
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Bronze", nbIng = 10, idItem = 442, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" }
            }
        },
        {
            name = "Kriptonite",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 140,
            minLevel = 120,
            idItem = 6457,
            weight = 300,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Bronze", nbIng = 10, idItem = 442, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" },
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" },
                { name = "Argent", nbIng = 10, idItem = 350, job = "mineur" }
            }
        },
        {
            name = "Kobalite",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 160,
            minLevel = 140,
            idItem = 6458,
            weight = 300,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" },
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" },
                { name = "Argent", nbIng = 10, idItem = 350, job = "mineur" },
                { name = "Bauxite", nbIng = 10, idItem = 446, job = "mineur" }
            }
        },
        {
            name = "Rutile",
            lot = 10,
            nbItemsBeforeNextCraft = 10,
            active = true,
            lvlToDesactive = 201,
            minLevel = 160,
            idItem = 7036,
            weight = 350,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" },
                { name = "Bauxite", nbIng = 10, idItem = 446, job = "mineur" },
                { name = "Argent", nbIng = 10, idItem = 350, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" },
                { name = "Or", nbIng = 10, idItem = 313, job = "mineur" }
            }
        },
        {
            name = "Pyrute",
            lot = 10,
            nbItemsBeforeNextCraft = 10,
            active = true,
            lvlToDesactive = 201,
            minLevel = 180,
            idItem = 7035,
            weight = 400,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Or", nbIng = 10, idItem = 313, job = "mineur" },
                { name = "Bauxite", nbIng = 10, idItem = 446, job = "mineur" },
                { name = "Kobalte", nbIng = 10, idItem = 443, job = "mineur" },
                { name = "Dolomite", nbIng = 10, idItem = 7033, job = "mineur" },
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" },
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Argent", nbIng = 10, idItem = 350, job = "mineur" }
            }
        },
        {
            name = "Ardonite",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = false,
            lvlToDesactive = 201,
            minLevel = 200,
            idItem = 12728,
            weight = 400,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Obsidienne", nbIng = 10, idItem = 11110, job = "mineur" },
                { name = "Silicate", nbIng = 10, idItem = 7032, job = "mineur" },
                { name = "Manganese", nbIng = 10, idItem = 445, job = "mineur" },
                { name = "Bauxite", nbIng = 10, idItem = 446, job = "mineur" },
                { name = "Dolomite", nbIng = 10, idItem = 7033, job = "mineur" },
                { name = "Argent", nbIng = 10, idItem = 350, job = "mineur" },
                { name = "Or", nbIng = 10, idItem = 313, job = "mineur" },
                { name = "Etain", nbIng = 10, idItem = 444, job = "mineur" }
            }
        }
    },
    ["bucheron"] = {
        {
            name = "Planche agglomere",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 20,
            minLevel = 1,
            idItem = 16489,
            weight = 50,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Frene", nbIng = 6, idItem = 303, job = "bucheron" },
                { name = "Fer", nbIng = 4, idItem = 312 }
            }
        },
        {
            name = "Planche contreplaque",
            lot = nil,
            nbItemsBeforeNextCraft = 200,
            active = true,
            lvlToDesactive = 201,
            minLevel = 20,
            idItem = 16490,
            weight = 100,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Frene", nbIng = 10, idItem = 303, job = "bucheron" },
                { name = "Chataignier", nbIng = 10, idItem = 473, job = "bucheron" }
            }
        },
        {
            name = "Substrat de buisson",
            lot = 100,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 20,
            idItem = 2539,
            weight = 22,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Planche contreplaque", nbIng = 2, idItem = 16490, job = "substrat" },
                { name = "Potion de souvenir", nbIng = 1, idItem = 7652 }
            }
        },
        {
            name = "Planche grille",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 40,
            idItem = 16491,
            weight = 150,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Frene", nbIng = 10, idItem = 303, job = "bucheron" },
                { name = "Chataignier", nbIng = 10, idItem = 473, job = "bucheron" },
                { name = "Noyer", nbIng = 10, idItem = 476, job = "bucheron" }
            }
        },
        {
            name = "Substrat de bocage",
            lot = 100,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 40,
            idItem = 12745,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Planche grille", nbIng = 1, idItem = 16491, job = "substrat" },
                { name = "Potion de souvenir", nbIng = 1, idItem = 7652 }
            }
        },
        {
            name = "Planche de surf",
            lot = nil,
            nbItemsBeforeNextCraft = 200,
            active = true,
            lvlToDesactive = 201,
            minLevel = 60,
            idItem = 16492,
            weight = 200,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Frene", nbIng = 10, idItem = 303, job = "bucheron" },
                { name = "Chataignier", nbIng = 10, idItem = 473, job = "bucheron" },
                { name = "Noyer", nbIng = 10, idItem = 476, job = "bucheron" },
                { name = "Chene", nbIng = 10, idItem = 460, job = "bucheron" }
            }
        },
        {
            name = "Substrat de futaie",
            lot = 100,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 60,
            idItem = 2540,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Planche de surf", nbIng = 1, idItem = 16492, job = "substrat" },
                { name = "Potion de souvenir", nbIng = 1, idItem = 7652 }
            }
        },
        {
            name = "Planche a repasser",
            lot = 100,
            nbItemsBeforeNextCraft = 200,
            active = true,
            lvlToDesactive = 201,
            minLevel = 80,
            idItem = 16493,
            weight = 200,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Chene", nbIng = 10, idItem = 460, job = "bucheron" },
                { name = "Bombu", nbIng = 10, idItem = 2358, job = "bucheron" },
                { name = "Erable", nbIng = 10, idItem = 471, job = "bucheron" },
                { name = "Noyer", nbIng = 10, idItem = 476, job = "bucheron" }
            }
        },
        {
            name = "Substrat de fascine",
            lot = nil,
            nbItemsBeforeNextCraft = 100,
            active = true,
            lvlToDesactive = 201,
            minLevel = 80,
            idItem = 2543,
            weight = 12,
            next = false,
            waitItemOfAnotherJob = false,
            ingredient = {
                { name = "Planche a repasser", nbIng = 2, idItem = 16493, job = "substrat" },
                { name = "Potion de souvenir", nbIng = 1, idItem = 7652 }
            }
        }
    },
    ["bijoutier"] = {

    },
    ["coordonier"] = {

    },
    ["tailleur"] = {

    }
}

local ITEM = {
    ["paysan"] = {
        ["Ble"] = { name = "Ble", id = 289, priorityToGather = 0, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 38, job = "paysan" },
        ["Orge"] = { name = "Orge", id = 400, priorityToGather = 1, lvlToFarm = 20, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 43, job = "paysan" },
        ["Avoine"] = { name = "Avoine", id = 533, priorityToGather = 2, lvlToFarm = 40, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 45, job = "paysan" },
        ["Houblon"] = { name = "Houblon", id = 401, priorityToGather = 3, lvlToFarm = 60, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 39, job = "paysan" },
        ["Lin"] = { name = "Lin", id = 423, priorityToGather = 4, lvlToFarm = 80, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 42, job = "paysan" },
        ["Riz"] = { name = "Riz", id = 7018, priorityToGather = 5, lvlToFarm = 100, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 111, job = "paysan" },
        ["Seigle"] = { name = "Seigle", id = 532, priorityToGather = 6, lvlToFarm = 100, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 44, job = "paysan" },
        ["Malt"] = { name = "Malt", id = 405, priorityToGather = 7, lvlToFarm = 120, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 47, job = "paysan" },
        ["Chanvre"] = { name = "Chanvre", id = 425, priorityToGather = 8, lvlToFarm = 140, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 46, job = "paysan" },
        ["Mais"] = { name = "Mais", id = 16454, priorityToGather = 9, lvlToFarm = 160, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 260, job = "paysan" },
        ["Millet"] = { name = "Millet", id = 16456, priorityToGather = 10, lvlToFarm = 180, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 261, job = "paysan" },
        ["Frostiz"] = { name = "Frostiz", id = 11109, priorityToGather = 11, lvlToFarm = 200, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 134, job = "paysan" },
    },
    ["alchimiste"] = {
        ["Ortie"] = { name = "Ortie", id = 421, priorityToGather = 0, lvlToFarm = 1, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 254, job = "alchimiste" },
        ["Sauge"] = { name = "Sauge", id = 428, priorityToGather = 1, lvlToFarm = 20, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 255, job = "alchimiste" },
        ["Trefle"] = { name = "Trefle a 5 feuille", id = 395, priorityToGather = 2, lvlToFarm = 40, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 67, job = "alchimiste" },
        ["MentheSauvage"] = { name = "Menthe sauvage", id = 380, priorityToGather = 3, lvlToFarm = 60, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 66, job = "alchimiste" },
        ["Orchidee"] = { name = "Orchidee freyesque", id = 593, priorityToGather = 4, lvlToFarm = 80, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 68, job = "alchimiste" },
        ["Edelweiss"] = { name = "Edelweiss", id = 594, priorityToGather = 5, lvlToFarm = 100, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 61, job = "alchimiste" },
        ["GraineDePandouille"] = { name = "Graine de pandouille", id = 7059, priorityToGather = 6, lvlToFarm = 120, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 112, job = "alchimiste" },
        ["Ginseng"] = { name = "Ginseng", id = 16385, priorityToGather = 7, lvlToFarm = 140, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 256, job = "alchimiste" },
        ["Belladone"] = { name = "Belladone", id = 16387, priorityToGather = 8, lvlToFarm = 160, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 257, job = "alchimiste" },
        ["Mandragore"] = { name = "Mandragore", id = 16389, priorityToGather = 9, lvlToFarm = 180, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 258, job = "alchimiste" },
        ["PerceNeige"] = { name = "PerceNeige", id = 11102, priorityToGather = 10, lvlToFarm = 200, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 131, job = "alchimiste" },
    },
    ["mineur"] = {
        ["Fer"] = { name = "Fer", id = 312, priorityToGather = 0, lvlToFarm = 1, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 17, job = "mineur" },
        ["Cuivre"] = { name = "Cuivre", id = 441, priorityToGather = 1, lvlToFarm = 20, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 53, job = "mineur" },
        ["Bronze"] = { name = "Bronze", id = 442, priorityToGather = 2, lvlToFarm = 40, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 55, job = "mineur" },
        ["Kobalte"] = { name = "Kobalte", id = 443, priorityToGather = 3, lvlToFarm = 60, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 37, job = "mineur" },
        ["Manganese"] = { name = "Manganese", id = 445, priorityToGather = 4, lvlToFarm = 80, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 54, job = "mineur" },
        ["Etain"] = { name = "Etain", id = 444, priorityToGather = 5, lvlToFarm = 100, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 52, job = "mineur" },
        ["Silicate"] = { name = "Silicate", id = 7032, priorityToGather = 6, lvlToFarm = 100, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 114, job = "mineur" },
        ["Argent"] = { name = "Argent", id = 350, priorityToGather = 7, lvlToFarm = 120, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 24, job = "mineur" },
        ["Bauxite"] = { name = "Bauxite", id = 446, priorityToGather = 8, lvlToFarm = 140, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 26, job = "mineur" },
        ["Or"] = { name = "Or", id = 313, priorityToGather = 9, lvlToFarm = 160, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 25, job = "mineur" },
        ["Dolomite"] = { name = "Dolomite", id = 7033, priorityToGather = 10, lvlToFarm = 180, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 113, job = "mineur" },
        ["Obsidienne"] = { name = "Obsidienne", id = 11110, priorityToGather = 11, lvlToFarm = 200, minStock = 0, maxStock = 20000, forceFarm = false, gatherId = 135, job = "mineur" },
    },
    ["bucheron"] = {
        ["Frene"] = { name = "Frene", id = 303, priorityToGather = 0, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 1, job = "bucheron" },
        ["Chataignier"] = { name = "Chataignier", id = 473, priorityToGather = 1, lvlToFarm = 20, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 33, job = "bucheron" },
        ["Noyer"] = { name = "Noyer", id = 476, priorityToGather = 2, lvlToFarm = 40, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 34, job = "bucheron" },
        ["Chene"] = { name = "Chene", id = 460, priorityToGather = 3, lvlToFarm = 60, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 8, job = "bucheron" },
        ["Bombu"] = { name = "Bombu", id = 2358, priorityToGather = 4, lvlToFarm = 70, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 98, job = "bucheron" },
        ["Erable"] = { name = "Erable", id = 471, priorityToGather = 5, lvlToFarm = 80, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 31, job = "bucheron" },
        ["Oliviolet"] = { name = "Oliviolet", id = 2357, priorityToGather = 6, lvlToFarm = 90, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 101, job = "bucheron" },
        ["If"] = { name = "If", id = 461, priorityToGather = 7, lvlToFarm = 100, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 28, job = "bucheron" },
        ["Bambou"] = { name = "Bambou", id = 7013, priorityToGather = 8, lvlToFarm = 110, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 108, job = "bucheron" },
        ["Merisier"] = { name = "Merisier", id = 474, priorityToGather = 9, lvlToFarm = 120, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 35, job = "bucheron" },
        ["Noisetier"] = { name = "Noisetier", id = 16488, priorityToGather = 10, lvlToFarm = 130, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 259, job = "bucheron" },
        ["Ebene"] = { name = "Ebene", id = 449, priorityToGather = 11, lvlToFarm = 140, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 29, job = "bucheron" },
        ["Kaliptus"] = { name = "Kaliptus", id = 7925, priorityToGather = 12, lvlToFarm = 150, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 121, job = "bucheron" },
        ["Charme"] = { name = "Charme", id = 472, priorityToGather = 13, lvlToFarm = 160, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 32, job = "bucheron" },
        ["BambouSombre"] = { name = "Bambou Sombre", id = 7016, priorityToGather = 14, lvlToFarm = 170, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 109, job = "bucheron" },
        ["Orme"] = { name = "Orme", id = 470, priorityToGather = 15, lvlToFarm = 180, minStock = 0, maxStock = 3000, forceFarm = false, gatherId = 30, job = "bucheron" }
    },
    ["divers"] = {
        ["Aubergine"] = { name = "Aubergine", id = 2331, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["SangDeScorbute"] = { name = "Sang de scorbute", id = 2012, lvlToFarm = 1, minStock = 3000, maxStock = nil, forceFarm = false },
        ["CendreEternelle"] = { name = "Cendre eternelle", id = 1984, lvlToFarm = 1, minStock = 3000, maxStock = nil, forceFarm = false },
        ["EauPotable"] = { name = "Eau potable", id = 311, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Cerise"] = { name = "Cerise", id = 1734, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Epices"] = { name = "Epices", id = 1977, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Oignon"] = { name = "Oignon", id = 1975, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["GraisseGelatineuse"] = { name = "Graisse gelatineuse", id = 1983, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["DoseDeJusGoutus"] = { name = "Dose de jus goutus", id = 1731, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Haricot"] = { name = "Haricot", id = 6671, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["PoudreDePerlinpainpain"] = { name = "Poudre de perlinpainpain", id = 519, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["PoudeTemporelle"] = { name = "Poude temporelle", id = 1986, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Resine"] = { name = "Resine", id = 1985, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["MesureDeSel"] = { name = "Mesure de sel", id = 1730, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["MesureDePoivre"] = { name = "Mesure de poivre", id = 1978, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["Citron"] = { name = "Citron", id = 1736, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["plancheContrePlaque"] = { name = "Planche contreplaque", id = 16490, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["plancheGrille"] = { name = "Planche grille", id = 16491, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["plancheSurf"] = { name = "Planche de surf", id = 16492, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["plancheRepasser"] = { name = "Planche a repasser", id = 16493, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["plancheGravure"] = { name = "Planche de gravure", id = 16496, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["popoSouvenir"] = { name = "Potion de souvenir", id = 7652, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["popoVieillesse"] = { name = "Potion de viellesse", id = 17060, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
        ["popoAncetre"] = { name = "Potion des ancetre", id = 16419, lvlToFarm = 1, minStock = 0, maxStock = 3000, forceFarm = false },
    },
    ["monstre"] = {

    }
}

return CRAFT, ITEM