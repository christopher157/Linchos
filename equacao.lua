function MensagemHelp(cid)

	local mensagens = {
	
	[1] = {"Aqui no RidersWar nós não só queremos lhe entreter, mas também lhe ajudar.\nPor isso resolvemos desenvolver este sistema. Esse sistema tem o objetivo de\nresolver equações do segundo grau para você. Isso mesmo, aquela \nequação que ninguém aguenta mais, usando: x = – b + - raizb²-4.a.c"},
    [2] = {"Bom, Se você não sabe como funciona a equação do segundo grau... \nÉ, não precisa saber mesmo. rssrrs'\nPois se você entender um pouquinho do conceito da equação, \nnós já podemos resolver ela por completa para você.\nE se você já tem um pouco do conceito, é só pular esta parte e ir \npara: 'Como aplicar valores no comando apra obter o resultado da equação:'"},
    [3] = {"As equações do tipo Ax + b = 0, com A e B números\nreais e A # 0 são consideradas equações do 1° grau, e\npodem ter no máximo um resultado. Os modelos de expressões\nque satisfazem a condição Ax² + Bx + V = 0, com A, B e C números\nreais e # de 0 se enquadram na condição de equações do 2° grau,\nsendo possível a sua resolução através do Teorema de Bháskara.\nA utilização desse teorema requer conheccimento dos valores dos\ncoeficientes A, B e C, por exemplo, na equação 2x² + 4x - 12 = 0\nos coeficientes são: A = 2, B = 4 E C = -12.\nUma equação do 2° grau pode ter no máximo duas raízes (soluções)\nreais, a condição de existência das raízes dependerá do valor do\ndiscrimento(?). De acordo com o seu valor podemos ter as seguintes\nsituações:\n\n? < 0, não possui raízes reais.\n? = 0, possui duas raízes reais idênticas.\n? > 0, possui duas raízes reais e distintas.\n"},
    [4] = {"                                                                    Exemplo:\n\nSendo: y² + 18y - 40 = 0\nEntão: A = 1, B = 18, C = -40\n\nÉ isso que você precisa nos informar! Apenas o valor de 'A', 'B' e 'C'\nda equação e o sistema automaticamente irá lhe devolve o valor de Delta, de X¹ e X²."},
    [4] = {"Como aplicar valores no comando para obter o resultado da equação:"},
    [6] = {"Se eu quero o resultado de: x² -5x - 6 = 0, o comando ficará simplesmente:\n!equacao 1, -5, -6.\nNeste caso, o resultado seria:\n                                                           Delta = 49\n                                                            X'' = 6\n                                                            X' = -1"},         
	
	}
	
    for index, mensagem in pairs(mensagens) do
		doPlayerPopupFYI(cid, mensagem[1])
	end
	
   return true
end

function onSay(cid, words, param, channel)

	if (param == '') then
		local str = "Desculpe-nos, mas a sintaxe deste comando está incorreta. Iremos passar alguns parâmetros que poderão lhe ajudar:\n1 - !equacao help\n2 !equacao coeficiente a, coeficiente b, coneficiente c"
		return doPlayerSendTextMessage(cid, 27, str)
	end
	
	local t = param:explode(",")

    local a, b, c = t[1], t[2], t[3]

	if (a == "help") then
		 return MensagemHelp(cid)
	end
	
	if (a == '' or not tonumber(a)) then
	   return doPlayerSendTextMessage(cid, 27, "Está faltando o coeficiente A ou você colocou uma letra juntamente.")
    end
     
	if (b == '' or not tonumber(b)) then
		return doPlayerSendTextMessage(cid, 27, "Está faltando o coeficiente B ou você colocou uma letra juntamente.")
	end
	
	if (not tonumber(c) or c == '') then
		return doPlayerSendTextMessage(cid, 27, "Está faltando o coeficiente ou você colocou uma letra juntamente.")
	end
	
	local delta = b^2-4*a*c
	local raiz = math.sqrt(delta)
	local x1, x2, x3 = -b+raiz, -b-raiz, 2*a
	local quadrado = b^2
    local ante = 4*a*c
    
    if (delta == 0) then
       doPlayerPopupFYI(cid, "Estes valores retornaram\na equação: "..(tonumber(a) > 0 and "+" or "")..""..a.."x² "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0 \nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a operação,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsso quer dizer que esta \nequação termina aqui \nmesmo, pois 0\nresultará 2 resultados iguals.\nA próxima página exibirá\n seu cálculo.")
      return doPlayerPopupFYI(cid, "Fórmula: Delta = b²-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."²-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."")
    end
      
	if (delta < 0) then
	    doPlayerPopupFYI(cid, "Estes valores retornaram\na equação: "..(tonumber(a) > 0 and "+" or "")..""..a.."x² "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0 \nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a operação,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsso quer dizer que esta \nequação não existe \ne não é possível achar \nos valores de X, pois \nnúmeros abaixo de 0 ou \no próprio 0 não possui \nraizes reais.\n\nA próxima 'página' exibirá\nseu cálculo inexato:")
       return doPlayerPopupFYI(cid, "Fórmula: Delta = b²-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."²-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."")
    else     
        doPlayerPopupFYI(cid, "Com estes valores, \nverificamos que sua \nequação é: "..(tonumber(a) > 0 and "+" or "")..""..a.."x² "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0\nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a operação,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsto é: você tem um cálculo \nperfeito.\n\nA próxima página exibirá o \nseu cálculo exato.\n\n\Lembre-se:\nNão há probabilidade \nalguma deste cálculo \nestar errado.")
	   return doPlayerPopupFYI(cid, "Fórmula: Delta = b²-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."²-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."\n\nFórmula: -b +- raiz de Delta/2.a\n\nx = (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." + - raiz de "..delta.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.."\n\nx' (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." + "..raiz.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.." = "..x1/x3.."\nx'' (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." - "..raiz.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.." = "..x2/x3.."\n\nResultado final:\nx' = "..x1/x3.."\nx'' = "..x2/x3.."")
	end
end