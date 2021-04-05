local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITwarlock

-- To Do

-- Spells

SB.DemonicCore = 267102
SB.Implosion = 196277
SB.ExplosivePotential = 275395
SB.GrimoireFelguard = 111898
SB.SummonVilefiend = 264119
SB.SummonDemonicTyrant = 265187
SB.DemonicStrength = 267171
SB.BilescourgeBombers = 267211
SB.CallDreadStalkers = 104316
SB.HandOfGuldan = 105174
SB.Demonbolt = 264178
SB.PowerSiphon = 264130
SB.ShadowBolt2 = 686
SB.NetherPortal = 267217
SB.Doom = 265412
SB.SoulStrike = 264057
SB.DemonicConsumption = 267215
SB.BalefulInvocation = 287059
SB.CommandDemon = 119898
SB.AxeToss = 89766
SB.Felstorm = 89751
SB.LegionStrike = 30213
SB.ThreateningPresence = 134477
SB.DemonicGateway = 111771
SB.DemonicCircle = 268358
SB.HealthFunnel = 755
SB.DemonicCalling = 205146

local frame = CreateFrame("FRAME")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

local impTime, impCast = {}, {}
local alreadyRegistered = false
local impCount = 0
local stalkerCount = 0
local stalkerspawnTime = {}
local playerGUID

frame:SetScript("OnEvent", function(self, event)
	local gettime = GetTime()
	playerGUID = UnitGUID("player")
	--print(playerGUID)
    local timestamp, type, hideCaster,
    sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID = CombatLogGetCurrentEventInfo()
	
	if(event=="COMBAT_LOG_EVENT_UNFILTERED") then
		
		-- time out any Imps (12 seconds)
		for index, value in pairs(impTime) do
			if (value + 12) < gettime then
				impTime[index] = nil
				impCount = impCount - 1

				--print(("Imp timed out. Count: |cff00ff00%d|r"):format(impCount))
			end
		end
	
		-- imp imploded
		if (type == "SPELL_CAST_SUCCESS") and sourceGUID == playerGUID and spellID == 196277 then
			table.wipe(impTime)
			table.wipe(impCast)
			impCount = 0
			--print(("Imp imploded. Count: |cff00ff00%d|r"):format(impCount))
		end
		
		-- imp died
		if (type == "UNIT_DIED") and (sourceName == "Wild Imp" or destName == "Wild Imp") then
			for index, value in pairs(impTime) do
				if destGUID == index then
					impTime[index] = nil
					impCast[index] = nil
					impCount = impCount - 1

					--print(("Imp died. Count: |cff00ff00%d|r"):format(impCount))
				end
			end
		end

		-- imp died from casting (5 casts)
		if (type == "SPELL_CAST_SUCCESS") and sourceName == "Wild Imp" then
			for index,  value in pairs(impCast) do
				if sourceGUID == index then
					-- remove cast
					impCast[index] = impCast[index] - 1

					-- wild imp has casted 5 times so it dies
					if impCast[index] == 0 then
						impCast[index] = nil
						impTime[index] = nil
						impCount = impCount - 1

						--print(("Imp casted 5 times and died. Count: |cff00ff00%d|r"):format(impCount))
					end
				end
			end
		end
	
		-- imp summoned
		if (type == "SPELL_SUMMON") and destName == "Wild Imp" and sourceGUID == playerGUID then
			--print("imp Summoned")
			impTime[destGUID] = gettime
			impCast[destGUID] = 5
			impCount = impCount + 1
			--print(("Imp spawned. Count: |cff00ff00%d|r"):format(impCount))
		end	
        
        -- Dreadstalker summoned
        if (type == "SPELL_SUMMON") and destName == "Dreadstalker" and sourceGUID == playerGUID then
            --print("dreadstalker Summoned")
            stalkerCount = stalkerCount + 1
            stalkerspawnTime = timestamp
            print('Dreadstalker Spawn Time:' .. stalkerspawnTime)
            --print(("dreadstalker spawned. Count: |cff00ff00%d|r"):format(impCount))
        end

	end
end)


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

local currentTime = {}
local stalkerupTime = {}

