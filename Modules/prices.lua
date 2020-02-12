local addonName, bepgp = ...
local moduleName = addonName.."_prices"
local bepgp_prices = bepgp:NewModule(moduleName, "AceEvent-3.0")
local ST = LibStub("ScrollingTable")
local name_version = "BastionEPGPFixed-1.0"
local prices = {
  -----------------
  --- Naxxramas ---
  -----------------
  -- Trash loot --
  [23044] = {116,"T3"}; --Harbinger of Doom
  [23069] = {18,"T3"}; --Necro-knight Garb
  [23221] = {100,"T3"}; --Misplaced Servo Arm
  [23226] = {104,"T3"}; --Ghoul Skin Tunic
  [23237] = {60,"T3"}; --Ring of Eternal Flame
  [23238] = {40,"T3"}; --Stygian Buckler
  [23663] = {48,"T3"}; --Girdle of Elemental Fury
  [23664] = {48,"T3"}; --Pauldrons of Elemental Fury
  [23665] = {48,"T3"}; --Leggings of Elemental Fury
  [23666] = {48,"T3"}; --Belt of the Grand Crusader
  [23667] = {48,"T3"}; --Spaulders of the Grand Crusader
  [23668] = {48,"T3"}; --Leggings of the Grand Crusader

  -- Anub'Rekhan --
  [22935] = {4,"T3"}; --Touch of Frost
  [22936] = {72,"T3"}; --Wristguards of Vengeance
  [22937] = {48,"T3"}; --Gem of Nerubis
  [22938] = {96,"T3"}; --Cryptfiend Silk Cloak
  [22939] = {72,"T3"}; --Band of Unanswered Prayers

  -- Faerlina --
  [22806] = {116,"T3"}; --Widow's Remorse
  [22940] = {4,"T3"}; --Icebane Pauldrons
  [22941] = {4,"T3"}; --Polar Shoulderpads
  [22942] = {116,"T3"}; --The Widow's Embrace
  [22943] = {60,"T3"}; --Malice Stone Pendant

  -- Maexxna --
  [22804] = {116,"T3"}; --Maexxna's Fang
  [22807] = {152,"T3"}; --Wraith Blade
  [22947] = {24,"T3"}; --Pendant of Forgotten Names
  [22954] = {116,"T3"}; --Kiss of the Spider
  [23220] = {132,"T3"}; --Crystal Webbed Robe

  -- Patchwerk --
  [22815] = {88,"T3"}; --Severance
  [22818] = {92,"T3"}; --The Plague Bearer
  [22820] = {72,"T3"}; --Wand of Fates
  [22960] = {96,"T3"}; --Cloak of Suturing
  [22961] = {80,"T3"}; --Band of Reanimation

  -- Grobbulus --
  [22803] = {80,"T3"}; --Midnight Haze
  [22810] = {44,"T3"}; --Toxin Injector
  [22967] = {4,"T3"}; --Icy Scale Spaulders
  [22968] = {4,"T3"}; --Glacial Mantle
  [22988] = {152,"T3"}; --The End of Dreams

  -- Gluth --
  [23075] = {80,"T3"}; --Death's Bargain
  [22813] = {72,"T3"}; --Claymore of Unholy Might
  [22981] = {52,"T3"}; --Gluth's Missing Collar
  [22983] = {112,"T3"}; --Rime Covered Mantle
  [22994] = {24,"T3"}; --Digested Hand of Power

  -- Thaddius --
  [23070] = {136,"T3"}; --Leggings of Polarity
  [23000] = {136,"T3"}; --Plated Abomination Ribcage
  [23001] = {96,"T3"}; --Eye of Diminution
  [22801] = {140,"T3"}; --Spire of Twilight
  [22808] = {116,"T3"}; --The Castigator

  -- Noth --
  [23028] = {16,"T3"}; --Hailstone Band
  [23029] = {60,"T3"}; --Noth's Frigid Heart
  [23030] = {68,"T3"}; --Cloak of the Scourge
  [23031] = {76,"T3"}; --Band of the Inevitable
  [22816] = {72,"T3"}; --Hatchet of Sundered Bone
  [23005] = {68,"T3"}; --Totem of Flowing Water
  [23006] = {68, "T3"}; -- Libram of Light

  -- Heigan --
  [23019] = {4,"T3"}; --Icebane Helmet
  [23033] = {4,"T3"}; --Icy Scale Coif
  [23035] = {112,"T3"}; --Preceptor's Hat
  [23036] = {72,"T3"}; --Necklace of Necropsy
  [23068] = {124,"T3"}; --Legplates of Carnage

  -- Loatheb --
  [23037] = {24,"T3"}; --Ring of Spiritual Fervor
  [23038] = {88,"T3"}; --Band of Unnatural Forces
  [23039] = {132,"T3"}; --The Eye of Nerub
  [23042] = {12,"T3"}; --Loatheb's Reflection
  [22800] = {160,"T3"}; --Brimstone Staff

  -- Razuvious --
  [23004] = {48,"T3"}; --Idol of Longevity
  [23009] = {72,"T3"}; --Wand of the Whispering Dead
  [23014] = {120,"T3"}; --"Iblis, Blade of the Fallen Seraph"
  [23017] = {48,"T3"}; --Veil of Eclipse
  [23018] = {84,"T3"}; --Signets of the Fallen Defender
  [23219] = {124,"T3"}; --Girdle of the Mentor

  -- Gothik --
  [23073] = {32,"T3"}; --Boots of Displacement
  [23020] = {4,"T3"}; --Polar Helmet
  [23021] = {96,"T3"}; --The Soul Harvester's Bindings
  [23023] = {48,"T3"}; --Sadist's Collar
  [23032] = {4,"T3"}; --Glacial Headdress

  -- Four Horsemen --
  [22691] = {200,"T3"}; --Corrupted Ashbringer
  [22809] = {60,"T3"}; --Maul of the Redeemed Crusader
  [22811] = {72,"T3"}; --Soulstring
  [23025] = {92,"T3"}; --Seal of the Damned
  [23027] = {96,"T3"}; --Warmth of Forgiveness
  [23071] = {144,"T3"}; --Leggings of Apocalypse

  -- Sapphiron --
  [23041] = {160,"T3"}; --Slayer's Crest
  [23043] = {150,"T3"}; --The Face of Death
  [23045] = {160,"T3"}; --Shroud of Dominion
  [23046] = {160,"T3"}; --The Restrained Essence of Sapphiron
  [23047] = {160,"T3"}; --Eye of the Dead
  [23048] = {160,"T3"}; --Sapphiron's Right Eye
  [23049] = {160,"T3"}; --Sapphiron's Left Eye
  [23050] = {160,"T3"}; --Cloak of the Necropolis
  [23242] = {180,"T3"}; --Claw of the Frost Wyrm
  [23545] = {80,"T3"}; --Power of the Scourge
  [23547] = {80,"T3"}; --Resilience of the Scourge
  [23548] = {80,"T3"}; --Might of the Scourge
  [23549] = {120,"T3"}; --Fortitude of the Scourge
  [23040] = {160,"T3"}; --Glyph of Deflection

  -- Kel'Thuzad --
  [22520] = {0,"T3"}; --The Phylactery of Kel'Thuzad
  [22733] = {0,"T3"}; --Staff Head of Atiesh
  [22798] = {300,"T3"}; --Might of Menethil
  [22802] = {200,"T3"}; --Kingsfall
  [22821] = {116,"T3"}; --Doomfinger
  [23053] = {140,"T3"}; --Stormrage's Talisman of Seething
  [23054] = {200,"T3"}; --"Gressil, Dawn of Ruin"
  [23056] = {240,"T3"}; --Hammer of the Twisting Nether
  [23057] = {140,"T3"}; --Gem of Trapped Innocents
  [23577] = {200,"T3"}; --The Hungering Cold
  [22799] = {300,"T3"}; --Soulseeker
  [22812] = {300,"T3"}; --Nerubian Slavemaker
  [22819] = {180,"T3"}; --Shield of Condemnation

  -- T3 Tokens --
  [22349] = {148,"T3"}; --T3 Chest Token
  [22350] = {148,"T3"}; --T3 Chest Token
  [22351] = {148,"T3"}; --T3 Chest Token
  [22352] = {136,"T3"}; --T3 Pants Token
  [22353] = {120,"T3"}; --T3 Helm Token
  [22354] = {100,"T3"}; --T3 Shoulder Token
  [22355] = {84,"T3"}; --T3 Wrist Token
  [22356] = {92,"T3"}; --T3 Belt Token
  [22357] = {96,"T3"}; --T3 Gloves Token
  [22358] = {92,"T3"}; --T3 Boots Token
  [22359] = {136,"T3"}; --T3 Pants Token
  [22360] = {120,"T3"}; --T3 Helm Token
  [22361] = {100,"T3"}; --T3 Shoulder Token
  [22362] = {84,"T3"}; --T3 Wrist Token
  [22363] = {92,"T3"}; --T3 Belt Token
  [22364] = {96,"T3"}; --T3 Gloves Token
  [22365] = {92,"T3"}; --T3 Boots Token
  [22366] = {136,"T3"}; --T3 Pants Token
  [22367] = {120,"T3"}; --T3 Helm Token
  [22368] = {100,"T3"}; --T3 Shoulder Token
  [22369] = {84,"T3"}; --T3 Wrist Token
  [22370] = {92,"T3"}; --T3 Belt Token
  [22371] = {96,"T3"}; --T3 Gloves Token
  [22372] = {92,"T3"}; --T3 Boots Token
  [22416] = {148,"T3"}; --Dreadnaught's Battlegear
  [22417] = {136,"T3"}; --Dreadnaught's Battlegear
  [22418] = {120,"T3"}; --Dreadnaught's Battlegear
  [22419] = {100,"T3"}; --Dreadnaught's Battlegear
  [22420] = {92,"T3"}; --Dreadnaught's Battlegear
  [22421] = {96,"T3"}; --Dreadnaught's Battlegear
  [22422] = {92,"T3"}; --Dreadnaught's Battlegear
  [22423] = {84,"T3"}; --Dreadnaught's Battlegear
  [22424] = {84,"T3"};--Redemption Armor
  [22425] = {148,"T3"}; --Redemption Armor
  [22426] = {96,"T3"};--Redemption Armor
  [22427] = {136,"T3"}; --Redemption Armor
  [22428] = {120,"T3"}; --Redemption Armor
  [22429] = {100,"T3"}; --Redemption Armor
  [22430] = {92,"T3"};--Redemption Armor
  [22431] = {92,"T3"};--Redemption Armor
  [22436] = {148,"T3"}; --Cryptstalker Armor
  [22437] = {136,"T3"}; --Cryptstalker Armor
  [22438] = {120,"T3"}; --Cryptstalker Armor
  [22439] = {100,"T3"}; --Cryptstalker Armor
  [22440] = {92,"T3"}; --Cryptstalker Armor
  [22441] = {96,"T3"}; --Cryptstalker Armor
  [22442] = {92,"T3"}; --Cryptstalker Armor
  [22443] = {84,"T3"}; --Cryptstalker Armor
  [22464] = {148,"T3"}; --The Earthshatterer
  [22465] = {136,"T3"}; --The Earthshatterer
  [22466] = {120,"T3"}; --The Earthshatterer
  [22467] = {100,"T3"}; --The Earthshatterer
  [22468] = {92,"T3"}; --The Earthshatterer
  [22469] = {96,"T3"}; --The Earthshatterer
  [22470] = {92,"T3"}; --The Earthshatterer
  [22471] = {84,"T3"}; --The Earthshatterer
  [22476] = {148,"T3"}; --Bonescythe Armor
  [22477] = {136,"T3"}; --Bonescythe Armor
  [22478] = {120,"T3"}; --Bonescythe Armor
  [22479] = {100,"T3"}; --Bonescythe Armor
  [22480] = {92,"T3"}; --Bonescythe Armor
  [22481] = {96,"T3"}; --Bonescythe Armor
  [22482] = {92,"T3"}; --Bonescythe Armor
  [22483] = {84,"T3"}; --Bonescythe Armor
  [22488] = {148,"T3"}; --Dreamwalker Raiment
  [22489] = {136,"T3"}; --Dreamwalker Raiment
  [22490] = {120,"T3"}; --Dreamwalker Raiment
  [22491] = {100,"T3"}; --Dreamwalker Raiment
  [22492] = {92,"T3"}; --Dreamwalker Raiment
  [22493] = {96,"T3"}; --Dreamwalker Raiment
  [22494] = {92,"T3"}; --Dreamwalker Raiment
  [22495] = {84,"T3"}; --Dreamwalker Raiment
  [22496] = {148,"T3"}; --Frostfire Regalia
  [22497] = {136,"T3"}; --Frostfire Regalia
  [22498] = {120,"T3"}; --Frostfire Regalia
  [22499] = {100,"T3"}; --Frostfire Regalia
  [22500] = {92,"T3"}; --Frostfire Regalia
  [22501] = {96,"T3"}; --Frostfire Regalia
  [22502] = {92,"T3"}; --Frostfire Regalia
  [22503] = {84,"T3"}; --Frostfire Regalia
  [22504] = {148,"T3"}; --Plaguehart Raiment
  [22505] = {136,"T3"}; --Plaguehart Raiment
  [22506] = {120,"T3"}; --Plaguehart Raiment
  [22507] = {100,"T3"}; --Plaguehart Raiment
  [22508] = {92,"T3"}; --Plaguehart Raiment
  [22509] = {96,"T3"}; --Plaguehart Raiment
  [22510] = {92,"T3"}; --Plaguehart Raiment
  [22511] = {84,"T3"}; --Plaguehart Raiment
  [22512] = {148,"T3"}; --Vestments of Faith
  [22513] = {136,"T3"}; --Vestments of Faith
  [22514] = {120,"T3"}; --Vestments of Faith
  [22515] = {100,"T3"}; --Vestments of Faith
  [22516] = {92,"T3"}; --Vestments of Faith
  [22517] = {96,"T3"}; --Vestments of Faith
  [22518] = {92,"T3"}; --Vestments of Faith
  [22519] = {84,"T3"}; --Vestments of Faith
  [23059] = {160,"T3"}; --Dreadnaught's Battlegear
  [23060] = {160,"T3"}; --Bonescythe Armor
  [23061] = {160,"T3"}; --Vestments of Faith
  [23062] = {160,"T3"}; --Frostfire Regalia
  [23063] = {160,"T3"}; --Plaguehart Raiment
  [23064] = {160,"T3"}; --Dreamwalker Raiment
  [23065] = {160,"T3"}; --The Earthshatterer
  [23066] = {160,"T3"}; --Redemption Armor
  [23067] = {160,"T3"}; --Cryptstalker Armor

  ---------------------------
  --- Temple of Ahn'Qiraj ---
  ---------------------------
  -- Trash loot --
  [21836] = {44,"T2.5"}; --Ritssyn's Ring of Chaos
  [21837] = {40,"T2.5"}; --Anubisath Warhammer
  [21838] = {4,"T2.5"}; --Garb of Royal Ascension
  [21856] = {16,"T2.5"}; --"Neretzek, The Blood Drinker"
  [21888] = {8,"T2.5"}; --Gloves of the Immortal
  [21889] = {70,"T2.5"}; --Gloves of the Redeemed Prophet
  [21891] = {64,"T2.5"}; --Shard of the Fallen Star

  -- Prophet Skeram --
  [21698] = {40,"T2.5"}; --Leggings of Immersion
  [21699] = {36,"T2.5"}; --Barrage Shoulders
  [21700] = {24,"T2.5"}; --Pendant of the Qiraji Guardian
  [21701] = {88,"T2.5"}; --Cloak of the Concentrated Hatred
  [21702] = {4,"T2.5"}; --Amulet of Foul Warding
  [21703] = {24,"T2.5"}; --Hammer of Ji'zhi
  [21704] = {70,"T2.5"}; --Boots of the Redeemed Prophecy
  [21705] = {12,"T2.5"}; --Boots of the Fallen Prophet
  [21706] = {28,"T2.5"}; --Boots of the Unwavering Will
  [21707] = {48,"T2.5"}; --Ring of Swarming Thought
  [21708] = {4,"T2.5"}; --Beetle Scaled Wristguards
  [21814] = {92,"T2.5"}; --Breastplate of Annihilation
  [21128] = {52,"T2.5"}; --Staff of the Qiraji Prophets

  -- Bug Trio --
  [21603] = {56,"T2.5"}; --Wand of the Qiraji Nobility
  [21680] = {56,"T2.5"}; --Vest of Swift Execution
  [21681] = {64,"T2.5"}; --Ring of the Devoured
  [21682] = {4,"T2.5"}; --Bile-Covered Gauntlets
  [21683] = {68,"T2.5"}; --Mantle of the Desert Crusade
  [21684] = {4,"T2.5"}; --Mantle of the Desert's Fury
  [21685] = {4,"T2.5"}; --Petrified Scarab
  [21686] = {40,"T2.5"}; --Mantle of Phrenic Power
  [21687] = {4,"T2.5"}; --Ukko's Ring of Darkness
  [21688] = {68,"T2.5"}; --Boots of the Fallen Hero
  [21689] = {60,"T2.5"}; --Gloves of Ebru
  [21690] = {48,"T2.5"}; --Angelista's Charm
  [21691] = {4,"T2.5"}; --Ooze-ridden Gauntlets
  [21692] = {32,"T2.5"}; --Triad Girdle
  [21693] = {60,"T2.5"}; --Guise of the Devourer
  [21694] = {60,"T2.5"}; --Ternary Mantle
  [21695] = {80,"T2.5"}; --Angelista's Touch
  [21696] = {4,"T2.5"}; --Robes of the Triumvirate
  [21697] = {4,"T2.5"}; --Cape of the Trinity

  -- Sartura --
  [21648] = {4,"T2.5"}; --Recomposed Boots
  [21666] = {88,"T2.5"}; --Sartura's Might
  [21667] = {76,"T2.5"}; --Legplates of Blazing Light
  [21668] = {20,"T2.5"}; --Scaled Leggings of Qiraji Fury
  [21669] = {48,"T2.5"}; --Creeping Vine Helm
  [21670] = {44,"T2.5"}; --Badge of the Swarmguard
  [21671] = {48,"T2.5"}; --Robes of the Battleguard
  [21672] = {64,"T2.5"}; --Gloves of Enforcement
  [21673] = {32,"T2.5"}; --Silithid Claw
  [21674] = {64,"T2.5"}; --Gauntlets of Steadfast Determ..
  [21675] = {60,"T2.5"}; --Thick Qirajihide Belt
  [21676] = {32,"T2.5"}; --Leggings of the Festering Swa..
  [21678] = {4,"T2.5"}; --Necklace of Purity

  -- Fankriss --
  [21627] = {4,"T2.5"}; --Cloak of Untold Secrets
  [21635] = {104,"T2.5"}; --Barb of the Sand Reaver
  [21639] = {76,"T2.5"}; --Pauldrons of the Unrelenting
  [21645] = {60,"T2.5"}; --Hive Tunneler's Boots
  [21647] = {28,"T2.5"}; --Fetish of the Sand Reaver
  [21650] = {112,"T2.5"}; --Ancient Qiraji Ripper
  [21651] = {52,"T2.5"}; --Scaled Sand Reaver Leggings
  [21652] = {4,"T2.5"}; --Silithid Carapace Chestguard
  [21663] = {136,"T2.5"}; --Robes of the Guardian Saint
  [21664] = {80,"T2.5"}; --Barbed Choker
  [21665] = {72,"T2.5"}; --Mantle of Wicked Revenge
  [22396] = {4,"T2.5"}; --Totem of Life
  [22402] = {4,"T2.5"}; --Libram of Grace

  -- Viscidus --
  [21622] = {100,"T2.5"}; --Sharpened Silithid Femur
  [21623] = {60,"T2.5"}; --Gauntlets of the Right. Champ
  [21624] = {48,"T2.5"}; --Gauntlets of Kalimdor
  [21625] = {48,"T2.5"}; --Scarab Brooch
  [21626] = {4,"T2.5"}; --Slime-coated Leggings
  [21677] = {56,"T2.5"}; --Ring of the Qiraji Fury
  [22399] = {68,"T2.5"}; --Idol of Health
  [20928] = {68,"T2.5"}; --Qiraji Bindings of Command
  [20932] = {68,"T2.5"}; --Qiraji Bindings of Dominance

  -- Princess Huhuran --
  [21616] = {52,"T2.5"}; --Huhuran's Stinger
  [21617] = {64,"T2.5"}; --Wasphide Gauntlets
  [21618] = {24,"T2.5"}; --Hive Defiler Wristguards
  [21619] = {44,"T2.5"}; --Gloves of the Messiah
  [21620] = {80,"T2.5"}; --Ring of the Martyr
  [21621] = {40,"T2.5"}; --Cloak of the Golden Hive

  -- Twin Emperors --
  [21597] = {88,"T2.5"}; --Royal Scepter of Vek'lor
  [21598] = {84,"T2.5"}; --Royal Qiraji Belt
  [21599] = {68,"T2.5"}; --Vek'lor's Gloves of Devastation
  [21600] = {88,"T2.5"}; --Boots of Epiphany
  [21601] = {80,"T2.5"}; --Ring of Emperor Vek'lor
  [21602] = {88,"T2.5"}; --Qiraji Execution Bracers
  [21604] = {80,"T2.5"}; --Bracelets of Royal Redemption
  [21605] = {60,"T2.5"}; --Gloves of the Hidden Temple
  [21606] = {68,"T2.5"}; --Belt of the Fallen Emperor
  [21607] = {20,"T2.5"}; --Grasp of the Fallen Emperor
  [21608] = {80,"T2.5"}; --Amulet of Vek'nilash
  [21609] = {52,"T2.5"}; --Regenerating Belt of Vek'nilash
  [21679] = {48,"T2.5"}; --Kalimdor's Revenge
  [20926] = {72,"T2.5"}; --Vek'nilash's Circlet
  [20930] = {72,"T2.5"}; --Vek'lor's Diadem

  -- Ouro --
  [21610] = {88,"T2.5"}; --Wormscale Blocker
  [21611] = {48,"T2.5"}; --Burrower Bracers
  [21615] = {88,"T2.5"}; --Don Rigoberto's Lost Hat
  [23557] = {128,"T2.5"}; --Larvae of the Great Worm
  [23558] = {24,"T2.5"}; --The Burrower's Shell
  [23570] = {80,"T2.5"}; --Jom Gabbar
  [20927] = {76,"T2.5"}; --Ouro's Intact Hide
  [20931] = {76,"T2.5"}; --Skin of the Great Sandworm
  [20929] = {128,"T2.5"}; --Carapace of the Old God
  [20933] = {128,"T2.5"}; --Husk of the Old God

  -- C'Thun --
  [21126] = {152,"T2.5"}; --Death's Sting
  [21134] = {172,"T2.5"}; --Dark Edge of Insanity
  [21221] = {96,"T2.5"}; --Eye of C'thun
  [21579] = {44,"T2.5"}; --Vanquished Tentacle of C'thun
  [21581] = {116,"T2.5"}; --Gauntlets of Annihilation
  [21582] = {124,"T2.5"}; --Grasp of the Old God
  [21583] = {116,"T2.5"}; --Cloak of Clarity
  [21585] = {132,"T2.5"}; --Dark Storm Gauntlets
  [21586] = {124,"T2.5"}; --Belt of Never-ending Agony
  [21596] = {104,"T2.5"}; --Ring of the Godslayer
  [21709] = {96,"T2.5"}; --Eye of C'thun
  [21710] = {96,"T2.5"}; --Eye of C'thun
  [21712] = {96,"T2.5"}; --Eye of C'thun
  [21839] = {180,"T2.5"}; --Scepter of the False Prophet
  [22730] = {124,"T2.5"}; --Eyestalk Waist Cord
  [22731] = {116,"T2.5"}; --Cloak of the Devoured
  [22732] = {116,"T2.5"}; --Mark of C'thun

  -- T2.5 Tokens --
  [21232] = {116,"T2.5"}; --Imperial Qiraji Armaments
  [21237] = {84,"T2.5"}; --Imperial Qiraji Regalia
  [21242] = {116,"T2.5"}; --Imperial Qiraji Armaments
  [21244] = {116,"T2.5"}; --Imperial Qiraji Armaments
  [21268] = {84,"T2.5"}; --Imperial Qiraji Regalia
  [21269] = {116,"T2.5"}; --Imperial Qiraji Armaments
  [21272] = {116,"T2.5"}; --Imperial Qiraji Armaments
  [21273] = {84,"T2.5"}; --Imperial Qiraji Regalia
  [21275] = {84,"T2.5"}; --Imperial Qiraji Regalia
  [21329] = {72,"T2.5"}; --Conqueror's Battlegear
  [21330] = {68,"T2.5"}; --Conqueror's Battlegear
  [21331] = {128,"T2.5"}; --Conqueror's Battlegear
  [21332] = {76,"T2.5"}; --Conqueror's Battlegear
  [21333] = {68,"T2.5"}; --Conqueror's Battlegear
  [21334] = {128,"T2.5"}; --Doomcaller's Attire
  [21335] = {68,"T2.5"}; --Doomcaller's Attire
  [21336] = {76,"T2.5"}; --Doomcaller's Attire
  [21337] = {72,"T2.5"}; --Doomcaller's Attire
  [21338] = {68,"T2.5"}; --Doomcaller's Attire
  [21343] = {128,"T2.5"}; --Enigma Vestments
  [21344] = {68,"T2.5"}; --Enigma Vestments
  [21345] = {68,"T2.5"}; --Enigma Vestments
  [21346] = {76,"T2.5"}; --Enigma Vestments
  [21347] = {72,"T2.5"}; --Enigma Vestments
  [21348] = {72,"T2.5"}; --Garments of the Oracle
  [21349] = {68,"T2.5"}; --Garments of the Oracle
  [21350] = {68,"T2.5"}; --Garments of the Oracle
  [21351] = {128,"T2.5"}; --Garments of the Oracle
  [21352] = {76,"T2.5"}; --Garments of the Oracle
  [21353] = {72,"T2.5"}; --Genesis Raiment
  [21354] = {68,"T2.5"}; --Genesis Raiment
  [21355] = {68,"T2.5"}; --Genesis Raiment
  [21356] = {76,"T2.5"}; --Genesis Raiment
  [21357] = {128,"T2.5"}; --Genesis Raiment
  [21359] = {68,"T2.5"}; --Deathdealer's Embrace
  [21360] = {72,"T2.5"}; --Deathdealer's Embrace
  [21361] = {68,"T2.5"}; --Deathdealer's Embrace
  [21362] = {76,"T2.5"}; --Deathdealer's Embrace
  [21364] = {128,"T2.5"}; --Deathdealer's Embrace
  [21365] = {68,"T2.5"}; --Striker's Garb
  [21366] = {72,"T2.5"}; --Striker's Garb
  [21367] = {68,"T2.5"}; --Striker's Garb
  [21368] = {76,"T2.5"}; --Striker's Garb
  [21370] = {128,"T2.5"}; --Striker's Garb
  [21372] = {72,"T2.5"}; --Stormcaller's Garb
  [21373] = {68,"T2.5"}; --Stormcaller's Garb
  [21374] = {128,"T2.5"}; --Stormcaller's Garb
  [21375] = {76,"T2.5"}; --Stormcaller's Garb
  [21376] = {68,"T2.5"}; --Stormcaller's Garb
  [21387] = {72,"T2.5"}; --Avenger's Battlegear
  [21388] = {68,"T2.5"}; --Avenger's Battlegear
  [21389] = {128,"T2.5"}; --Avenger's Battlegear
  [21390] = {76,"T2.5"}; --Avenger's Battlegear
  [21391] = {68,"T2.5"}; --Avenger's Battlegear

  ----------------------
  --- Blackwing Lair ---
  ----------------------

  -- Trash Loot --
  [19354] = {16,"T2"}; --Draconic Avenger
  [19358] = {12,"T2"}; --Draconic Maul
  [19362] = {32,"T2","Orc Fury>Rest"}; --Doom's Edge
  [19434] = {40,"T2"}; --Band of Dark Dominion
  [19435] = {8,"T2"}; --Essence Gatherer
  [19436] = {22,"T2","Fluffi>Klik>Fury/Cat>Enhance>Rest"}; --Cloak of Draconic Might
  [19437] = {48,"T2"}; --Boots of Pure Thought
  [19438] = {38,"T2"}; --Ringo's Blizzard Boots
  [19439] = {4,"T2"}; --Interlaced Shadow Jerkin

  -- Shared Loot --
  [19353] = {32,"T2"}; --Drake Talon Cleaver
  [19355] = {48,"T2"}; --Shadow Wing Focus Staff
  [19394] = {52,"T2","Klik>Rest"}; --Drake Talon Pauldrons
  [19395] = {116,"T2"}; --Rejuvenating Gem
  [19396] = {33,"T2","Feral>Rest"}; --Taut Dragonhide Belt
  [19397] = {40,"T2"}; --Ring of Blackrock
  [16913] = {32,"T2"}; --Netherwind Regalia
  [16940] = {32,"T2"}; --Dragonstalker Armor
  [16964] = {32,"T2"}; --Battlegear of Wrath
  [16907] = {32,"T2"}; --Bloodfang Armor
  [16928] = {32,"T2"}; --Nemesis Raiment
  [16920] = {32,"T2"}; --Vestments of Transcendence
  [16899] = {32,"T2"}; --Stormrage Raiment
  [16956] = {32,"T2"}; --Judgement Armor
  [16948] = {32,"T2"}; --The Ten Storms

  -- Razorgore --
  [19334] = {32,"T2"}; --The Untamed Blade
  [19335] = {20,"T2"}; --Spineshatter
  [19336] = {16,"T2"}; --Arcane Infused Gem
  [19337] = {16,"T2"}; --The Black Book
  [19369] = {16,"T2"}; --Gloves of Rapid Evolution
  [19370] = {72,"T2"}; --Mantle of the Blackwing Cabal
  [16918] = {28,"T2"}; --Netherwind Regalia
  [16935] = {28,"T2"}; --Dragonstalker Armor
  [16959] = {28,"T2"}; --Battlegear of Wrath
  [16911] = {28,"T2"}; --Bloodfang Armor
  [16934] = {28,"T2"}; --Nemesis Raiment
  [16926] = {28,"T2"}; --Vestments of Transcendence
  [16904] = {28,"T2"}; --Stormrage Raiment
  [16951] = {28,"T2"}; --Judgement Armor
  [16943] = {28,"T2"}; --The Ten Storms

  -- Vaelastrasz --
  [19339] = {40,"T2"}; --Mind Quickening Gem
  [19340] = {16,"T2"}; --Rune of Metamorphosis
  [19346] = {48,"T2","Klik>Vayu>Dagger Rogue>Rest"}; --Dragonfang Blade
  [19348] = {28,"T2"}; --Red Dragonscale Protector
  [19371] = {28,"T2"}; --Pendant of the Fallen Dragon
  [19372] = {44,"T2","Tank>DPS"}; --Helm of Endless Rage
  [16818] = {32,"T2"}; --Netherwind Regalia
  [16936] = {32,"T2"}; --Dragonstalker Armor
  [16960] = {32,"T2"}; --Battlegear of Wrath
  [16910] = {32,"T2"}; --Bloodfang Armor
  [16933] = {32,"T2"}; --Nemesis Raiment
  [16925] = {32,"T2"}; --Vestments of Transcendence
  [16903] = {32,"T2"}; --Stormrage Raiment
  [16952] = {32,"T2"}; --Judgement Armor
  [16944] = {32,"T2"}; --The Ten Storms

  -- Broodlord Lashlayer --
  [19341] = {40,"T2"}; --Lifegiving Gem
  [19342] = {16,"T2"}; --Venomous Totem
  [19350] = {40,"T2"}; --Heartstriker
  [19351] = {92,"T2","Sword Rogue>Edgemasters Fury>Rest"}; --"Maladath, Runed Blade of the.."
  [19373] = {40,"T2"}; --Black Brood Pauldrons
  [19374] = {72,"T2","Mage/WL>Rest"}; --Bracers of Arcane Accuracy
  [20383] = {40,"T2"}; --Head of Broodlord Lashlayer
  [16912] = {32,"T2"}; --Netherwind Regalia
  [16941] = {32,"T2"}; --Dragonstalker Armor
  [16965] = {32,"T2"}; --Battlegear of Wrath
  [16906] = {32,"T2"}; --Bloodfang Armor
  [16927] = {32,"T2"}; --Nemesis Raiment
  [16919] = {32,"T2"}; --Vestments of Transcendence
  [16898] = {32,"T2"}; --Stormrage Raiment
  [16957] = {32,"T2"}; --Judgement Armor
  [16949] = {32,"T2"}; --The Ten Storms

  -- Firemaw --
  [19343] = {20,"T2"};--Scrolls of Blinding Light
  [19344] = {20,"T2"}; --Natural Alignment Crystal
  [19365] = {52,"T2"}; --Claw of the Black Drake
  [19398] = {32,"T2","Rogue>Rest"}; --Cloak of Firemaw
  [19399] = {12,"T2"}; --Black Ash Robe
  [19400] = {44,"T2","SPriest>Rest"}; --Firemaw's Clutch
  [19401] = {20,"T2"}; --Primalist's Linked Legguards
  [19402] = {24,"T2"}; --Legguards of the Fallen Crusader

  -- Ebonroc --
  [19345] = {20,"T2"}; --Aegis of Preservation
  [19368] = {34,"T2"}; --Dragonbreath Hand Cannon
  [19403] = {52,"T2", "Mage/WL>Rest"}; --Band of Forced Concentration
  [19405] = {60,"T2","Bear>Rest"}; --Malfurion's Blessed Bulwark
  [19406] = {116,"T2","Fluffi>Klik>Fury/Rogue/Cat>Rest"}; --Drake Fang Talisman
  [19407] = {40,"T2"}; --Ebony Flame Gloves

  -- Flamegor --
  [19357] = {32,"T2"}; --Herald of Woe
  [19367] = {32,"T2"}; --Dragon's Touch
  [19430] = {52,"T2","Shaman>Rest"}; --Shroud of Pure Thought
  [19431] = {70,"T2"}; --Styleen's Impeding Scarab
  [19432] = {32,"T2","Feral>Rest"}; --Circle of Applied Force
  [19433] = {12,"T2"}; --Emberweave Leggings

  -- Chromaggus --
  [19347] = {72,"T2"}; --Claw of Chromaggus
  [19349] = {62,"T2","Klik>Rest"}; --Elementium Reinforced Bulwark
  [19352] = {76,"T2","Sword Rogue>Edgemaster Fury>Rest"}; --Chromatically Tempered Sword
  [19361] = {124,"T2"}; --"Ashjre'thul, Crossbow of Smiting"
  [19385] = {100,"T2"}; --Empowered Leggings
  [19386] = {32,"T2","Bear>Rest"}; --Elementium Threaded Cloak
  [19387] = {84,"T2","Fury>Rest"}; --Chromatic Boots
  [19388] = {36,"T2"}; --Angelista's Grasp
  [19389] = {44,"T2","Bear>Rest"}; --Taut Dragonhide Shoulderpads
  [19390] = {24,"T2"}; --Taut Dragonhide Gloves
  [19391] = {40,"T2"}; --Shimmering Geta
  [19392] = {22,"T2"}; --Girdle of the Fallen Crusader
  [19393] = {16,"T2"}; --Primalist's Linked Waistguard
  [16937] = {40,"T2"}; --Dragonstalker Armor
  [16961] = {40,"T2"}; --Battlegear of Wrath
  [16932] = {40,"T2"}; --Nemesis Raiment
  [16924] = {40,"T2"}; --Vestments of Transcendence
  [16902] = {40,"T2"}; --Stormrage Raiment
  [16953] = {40,"T2"}; --Judgement Armor
  [16945] = {40,"T2"}; --The Ten Storms
  [16917] = {40,"T2"}; --Netherwind Regalia
  [16832] = {40,"T2"}; --Bloodfang Armor

  -- Nefarian --
  [19003] = {52,"T2"}; --Head of Nefarian
  [19356] = {80,"T2","Mage/WL>Rest"}; --Staff of the Shadow Flame
  [19360] = {60,"T2","Druid/Shaman>Priest"}; --Lok'amir il Romathis
  [19363] = {100,"T2","Orc/Edgemaster DPS War>Rest"}; --"Crul'shoruk, Edge of Chaos"
  [19364] = {64,"T2"}; --"Ashkandi, Greatsword of the Bro.."
  [19375] = {96,"T2","Mage/WL>Rest"}; --"Mish'undare, Circlet of the Mind Flayer"
  [19376] = {20,"T2","Tank>Rest"}; --Archimtiros' Ring of Reckoning
  [19377] = {76,"T2","Rogue>Hunter/Cat>Rest"}; --Prestor's Talisman of Connivery
  [19378] = {30,"T2"}; --Cloak of the Brood Lord
  [19379] = {116,"T2","Mage/WL>Rest"}; --Neltharion's Tear
  [19380] = {36,"T2","Enhance>Rest"}; --Therazane's Link
  [19381] = {84,"T2","Bear>Rogue/Cat"}; --Boots of the Shadow Flame
  [19382] = {76,"T2"}; --Pure Elementium Band
  [19366] = {52,"T2","Physical DPS>Rest"}; --Head of Nefarian
  [19383] = {52,"T2","Physical DPS>Rest"}; --Head of Nefarian
  [19384] = {52,"T2","Physical DPS>Rest"}; --Head of Nefarian
  [16916] = {48,"T2"}; --Netherwind Regalia
  [16942] = {48,"T2"}; --Dragonstalker Armor
  [16966] = {48,"T2"}; --Battlegear of Wrath
  [16905] = {48,"T2"}; --Bloodfang Armor
  [16931] = {48,"T2"}; --Nemesis Raiment
  [16923] = {48,"T2"}; --Vestments of Transcendence
  [16897] = {48,"T2"}; --Stormrage Raiment
  [16958] = {48,"T2"}; --Judgement Armor
  [16950] = {48,"T2"}; --The Ten Storms

  -------------------
  --- Molten Core ---
  -------------------

  -- Trash loot --
  [16799] = {8,"T1"}; --Arcanist Regalia WRIST
  [16802] = {8,"T1"}; --Arcanist Regalia BELT
  [16804] = {8,"T1"}; --Felheart Raiment
  [16806] = {8,"T1"}; --Felheart Raiment
  [16817] = {8,"T1"}; --Vestments of Prophecy
  [16819] = {8,"T1"}; --Vestments of Prophecy
  [16825] = {8,"T1"}; --Nightslayer Armor
  [16827] = {8,"T1"}; --Nightslayer Armor
  [16828] = {8,"T1"}; --Cenarion Raiment
  [16830] = {8,"T1"}; --Cenarion Raiment
  [16838] = {8,"T1"}; --The Earthfury
  [16840] = {8,"T1"}; --The Earthfury
  [16850] = {8,"T1"}; --Giantstalker Armor
  [16851] = {8,"T1"}; --Giantstalker Armor
  [16857] = {8,"T1"}; --Lawbringer Armor
  [16858] = {8,"T1"}; --Lawbringer Armor
  [16861] = {8,"T1"}; --Battlegear of Might
  [16864] = {8,"T1"}; --Battlegear of Might

  -- Flamewalker Shared Loot --
  [17077] = {4,"T1","PVP/Farm"}; --Crimson Shocker
  [18861] = {4,"T1"}; --Flamewalker Legplates
  [18879] = {30,"T1"}; --Heavy Dark Iron Ring
  [18870] = {8,"T1"}; --Helm of the Lifegiver
  [18872] = {8,"T1"}; --Manastorm Leggings
  [19147] = {30,"T1"}; --Ring of Spell Power
  [19145] = {30,"T1"}; --Robe of Volatile Power
  [18875] = {42,"T1"}; --Salamander Scale Pants
  [18878] = {16,"T1"}; --Sorcerous Dagger
  [19146] = {8,"T1"}; --Wristguards of Stability

  -- Non-Flamewalker Shared Loot --
  [18823] = {12,"T1","Dagger Rogues"}; --Aged Core Leather Gloves
  [18829] = {20,"T1"}; --Deep Earth Spaulders
  [19142] = {12,"T1"}; --Fire Runed Grimoire
  [19143] = {14,"T1"}; --Flameguard Gauntlets
  [18824] = {8,"T1"}; --Magma Tempered Boots
  [19136] = {28,"T1"}; --Mana Igniting Cord
  [18822] = {12,"T1"}; --Obsidian Edged Blade
  [18821] = {36,"T1"}; --Quick Strike Ring
  [19144] = {12,"T1"}; --Sabatons of the Flamewalker
  [18820] = {36,"T1"}; --Talisman of Ephemeral Power

  -- Lucifron --
  [16665] = {0,"T1"}; --Tome of Tranquilizing Shot
  [17109] = {8,"T1"}; --Choker of Enlightenment
  [16805] = {12,"T1"}; --Felheart Raiment
  [16800] = {12,"T1"}; --Arcanist Regalia
  [16829] = {12,"T1"}; --Cenarion Raiment
  [16837] = {12,"T1"}; --The Earthfury
  [16859] = {12,"T1"}; --Lawbringer Armor
  [16863] = {12,"T1"}; --Battlegear of Might

  -- Magmadar --
  [17065] = {36,"T1"}; --Medallion of Steadfast Might
  [17073] = {12,"T1","PVP"}; --Earthshaker
  [18203] = {16,"T1","Tanks"}; --Eskhandar's Right Claw
  [17069] = {25,"T1","Melee DPS"}; --Striker's Mark (slightly more expensive than Blastershot Launcher)
  [18832] = {24,"T1", "Sword Rogues>Warriors"}; --Brutality Blade (Offhand)
  [17066] = {24,"T1"}; --Drillborer Disk
  [17071] = {12,"T1"}; --Gutgore Ripper
  [16814] = {12,"T1"}; --Vestments of Prophecy
  [16796] = {12,"T1"}; --Arcanist Regalia
  [16810] = {12,"T1"}; --Felheart Raiment
  [16822] = {12,"T1"}; --Nightslayer Armor
  [16835] = {12,"T1"}; --Cenarion Raiment
  [16847] = {12,"T1"}; --Giantstalker Armor
  [16843] = {12,"T1"}; --The Earthfury
  [16855] = {12,"T1"}; --Lawbringer Armor
  [16867] = {12,"T1"}; --Battlegear of Might

  -- Gehennas --
  [16812] = {12,"T1"}; --Vestments of Prophecy
  [16826] = {12,"T1"}; --Nightslayer Armor
  [16849] = {12,"T1"}; --Giantstalker Armor
  [16839] = {12,"T1"}; --The Earthfury
  [16860] = {12,"T1"}; --Lawbringer Armor
  [16862] = {12,"T1"}; --Battlegear of Might

  -- Garr --
  [18564] = {0,"T1"}; --Bindings of the Windseeker
  [17105] = {22,"T1"}; --Aurastone Hammer
  [16813] = {12,"T1"}; --Vestments of Prophecy
  [16795] = {12,"T1"}; --Arcanist Regalia
  [16808] = {12,"T1"}; --Felheart Raiment
  [16821] = {12,"T1"}; --Nightslayer Armor
  [16834] = {12,"T1"}; --Cenarion Raiment
  [16846] = {12,"T1"}; --Giantstalker Armor
  [16842] = {12,"T1"}; --The Earthfury
  [16854] = {12,"T1"}; --Lawbringer Armor
  [16866] = {12,"T1"}; --Battlegear of Might


  -- Geddon --
  [18563] = {0,"T1"}; --Bindings of the Windseeker
  [17110] = {8,"T1"}; --Seal of the Archmagus
  [16797] = {12,"T1"}; --Arcanist Regalia
  [16807] = {12,"T1"}; --Felheart Raiment
  [16836] = {12,"T1"}; --Cenarion Raiment
  [16844] = {12,"T1"}; --The Earthfury
  [16856] = {12,"T1"}; --Lawbringer Armor

  -- Shazzrah --
  [16811] = {12,"T1"}; --Vestments of Prophecy
  [16801] = {12,"T1"}; --Arcanist Regalia
  [16803] = {12,"T1"}; --Felheart Raiment
  [16824] = {12,"T1"}; --Nightslayer Armor
  [16831] = {12,"T1"}; --Cenarion Raiment
  [16852] = {12,"T1"}; --Giantstalker Armor


  -- Sulfuron --
  [17074] = {4,"T1"}; --Shadowstrike
  [16816] = {12,"T1"}; --Vestments of Prophecy
  [16823] = {12,"T1"}; --Nightslayer Armor
  [16848] = {12,"T1"}; --Giantstalker Armor
  [16868] = {12,"T1"}; --Battlegear of Might

  -- Golemagg --
  [17103] = {28,"T1"}; --Azuresong Mageblade
  [18842] = {24,"T1"}; --Staff of Dominance
  [17072] = {22,"T1"}; --Blastershot Launcher
  [16809] = {16,"T1"}; --Felheart Raiment
  [16820] = {16,"T1"}; --Nightslayer Armor
  [16853] = {16,"T1"}; --Lawbringer Armor
  [16865] = {16,"T1"}; --Battlegear of Might
  [16815] = {16,"T1"}; --Vestments of Prophecy
  [16833] = {16,"T1"}; --Cenarion Raiment
  [16841] = {16,"T1"}; --The Earthfury
  [16845] = {16,"T1"}; --Giantstalker Armor
  [16798] = {16,"T1"}; --Arcanist Regalia

  -- Majordomo Executus --
  [18646] = {22,"T1"}; --The Eye of Divinity (Aurastone hammer price, since its 50/50)
  [18703] = {22,"T1"}; --Ancient Petrified Leaf (same as eye)
  [18803] = {12,"T1","PVP"}; --Finkle's Lava Dredger
  [18805] = {32,"T1","Dagger rogues>Rest"}; --Core Hound Tooth OH
  [18806] = {4,"T1"}; --Core Forged Greaves
  [18808] = {16,"T1"}; --Gloves of the Hypnotic Flame
  [18809] = {16,"T1","SPriest>Warlock"}; --Sash of Whispered Secrets
  [18810] = {36,"T1"}; --Wild Growth Spaulders
  [18811] = {4,"T1"}; --Fireproof Cloak
  [18812] = {28,"T1"}; --Wristguards of True Flight
  [19139] = {4,"T1"}; --Fireguard Shoulders
  [19140] = {28,"T1","1 Per Healer"}; --Cauterizing Band

  -- Ragnaros --
  [17063] = {48,"T1"}; --Band of Accuria
  [17204] = {15,"T1"}; --Eye of Sulfuras (has to cost something)
  [18814] = {36,"T1"}; --Choker of the Firelord (should be same price as trinket, gets replaced at the same time)
  [18815] = {12,"T1"}; --Essence of the Pure Flame
  [18816] = {40,"T1"}; --Perdition's Blade MH
  [18817] = {40,"T1"}; --Crown of Destruction
  [19137] = {48,"T1"}; --Onslaught Girdle
  [19138] = {24,"T1"}; --Band of Sulfuras
  [17082] = {12,"T1"}; --Shard of the Flame
  [17102] = {20,"T1"}; --Cloak of the Shrouded Mists
  [17104] = {20,"T1"}; --Spinal Reaper
  [17106] = {16,"T1"}; --Malistar's Defender
  [17107] = {16,"T1"}; --Dragon's Blood Cape
  [16901] = {32,"T2"}; --Stormrage Raiment
  [16909] = {32,"T2"}; --Bloodfang Armor
  [16915] = {32,"T2"}; --Netherwind Regalia
  [16922] = {32,"T2"}; --Vestments of Transcendence
  [16930] = {32,"T2"}; --Nemesis Raiment
  [16938] = {32,"T2"}; --Dragonstalker Armor
  [16946] = {32,"T2"}; --The Ten Storms
  [16954] = {32,"T2"}; --Judgement Armor
  [16962] = {32,"T2"}; --Battlegear of Wrath
  [17076] = {40,"T1"}; --Bonereaver's Edge

  ---------------------
  --- Single Bosses ---
  ---------------------

  --Onyxia--
  [16908] = {40,"T2"}; --Bloodfang Armor
  [16900] = {40,"T2"}; --Stormrage Raiment --head
  [16914] = {40,"T2"}; --Netherwind Regalia
  [16921] = {40,"T2"}; --Vestments of Transcendence
  [16929] = {40,"T2"}; --Nemesis Raiment
  [16939] = {40,"T2"}; --Dragonstalker Armor
  [16947] = {40,"T2"}; --The Ten Storms
  [16955] = {40,"T2"}; --Judgement Armor
  [16963] = {40,"T2"}; --Battlegear of Wrath
  [17064] = {52,"T1.5"}; --Shard of the Scale
  [17067] = {12,"T1.5","PVP"}; --Ancient Cornerstone Grimoire
  [17068] = {32,"T1.5"}; --Deathbringer (seems fair)
  [17070] = {36,"T1.5"}; --Fang of the Mystics
  [17075] = {32,"T1.5"}; --Vis'kag the Bloodletter (More expensive than Brutality blade, worse than Deathbringer)
  [17078] = {16,"T1.5"}; --Sapphiron Drape

  [17111] = {16,"T1.5"}; --Blazefury Medallion
  [17112] = {20,"T1.5"}; --Empyrean Demolisher
  [17113] = {24,"T1.5"}; --Amberseal Keeper
  [18202] = {20,"T1.5"}; --Eskhandar's Left Claw
  [18204] = {12,"T1.5"}; --Eskhandar's Pelt
  [18205] = {16,"T1.5"}; --Eskhandar's Collar
  [18208] = {12,"T1.5"}; --Drape of Benediction
  [18403] = {0,"T1.5"}; --Head of Onyxia
  [18404] = {0,"T1.5"}; --Head of Onyxia
  [18406] = {0,"T1.5"}; --Head of Onyxia
  [18422] = {0,"T1.5"}; --Head of Onyxia // Horde
  [18423] = {0,"T1.5"}; --Head of Onyxia // Alliance
  [18541] = {52,"T1.5"}; --Puissant Cape
  [18542] = {12,"T1.5"}; --Typhoon
  [18543] = {12,"T1.5"}; --Ring of Entropy
  [18544] = {20,"T1.5"}; --Doomhide Gauntlets
  [18545] = {4,"T1.5"}; --Leggings of Arcane Supremacy
  [18546] = {24,"T1.5"}; --Infernal Headcage
  [18547] = {4,"T1.5"}; --Unmelting Ice Girdle
  [18665] = {0,"T1.5"}; --The Eye of Shadow
  [18704] = {0,"T1.5"}; --Mature Blue Dragon Sinew
  [18705] = {0,"T1.5"}; --Mature Black Dragon Sinew
  [18813] = {4,"T1.5"}; --Ring of Binding
  [19130] = {46,"T1.5"}; --Cold Snap
  [19131] = {56,"T1.5"}; --Snowblind Shoes
  [19132] = {60,"T1.5"}; --Crystal Adorned Crown
  [19133] = {54,"T1.5"}; --Fel Infused Leggings
  [19134] = {16,"T1.5"}; --Flayed Doomguard Belt
  [19135] = {12,"T1.5"}; --Blacklight Bracer
  [20577] = {36,"T1.5"}; --Nightmare Blade
  [20578] = {36,"T1.5"}; --Emerald Dragonfang
  [20579] = {4,"T1.5"}; --Green Dragonskin Cloak
  [20580] = {32,"T1.5"}; --Hammer of Bestial Fury
  [20581] = {40,"T1.5"}; --Staff of Rampant Growth
  [20582] = {20,"T1.5"}; --Trance Stone
  [20599] = {28,"T1.5"}; --Polished Ironwood Crossbow
  [20600] = {4,"T1.5"}; --Nightmare Engulfed Object
  [20615] = {16,"T1.5"}; --Dragonspur Wraps
  [20616] = {16,"T1.5"}; --Dragonbone Wristguards
  [20617] = {28,"T1.5"}; --Ancient Corroded Leggings
  [20618] = {40,"T1.5"}; --Gloves of Delusional Power
  [20619] = {4,"T1.5"}; --Acid Inscribed Greaves
  [20621] = {24,"T1.5"}; --Boots of the Endless Moor
  [20622] = {20,"T1.5"}; --Dragonheart Necklace
  [20623] = {32,"T1.5"}; --Circlet of Restless Dreams
  [20624] = {24,"T1.5"}; --Ring of the Unliving
  [20625] = {4,"T1.5"}; --Belt of the Dark Bog
  [20626] = {20,"T1.5"}; --Black Bark Wristbands
  [20627] = {50,"T1.5"}; --Dark Heart Pants
  [20628] = {54,"T1.5"}; --Deviate Growth Cap
  [20629] = {12,"T1.5"}; --Malignant Footguards
  [20630] = {10,"T1.5"}; --Gauntlets of the Shining Light
  [20631] = {40,"T1.5"}; --Mendicant's Slippers
  [20632] = {20,"T1.5"}; --Mindtear Band
  [20633] = {4,"T1.5"}; --Unnatural Leather Spaulders
  [20634] = {24,"T1.5"}; --Boots of Fright
  [20635] = {36,"T1.5"}; --Jade Inlaid Vestments
  [20636] = {52,"T1.5"}; --Hibernating Crystal
  [20637] = {4,"T1.5"}; --Acid Inscribed Pauldrons
  [20638] = {32,"T1.5"}; --Leggings of the Demented Mind
  [20639] = {12,"T1.5"}; --Strangely Glyphed Legplates
  [20644] = {4,"T1.5"}; --Nightmare Engulfed Object
}
--[[local price_scaling = {
  ["T1"] = 1,
  ["T1.5"] = 1.5,
  ["T2"] = 3,
  ["T2.5"] = 6,
  ["T3"] = 9
}]]
--[[
itemID, itemType, itemSubType, itemEquipLoc, icon, itemClassID, itemSubClassID = GetItemInfoInstant(itemID or "itemString" or "itemName" or "itemLink")
itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemID or "itemString" or "itemName" or "itemLink")
Search for ItemMixin
]]
local progress_scaling = {
  ["T3"] =   {["T3"]=1,  ["T2.5"]=1,  ["T2"]=1,  ["T1.5"]=1,["T1"]=1},
  ["T2.5"] = {["T3"]=1.5,["T2.5"]=1.5,["T2"]=2,  ["T1.5"]=2,["T1"]=2},
  ["T2"] =   {["T3"]=2,  ["T2.5"]=2,  ["T2"]=3,  ["T1.5"]=3,["T1"]=4.5},
  ["T1"] =   {["T3"]=4.5,["T2.5"]=4.5,["T2"]=4.5,["T1.5"]=6,["T1"]=9}
}
local function get_adjusted_price(price,tier,progress)
  if not progress_scaling[progress] then return price end
  if not progress_scaling[progress][tier] then return price end
  return math.floor(progress_scaling[progress][tier] * price)
