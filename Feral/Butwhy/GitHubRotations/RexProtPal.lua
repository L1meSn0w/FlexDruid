local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpaladin

-- To Do

-- Spells

SB.ShieldoftheRighteous = 53600
SB.LightoftheProtector = 184092
SB.Judgment = 275779
SB.Consecration = 26573
SB.AvengersShield = 31935
SB.HammeroftheRighteous = 53595
SB.GrandCrusader = 85043
SB.HandofReckoning = 62124
SB.GuardianofAncientKings = 86659
SB.ArdentDefender = 31850
SB.AvengingWrath = 31884
SB.LayonHands = 633
SB.DivineShield = 642
SB.FinalStand = 204077
SB.BlessingofProtection = 1022
SB.BlessingofSpellwarding = 204018
SB.AegisofLight = 204150
SB.Seraphim = 152262
SB.WakeofAshes = 255937
SB.Cavalier = 230332
SB.SelflessHealer = 85804
SB.DivinePurpose = 223817
SB.CrusaderStrike = 35395
SB.TemplarsVerdict = 85256
SB.BladeofJustice = 184575
SB.ArtofWar = 267344
SB.DivineStorm = 53385
SB.FlashofLight = 19750
SB.HammerofJustice = 853
SB.Redemption = 7328
SB.CleanseToxins = 213644
SB.HandofHindrance = 183218
SB.DivineSteed = 190784
SB.ShieldofVengeance = 184662
SB.Rebuke = 96231
SB.BlessingofFreedom = 1044
SB.HeartoftheCrusader = 32223


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('protpal_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('protpal_settings_intpercenthigh',65)
	local LoPHealth = dark_addon.settings.fetch('protpal_settings_LoPHealth',30)
    local race = UnitRace('player')

    -- Targets in range check
    local enemyCount = enemies.around(8)
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    -- Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end

    -- Interrupts
        -- Define random number for interrupt
        local intpercent = math.random(intpercentlow,intpercenthigh)

        -- Rebuke
        if toggle('interrupts', false) and castable(SB.Rebuke, 'target') and -spell(SB.Rebuke) == 0 and target.interrupt(intpercent, false) and target.distance < 8 then
          print('Rebuke @ ' .. intpercent)
          return cast(SB.Rebuke, 'target')
        end

    -- Cooldowns
    if toggle('cooldowns', false) then
        -- AvengingWrath on cooldown or for burst DPS
        if castable(SB.AvengingWrath) and -spell(SB.AvengingWrath) == 0 then
            return cast(SB.AvengingWrath)
        end
    end

    --Defensive and Utility Abilities
    --Light of the Protector is Fury's only personal cooldown, good for mitigating damage and healing it back up with Bloodthirst. Note that the buff is not consumed by Bloodthirst, meaning it can be used multiple times during the 8-second duration for increased healing.
    if castable(SB.LightoftheProtector) and -spell(SB.LightoftheProtector) == 0 and -player.health <= LoPHealth then
        print('LightoftheProtector @ ' .. LoPHealth)
  		return cast(SB.LightoftheProtector)
  	end

    -- Healing
    if castable(SB.FlashofLight) and -spell(SB.FlashofLight) == 0 and -player.health <= 75 then
        print('FlashofLight @ ' .. -player.health)
        return cast(SB.FlashofLight)
    end

--Shield of the Righteous
    if castable(SB.ShieldoftheRighteous) and -spell(SB.ShieldoftheRighteous) == 0 and spell(SB.ShieldoftheRighteous).charges >= 2 
	and target.distance < 8 and player.buff(SB.ShieldoftheRighteous).down then
        return cast(SB.ShieldoftheRighteous)
    end

--Cast Consecration IF you are not standing in it.
        if castable(SB.Consecration) and -spell(SB.Consecration) == 0 and player.buff(SB.Consecration).down then
            return cast(SB.Consecration)
        end

--Cast Judgment
        if castable(SB.Judgment) and -spell(SB.Judgment) == 0 and target.distance <= 30 then
            return cast(SB.Judgment)
        end

--Cast Avenger's Shield 
        if castable(SB.AvengersShield) and -spell(SB.AvengersShield) == 0 and target.distance <= 30 then
            return cast(SB.AvengersShield)
        end

--Cast Hammer of the Righteous 
        if castable(SB.HammeroftheRighteous) and -spell(SB.HammeroftheRighteous) == 0 and target.distance < 8 then
            return cast(SB.HammeroftheRighteous)
        end

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

end

local function interface()

    local settings = {
        key = 'protpal_settings',
        title = 'Protection Paladin',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Protection Paladin Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'text', text = 'Shift Modifier used for Heroic Leap' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'LoPHealth', type = 'spinner', text = 'Light of the Protector at Health %', default = '30', desc = 'cast Light of the Protector at', min = 0, max = 100, step = 1 },
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
    spec = dark_addon.rotation.classes.paladin.protection,
    name = 'RexProtPal',
    label = 'Rex Prot Paladin',
    combat = combat,
    resting = resting,
    interface = interface
})