print('Imps Up:' .. impCount)
print('Dreadstalkers Up:' .. stalkerCount)
currentTime = GetServerTime()
stalkerupTime = currentTime - stalkerspawnTime
print('Dreadstalkers Uptime:' .. stalkerupTime)

		-- Blood Fury - only used if playing an Orc
		-- if castable(SB.BloodFury) and -spell(SB.BloodFury) == 0 then
		-- 	return cast(SB.BloodFury)
		-- end

		-- Health Funnel to heal your pet while in combat
		if pet.exists and castable(SB.HealthFunnel) and player.health.percent >= 50 and pet.health.percent <= 50 then
			return cast(SB.HealthFunnel)
		end
		
		-- Implosion for AoE and buff uptime (Azerite trait Explosive Potential)
		if castable(SB.Implosion) and (not buff(SB.ExplosivePotential).up or buff(SB.ExplosivePotential).remains < 2) and impCount >= 3 and target.distance <= 40 then
			return cast(SB.Implosion, 'target')
		end

		-- Call Dreadstalkers with Demonic Calling buff
		if castable(SB.CallDreadStalkers) and player.buff(SB.DemonicCalling) and player.power.soulshards.actual >= 1 then
			return cast(SB.CallDreadStalkers, 'target')
		end

		-- Grimoire Felguard
		if castable(SB.GrimoireFelguard) and -spell(SB.GrimoireFelguard) == 0 and player.power.soulshards.actual >= 1 then
			return cast(SB.GrimoireFelguard, 'target')
		end

		-- Hand of Gul'dan for Explosive Potential
		if castable(SB.HandOfGuldan) and not buff(SB.ExplosivePotential).up and player.power.soulshards.actual >= 3 and not spell(SB.HandOfGuldan).lastcast then
			return cast(SB.HandOfGuldan, 'target')
		end

		-- Demonic Strength
		if castable(SB.DemonicStrength) and not pet.buff(SB.Felstorm).up and -spell(SB.DemonicStrength) == 0 then
			return cast(SB.DemonicStrength)
		end

		-- Call Dreadstalkers
		if castable(SB.CallDreadStalkers) and player.power.soulshards.actual >= 2 then
			return cast(SB.CallDreadStalkers, 'target')
		end

		-- Summon Demonic Tyrant - best to use when you have many demons summoned!
		if castable(SB.SummonDemonicTyrant) and impCount >= 3 and -spell(SB.CallDreadStalkers).remains > 10 then
			return cast(SB.SummonDemonicTyrant)
		end

		-- Hand of Gul'dan filler
		if castable(SB.HandOfGuldan) and player.power.soulshards.actual >= 3 and  not spell(SB.HandOfGuldan).lastcast then
			return cast(SB.HandOfGuldan, 'target')
		end

		-- Demonbolt @ 2+ stacks of Demonic Core
		if castable(SB.Demonbolt) and player.buff(SB.DemonicCore).count >= 2 then
			return cast(SB.Demonbolt, 'target')
		end
		
		-- Nether Portal
		if castable(SB.NetherPortal) and -spell(SB.NetherPortal) == 0 and player.power.soulshards.actual >= 1 then
			return cast(SB.NetherPortal)
		end
		
		-- Summon Vilefiend
		if castable(SB.SummonVilefiend) and -spell(SB.SummonVilefiend) == 0 and player.power.soulshards.actual >= 1 then
			return cast(SB.SummonVilefiend)
		end
		-- Soul Strike
		if castable(SB.SoulStrike) and -spell(SB.SoulStrike) == 0 then
			return cast(SB.SoulStrike)
		end
		
		-- Bilescourge Bombers
		if castable(SB.BilescourgeBombers) and -spell(SB.BilescourgeBombers) == 0 and player.power.soulshards.actual >= 2 then
			return cast(SB.BilescourgeBombers, 'ground')
		end
		
		-- Shadowbolt spam to generate shards
		if castable(SB.ShadowBolt2) then
			return cast(SB.ShadowBolt2, 'target')
		end


end
end

local function resting()

--   local enemyCount = enemies.around(40)
--   dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

--     if pet.exists then
--         print(pet.guid)
--     end

--[[if target.alive and target.enemy and player.alive and not player.channeling() then
--Cast Shadow Word Pain.
        if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down then
            return cast(SB.ShadowWordPain)
        end]]
end


local function interface()

    local settings = {
        key = 'afflo_settings',
        title = 'Affliction Warlock',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Affliction Warlock Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'DHealth', type = 'spinner', text = 'Dispersion at Health %', default = '30', desc = 'cast Dispersion at', min = 0, max = 100, step = 1 },
            { key = 'SMHealth', type = 'spinner', text = 'Shadow Mend at Health %', default = '50', desc = 'cast Shadow Mend at', min = 0, max = 100, step = 1 },
        }
    }

    configWindow = dark_addon.interface.builder.buildGUI(settings)

    dark_addon.interface.buttons.add_toggle({
        name = 'settings',
        label = 'Rotation Settings',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.cyan,
            color2 = dark_addon.interface.color.dark_cyan
        },
        off = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.grey,
            color2 = dark_addon.interface.color.dark_grey
        },
        callback = function(self)
            if configWindow.parent:IsShown() then
                configWindow.parent:Hide()
            else
                configWindow.parent:Show()
            end
        end
    })
    

end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.warlock.demonology,
    name = 'RexDemoLock',
    label = 'Rex Demonology Warlock',
    combat = combat,
    resting = resting,
    interface = interface
})