end

function bepgp_prices:GetPrice(item,progress)
  if not (type(item)=="number" or type(item)=="string") then return end
  if not progress then progress = "T3" end
  local price,itemID,data,tier
  itemID = GetItemInfoInstant(item)
  if (itemID) then
    data = prices[itemID]
    if (data) then
      price, tier = data[1], data[2]
      price = get_adjusted_price(price,tier,progress)
    else
      return
    end
  end
  return price
end

function bepgp_prices:GetItemNote(item)
  if not (type(item)=="number" or type(item)=="string") then return end
  local itemID, data, note
  itemID = GetItemInfoInstant(item)
  if (itemID) then
    data = prices[itemID]
    if (data) then
      note = data[3]
    end
  end
  return note or "no note"
end

function bepgp_prices:OnEnable()
  bepgp:RegisterPriceSystem(name_version,bepgp_prices.GetPrice)
  local mzt,_,_,_,reason = GetAddOnInfo("MizusRaidTracker")
  if not (reason == "ADDON_MISSING" or reason == "ADDON_DISABLED") then
    local loaded, finished = IsAddOnLoaded("MizusRaidTracker")
    if loaded then
      self:ADDON_LOADED("ADDON_LOADED","MizusRaidTracker")
    else
      self:RegisterEvent("ADDON_LOADED")
    end
  end
end

function bepgp_prices:ADDON_LOADED(event,...)
  if ... == "MizusRaidTracker" then
    self:UnregisterEvent("ADDON_LOADED")
    local MRT_ItemCost = function(mrt_data)
      local itemstring = mrt_data.ItemString
      local dkpValue = self:GetPrice(itemstring, bepgp.db.profile.progress)
      local itemNote
      if not dkpValue then
        dkpValue = 0
        itemNote = ""
      else
        local dkpValue2 = math.floor(dkpValue*bepgp.db.profile.discount)
        itemNote = string.format("%d or %d", dkpValue, dkpValue2)
      end
      return dkpValue, mrt_data.Looter, itemNote, "", true
    end
    if MRT_RegisterItemCostHandlerCore then
      MRT_RegisterItemCostHandlerCore(MRT_ItemCost, addonName)
    end
  end
end

bepgp_prices._prices = prices
