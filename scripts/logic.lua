-- Super Metroid Logic

function isCasual()
	local casual = Tracker:ProviderCountForCode("casual")
	
	if (casual == 1) then
		return 1
	end
	
	return 0
end

function isTournament()
	local tournament = Tracker:ProviderCountForCode("tournament")
	
	if (tournament == 1) then
		return 1
	end
	
	return 0
end

function hasWave()
	local wave = Tracker:ProviderCountForCode("wave")

	if (wave == 1) then
		return 1
	end
		
	return 0
end

function hasPlasmaBeam()
	local plasma = Tracker:ProviderCountForCode("plasma")

	if (plasma == 1) then
		return 1
	end
		
	return 0
end

function hasChargeBeam()
	local charge = Tracker:ProviderCountForCode("charge")

	if (charge == 1) then
		return 1
	end
		
	return 0
end

function hasHiJump()
	local hijump = Tracker:ProviderCountForCode("hijump")

	if (hijump == 1) then
		return 1
	end
		
	return 0
end


function hasSpaceJump()
	local space = Tracker:ProviderCountForCode("space")

	if (space == 1) then
		return 1
	end
		
	return 0
end

function hasVaria()
	local varia = Tracker:ProviderCountForCode("varia")

	if (varia == 1) then
		return 1
	end
		
	return 0
end

function hasGravity()
	local gravity = Tracker:ProviderCountForCode("gravity")

	if (gravity == 1) then
		return 1
	end
		
	return 0
end

function hasGrapple()
	local grapple = Tracker:ProviderCountForCode("grapple")

	if (grapple == 1) then
		return 1
	end
		
	return 0
end

function hasIceBeam()
	local ice = Tracker:ProviderCountForCode("ice")

	if (ice == 1) then
		return 1
	end
		
	return 0
end


function hasBasicBombs()
	local bomb = Tracker:ProviderCountForCode("bomb")
	
	if (bomb == 1) then
		return 1
	end
		
	return 0
end

function hasPowerBombs()
	local powerbomb = Tracker:ProviderCountForCode("powerbomb")
	
	if (powerbomb >= 1) then
		return 1
	end
	
	return 0
end

function hasBombs()
	if (hasBasicBombs() == 1 or hasPowerBombs() == 1) then
		return 1
	end
		
	return 0
end

function countPB()
	local powerbomb = Tracker:ProviderCountForCode("powerbomb")
	local powerbomb2 = Tracker:ProviderCountForCode("powerbomb2")
	local powerbomb3 = Tracker:ProviderCountForCode("powerbomb3")
	
	if (powerbomb == 1) then
		return 1
	elseif (powerbomb2 == 1) then
		return 2
	elseif (powerbomb3 == 1) then
		return 3
	end
	
	return 0
end

function hasMorph()
	local morph = Tracker:ProviderCountForCode("morph")
	
	if (morph == 1) then
		return 1
	end
	
	return 0
end

function hasMissiles()
	local missile = Tracker:ProviderCountForCode("missile")
	
	if (missile >= 1) then
		return 1
	end
	
	return 0
end

function hasSuper()
	local super = Tracker:ProviderCountForCode("super")
	
	if (super >= 1) then
		return 1
	end
	
	return 0
end

function hasEnergyReserves()
	local etanks = Tracker:ProviderCountForCode("etank")
	local reservetanks = Tracker:ProviderCountForCode("reservetank")
	
	return (etanks + reservetanks + 1) -- +1 for starting tank
end

function hasScrewAttack()
	local screw = Tracker:ProviderCountForCode("screw")
	
	if (screw == 1) then
		return 1
	end
	
	return 0
end

function hasSpringBall()
	local spring = Tracker:ProviderCountForCode("spring")
	
	if (spring == 1) then
		return 1
	end
	
	return 0
end

function hasGravity()
	local gravity = Tracker:ProviderCountForCode("gravity")
	if (gravity == 1) then
		return 1
	end
	
	return 0
end

function hasSpeedBooster()
	local speed = Tracker:ProviderCountForCode("speed")
	if (speed == 1) then
		return 1
	end
	
	return 0
end

function canFlySM()
	if (hasSpaceJump() == 1 or canBombJump() == 1) then
		return 1
	end
		
	return 0
end

function canBombWalls()
	if ((hasMorph() == 1 and hasBombs() == 1) or hasScrewAttack() == 1) then
		return 1
	end
	
	return 0
end

