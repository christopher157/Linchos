local skulls = {
[0] = {0, 2229, "Player"},
[1] = {3, 2229, "PK"},
[2] = {4, 2229, "PK RED"},
[3] = {5, 2229, "PK BLACK"}
}

function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	
	if (player:isPlayer()) then
		for index, pk in pairs(skulls) do
			if (player:getSkull() == pk[1]) then
				local x = killer:addItem(pk[2], 1)
				x:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Este é o coração do "..pk[3]..": "..player:getName()..", level: ["..player:getLevel().."], derrotado pelo Player: "..killer:getName()..", level: ["..killer:getLevel().."], no dia: "..(os.date("%d")).." de "..(os.date("%B")).." de "..os.date("%Y").." ("..(os.date("%A")).."), às: "..(os.date("%X"))..".")
			end
		end
	end
	
	return true
end                                                            