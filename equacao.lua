function MensagemHelp(cid)

	local mensagens = {
	
	[1] = {"Aqui no RidersWar n�s n�o s� queremos lhe entreter, mas tamb�m lhe ajudar.\nPor isso resolvemos desenvolver este sistema. Esse sistema tem o objetivo de\nresolver equa��es do segundo grau para voc�. Isso mesmo, aquela \nequa��o que ningu�m aguenta mais, usando: x = � b + - raizb�-4.a.c"},
    [2] = {"Bom, Se voc� n�o sabe como funciona a equa��o do segundo grau... \n�, n�o precisa saber mesmo. rssrrs'\nPois se voc� entender um pouquinho do conceito da equa��o, \nn�s j� podemos resolver ela por completa para voc�.\nE se voc� j� tem um pouco do conceito, � s� pular esta parte e ir \npara: 'Como aplicar valores no comando apra obter o resultado da equa��o:'"},
    [3] = {"As equa��es do tipo Ax + b = 0, com A e B n�meros\nreais e A # 0 s�o consideradas equa��es do 1� grau, e\npodem ter no m�ximo um resultado. Os modelos de express�es\nque satisfazem a condi��o Ax� + Bx + V = 0, com A, B e C n�meros\nreais e # de 0 se enquadram na condi��o de equa��es do 2� grau,\nsendo poss�vel a sua resolu��o atrav�s do Teorema de Bh�skara.\nA utiliza��o desse teorema requer conheccimento dos valores dos\ncoeficientes A, B e C, por exemplo, na equa��o 2x� + 4x - 12 = 0\nos coeficientes s�o: A = 2, B = 4 E C = -12.\nUma equa��o do 2� grau pode ter no m�ximo duas ra�zes (solu��es)\nreais, a condi��o de exist�ncia das ra�zes depender� do valor do\ndiscrimento(?). De acordo com o seu valor podemos ter as seguintes\nsitua��es:\n\n? < 0, n�o possui ra�zes reais.\n? = 0, possui duas ra�zes reais id�nticas.\n? > 0, possui duas ra�zes reais e distintas.\n"},
    [4] = {"                                                                    Exemplo:\n\nSendo: y� + 18y - 40 = 0\nEnt�o: A = 1, B = 18, C = -40\n\n� isso que voc� precisa nos informar! Apenas o valor de 'A', 'B' e 'C'\nda equa��o e o sistema automaticamente ir� lhe devolve o valor de Delta, de X� e X�."},
    [4] = {"Como aplicar valores no comando para obter o resultado da equa��o:"},
    [6] = {"Se eu quero o resultado de: x� -5x - 6 = 0, o comando ficar� simplesmente:\n!equacao 1, -5, -6.\nNeste caso, o resultado seria:\n                                                           Delta = 49\n                                                            X'' = 6\n                                                            X' = -1"},         
	
	}
	
    for index, mensagem in pairs(mensagens) do
		doPlayerPopupFYI(cid, mensagem[1])
	end
	
   return true
end

function onSay(cid, words, param, channel)

	if (param == '') then
		local str = "Desculpe-nos, mas a sintaxe deste comando est� incorreta. Iremos passar alguns par�metros que poder�o lhe ajudar:\n1 - !equacao help\n2 !equacao coeficiente a, coeficiente b, coneficiente c"
		return doPlayerSendTextMessage(cid, 27, str)
	end
	
	local t = param:explode(",")

    local a, b, c = t[1], t[2], t[3]

	if (a == "help") then
		 return MensagemHelp(cid)
	end
	
	if (a == '' or not tonumber(a)) then
	   return doPlayerSendTextMessage(cid, 27, "Est� faltando o coeficiente A ou voc� colocou uma letra juntamente.")
    end
     
	if (b == '' or not tonumber(b)) then
		return doPlayerSendTextMessage(cid, 27, "Est� faltando o coeficiente B ou voc� colocou uma letra juntamente.")
	end
	
	if (not tonumber(c) or c == '') then
		return doPlayerSendTextMessage(cid, 27, "Est� faltando o coeficiente ou voc� colocou uma letra juntamente.")
	end
	
	local delta = b^2-4*a*c
	local raiz = math.sqrt(delta)
	local x1, x2, x3 = -b+raiz, -b-raiz, 2*a
	local quadrado = b^2
    local ante = 4*a*c
    
    if (delta == 0) then
       doPlayerPopupFYI(cid, "Estes valores retornaram\na equa��o: "..(tonumber(a) > 0 and "+" or "")..""..a.."x� "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0 \nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a opera��o,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsso quer dizer que esta \nequa��o termina aqui \nmesmo, pois 0\nresultar� 2 resultados iguals.\nA pr�xima p�gina exibir�\n seu c�lculo.")
      return doPlayerPopupFYI(cid, "F�rmula: Delta = b�-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."�-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."")
    end
      
	if (delta < 0) then
	    doPlayerPopupFYI(cid, "Estes valores retornaram\na equa��o: "..(tonumber(a) > 0 and "+" or "")..""..a.."x� "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0 \nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a opera��o,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsso quer dizer que esta \nequa��o n�o existe \ne n�o � poss�vel achar \nos valores de X, pois \nn�meros abaixo de 0 ou \no pr�prio 0 n�o possui \nraizes reais.\n\nA pr�xima 'p�gina' exibir�\nseu c�lculo inexato:")
       return doPlayerPopupFYI(cid, "F�rmula: Delta = b�-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."�-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."")
    else     
        doPlayerPopupFYI(cid, "Com estes valores, \nverificamos que sua \nequa��o �: "..(tonumber(a) > 0 and "+" or "")..""..a.."x� "..(tonumber(b) > 0 and "+" or "")..""..b.."x "..(tonumber(c) > 0 and "+" or "")..""..c.." = 0\nOnde:\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nConcluindo a opera��o,\ntemos Delta = "..delta.." \nque resulta na raiz: "..raiz.."\n\nIsto �: voc� tem um c�lculo \nperfeito.\n\nA pr�xima p�gina exibir� o \nseu c�lculo exato.\n\n\Lembre-se:\nN�o h� probabilidade \nalguma deste c�lculo \nestar errado.")
	   return doPlayerPopupFYI(cid, "F�rmula: Delta = b�-4.a.c\n\nA = "..(tonumber(a) > 0 and "+" or "")..""..a.." \nB = "..(tonumber(b) > 0 and "+" or "")..""..b.."\nC = "..(tonumber(c) > 0 and "+" or "")..""..c.."\n\nDelta = "..(tonumber(b) > 0 and "+" or "")..""..b.."�-4."..(tonumber(a) > 0 and "+" or "")..""..a.."."..(tonumber(c) > 0 and "+" or "")..""..c.."\nDelta = "..quadrado.." - "..ante.."\nDelta = "..delta.."\n\nF�rmula: -b +- raiz de Delta/2.a\n\nx = (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." + - raiz de "..delta.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.."\n\nx' (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." + "..raiz.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.." = "..x1/x3.."\nx'' (-)"..(tonumber(b) > 0 and "+" or "")..""..b.." - "..raiz.."/2."..(tonumber(a) > 0 and "+" or "")..""..a.." = "..x2/x3.."\n\nResultado final:\nx' = "..x1/x3.."\nx'' = "..x2/x3.."")
	end
end