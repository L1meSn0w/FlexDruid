local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.dk
local AZ = dark_addon.rotation.spellbooks.azerite
	local function combat()
		if not UIParent:IsShown() then
		   RunMacroText("/reload")
		end
					
	local Breathofsyndras = dark_addon.settings.fetch('DeathKing_Settings_Breathofsyndras', true)

	if target.enemy and target.alive and target.distance < 8 then
    auto_attack()
	end  		 
	if target.alive and target.enemy and player.alive and not player.channeling() then
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end
    dark_addon.interface.status_extra('AoeTargets#:' .. enemyCount .. ' Dist:' .. target.distance)
  	if castable(SB.ChainsofIce) and player.buff(SB.ColdHeart).count == 20 then
    return cast(SB.ChainsofIce, 'target')
    end
	
	   --Essence start
   	local delay = 0
   
   --burst essences

	--1

    if toggle("cooldowns", false) and castable(AZ.GuardianofAzeroth1) and -spell(AZ.GuardianofAzeroth1) == 0 then
    return cast(AZ.GuardianofAzeroth1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(AZ.GuardianofAzeroth2) and -spell(AZ.GuardianofAzeroth2) == 0 then
        return cast(AZ.GuardianofAzeroth2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(AZ.GuardianofAzeroth3) and -spell(AZ.GuardianofAzeroth3) == 0 then
			return cast(AZ.GuardianofAzeroth3, 'target')
			end 
	
	--2
	
    if toggle("cooldowns", false) and castable(AZ.MemoryofLucidDreams1) and -spell(AZ.MemoryofLucidDreams1) == 0 then
    return cast(AZ.MemoryofLucidDreams1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(AZ.MemoryofLucidDreams2) and -spell(AZ.MemoryofLucidDreams2) == 0 then
        return cast(AZ.MemoryofLucidDreams2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(AZ.MemoryofLucidDreams3) and -spell(AZ.MemoryofLucidDreams3) == 0 then
			return cast(AZ.MemoryofLucidDreams3, 'target')
			end 

	--3 uncomment to cast (req. 8.3.0+ patch)
		if delay < GetTime() then
	if toggle("cooldowns", false) and castable(AZ.MomentofGlory1) then
    return cast(AZ.MomentofGlory1, 'player')
    end 
	    if toggle("cooldowns", false) and castable(AZ.MomentofGlory2) and -spell(AZ.MomentofGlory2) == 0 then
        return cast(AZ.MomentofGlory2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(AZ.MomentofGlory3) and -spell(AZ.MomentofGlory3) == 0 then
			return cast(AZ.MomentofGlory3, 'target')
			end 
		delay = GetTime() + 1.5
	end	
			
	--4
	
    if toggle("cooldowns", false) and castable(AZ.WorldveinResonance1) and -spell(AZ.WorldveinResonance1) == 0 then
    return cast(AZ.WorldveinResonance1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(AZ.WorldveinResonance2) and -spell(AZ.WorldveinResonance2) == 0 then
        return cast(AZ.WorldveinResonance2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(AZ.WorldveinResonance3) and -spell(AZ.WorldveinResonance3) == 0 then
			return cast(AZ.WorldveinResonance3, 'target')
			end 

	
	
	
	--damage essences
	
	
	
	--1 
	
	 if castable(AZ.AnimaofDeath1) and -spell(AZ.AnimaofDeath1) == 0 then
        return cast(AZ.AnimaofDeath1, 'target')
    end
			 if castable(AZ.AnimaofDeath2) and -spell(AZ.AnimaofDeath2) == 0 then
        return cast(AZ.AnimaofDeath2, 'target')
    end
				 if castable(AZ.AnimaofDeath3) and -spell(AZ.AnimaofDeath3) == 0 then
        return cast(AZ.AnimaofDeath3, 'target')
    end
	
	--2 
	
	 if castable(AZ.BloodoftheEnemy1) and -spell(AZ.BloodoftheEnemy1) == 0 then
        return cast(AZ.BloodoftheEnemy1, 'target')
    end
			 if castable(AZ.BloodoftheEnemy2) and -spell(AZ.BloodoftheEnemy2) == 0 then
        return cast(AZ.BloodoftheEnemy2, 'target')
    end
				 if castable(AZ.BloodoftheEnemy3) and -spell(AZ.BloodoftheEnemy3) == 0 then
        return cast(AZ.BloodoftheEnemy3, 'target')
    end
	
		
	--3  uncomment to cast (req. 8.3.0+ patch)
	
	 if castable(AZ.ReapingFlames1) and -spell(AZ.ReapingFlames1) == 0 then
        return cast(AZ.ReapingFlames1, 'target')
    end
			 if castable(AZ.ReapingFlames2) and -spell(AZ.ReapingFlames2) == 0 then
        return cast(AZ.ReapingFlames2, 'target')
    end
				 if castable(AZ.ReapingFlames3) and -spell(AZ.ReapingFlames3) == 0 then
        return cast(AZ.ReapingFlames3, 'target')
    end
	
	--4
	if delay < GetTime() then
	 if castable(AZ.FocusedAzeriteBeam1) and -spell(AZ.FocusedAzeriteBeam1) == 0 then
        return cast(AZ.FocusedAzeriteBeam1, 'target')
    end
			 if castable(AZ.FocusedAzeriteBeam2) and -spell(AZ.FocusedAzeriteBeam2) == 0 then
        return cast(AZ.FocusedAzeriteBeam2, 'target')
    end
				 if castable(AZ.FocusedAzeriteBeam3) and -spell(AZ.FocusedAzeriteBeam3) == 0 then
        return cast(AZ.FocusedAzeriteBeam3, 'target')
    end
	 delay = GetTime() + 1.4
end	
	--5
	
	 if castable(AZ.PurifyingBlast1) and -spell(AZ.PurifyingBlast1) == 0 then
        return cast(AZ.PurifyingBlast1, 'target')
    end
			 if castable(AZ.PurifyingBlast2) and -spell(AZ.PurifyingBlast2) == 0 then
        return cast(AZ.PurifyingBlast2, 'target')
    end
				 if castable(AZ.PurifyingBlast3) and -spell(AZ.PurifyingBlast3) == 0 then
        return cast(AZ.PurifyingBlast3, 'target')
    end
	
	--6
	
	 if castable(AZ.ConcentratedFlame1) and -spell(AZ.ConcentratedFlame1) == 0 then
        return cast(AZ.ConcentratedFlame1, 'target')
    end
			 if castable(AZ.ConcentratedFlame2) and -spell(AZ.ConcentratedFlame2) == 0 then
        return cast(AZ.ConcentratedFlame2, 'target')
    end
				 if castable(AZ.ConcentratedFlame3) and -spell(AZ.ConcentratedFlame3) == 0 then
        return cast(AZ.ConcentratedFlame3, 'target')
    end
	
	--7
			
	 if castable(AZ.TheUnboundForce1) and -spell(AZ.TheUnboundForce1) == 0 then
        return cast(AZ.TheUnboundForce1, 'target')
    end
			 if castable(AZ.TheUnboundForce2) and -spell(AZ.TheUnboundForce2) == 0 then
        return cast(AZ.TheUnboundForce2, 'target')
    end
				 if castable(AZ.TheUnboundForce3) and -spell(AZ.TheUnboundForce3) == 0 then
        return cast(AZ.TheUnboundForce3, 'target')
    end
	
		
	
	-- end essences 
	
	
	
	
  if enemyCount == 1 then
  
   if not castable(SB.Obliterate) and castable(SB.FrostScyte) then
   return cast(SB.FrostScyte, 'target')
   end
   
   
   
   if toggle("cooldowns", true) then
   
   if not castable(SB.HowlingBlast) and castable(SB.RuneWeapon) and -player.power.runicpower.actual <= 25 then
   return cast(SB.RuneWeapon, 'target')
   end
   
	  	 if castable(SB.Pillaroffrost) then
	    return cast(SB.Pillaroffrost)
	  end
   
   end
   
		if talent(3, 2) then
		if castable(SB.HornOfWinter, 'player') and not -buff(SB.HornOfWinter) then
		return cast(SB.HornOfWinter, 'player')
		end
		end
   
   
 

   
	if toggle("Opener", false) then
    
	 if player.buff(SB.Rime).remains > 1 then
        return cast(SB.HowlingBlast, 'Target')
		end
		
	if castable(SB.Obliterate) and -player.power.runicpower.actual <= 95 then
        return cast(SB.Obliterate, 'Target')
	end

	 
	 if castable(SB.RuneWeapon) then
	    return cast(SB.RuneWeapon, 'Target')
	  end
	  	 if castable(SB.Pillaroffrost) then
	    return cast(SB.Pillaroffrost)
	  end
	  if castable(SB.Breathofsyndra) and -player.power.runicpower.actual > 95 then
	  	    return cast(SB.Breathofsyndra, 'Target')
	  end
	   if player.buff(SB.Breathofsyndra).down then
	  	  		macro('/fd toggle Opener')
				return cast(SB.DeathAdvance, 'ground')
	  end
	  
	  end
	  
    if Breathofsyndras == true then
	
	if castable(SB.FrostWyrmFury) then
	return cast(SB.FrostWyrmFury, 'target')
	end
	if castable(SB.Remorselesswinter)  then 
	return cast(SB.Remorselesswinter)
	end	
	if player.buff(SB.Rime).remains > 1 then
	return cast(SB.HowlingBlast, 'target')
	end
	if player.buff(SB.KillingMachine).remains > 1 then
	return cast(SB.Obliterate, 'target')
	end		
	if player.power.runicpower.actual <= 50 then
	return cast(SB.Obliterate, 'target')
	end
	if player.power.runicpower.actual > 30 then
	return cast(SB.GlacialAdvance, 'target')
	end
end
                
                
                
if Breathofsyndras == false then      


--Apply Disease
    if (-buff(SB.DarkSuccor) and buff(SB.DarkSuccor).remains < 3) or -player.health < 50 then
      return cast(SB.DeathStrike, 'target')
    end
    if player.buff(SB.KillingMachine).remains > 1 then
      return cast(SB.Obliterate, 'target')
    end
	if castable(SB.Remorselesswinter)  then 
	return cast(SB.Remorselesswinter)
	end	
    if -power.runicpower > 95 then
      return cast(SB.IceStrike, 'target')
    end
    if -buff(SB.Rime) and castable(SB.HowlingBlast) then
      return cast(SB.HowlingBlast, 'target')
    end
    if not -buff(SB.KillingMachine) and -power.runicpower > 75 then
      return cast(SB.IceStrike, 'target')
    end
    if -spell(SB.Obliterate) == 0 then
      return cast(SB.Obliterate, 'target')
    end
	if player.power.runicpower.actual > 30 then
	return cast(SB.GlacialAdvance, 'target')
	end

       
end






  end
 
  
  if enemyCount > 2 then


   if toggle("cooldowns", true) then
   
   if not castable(SB.HowlingBlast) and castable(SB.RuneWeapon) and -player.power.runicpower.actual <= 25 then
   return cast(SB.RuneWeapon, 'target')
   end
   
	  	 if castable(SB.Pillaroffrost) then
	    return cast(SB.Pillaroffrost)
	  end
   
   end
   
		if talent(3, 2) then
		if castable(SB.HornOfWinter, 'player') and not -buff(SB.HornOfWinter) then
		return cast(SB.HornOfWinter, 'player')
		end
		end
   
   
 

   
	if toggle("Opener", false) then
    
	 if player.buff(SB.Rime).remains > 1 then
        return cast(SB.HowlingBlast, 'Target')
		end
		
	if castable(SB.FrostScyte) and -player.power.runicpower.actual <= 95 then
        return cast(SB.FrostScyte, 'Target')
	end

	 
	 if castable(SB.RuneWeapon) then
	    return cast(SB.RuneWeapon, 'Target')
	  end
	  	 if castable(SB.Pillaroffrost) then
	    return cast(SB.Pillaroffrost)
	  end
	  if castable(SB.Breathofsyndra) and -player.power.runicpower.actual <= 95 then
	  	    return cast(SB.Breathofsyndra, 'Target')
	  end
	   if player.buff(SB.Breathofsyndra).down then
	  	  		macro('/fd toggle Opener')
				return cast(SB.DeathAdvance, 'ground')
	  end
	  
	  end
	  
    if Breathofsyndras == true then
	

	
	if lastcast(SB.ChainsofIce) and castable(SB.FrostWyrmFury) then
	return cast(SB.FrostWyrmFury, 'target')
	end
	if castable(SB.Remorselesswinter)  then 
	return cast(SB.Remorselesswinter)
	end	
	if player.buff(SB.Rime).remains > 1 then
	return cast(SB.HowlingBlast, 'target')
	end
	if player.buff(SB.KillingMachine).remains > 1 then
	return cast(SB.FrostScyte, 'target')
	end		
	if player.power.runicpower.actual <= 50 then
	return cast(SB.FrostScyte, 'target')
	end
	if player.power.runicpower.actual > 30 then
	return cast(SB.GlacialAdvance, 'target')
	end
end
                
                
                
if Breathofsyndras == false then      


--Apply Disease
    if (-buff(SB.DarkSuccor) and buff(SB.DarkSuccor).remains < 3) or -player.health < 50 then
      return cast(SB.DeathStrike, 'target')
    end
    if player.buff(SB.KillingMachine).remains > 1 then
      return cast(SB.FrostScyte, 'target')
    end
	if castable(SB.Remorselesswinter)  then 
	return cast(SB.Remorselesswinter)
	end	
    if -power.runicpower > 95 then
      return cast(SB.IceStrike, 'target')
    end
    if -buff(SB.Rime) and castable(SB.HowlingBlast) then
      return cast(SB.HowlingBlast, 'target')
    end
    if not -buff(SB.KillingMachine) and -power.runicpower > 75 then
      return cast(SB.IceStrike, 'target')
    end
    if -spell(SB.FrostScyte) == 0 then
      return cast(SB.FrostScyte, 'target')
    end
	if player.power.runicpower.actual > 30 then
	return cast(SB.GlacialAdvance, 'target')
	end

       
end


  end
  end
end
 





local function resting()
  -- Put great stuff here to do when your out of combat
end

function interface()
local settings3 = {
        key = 'DeathKing_Settings',
        title = 'Всратый труп production',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = " Какой то флекс!" },
			{ type = 'rule' },
			{ type = 'header', text = "Дыхание пидрагосы есть чи нет" },
			{ key = 'Breathofsyndras', type = 'checkbox', text = 'Меняем ротацию', desc = '', default = false },

        }
    }
	configWindow2 = dark_addon.interface.builder.buildGUI(settings3)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings3',
        label = 'Config',
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
  dark_addon.interface.buttons.add_toggle(
    {
      name = "Opener",
      label = "Use Opener",
      font = "dark_addon_icon",
      on = {
        label = dark_addon.interface.icon("toggle-on"),
        color = dark_addon.interface.color.warrior_brown,
        color2 = dark_addon.interface.color.warrior_brown
      },
      off = {
        label = dark_addon.interface.icon("toggle-off"),
        color = dark_addon.interface.color.grey,
        color2 = dark_addon.interface.color.dark_grey
      }
    }
  )
end

dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.deathknight.frost,
  name = 'frost',
  label = 'Bundled Frost',
  combat = combat,
  resting = resting,
  interface = interface
})