function canBombPassages()
	if (hasMorph() == 1 and hasBombs() == 1) then
		return 1
	end
	
	return 0
end

function canBombJump()
	if (hasMorph() == 1 and hasBasicBombs() == 1) then
		return 1
	end
	
	return 0
end

function canBomb()
	if (hasMorph() == 1 and (hasPowerBombs() == 1 or hasBasicBombs() == 1)) then
		return 1
	end
	
	return 0
end

function canPowerBomb()
	if (hasMorph() == 1 and hasPowerBombs() == 1) then
		return 1
	end
	
	return 0
end

function canOpenRedDoors()
	if (hasMissiles() == 1 or hasSuper() == 1) then
		return 1
	end
	
	return 0
end

function canSpringJump()
	if (hasMorph() == 1 and hasSpringBall() == 1) then
		return 1
	end
	
	return 0
end

function canEnterAndLeaveGauntletTournament()
	if (((hasMorph() == 1 and (hasBombs() == 1 or (hasPowerBombs() == 1 and countPB() >= 2))) or hasScrewAttack() == 1 or (hasSpeedBooster() == 1 and canPowerBomb() == 1 and hasEnergyReserves() >= 2))) then
		return 1
	end
	
	return 0
end

function canEnterAndLeaveGauntletCasual()
	if (((hasMorph() == 1 and (canFlySM() == 1 or hasSpeedBooster() == 1)) and (hasBasicBombs() == 1 or (hasPowerBombs() == 1 and countPB() >= 2) or hasScrewAttack() == 1))) then
		return 1
	end
	
	return 0
end

function canDefeatBotwoon()
	if (isCasual() == 1 and (hasSpeedBooster() == 1 or canAccessMaridiaPortal() == 1)) then
		return 1
	elseif (isTournament() == 1 and (hasIceBeam() == 1 or hasSpeedBooster() == 1 or canAccessMaridiaPortal() == 1)) then
		return 1
	end
	
	return 0
end


function canDefeatDraygon()
	if (isCasual() == 1 and canDefeatBotwoon() == 1 and hasGravity() == 1 and ((hasSpeedBooster() == 1 and hasHiJump() == 1) or canFlySM() == 1)) then
		return 1
	elseif (isTournament() == 1 and canDefeatBotwoon() == 1 and hasGravity() == 1) then
		return 1
	end
	
	return 0
end

function heatProof()
	if (hasVaria() == 1) then
		return 1
	end
	
	return 0
end

function canHellRun()
	if (heatProof() == 1 or hasEnergyReserves() >= 6) then
		return 1
	end
	
	return 0
end

function crocomireTournament()
	if ((((canBombWalls() == 1 or hasSpeedBooster() == 1)
			and (hasSuper() == 1 and hasMorph() == 1))
			or canAccessNorfairPortal() == 1)
			and hasSuper() == 1
			and (hasEnergyReserves()  >= 3 and hasSpeedBooster() == 1 or canHellRun() == 1)
			and ((canFlySM() == 1 or hasHiJump() == 1 or canSpringJump() == 1 or (hasVaria() == 1 and hasIceBeam() == 1)) or hasSpeedBooster() == 1)
			and (canBombPassages() == 1 or hasSpeedBooster() == 1 or (heatProof() == 1 and hasMorph() == 1))) then
		return 1
	end
	
	return 0
end

function crocomireCasual()
	if ((((canBombWalls() == 1 or hasSpeedBooster() == 1)
                and (hasSuper() == 1 and hasMorph() == 1))
                or canAccessNorfairPortal() == 1)
                and hasVaria() == 1
				and hasSuper() == 1
				and ((canPowerBomb() == 1 and hasSpeedBooster() == 1) or (hasSpeedBooster() == 1 and hasWave() == 1) or (hasMorph() == 1 and (canFlySM() == 1 or hasHiJump() == 1) and hasWave() == 1))) then
		return 1
	end
	
	return 0
end

function norfairEastTournament()
	if ((((canBombWalls() == 1 or hasSpeedBooster() == 1)
                and (hasSuper() == 1 and hasMorph() == 1))
                or canAccessNorfairPortal() == 1)
                and canHellRun() == 1
                and (hasSuper() == 1 and (canFlySM() == 1 or hasHiJump() == 1 or canSpringJump() == 1 or (hasVaria() == 1 and (hasIceBeam() == 1 or hasSpeedBooster() == 1)))
                 or (hasSpeedBooster() == 1 and canPowerBomb() == 1))) then
		return 1
	end
	
	return 0
