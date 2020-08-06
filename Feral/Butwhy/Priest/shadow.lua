local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.priest
local soot = dark_addon.rotation.dispellbooks.soothe
local p = dark_addon.rotation.spellbooks.p
local s = dark_addon.rotation.spellbooks.s
local l = dark_addon.rotation.spellbooks.l
local pn = dark_addon.rotation.spellbooks.pn
local f = dark_addon.rotation.spellbooks.f
local d = dark_addon.rotation.spellbooks.d
local t = dark_addon.rotation.spellbooks.t
local e = dark_addon.rotation.spellbooks.e
local a = dark_addon.rotation.spellbooks.a
local ef = dark_addon.rotation.spellbooks.ef
local rf = dark_addon.rotation.spellbooks.rf
local eb = dark_addon.rotation.spellbooks.eb
local c = dark_addon.rotation.spellbooks.c
local h = dark_addon.rotation.spellbooks.h
local cy = dark_addon.rotation.spellbooks.cy
local s = dark_addon.rotation.spellbooks.s
local m = dark_addon.rotation.spellbooks.m
local rp = dark_addon.rotation.spellbooks.rp
local ro = dark_addon.rotation.spellbooks.ro
local g = dark_addon.rotation.spellbooks.g
local gp = dark_addon.rotation.spellbooks.gp
local ct = dark_addon.rotation.spellbooks.ct
local rp = dark_addon.rotation.spellbooks.rp
local hb = dark_addon.rotation.spellbooks.hb
local rot = dark_addon.rotation.spellbooks.rot
local v = dark_addon.rotation.spellbooks.v
local fu = dark_addon.rotation.spellbooks.fu
local hogg = dark_addon.rotation.spellbooks.hogg
local flashl = dark_addon.rotation.spellbooks.flashlig
local holylight = dark_addon.rotation.spellbooks.holyli
local repentr = dark_addon.rotation.spellbooks.repa
local race = UnitRace('player')

SB.WeakenedSoul = 6788
SB.DarkVoid = 263346
SB.ConcentratedFlame = 295373
SB.WorldveinResonance = 295186

local function combat()
if UIParent:IsShown() then
   RunMacroText("/script UIErrorsFrame:Hide()")
