local addon, dark_addon = ...

dark_addon.rotation.spellbooks.druid = {

	-- All specs
	AutoAttack = 6603,
	Typhoon = 132469,
	SkullBash = 106839,
	MightyBash = 175682,
	RemoveCorruption = 2782,
	Soothe = 2908,
	Barkskin = 22812,
	SurvivalInstincts = 61336,
	Moonfire = 8921,
	Regrowth = 8936,
	Clearcasting = 16870,
	Renewal = 108238,
	TravelForm = 783,
	Hibernate = 2637,
	TigerDash = 252216,
	
	-- Balance
	MoonkinForm = 24858,
	SolarWrath = 190984,
	Starsurge = 78674,
	LunarStrike = 194153,
	Sunfire = 93402,
	RemoveCorruption = 2782,
	Starfall = 191034,
	Soothe = 2908,
	SolarBeam = 78675,
	WarriorOfElune = 202425,
	IncarnationB = 102560,
	FuryOfElune = 202770,
	Flap = 164862,
	MoonfireDebuff = 164812,
	SunfireDebuff = 164815,
	LunarEmpowerment = 164547,
	SolarEmpowerment = 164545,
	
	-- Feral
	CatForm = 768,
	FerociousBite = 22568,
	Rake = 1822,
	RakeDebuff = 155722,
	ThrashCat = 106830,
	TigersFury = 5217,
	Prowl = 5215,
	Rip = 1079,
	SwipeCat =106785,
	Berserk = 106951,
	Maim = 22570,
	PredatorySwiftness = 16974,
	Shred = 5221,
	Dash = 1850,
	SavageRoar = 52610,
	ClearcastingF = 135700,
	
	-- Guardian
	BearForm = 5487,
	Maul = 6807,
	ThrashBear = 77758,
	ThrashDebuff = 192090,
	Ironfur = 192081,
	SwipeBear = 213771,
	FrenziedRegeneration = 22842,
	StampedingRoar = 106898,
	Mangle = 33917,
	BristlingFur = 155835,
	WildCharge = 16979,
	Pulverize = 80313,
	StampedingRoar = 77761,
	GalacticGuardian = 203964,
	
	-- Restoration
	Rejuvenation = 774,
	Swiftmend = 18562,
	Lifebloom = 33763,
	NaturesCure = 88423,
	WildGrowth = 48438,
	Innervate = 29166,
	Ironbark = 102342,
	Revitalize = 212040,
	Efflorescence = 145205,
	Tranquility = 740,
	CenarionWard = 102351,
	IncarnationR = 33891,
	Flourish = 197721,
	TranquilityBuff = 157982,
	UrsolsVortex = 102793,
}

