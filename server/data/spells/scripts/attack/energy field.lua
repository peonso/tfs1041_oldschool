local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, ITEM_ENERGYFIELD_PVP)

function onCastSpell(cid, var, isHotkey)
	-- check for stairHop delay
	if not getCreatureCondition(cid, CONDITION_PACIFIED) then
		return doCombat(cid, combat, var)
	else
		cid:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
		cid:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end