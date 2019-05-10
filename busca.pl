%% Verifica se um elemento X existe no array
%% pertence(+X,+[]).
pertence(X,[X|_]):-!.
pertence(X,[_|C]):-
	pertence(X,C).

%% Chama a função auxiliar que realiza a busca dos possíveis caminhos de Ini a Fim
%% caminho(+Ini,+Fim,-Dist,-Cam).
caminho(Ini,Fim,Dist,Cam):-
	caminho_aux(Ini,[Fim],0,Dist,Cam).

%% Função auxiliar que realiza a busca dos possíveis caminhos de Ini a Fim
%% caminho(+Ini,+Fim,0,-Dist,-Cam).
caminho_aux(Cid,[Cid|Cids],Dist,Dist,[Cid|Cids]).
caminho_aux(Ini,[Adj|Cids],Dist,DistF,CamF):-
	pode_ir(Interm,Adj,D1,_),
	%% Verifica se a cidade Intermediaria não pertence a lista de cidades já visitadas
	\+ pertence(Interm,[Adj|Cids]),
	%% Acumula a distância
	D2 is Dist+D1,
	caminho_aux(Ini,[Interm,Adj|Cids],D2,DistF,CamF).

%% Entre os caminhos possíveis, devolve o de menor caminho
%% menor_caminho(+Ini,+Fim,-Dist,-Cam).
menor_caminho(Ini,Fim,Dist,Cam):-
	caminho(Ini,Fim,Dist,Cam),
	\+ (caminho(Ini,Fim,Dist2,_), Dist2 < Dist).