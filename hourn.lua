function onSay(cid, words, param, channel)
	
		if (param == '') then
 
			if getTilePzInfo(getThingPos(cid)) then
				return doPlayerSendTextMessage(cid, 27, "Você não pode criar o Boss dentro de uma área Pz, anta.")
			end
	
			doCreateMonster("Hourn", getThingPos(cid))
			doPlayerSendTextMessage(cid, 27, "Você criou o Hourn.")
	
			local str = "Hooo! A big Boss decided to invade the Temple, because he realized a great drive by. It would also a BIG help to contain it!"
	
			return broadcastMessage(str)
		end
	
	if (param ~= '') then
	
		local t = param:explode(",")
		local pos = {x = t[1], y = t[2], z = t[3]}
		local Error = "Comando incorreto, use: [/hourn posX, posY, posZ, MSGN para o servidor!] ou somente [/hourn]."
		
	for i = 1, 4 do
		if (not (tonumber(t[i]))) then
			doPlayerSendTextMessage(cid, 27, Error)
			break
		end
	end
	
		doCreateMonster("Hourn", pos)
		doPlayerSendTextMessage(cid, 27, "Você criou o Hourn.")
	
		return broadcastMessage(t[4])
	end
 
	return true
end