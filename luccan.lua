fromToPos = {{x = 157, y = 48, z = 7}, {x = 162, y = 50, z = 7}} -- Pos superior esquerda, pos inferior direita.
numSqm = 5 -- Numero total de SQMs na area. 

function onSay(cid, words, param, channel)

	a, b, c = fromToPos[1].x, fromToPos[2].x, fromToPos[1].y
	
	for i = 1, numSqm do	
		while a < b do
			doCreateItem(math.random(9043, 9050), 1, {x = a, y = c, z = fromToPos[1].z})
			a = a + 1
		end
	
		if a == b then
			c = c + 1
			a = fromToPos[1].x
		end                                                                               
	end

	return true
end