end

function norfairEastCasual()
	if ((((canBombWalls() == 1 or hasSpeedBooster() == 1)
                and (hasSuper() == 1 and hasMorph() == 1))
                or canAccessNorfairPortal() == 1)
                and hasVaria() == 1
                and hasSuper() == 1
                and (canFlySM() == 1 or hasHiJump() == 1 or hasSpeedBooster() == 1)) then
		return 1
	end
	
	return 0
end

function norfairWest()
	if (((canBombWalls() == 1 or hasSpeedBooster() == 1)
                and (hasSuper() == 1 and hasMorph() == 1))
                or canAccessNorfairPortal() == 1) then
		return 1
	end
	
	return 0
end

function lowerNorfairEastTournament()
	if (heatProof() == 1
				and	((norfairEastTournament() == 1
						and canPowerBomb() == 1		
						and (hasHiJump() == 1 or hasGravity() == 1))
					or (canAccessLowerNorfairPortal() == 1 
						and canBombWalls() == 1 
						and (canFlySM() == 1 or canSpringJump() == 1 or hasSpeedBooster() == 1)))
				and (canFlySM() == 1 or hasHiJump() == 1 or canSpringJump() == 1 or (hasIceBeam() == 1 and hasChargeBeam() == 1))
				and (canBombPassages() == 1 or (hasScrewAttack() == 1 and hasSpaceJump() == 1))) then
		return 1
	end
	
	return 0
end

function lowerNorfairEastCasual()
	if (heatProof() == 1
				and	((norfairEastCasual() == 1
						and canPowerBomb() == 1		
						and (hasSpaceJump() == 1 and hasGravity() == 1))
					or (canAccessLowerNorfairPortal() == 1 
						and canBombWalls() == 1
						and hasSuper() == 1
						and canPowerBomb() == 1
						and (canFlySM() == 1 or hasSpeedBooster() == 1)))
				and (canFlySM() == 1 or hasHiJump() == 1)) then
		return 1
	end
	
	return 0
end

function plasmaBeamTournament()
	if (canDefeatDraygon() == 1
				and ((hasChargeBeam() == 1 and hasEnergyReserves() >= 4) or hasScrewAttack() == 1 or hasPlasmaBeam() == 1 or hasSpeedBooster() == 1)
				and (hasHiJump() == 1 or canSpringJump() == 1 or canFlySM() == 1 or hasSpeedBooster() == 1)) then
		return 1
	end
	
	return 0
end

function canAccessDeathMountainPortal()
	if ((canBombWalls() == 1 or hasSpeedBooster() == 1)
		and (hasSuper() == 1 and hasMorph() == 1)) then
		return 1
	end
	
	return 0
end

function canAccessMiseryMirePortal()
	if (isCasual() == 1 and heatProof() == 1 and hasSuper() == 1 and canPowerBomb() == 1 and hasGravity() == 1 and hasSpaceJump() == 1) then
		return 1
	elseif (isTournament() == 1 and heatProof() == 1 and (hasHiJump() == 1 or hasGravity() == 1) and canPowerBomb() == 1) then
		return 1
	end
	
	return 0
end

function canAccessDarkWorldPortal()
	if (isCasual() == 1 and canPowerBomb() == 1 and hasSuper() == 1 and hasGravity() == 1 and hasSpeedBooster() == 1) then
		return 1
	elseif (isTournament() == 1 and 
		(hasSuper() == 1 and 
			(hasChargeBeam() == 1 or (hasSuper() == 1 and hasMissiles() == 1)) and
			(hasGravity() == 1 or (hasHiJump() == 1 and hasIceBeam() == 1 and hasGrapple() == 1)) and
			(hasIceBeam() == 1 or (hasSpeedBooster() == 1 and hasGravity == 1)))) then
		return 1
	end
	
	return 0
end

-- ALTTP Logic

function hasFlute()
	local flute = Tracker:ProviderCountForCode("flute")
	if (flute == 1) then
		return 1
	end
	
	return 0
end

function hasBottle()
	local bottle = Tracker:ProviderCountForCode("bottle")
	if (bottle >= 1) then
		return 1
	end
	
	return 0
end

function hasHalfMagic()
	local halfmagic = Tracker:ProviderCountForCode("halfmagic")
	if (halfmagic >= 1) then
		return 1
	end
	
	return 0
end

