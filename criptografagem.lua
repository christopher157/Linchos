local criptografagem = {
	["a"] = "d",
	["b"] = "e",
	["c"] = "f",
	["d"] = "g",
	["e"] = "h",
	["f"] = "i",
	["g"] = "j",
	["h"] = "k",
	["i"] = "l",
	["j"] = "m",
	["k"] = "n",
	["l"] = "o",
	["m"] = "p",
	["n"] = "q",
	["o"] = "r",
	["p"] = "s",
	["q"] = "t",                                   
	["r"] = "u",
	["s"] = "v",
	["t"] = "w",
	["u"] = "x",
	["v"] = "y",
	["w"] = "z",
	["x"] = "a",
	["y"] = "b",
	["z"] = "c",
}

local descriptografagem = {
	["d"] = "a",
	["e"] = "b",
	["f"] = "c",
	["g"] = "d",
	["h"] = "e",
	["i"] = "f",
	["j"] = "g",
	["k"] = "h",
	["l"] = "i",
	["m"] = "j",
	["n"] = "k",
	["o"] = "l",
	["p"] = "m",
	["q"] = "n",
	["r"] = "o",
	["s"] = "p",
	["t"] = "q",
	["u"] = "r",
	["v"] = "s",
	["w"] = "t",
	["x"] = "u",
	["y"] = "v",
	["z"] = "w",
	["a"] = "x",
	["b"] = "y",
	["c"] = "z",
}

function substituirLetras(texto, traducoes, param)
    return string.gsub(texto, "%a", traducoes)
end

function onSay(cid, words, param, channel)

	local t = param:explode(",")
	local mensagem = t[2]
	                                        
	if (not t[1]) then
		return doPlayerSendTextMessage(cid, 27, "Voce precisa informar se deseja criptografar ou decriptar a mensagem.")
	end
	
	if (t[2] == '') then
		return doPlayerSendTextMessage(cid, 27, "Voce precisa informar a mensagem que será criptgrafada")
	end
	if (t[1] == "criptografar") then
		local str = substituirLetras(mensagem, criptografagem)
		return doPlayerSendTextMessage(cid, 27, "A mensagem ["..t[2].."] foi criptografada com sucesso. Seu código é: ["..str.."].")
	end
	
	if (t[1] == "descriptografar") then
		local str = substituirLetras(mensagem, descriptografagem)
		return doPlayerSendTextMessage(cid, 27, "O código ["..t[2].."] foi decriptado com sucesso. Sua mensagem é: ["..str.."]")
	end
	
	return true
end