end
	local current_gcd = (1.5 / ((UnitSpellHaste("player") / 100) + 1))
	local mousedots = dark_addon.settings.fetch("KiraFeral_settings_mousedots")
	local mousecrash = dark_addon.settings.fetch("KiraFeral_settings_mousecrash")
	local mousedispell = dark_addon.settings.fetch("KiraFeral_settings_mousedispell")
	local useVampiricEmbrace = dark_addon.settings.fetch("KiraFeral_settings_VampiricEmbrace.check", true)
    local VampiricEmbracePercent = dark_addon.settings.fetch("KiraFeral_settings_VampiricEmbrace.spin", 25)
  	local powerword = dark_addon.settings.fetch('KiraFeral_settings_powerword', true)
  	local boostspeed = dark_addon.settings.fetch('KiraFeral_settings_boostspeed', true)
  	local shieldonly = dark_addon.settings.fetch('KiraFeral_settings_shieldonly', true)
  	local Fadeout = dark_addon.settings.fetch('KiraFeral_settings_Fadeout', true)
	local Dispersion = dark_addon.settings.fetch("KiraFeral_settings_Dispersion", 25)
	local usetankgrip = dark_addon.settings.fetch("KiraFeral_settings_tankgrip.check", true)
    local tankgrip = dark_addon.settings.fetch("KiraFeral_settings_tankgrip.spin", 25)
	local usenottankgrip = dark_addon.settings.fetch("KiraFeral_settings_nottankgrip.check", true)
    local nottankgrip = dark_addon.settings.fetch("KiraFeral_settings_nottankgrip.spin", 25)		
	local intpercentlow = dark_addon.settings.fetch('KiraFeral_settings_intpercentlow',10)
	local intpercenthigh = dark_addon.settings.fetch('KiraFeral_settings_intpercenthigh',65)	
	local enemyrangedCount = enemies.count(function (unit)
		return unit.alive and unit.combat and unit.distance == target.distance 
	end)
	dark_addon.interface.status_extra('T#:' .. enemyrangedCount .. ' D:' .. target.distance)

 if toggle('interrupts', false) then
	if Kick0 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and p[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick1 == true then
        if target.castable(SB.PsychicHorror) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and s[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.PsychicHorror, target)
            end
          end
        end
	end
	if Kick2 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and l[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick3 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and pn[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick4 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and f[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick5 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and d[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick6 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and t[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick7 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and e[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick8 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and a[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick9 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ef[spell_id] then
              --  print("Кикнул " .. name .. " на цели.")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick10 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rf[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick11 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and eb[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick12 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and c[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick13 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and h[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick14 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and cy[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick15 == true then
        if target.castable(SB.PsychicHorror) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and s[spell_id] and target.distance < 8 then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.PsychicHorror, target)
            end
          end
        end
	end
	if Kick16 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and m[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick17 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rp[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick18 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ro[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick19 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and g[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick20 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and gp[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick21 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ct[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick22 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and fu[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick23 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and hb[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick24 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rot[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick25 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and v[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick26 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and holylight[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick27 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and flashl[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end
	if Kick28 == true then
        if target.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and repentr[spell_id] then
                --print("Кикнул " .. name .. " на цели!")
                return cast(SB.Silence, target)
            end
          end
        end
	end	
--Кик в фокус
	
	if KickFocus0 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and p[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus1 == true then
        if focus.castable(SB.PsychicHorror) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and s[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.PsychicHorror, focus)
            end
          end
        end
	end
	if KickFocus2 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and l[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus3 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and pn[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus4 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and f[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus5 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and d[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus6 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and t[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus7 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and e[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus8 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and a[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus9 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ef[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus10 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rf[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus11 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and eb[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus12 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and c[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus13 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and h[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus14 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and cy[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus15 == true then
        if focus.castable(SB.PsychicHorror) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and s[spell_id] and target.distance < 8 then
                --print("Кикнул " .. name .. " !")
                return cast(SB.PsychicHorror, focus)
            end
          end
        end
	end
	if KickFocus16 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and m[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus17 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rp[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus18 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ro[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus19 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and g[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus20 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and gp[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus21 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ct[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus22 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and fu[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus23 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and hb[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus24 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rot[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus25 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and v[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus26 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and holylight[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus27 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and flashl[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end
	if KickFocus28 == true then
        if focus.castable(SB.Silence) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and repentr[spell_id] then
                --print("Кикнул " .. name .. " !")
                return cast(SB.Silence, focus)
            end
          end
        end
	end		
end


    if player.alive and target.alive and target.enemy and not player.channeling() then

        -- Interrupt --
        if castable(SB.Silence) and target.interrupt(50) then
            return cast(SB.Silence, 'target')
        end
		
		-- Modifiers --
		-- Shadow Crash (Shift)
	--	if castable(SB.ShadowCrash) and modifier.shift then
	--		return cast(SB.ShadowCrash, 'ground')
	--	end
		
if (mousecrash == "shift" and modifier.shift) or (mousecrash == "control" and modifier.control) or (mousecrash == "alt" and modifier.alt) then 
return cast(SB.ShadowCrash, 'ground')
end

	if (mousedispell == "shift" and modifier.shift) or (mousecrash == "control" and modifier.control) or (mousecrash == "alt" and modifier.alt) then 
return cast(SB.MassDispel, 'ground')
end	
		
		-- Mass Dispel (Alt)
		--if castable(SB.MassDispel) and modifier.alt then
		---	return cast(SB.MassDispel, 'ground')
		---end

        -- Defenses --
        -- Power Word Shield when moving
		if castable(SB.PowerShield) and player.moving and player.buff(SB.PowerShield).down then
			return cast(SB.PowerShield, 'player')
		end
		
		

   if Dispersion and -player.health <= Dispersion then
        return cast(SB.Dispersion)
      end
		

        -- Rotation --
		-- Shadowfiend  DarkAscension
		if toggle("cooldowns", false) then
		if castable(SB.ShadowFiend) then
			return cast(SB.ShadowFiend, 'target')
		end
		else 
			if castable(SB.Mindbender) then
			return cast(SB.Mindbender, 'target')
		end
		end
	
	
 	if  talent(7,2) then 
	if toggle("cooldowns", false) and castable(SB.DarkAscension, 'target') then
        return cast(SB.DarkAscension, 'target')
    end
	end
	
	if  talent(7,3) then 
	if toggle("cooldowns", false) and castable(SB.SurrendertoMadness, 'target') then
        return cast(SB.SurrendertoMadness, 'target')
    end
	end
	
	if not talent(3,2) and castable(SB.VampiricTouch) and target.debuff(SB.VampiricTouch).remains <= 3 then
			return cast(SB.VampiricTouch, 'target')
		end
		if not talent(3,2) and castable(SB.ShadowPain) and target.debuff(SB.ShadowPain).remains <= 2 then
			return cast(SB.ShadowPain, 'target')
		end
		
		if talent(3,2) and castable(SB.VampiricTouch) and target.debuff(SB.ShadowPain).down or target.debuff(SB.VampiricTouch).down or target.debuff(SB.ShadowPain).remains <= 3 or target.debuff(SB.VampiricTouch).remains <= 3 then
		return cast(SB.VampiricTouch, 'target')
		end
		
	if not talent(3,2) then 
	if (mousedots == "shift" and modifier.shift) or (mousedots == "control" and modifier.control) or (mousedots == "alt" and modifier.alt) then 
	if mouseover.debuff(SB.ShadowPain).down and -spell(SB.ShadowPain) == 0  then
         return cast(SB.ShadowPain, "mouseover")
	else if mouseover.debuff(SB.VampiricTouch).down and -spell(SB.VampiricTouch) == 0 then
	return cast(SB.VampiricTouch, "mouseover")
end
end
end
	else 
	if talent(3,2) and (mousedots == "shift" and modifier.shift) or (mousedots == "control" and modifier.control) or (mousedots == "alt" and modifier.alt) then 
	if mouseover.debuff(SB.VampiricTouch).down or mouseover.debuff(SB.ShadowPain).down and -spell(SB.VampiricTouch) == 0 then
	return cast(SB.VampiricTouch, "mouseover")
end
end
end
		-- Voidform at 60+ Insanity
		if castable(SB.VoidEruption) and player.power.insanity.actual >= 60 then
			return cast(SB.VoidEruption)
		end
		
		-- Void Bolt when in Voidform
		if castable(SB.VoidBolt) and player.buff(SB.VoidForm).up then
			return cast(SB.VoidBolt, 'target')
		end
		
		-- Shadow Word Void
		if castable(SB.ShadowVoid) then
			return cast(SB.ShadowVoid, 'target')
		end
		
		if castable(SB.MindBlast) then
			return cast(SB.MindBlast, 'target')
		end
		
		if  player.buff(SB.ShadowyInsight).up and castable(SB.MindBlast) then
			return cast(SB.MindBlast, 'target')
		end
		-- Mind Sear with 3+ targets
		if enemyrangedCount >= 3 then
		if castable(SB.DarkVoid) then 
			return cast(SB.DarkVoid, 'target')
				else
		if castable(SB.MindSear) then
			return cast(SB.MindSear, 'target')
		end
		end
	end

		-- Mind Flay filler
		if castable(SB.MindFlay) then
			return cast(SB.MindFlay, 'target')
		end
	if castable(SB.ShadowWordDeath) and -spell(SB.ShadowWordDeath) == 0 then
    return cast(SB.ShadowWordDeath)
    end
    if castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
        return cast(SB.ConcentratedFlame, 'target')
    end
    if castable(SB.WorldveinResonance) and -spell(SB.WorldveinResonance) == 0 and target.distance < 5 then
        return cast(SB.WorldveinResonance, 'target')
    end   
    end
	
if toggle("dispel", false) and target.enemy and target.alive then
  if castable(SB.DispelMagic) then
      for i = 1, 2 do
    local name, _, _, count, debuff_type, _, _, _, _, spell_id = UnitDebuff("target", i) 
    if name and soot[spell_id] then
      return cast(SB.DispelMagic)
    end
  end
end
	end

if toggle("frienddispel", false) and player.alive then	
    -- group cleanse
    local unit = group.dispellable(SB.PurifyDisease)
    if unit and unit.castable(SB.PurifyDisease) then
      return cast(SB.PurifyDisease, unit)
    end
  end
  --self dispel 
      if castable(SB.PurifyDisease) and player.dispellable(SB.PurifyDisease) then
      return cast(SB.PurifyDisease, player)
    end
	

if useVampiricEmbrace == true and player.health.percent < VampiricEmbracePercent then
return cast(SB.VampiricEmbrace)
end	
--buffs
if powerword == true and castable(SB.PowerWordFortitude, 'player') and player.buff(SB.PowerWordFortitude).down and not player.channeling() then
return cast(SB.PowerWordFortitude, 'player')
end 
if boostspeed == true and player.moving and castable(SB.PowerShield, 'player') and player.debuff(SB.WeakenedSoul).down and not player.channeling() then
return cast(SB.PowerShield, 'player')
end 
if shieldonly == true and castable(SB.PowerShield, 'player') and player.buff(SB.PowerShield).down and not player.channeling() then
return cast(SB.PowerShield, 'player')
end 

if Fadeout == true and castable(SB.Fade, 'player') and UnitThreatSituation("player", "target")  and target.distance < 8 then
return cast(SB.Fade, 'player')
end 
local intpercent = math.random(intpercentlow,intpercenthigh)
if toggle("KickALL", false) and castable(SB.Silence, 'target') and target.interrupt(intpercent, false) then
    --  print('Kicked' .. intpercent)
      return cast(SB.Silence, 'target')
    end
if toggle("KickALL", false) and castable(SB.MindBomb, 'target') and not castable(SB.Silence) and target.interrupt(intpercent, false) then
      --  print('Kicked' .. intpercent)
        return cast(SB.MindBomb, 'target')
    end

if usetankgrip == true and player.health.percent < tankgrip then
return cast(SB.LeapofFaith, tank)
end	
if usenottankgrip == true and player.health.percent < nottankgrip then
return cast(SB.LeapofFaith, lowest)
end	
end --combat 

local function resting()
  	local powerword = dark_addon.settings.fetch('KiraFeral_settings_powerword', true)
  	local boostspeed = dark_addon.settings.fetch('KiraFeral_settings_boostspeed', true)
  	local shieldonly = dark_addon.settings.fetch('KiraFeral_settings_shieldonly', true)
	local LevitateBuff = dark_addon.settings.fetch('KiraFeral_settings_LevitateBuff', true)
	
    if target.alive and target.enemy and player.alive and not player.channeling() then
	
		-- Shadow Word Pain to start combat
       if toggle("Opener", false) then
	   if castable(SB.ShadowPain) then
            return cast(SB.ShadowPain, 'target')
        end
    end
	end

if powerword == true and castable(SB.PowerWordFortitude, 'player') and player.buff(SB.PowerWordFortitude).down  then
return cast(SB.PowerWordFortitude, 'player')
end 
if boostspeed == true and player.moving and castable(SB.PowerShield, 'player') and player.debuff(SB.WeakenedSoul).down  then
return cast(SB.PowerShield, 'player')
end 
if shieldonly == true and castable(SB.PowerShield, 'player') and player.buff(SB.PowerShield).down  then
return cast(SB.PowerShield, 'player')
end 

if LevitateBuff == true and IsFalling and player.buff(SB.Levitate).down then
return cast(SB.Levitate, 'player')
end
end --resting

local function interface()

    if (GetLocale() == "ruRU") then
    local settings = {
        key = 'KiraFeral_settings',
        title = 'GACHI bible production',
        width = 350,
        height = 802,
	--	color = "3cff00",
		color = "00a2ff",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "SETTINGS",		align = 'CENTER',},
			        { type = 'rule' },
            { type = 'text', text = 'Myth+: [3] - [1] - [2-3] - [DownBelow] - [1-3] - [1] - [1-2]', align = 'CENTER' },
            { type = 'text', text = 'Heavy AoE: [3] - [1] - [3] - [DownBelow] - [3] - [1] - [1]', align = 'CENTER' },
            { type = 'text', text = 'SingleTarget: [3] - [1] - [1] - [DownBelow] - [1-3] - [1] - [1]', align = 'CENTER' },
            { type = 'text', text = 'Builds by: icy-veins.com', align = 'CENTER'},
            { type = 'text', text = 'Support all talents exept:  [6-3] bc usless shit. (Change my mind.)', align = 'CENTER' },
            { type = 'text', text = 'Talent: [4-3] Req., to kick some stuff in pvp. [Not Work in pve]', align = 'CENTER' },
            { type = 'text', text = 'Talent: [4-2] Req., to kick stuff in pve.', align = 'CENTER' },
            { type = 'text', text = 'ALT = Mdispell| Shift = ShadowCrash| Ctrl = MouseOver DOTS.', align = 'CENTER' },
            { type = 'rule' },
            { type = 'header', text = 'Kick Cast',  align = 'CENTER'},
			{ type = 'text', text = 'Welcome.', align = 'CENTER' },
			{ type = 'text', text = 'Toggle Interrupts, then hit 2 books buttons.', align = 'CENTER' },
			{ type = 'text', text = 'Now set-up what u want to kick!', align = 'CENTER' },
-- 										Kick cast settings will be here soon..... 
		    { type = 'rule' },
		    { type = 'header', text = "USEFUL STUFF.", align = 'CENTER' },
			{ key = 'LevitateBuff', type = 'checkbox', text = 'Levitate Buff', desc = 'Update Levitate buff if not in combat.', default = false },
			{ key = 'powerword', type = 'checkbox', text = 'Power Word: Fortitude', desc = 'Use Power Word: Fortitude?', default = false },
			{ key = 'boostspeed', type = 'checkbox', text = 'Use shield to speed up movment', desc = '', default = false },
			{ key = 'shieldonly', type = 'checkbox', text = 'Just update shield buff', desc = 'Just update shield buff?', default = false },
			{ key = 'Fadeout', type = 'checkbox', text = 'Fade', desc = 'Use Fade if taunted on u, and distance < 8.', default = false },
			
						{ key = 'mousedots', type = 'dropdown', text = 'MouseOver DOTS.', desc = 'Hold key to make some dots!', default = 'control',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			
						{ key = 'mousecrash', type = 'dropdown', text = 'MouseOver CRASH.', desc = 'Hold key to CRASH THEIR ASS!', default = 'shift',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
						{ key = 'mousedispell', type = 'dropdown', text = 'MouseOver MASS DISPELL.', desc = 'Hold key to clean anus!', default = 'alt',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			
            { key = 'intpercentlow', type = 'spinner', text = 'Pve kick intpercentlow %', default = '50', desc = '', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Pve kick intpercenthigh %', default = '65', desc = '', min = 51, max = 100, step = 1 },
					    { type = 'rule' },
						{ type = 'header', text = "SAVE ASS!", align = 'CENTER' },
			{ key = 'Dispersion', type = 'spinner', text = 'AUTO Dispersion', desc = 'AUTO Dispersion ON  HP% ', default = 25, min = 1, max = 100, step = 1 }, 
			
			{ key = "VampiricEmbrace", type = "checkspin", text = "Vampiric Embrace", desc = "AUTO Vampiric Embrace ON  HP%", default_check = false, default_spin = 40, min = 5, max = 100, step = 1 },
		    { type = 'rule' },	
			
					{ type = 'header', text = "Just for rofl...", align = 'CENTER' },
					
	      { key = 'tankgrip', type = 'checkspin', text = '[TANK] Leap of Faith', desc = 'Health Percent to cast at', default_check = false, default_spin = 25, min = 1, max = 100, step = 1 }, 
	      { key = 'nottankgrip', type = 'checkspin', text = '[GROUP] Leap of Faith', desc = 'Health Percent to cast at', default_check = false, default_spin = 25, min = 1, max = 100, step = 1 },   					
					
					
				    { type = 'rule' },	
            { type = 'text', text = 'ATTENTION U CANT BIND 3 BUTTONS ON SAME KEY!!!!', align = 'CENTER' },						
            { type = 'text', text = 'P.s Мне лень переводить это щас, может позже. ;D', align = 'CENTER' },	
    }
	}
	
configWindow = dark_addon.interface.builder.buildGUI(settings)
	
    dark_addon.interface.buttons.add_toggle({
        name = 'settings',
        label = 'MainSettings!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.red,
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
		-- 				TOGGLE something
		    dark_addon.interface.buttons.add_toggle({
        name = 'Opener',
        label = 'Cast SWP on choosen target to start combat. [On|Off]',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
		 dark_addon.interface.buttons.add_toggle({
        name = 'dispel',
        label = 'Dispel adds (pve). [ON|OFF] *not tested',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
		 dark_addon.interface.buttons.add_toggle({
        name = 'frienddispel',
        label = 'Dispel group memebers. [ON|OFF] *not tested',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
	
	
		    local settings2 = {
        key = 'KiraFeral_settings2',
        title = 'GACHI bible production',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure target kick!", align = 'CENTER'},
			{ type = 'rule' },
			{ type = 'header', text = "Mage" , align = 'CENTER'},
			{ key = 'Kick0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'Kick20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'Kick10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'Kick8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'Kick17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'Kick18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'Kick19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'Kick7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest." , align = 'CENTER'},
			{ key = 'Kick3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'Kick5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'Kick16', type = 'checkbox', text = 'Mind control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid." , align = 'CENTER'},
			{ key = 'Kick6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'Kick23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'Kick14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'Kick24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'Kick26', type = 'checkbox', text = 'Восстановление', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = 'Минимум % хп цели', default = '30', desc = 'Что бы кикнуть ей восстановление', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk." , align = 'CENTER'},
			{ key = 'Kick1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'Kick9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'Kick25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'Kick22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock.", align = 'CENTER' },
			{ key = 'Kick15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'Kick4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'Kick12', type = 'checkbox', text = 'Chaos Bolt', desc = '', default = false },
			{ key = 'Kick21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman." , align = 'CENTER'},
			{ key = 'Kick13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'Kick2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin." , align = 'CENTER'},
			{ key = 'Kick26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'Kick27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'Kick28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH.", align = 'CENTER'},
			{ key = 'Kick11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow2 = dark_addon.interface.builder.buildGUI(settings2)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings2',
        label = 'PvP Kick Target!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
        callback = function(self)
            if configWindow2.parent:IsShown() then
                configWindow2.parent:Hide()
            else
                configWindow2.parent:Show()
            end
        end
    })
		    local settings3 = {
        key = 'KiraFeral_settings3',
        title = 'GACHI bible production',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure focus kick!" , align = 'CENTER'},
			{ type = 'rule' },
			{ type = 'header', text = "Mage" , align = 'CENTER'},
			{ key = 'KickFocus0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'KickFocus20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'KickFocus10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'KickFocus8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'KickFocus17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'KickFocus18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'KickFocus19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'KickFocus7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest.", align = 'CENTER' },
			{ key = 'KickFocus3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'KickFocus5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'KickFocus16', type = 'checkbox', text = 'Mind Control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid.", align = 'CENTER' },
			{ key = 'KickFocus6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'KickFocus23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'KickFocus14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'KickFocus24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'KickFocus26', type = 'checkbox', text = 'Восстановление', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = 'Минимум % хп цели', default = '30', desc = 'Что бы кикнуть ей восстановление', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk.", align = 'CENTER' },
			{ key = 'KickFocus1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'KickFocus9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'KickFocus25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'KickFocus22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock.", align = 'CENTER' },
			{ key = 'KickFocus15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'KickFocus4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'KickFocus12', type = 'checkbox', text = 'Chaos bolt', desc = '', default = false },
			{ key = 'KickFocus21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman.", align = 'CENTER' },
			{ key = 'KickFocus13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'KickFocus2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin.", align = 'CENTER' },
			{ key = 'KickFocus26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'KickFocus27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'KickFocus28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH.", align = 'CENTER' },
			{ key = 'KickFocus11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow3 = dark_addon.interface.builder.buildGUI(settings3)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings3',
        label = 'PvP Kick Focus!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
        callback = function(self)
            if configWindow3.parent:IsShown() then
                configWindow3.parent:Hide()
            else
                configWindow3.parent:Show()
            end
        end
    })
	
		    dark_addon.interface.buttons.add_toggle({
        name = 'KickALL',
        label = 'PVE Kick everything. [On|Off]',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('axe-battle'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('axe'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
else -- enUS start

 local settings = {
        key = 'KiraFeral_settings',
        title = 'GACHI bible production',
        width = 350,
        height = 823,
	--	color = "3cff00",
		color = "00a2ff",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "SETTINGS",		align = 'CENTER'},
			        { type = 'rule' },
            { type = 'text', text = 'Myth+: [3] - [1] - [2-3] - [DownBelow] - [1-3] - [1] - [1-2]', align = 'CENTER' },
            { type = 'text', text = 'Heavy AoE: [3] - [1] - [3] - [DownBelow] - [3] - [1] - [1]', align = 'CENTER' },
            { type = 'text', text = 'SingleTarget: [3] - [1] - [1] - [DownBelow] - [1-3] - [1] - [1]', align = 'CENTER' },
            { type = 'text', text = 'Builds by: icy-veins.com', align = 'CENTER'},
            { type = 'text', text = 'Support all talents exept:  [6-3] bc usless shit. (Change my mind.)', align = 'CENTER' },
            { type = 'text', text = 'Talent: [4-3] Req., to kick some stuff in pvp. [Not Work in pve]', align = 'CENTER' },
            { type = 'text', text = 'Talent: [4-2] Req., to kick stuff in pve.', align = 'CENTER' },
            { type = 'text', text = 'ALT = Mdispell| Shift = ShadowCrash| Ctrl = MouseOver DOTS.', align = 'CENTER' },
            { type = 'rule' },
            { type = 'header', text = 'Kick Cast',  align = 'CENTER'},
			{ type = 'text', text = 'Welcome.', align = 'CENTER' },
			{ type = 'text', text = 'Toggle Interrupts, then hit 2 books buttons.', align = 'CENTER' },
			{ type = 'text', text = 'Now set-up what u want to kick!', align = 'CENTER' },
-- 										Kick cast settings will be here soon..... 
		    { type = 'rule' },
		    { type = 'header', text = "USEFUL STUFF.", align = 'CENTER' },
			{ key = 'LevitateBuff', type = 'checkbox', text = 'Levitate Buff', desc = 'Update Levitate buff if not in combat.', default = false },
			{ key = 'powerword', type = 'checkbox', text = 'Power Word: Fortitude', desc = 'Use Power Word: Fortitude?', default = false },
			{ key = 'boostspeed', type = 'checkbox', text = 'Use shield to speed up movment', desc = '', default = false },
			{ key = 'shieldonly', type = 'checkbox', text = 'Just update shield buff', desc = 'Just update shield buff?', default = false },
			{ key = 'Fadeout', type = 'checkbox', text = 'Fade', desc = 'Use Fade if taunted on u, and distance < 8.', default = false },
			
						{ key = 'mousedots', type = 'dropdown', text = 'MouseOver DOTS.', desc = 'Hold key to make some dots!', default = 'control',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			
						{ key = 'mousecrash', type = 'dropdown', text = 'MouseOver CRASH.', desc = 'Hold key to CRASH THEIR ASS!', default = 'shift',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
						{ key = 'mousedispell', type = 'dropdown', text = 'MouseOver MASS DISPELL.', desc = 'Hold key to clean anus!', default = 'alt',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			
            { key = 'intpercentlow', type = 'spinner', text = 'Pve kick intpercentlow %', default = '50', desc = '', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Pve kick intpercenthigh %', default = '65', desc = '', min = 51, max = 100, step = 1 },						
					    { type = 'rule' },
						{ type = 'header', text = "SAVE ASS!", align = 'CENTER' },
			{ key = 'Dispersion', type = 'spinner', text = 'AUTO Dispersion', desc = 'AUTO Dispersion ON  HP% ', default = 25, min = 1, max = 100, step = 1 }, 
			
			{ key = "VampiricEmbrace", type = "checkspin", text = "Vampiric Embrace", desc = "AUTO Vampiric Embrace ON  HP%", default_check = false, default_spin = 40, min = 5, max = 100, step = 1 },
		    { type = 'rule' },	
			
					{ type = 'header', text = "Just for rofl...", align = 'CENTER' },
					
	      { key = 'tankgrip', type = 'checkspin', text = '[TANK] Leap of Faith', desc = 'Health Percent to cast at', default_check = false, default_spin = 25, min = 1, max = 100, step = 1 }, 
	      { key = 'nottankgrip', type = 'checkspin', text = '[GROUP] Leap of Faith', desc = 'Health Percent to cast at', default_check = false, default_spin = 25, min = 1, max = 100, step = 1 },   					
					
					
				    { type = 'rule' },	
            { type = 'text', text = 'ATTENTION U CANT BIND 3 BUTTONS ON SAME KEY!!!!', align = 'CENTER' },						
        
    }
	}
	
configWindow = dark_addon.interface.builder.buildGUI(settings)
	
    dark_addon.interface.buttons.add_toggle({
        name = 'settings',
        label = 'MainSettings!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.red,
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
		-- 				TOGGLE something
		    dark_addon.interface.buttons.add_toggle({
        name = 'Opener',
        label = 'Cast SWP on choosen target to start combat. [On|Off]',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
		 dark_addon.interface.buttons.add_toggle({
        name = 'dispel',
        label = 'Dispel adds (pve). [ON|OFF] *not tested',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
		 dark_addon.interface.buttons.add_toggle({
        name = 'frienddispel',
        label = 'Dispel group memebers. [ON|OFF] *not tested',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })
	
	
		    local settings2 = {
        key = 'KiraFeral_settings2',
        title = 'GACHI bible production',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure target kick!", align = 'CENTER'},
			{ type = 'rule' },
			{ type = 'header', text = "Mage" , align = 'CENTER'},
			{ key = 'Kick0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'Kick20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'Kick10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'Kick8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'Kick17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'Kick18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'Kick19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'Kick7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest." , align = 'CENTER'},
			{ key = 'Kick3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'Kick5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'Kick16', type = 'checkbox', text = 'Mind control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid." , align = 'CENTER'},
			{ key = 'Kick6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'Kick23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'Kick14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'Kick24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'Kick26', type = 'checkbox', text = 'Восстановление', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = 'Минимум % хп цели', default = '30', desc = 'Что бы кикнуть ей восстановление', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk." , align = 'CENTER'},
			{ key = 'Kick1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'Kick9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'Kick25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'Kick22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock.", align = 'CENTER' },
			{ key = 'Kick15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'Kick4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'Kick12', type = 'checkbox', text = 'Chaos Bolt', desc = '', default = false },
			{ key = 'Kick21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman." , align = 'CENTER'},
			{ key = 'Kick13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'Kick2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin." , align = 'CENTER'},
			{ key = 'Kick26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'Kick27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'Kick28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH.", align = 'CENTER'},
			{ key = 'Kick11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow2 = dark_addon.interface.builder.buildGUI(settings2)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings2',
        label = 'PvP Kick Target!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
        callback = function(self)
            if configWindow2.parent:IsShown() then
                configWindow2.parent:Hide()
            else
                configWindow2.parent:Show()
            end
        end
    })
		    local settings3 = {
        key = 'KiraFeral_settings3',
        title = 'GACHI bible production',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure focus kick!" , align = 'CENTER'},
			{ type = 'rule' },
			{ type = 'header', text = "Mage" , align = 'CENTER'},
			{ key = 'KickFocus0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'KickFocus20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'KickFocus10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'KickFocus8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'KickFocus17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'KickFocus18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'KickFocus19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'KickFocus7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest.", align = 'CENTER' },
			{ key = 'KickFocus3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'KickFocus5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'KickFocus16', type = 'checkbox', text = 'Mind Control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid.", align = 'CENTER' },
			{ key = 'KickFocus6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'KickFocus23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'KickFocus14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'KickFocus24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'KickFocus26', type = 'checkbox', text = 'Восстановление', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = 'Минимум % хп цели', default = '30', desc = 'Что бы кикнуть ей восстановление', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk.", align = 'CENTER' },
			{ key = 'KickFocus1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'KickFocus9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'KickFocus25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'KickFocus22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock.", align = 'CENTER' },
			{ key = 'KickFocus15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'KickFocus4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'KickFocus12', type = 'checkbox', text = 'Chaos bolt', desc = '', default = false },
			{ key = 'KickFocus21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman.", align = 'CENTER' },
			{ key = 'KickFocus13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'KickFocus2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin.", align = 'CENTER' },
			{ key = 'KickFocus26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'KickFocus27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'KickFocus28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH.", align = 'CENTER' },
			{ key = 'KickFocus11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow3 = dark_addon.interface.builder.buildGUI(settings3)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings3',
        label = 'PvP Kick Focus!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
        callback = function(self)
            if configWindow3.parent:IsShown() then
                configWindow3.parent:Hide()
            else
                configWindow3.parent:Show()
            end
        end
    })
	
		    dark_addon.interface.buttons.add_toggle({
        name = 'KickALL',
        label = 'PVE Kick everything. [On|Off]',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('axe-battle'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('axe'),
            color = dark_addon.interface.color.red,
            color2 = dark_addon.interface.color.dark_grey
        },
    })

end -- get locale end

	

end -- interface end


dark_addon.rotation.register({
	spec = dark_addon.rotation.classes.priest.shadow,
	name = 'bdsm',
	label = 'BDSM Priest - FlexHub.com',
	combat = combat,
	resting = resting,
	interface = interface,
})