function hasLamp()
	local lamp = Tracker:ProviderCountForCode("lamp")
	if (lamp == 1) then
		return 1
	end
	
	return 0
end
	
function hasPowerGlove()
	local gloves = Tracker:ProviderCountForCode("gloves")
	if (gloves == 1) then
		return 1
	end
	
	return 0
end
	
function hasTitansMitt()
	local mitts = Tracker:ProviderCountForCode("mitts")
	if (mitts == 1) then
		return 1
	end
	
	return 0
end

function hasMoonPearl()
	local moonpearl = Tracker:ProviderCountForCode("moonpearl")
	if (moonpearl == 1) then
		return 1
	end
	
	return 0
end

function hasFlippers()
	local flippers = Tracker:ProviderCountForCode("flippers")
	if (flippers == 1) then
		return 1
	end
	
	return 0
end

function hasHookshot()
	local hookshot = Tracker:ProviderCountForCode("hookshot")
	if (hookshot == 1) then
		return 1
	end
	
	return 0
end

function hasHammer()
	local hammer = Tracker:ProviderCountForCode("hammer")
	if (hammer == 1) then
		return 1
	end
	
	return 0
end

function defeatedAga()
	local aga1 = Tracker:ProviderCountForCode("aga1")
	if (aga1 == 1) then
		return 1
	end
	
	return 0
end

function canFly()
	if (hasFlute() == 1) then
		return 1
	end
	
	return 0
end
	
function canLiftRocks()
	if (hasPowerGlove() == 1 or hasTitansMitt() == 1) then
		return 1
	end
	
	return 0
end

function canLiftDarkRocks()
	if (hasTitansMitt() == 1) then
		return 1
	end
	
	return 0
end


function canAccessNorfairPortal()
	if (canFly() == 1 or (canLiftRocks() == 1 and hasLamp() == 1)) then
		return 1
	end
	
	return 0
end


function canAccessMaridiaPortal()
	if (isCasual() == 1 and hasMoonPearl() == 1 and hasFlippers() == 1 and hasGravity() == 1 and hasMorph() == 1 and (defeatedAga() == 1 or (hasHammer() == 1 and canLiftRocks() == 1) or canLiftDarkRocks() == 1)) then
		return 1
	elseif (isTournament() == 1 and hasMoonPearl() == 1 and hasFlippers() == 1 and (canSpringJump() == 1 or hasHiJump() == 1 or hasGravity() == 1) and hasMorph() == 1 and (defeatedAga() == 1 or (hasHammer() == 1 and canLiftRocks() == 1) or canLiftDarkRocks() == 1)) then
		return 1
	end
	
	return 0
end

function canAccessLowerNorfairPortal()
	if (canFly() == 1 and canLiftDarkRocks() == 1) then
		return 1
	end
	
	return 0
end

function canEnterNEDarkWorld()
	if ((defeatedAga() == 1
			or (hasHammer() == 1 and canLiftRocks() == 1 and hasMoonPearl() == 1)
			or (canLiftDarkRocks() == 1 and hasFlippers() == 1 and hasMoonPearl() == 1)
			or (canAccessDarkWorldPortal() == 1 and hasFlippers() == 1 and hasMoonPearl() == 1))) then
		return 1
	end
	
	return 0
end

function canEnterNWDarkWorld()
	if (hasMoonPearl() == 1
			and ((canEnterNEDarkWorld() == 1
				and (hasHookshot() == 1 and (hasFlippers() == 1 or canLiftRocks() == 1 or hasHammer() == 1)))
				or (hasHammer() == 1 and canLiftDarkRocks() == 1)
				or canLiftDarkRocks() == 1)) then
		return 1
	end
	
	return 0
end

function canEnterSDarkWorld()
	if (hasMoonPearl() == 1
			and ((canEnterNEDarkWorld() == 1 and (hasHammer() == 1
				or (hasHookshot() == 1 and (hasFlippers() == 1 or canLiftRocks() == 1))))
				or (hasHammer() == 1 and canLiftRocks() == 1)
				or canLiftDarkRocks() == 1)) then
		return 1
	end
	
	return 0
end

function canEnterDeathMountainWest()
	if (canFly() == 1 or (hasHookshot() == 1 and hasHammer() == 1) or canAccessDeathMountainPortal()) then
		return 1
	end
	
	return 0
end

function canExtendMagic()	
	if (hasHalfMagic() == 1 or hasBottle() == 1) then
		return true
	end
	
	return 0
end