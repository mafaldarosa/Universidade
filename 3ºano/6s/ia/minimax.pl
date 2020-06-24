g(jogo):- [jogo], estado_inicial(Ei), minimax_decidir(Ei,Op),nl,
write(Op),nl.

minimax_decidir(Ei,terminou):- terminal(Ei).



minimax_decidir(Ei,Opf):- 
	findall(Es-Op, op1(Ei,Op,Es),L),
	length(L,S),
	incMais(S),
	findall(Vc-Op,(member(E-Op,L), minimax_valor(E,Vc,1)),L1),
	escolhe_max(L1,Opf).


minimax_valor(Ei,Val,P):- terminal(Ei), !, valor(Ei,Val,P).


minimax_valor(Ei,Val,P):- 
	findall(Es,op1(Ei,_,Es),L),
	length(L,S),
	incMais(S),
	P1 is P+1,
	findall(Val1,(member(E,L),minimax_valor(E,Val1,P1)),V),
	seleciona_valor(V,P,Val).



seleciona_valor(V,P,Val):- X is P mod 2, X=0,!, maximo(V,Val).

seleciona_valor(V,_,Val):- minimo(V,Val).


maximo([A|R],Val):- maximo(R,A,Val).

maximo([],A,A).
maximo([A|R],X,Val):- A < X,!, maximo(R,X,Val).
maximo([A|R],_,Val):- maximo(R,A,Val).


escolhe_max([A|R],Val):- escolhe_max(R,A,Val).

escolhe_max([],_-Op,Op).
escolhe_max([A-_|R],X-Op,Val):- A < X,!, escolhe_max(R,X-Op,Val).
escolhe_max([A|R],_,Val):- escolhe_max(R,A,Val).

minimo([A|R],Val):- minimo(R,A,Val).

minimo([],A,A).
minimo([A|R],X,Val):- A > X,!, minimo(R,X,Val).
minimo([A|R],_,Val):- minimo(R,A,Val).