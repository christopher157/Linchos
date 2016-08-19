function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local pos = {x = 5776, y = 5931, z = 9, stackpos = 1}
	local tile = Tile(pos)
	local thing_1 = tile:getThing(pos.stackpos)
	local thing = pushThing(thing_1)
	local itens = {11004, 12001, 12221}
	local ran = math.random(1, #itens)
	local storage = 56189237
	
	if (item.actionid == 1623) then
		if getPlayerStorageValue(cid, storage) >= 3 then
			return doPlayerSendTextMessage(cid, 27, "Voce ja possui o acesso a Aurora.")
		end
		
		local item_pos = getTileThingByPos(pos)
		
		if (thing.itemid >= 0) then
			doRemoveItem(getThingfromPos(pos).uid)
			doCreateItem(itens[ran], 1, pos)
			doSendMagicEffect(pos, 7)
			
			if (itens[ran] == 11004) then
				setPlayerStorageValue(cid, storage, 1)
				local str = {"Combinacao Status: Esquentando", "Combinacao Status: Quente", "Combinacao Status: Mediano."}
				local mensagem = math.random(1, #str)	
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
			else
				setPlayerStorageValue(cid, storage, -1)
				local str = {"Combinacao Status: Morno", "Combinacao Status: Frio", "Combinacao Status: Prossiga"}
				local mensagem = math.random(1, #str)	
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
			end
		end
	end
	
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local pos = {x = 5776, y = 5934, z = 9, stackpos = 1}
	local tile = Tile(pos)
	local thing_1 = tile:getThing(pos.stackpos)
	local thing = pushThing(thing_1)
	local itens = {11004, 12001, 12221}
	local ran = math.random(1, #itens)
	local storage = 56189237
	local chance = math.random(10)
	
	if (item.actionid == 1624) then

		local item_pos = getTileThingByPos(pos)
		
		if getPlayerStorageValue(cid, storage) >= 3 then
			return doPlayerSendTextMessage(cid, 27, "Voce ja possui acesso a Aurora.")
		end
		
		if (thing.itemid >= 0) then
			doRemoveItem(getThingfromPos(pos).uid)
			doCreateItem(itens[ran], 1, pos)
			doSendMagicEffect(pos, 7)
			
			if (itens[ran] == 12001) then 
				if getPlayerStorageValue(cid, storage) >= 1 then
					if chance >= 6 then
						local str = {"Combinacao Status: Legal", "Combinacao Status: Indo bem"}
						local mensagem = math.random(1, #str)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
						return setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
					else
						local str = {"Combinacao Status: Volte ao inicio", "Combinacao Status: Nao sera com esta combinacao que passaras, volte ao inicio"}
						local mensagem = math.random(1, #str)
						setPlayerStorageValue(cid, storage, -1)						
						return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
					end
				end
			else
				local str = {"Combinacao Status: Algo deu errado nesta combinacao. Volte ao inicio.", "Combinacao Status: Frio demais", "Combinacao Status: Prossiga"}
				local mensagem = math.random(1, #str)
				setPlayerStorageValue(cid, storage, -1)
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
			end
		end
	end
	
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local pos = {x = 5776, y = 5937, z = 9, stackpos = 1}
	local tile = Tile(pos)
	local thing_1 = tile:getThing(pos.stackpos)
	local thing = pushThing(thing_1)
	local itens = {11004, 12001, 12221}
	local ran = math.random(1, #itens)
	local storage = 56189237
	local chance = math.random(5)
	
	if (item.actionid == 1625) then

		local item_pos = getTileThingByPos(pos)
		if getPlayerStorageValue(cid, storage) >= 3 then
			return doPlayerSendTextMessage(cid, 27, "Voce ja possui acesso a Aurora.")
		end
		
		if (thing.itemid >= 0) then
			doRemoveItem(getThingfromPos(pos).uid)
			doCreateItem(itens[ran], 1, pos)
			doSendMagicEffect(pos, 7)
			
			if (itens[ran] == 12221) then
				if getPlayerStorageValue(cid, storage) >= 2 then
					if chance >= 3 then
						local str = {"Combinacao Status: Parabens. Voce acertou a ordem das estatuas e acabou de ganhar o acesso a Aurora. Puxe a quarta alavanca ao seu lado"}
						local mensagem = math.random(1, #str)
						setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
						return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
					end
				else
					setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid) -1)
					local str = {"Combinacao Status: Tudo deu errado. Volte ao inicio", "Combinacao Status: Nao foi dessa vez. Volte ao inicio.", "Voce estava indo otimamente bem. Mas esta ultima combinacao nao foi legal. Volte ao inicio.", "Combiancao Status: Voce estava bem. Mas agora teras de voltar ao inicio.", "Combinacao Status: Volte ao inicio."}
					local mensagem = math.random(1, #str)	
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")	
				end
			else
				local str = {"Combinacao Status: Congelou. Volte ao inicio", "Combinacao Status: Congelou tudo. Volte do inicio.", "Combiancao Status: Voce estava bem. Mas agora teras de voltar ao inicio.", "Combinacao Status: Volte ao inicio."}			
				local mensagem = math.random(1, #str)
				setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid) -1)
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..str[mensagem]..".")
			end
		end
	end
	
	return true
end

function OpenWalls()
local storage = 56189237
local x = true
local B  = {  
	[1] = {9533,{x=5783, y=5937, z=10, stackpos = 1}},   
	[2] = {9533,{x=5783, y=5936, z=10, stackpos = 1}},
	[3] = {9533,{x=5783, y=5935, z=10, stackpos = 1}},
	[4] = {9533,{x=5783, y=5934, z=10, stackpos = 1}}   
} 

	for i = 1, #B do
		if getTileItemById(B[i][2], B[i][1]).uid == 0 then
			x = false 
		end
		if x == true then
			doRemoveItem(getThingfromPos(B[i][2]).uid,1)
			doSendMagicEffect(B[i][2], 51)
		else
			doCreateItem(B[i][1], 1, B[i][2])
			doSendMagicEffect(B[i][2], 51)
		end
	end
	setGlobalStorageValue(storage + 6, -1)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local storage = 56189237
	
	if (item.actionid == 1626) then
	
		local storage_time = 789231678
		
		if getGlobalStorageValue(storage + 6) >= 1 then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O portao ja esta aberto.")
		end
		
		if getPlayerStorageValue(cid, storage) >= 3 then
			OpenWalls()
			addEvent(OpenWalls, 60*1000)
			doCreatureSay(cid, "As Walls fecharao em 1 minuto.", TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(storage + 6, 1)
		else
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa achar a combinacao correta das estatuas.")
		end
	end
	
	return true
end


function onStepIn(cid, item, position, fromPosition)
	local storage = 56189237
	local player = Player(cid)
    if getPlayerStorageValue(cid, storage) < 3 then 
       doTeleportThing(cid, fromPosition)
	   return player:sendTextMessge(MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa achar a combinacao certa das estatuas.")
	end

	return true
end