dark_addon.rotation.dispellbooks.soothe = {
	-- Soothe
	[228318] = "Raging", -- Raging Affix	All	-	No	+100% damage dealt
	[255824] = "Fanatic's Rage", -- Dazar'ai Juggernaut	Atal'Dazar	12	Yes	+50% attack speed +20% dmg dealt, -50% mvespd
	[257476] = "Bestial Wrath", -- Irontide Mastiff	Freehold	60	No	+50% damage dealt
	[269976] = "Ancestral Fury", -- Shadow-Borne Champion	King's Rest	-	No	+100% damage dealt
	[262092] = "Inhale Vapors", -- Addled Thug	Motherlode	15	Yes	+50% damage dealt
	[272888] = "Ferocity", -- Ashvane Destroyer	Siege of Boralus	15	No	+65% haste
	[259975] = "Enrage", -- The Sand Queen	Tol Dagor	4	No	+5% damage, +5% haste, Stacks
	[265081] = "Warcry", -- Chosen Blood Matron	Underrot	30	No	+100% haste, AoE
	[266209] = "Wicked Frenzy", -- Fallen Deathspeaker	Underrot	8	Yes	+100% haste, Shadow damage on melee
	[257260] = "Enrage" -- Thornguard	Waycrest Manor	10	No	+25% damage dealt
}
dark_addon.rotation.spellbooks.purgeables = {
  [255579] = "Gilded Claws",
  [257397] = "Healing Balms",
  [270901] = "Induced REgeneration",
  [273432] = "Bound by Shadow",
  [267256] = "Earthwall",
  [267977] = "Tidal Surge",
  [276266] = "Spirit Swiftness",
  [268030] = "Mending Rapids",
  [274210] = "Reanimated Bones",
  [268375] = "Detect Thoughts",
  [276767] = "Consuming Void",
  [256957] = "Watertight Shell",
  [272659] = "electrified Scales",
  [269896] = "embryonic vigor",
  [265912] = "accumualtedCharge",
  [263224] = "Mark of the blood god",
  [258133] = "DarkStep",
  [258153] = "Watery Dome",
  [256849] = "DinoBuff",
  [268375] = "?",
  [276767] = "?",
  [256957] = "?",
  [272659] = "?",
  [262947] = "?",
  [262540] = "?",
  [66009] = "Hand of Protection",
  [12472] = "Icy Veins",
  [10060] = "Power Infusion",
  [2825] = "Bloodlust",
  [29166] = "Innervate",
  [12042] = "Arcane Power",
  [32182] = "Heroism",
  [1044] = "Blessing of Freedom",
  [198111] = "Temporal Shield",
  [213610] = "Holy Ward",
  [196098] = "Soul Harvest",
  [11426] = "Ice Barrier",
  [212295] = "Nether Ward",
  [196762] = "Inner Focus",
  [198144] = "Ice Form",
  [235450] = "Prismatic Barrier",
  [235313] = "Blazing Barrier",
  [190319] = "Combustion",
  [210294] = "Divine Favor",
  [33763] = "Lifebloom"
}


dark_addon.rotation.CC = {
  [31589] = "Slow",
  [339] = "Entangling Roots",
  [2637] = "Hibernate",
  [41085] = "Freezing Trap",
  [9484] = "Shackle Undead",
  [51514] = "Hex",
  --[5782] = "Fear",
  [217832] = "Imprison",
  [118] = "Polymorph",
  [161372] = "Polymorph Peacock",
  [61780] = "Polymorph Turkey",
  [161353] = "Polymorph Polar Bear",
  [161354] = "Polymorph Monkey",
  [161355] = "Polymorph Penguin",
  [28271] = "Polymorph Turtle",
  [28272] = "Polymorph Pig",
  [61305] = "Polymorph Black Cat",
  [61721] = "Polymorph Rabbit",
  [5246] = "Intimidating Shout",
  [22884] = "Psychic Scream",
  [277787] = "Polymorph Direhorn",
  [277792] = "Polymorph BumbleBee",
  [210873] = "Hex Dinosaur",
  [211004] = "Hex Spider",
  [211010] = "Hex Snake",
  [211015] = "Hex Cockraoch",
  [269352] = "Hex Dinosaur",
  [277778] = "Hex Zandalari Tendonripper",
  [20066] = "Rependance",
  [277784] = "Hex White Mongrel",
  [2094] = "Blind",
  [6770] = "Sap",
  [1776] = "Gouge",
  [5101] = "Dazed",
  [13496] = "Dazed",
  [35955] = "Dazed",
  [50259] = "Dazed",
  [116] = "Frostbolt",
  [183218] = "Hand of Hindrance",
  [16979] = "Wild Charge",
  [339] = "Entangling Roots",
  [233755] = "Deep Roots",
  [206852] = "Deep Roots",
  [200931] = "Encroaching Vines",
  [200549] = "Prickling Thorns",
  [202226] = "Entangling Claws",
  [122] = "Frost Nova",
  [116095] = "Disable",
  [103828] = "Warbringer",
  [2484] = "Earthbind Totem",
  [196840] = "Frost Shock",
  [3408] = "Crippling Poison",
  [44614] = "Flurry",  
  [120] = "Cone of Cold",
  [13809] = "Ice Trap",
  [5116] = "Concussive Shot",
  [45524] = "Chains of Ice",
  [22570] = "maim",
  [6789] = "Mortal Coil",
  [19387] = "Entrapment"	
}
dark_addon.rotation.dispellbooks.dispel = {
 [252781] = "Unstable Hex",
 [250096] = "Wracking Pain",
 [252687] = "Venomfang Strike",
 [255371] = "Terrifying Visage",
 [255591] = "Molten Gold",
 [257437] = "Poisoning Strike",
 [257908] = "Oiled Blade",
 [270920] = "Seduction",
 [270499] = "Frost Shock",
 [270492] = "Hex",
 [268233] = "Electrifying Shock",
 [268322] = "Touch of the Drowned",
 [268896] = "Mind Rend",
 [257168] = "Cursed Slash",
 [272588] = "Rotting Wounds",
 [272571] = "Choking Waters",
 [275014] = "Putrid Waters",
 [273563] = "Neurotoxin",
 [267027] = "Cytotoxin",
 [268008] = "Snake Charm",
 [269298] = "Widowmaker Toxin",
 [268797] = "Transmute: Enemy to Goo",
 [268846] = "Echo Blade",
 [259856] = "Chemical Burn",
 [257777] = "Crippling Shiv",
 [257791] = "Howling Fear",
 [266265] = "Wicked Assault",
 [265468] = "Withering Curse"
}
dark_addon.rotation.spellbooks.p = {
[118] = "Polymorph" --mage
}
dark_addon.rotation.spellbooks.s = {
[115175] = "SoothingMist"--monk
}
dark_addon.rotation.spellbooks.l = {
[204437] = "LightningLaso"--sham
}
dark_addon.rotation.spellbooks.pn = {
[47540] = "Penance"--priest
}
dark_addon.rotation.spellbooks.f = {
[5782] = "fear"--lock
}
dark_addon.rotation.spellbooks.d = {
[64843] = "DivineHymn"--priest
}
dark_addon.rotation.spellbooks.t = {
[740] = "Tranquility"--dru
}
dark_addon.rotation.spellbooks.e = {
[12051] = "Evocation"--mage
}
dark_addon.rotation.spellbooks.a = {
[5143] = "ArcaneMissiles"--mage
}
dark_addon.rotation.spellbooks.ef = {
[191837] = "EssenceFont" --monk kupel
}
dark_addon.rotation.spellbooks.rf = {
[205021] = "RayofFrost" --mage
}
dark_addon.rotation.spellbooks.eb = {
[198013] = "EyeBeam" --dh
}
dark_addon.rotation.spellbooks.c = {
[116858] = "ChaosBolt"--lock
}
dark_addon.rotation.spellbooks.h = {
[51514] = "Hex"--sham
}
dark_addon.rotation.spellbooks.cy = {
[209753] = "Cyclone" --dru
}
dark_addon.rotation.spellbooks.s = {
[30283] = "Shadowfury" --lock
}
dark_addon.rotation.spellbooks.m = {
[605] = "MindControl" --priest
}
dark_addon.rotation.spellbooks.rp = {
[116011] = "RuneofPower" --mage
}
dark_addon.rotation.spellbooks.ro = {
[113724] = "RingofFrost" --mage
}
dark_addon.rotation.spellbooks.g = {
[199786] = "GlacialSpike" --mage
}
dark_addon.rotation.spellbooks.gp = {
[203286] = "GreaterPyroblast" --mage
}
dark_addon.rotation.spellbooks.ct = {
[152108] = "Cataclysm"--lock
}
dark_addon.rotation.spellbooks.hogg = {
[105174] = "HandOfGul'dan"--lock
}
dark_addon.rotation.spellbooks.rp = {
[116011] = "RuneofPower" --mage
}
dark_addon.rotation.spellbooks.hb = {
[2637] = "Hibernate"--dru
}
dark_addon.rotation.spellbooks.rot = {
[66070] = "Roots" --dru
}
dark_addon.rotation.spellbooks.v = {
[116670] = "vify" --monks
}
dark_addon.rotation.spellbooks.fu = {
[218912] = "fuse" --monks
}

dark_addon.rotation.spellbooks.reg = {
[8936] = "Regrowth" --dru
}

dark_addon.rotation.spellbooks.flashlig= {
[19750] = "Flash of Light" --pal
}
dark_addon.rotation.spellbooks.holyli = {
[82326] = "Holy Light" --pal
}
dark_addon.rotation.spellbooks.repa = {
[20066] = "repentance" --pal
}





