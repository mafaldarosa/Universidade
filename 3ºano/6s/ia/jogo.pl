:-dynamic(winner/1).

estado_inicial(([(p1,_), (p2,_), (p3,_), (p4,_), (p5,_), 
				(p6,_), (p7,_), (p8,_), (p9,_),(p10,_),
				(p11,_), (p12,_), (p13,_), (p14,_), (p15,_),
				(p16,_), (p17,_), (p18,_), (p19,_), (p20,_),],_)).



terminal((E,_)):-linhas(E); colunas(E); 
			  diagonais(E);empate(E).



%função de utilidade, retorna o valor dos estados terminais, 1 ganha -1 perde
valor((E,_),1,_):- (linhas(E); colunas(E); diagonais(E)), winner(o),!.
valor((E,_),-1,_):-(linhas(E); colunas(E); diagonais(E)), winner(x),!.
valor((E,_),0,_):- empate(E),!.





trocaSimbolo('x','o').
trocaSimbolo('o','x').

op1((E,O), insere(p1,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p1, P, E, EF).

op1((E,O), insere(p2,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p2, P, E, EF).

op1((E,O), insere(p3,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p3, P, E, EF).


op1((E,O), insere(p4,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p4, P, E, EF).

op1((E,O), insere(p5,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p5, P, E, EF).

op1((E,O), insere(p6,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p6, P, E, EF).


op1((E,O), insere(p7,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p7, P, E, EF).

op1((E,O), insere(p8,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p8, P, E, EF).

op1((E,O), insere(p9,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p9, P, E, EF).

op1((E,O), insere(p10,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p10, P, E, EF).

op1((E,O), insere(p11,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p11, P, E, EF).

op1((E,O), insere(p12,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p12, P, E, EF).

op1((E,O), insere(p13,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p13, P, E, EF).

op1((E,O), insere(p14,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p14, P, E, EF).

op1((E,O), insere(p15,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p15, P, E, EF).

op1((E,O), insere(p16,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p16, P, E, EF).

op1((E,O), insere(p17,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p17, P, E, EF).

op1((E,O), insere(p18,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p18, P, E, EF).

op1((E,O), insere(p19,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p19, P, E, EF).

op1((E,O), insere(p20,P), (EF,P)):-
	trocaSimbolo(O,P),	
	insere_posicao(p20, P, E, EF).


insere_posicao(PX, S, E, EF):-
	member((PX, J), E),
	\+ nonvar(J), J = S,
	EF = E.




save(winner(P)):- retractall(winner(_)), asserta(winner(P)),!.

compare([X|Y]):-help(Y,X).
compare([]).

help([],_).
help([Y|X],Y) :- help(X,Y).


tres_seguidos(E,X,Y,Z):-member((X,P1),E),
			  	member((Y,P2),E),
			  	member((Z,P3),E),
			 	atom(P1), atom(P2), atom(P3),
			 	L = [P1, P2, P3],
			 	compare(L),
			 	save(winner(P1)),!.

linhas(E):-
	(tres_seguidos(E,p1,p2,p3);
	tres_seguidos(E,p2,p3,p4);
	tres_seguidos(E,p3,p4,p5);
	tres_seguidos(E,p6,p7,p8);
	tres_seguidos(E,p7,p8,p9);
	tres_seguidos(E,p8,p9,p10);
	tres_seguidos(E,p11,p12,p13);
	tres_seguidos(E,p12,p13,p14);
	tres_seguidos(E,p13,p14,p15);
	tres_seguidos(E,p16,p17,p18);
	tres_seguidos(E,p17,p18,p19);
	tres_seguidos(E,p18,p19,p20)).

colunas(E):-
	(tres_seguidos(E,p1,p6,p11);
	tres_seguidos(E,p6,p11,p16);
	tres_seguidos(E,p2,p7,p12);
	tres_seguidos(E,p7,p12,p17);
	tres_seguidos(E,p3,p8,p13);
	tres_seguidos(E,p8,p13,p18);
	tres_seguidos(E,p4,p9,p14);
	tres_seguidos(E,p9,p14,p19);
	tres_seguidos(E,p5,p10,p15);
	tres_seguidos(E,p10,p15,p20)).

diagonais(E):-
	(tres_seguidos(E,p6,p12,p18);
	tres_seguidos(E,p1,p7,p13);
	tres_seguidos(E,p7,p13,p19);
	tres_seguidos(E,p2,p8,p14);
	tres_seguidos(E,p8,p14,p20);
	tres_seguidos(E,p3,p9,p15);
	tres_seguidos(E,p10,p14,p18);
	tres_seguidos(E,p17,p13,p9);
	tres_seguidos(E,p13,p9,p5);
	tres_seguidos(E,p16,p12,p8);
	tres_seguidos(E,p12,p8,p4);
	tres_seguidos(E,p11,p7,p3)).


empate(E):-
	com_valor(E), asserta(empate).


com_valor([]).
com_valor([(_,K)|T]):-
	atom(K),
	com_valor(T).
	


jogada_minimax(_,(E,J)):- (linhas(E);colunas(E);diagonais(E)), print_(E),write('VENCEDOR: '),write(J),!.
jogada_minimax(_,(E,_)):- empate(E), print_(E),write('EMPATE!'),nl,!.

jogada_minimax('p',(E,J)):-
	print_(E),
	nl,statistics(real_time,[Ti,_]),
	minimax_decidir((E,J),Op),
	statistics(real_time,[Tf,_]), T is Tf-Ti,
	nl, 
	write('Tempo: '(T)),
	nl,
	n(N),
	write('Numero de Nós: '(N)),
	initInc,	
	nl,
	write(Op),
	nl,
	nl,
	op1((E,J),Op,Es),
	jogada_minimax('h',Es).

jogada_minimax('h',(E,J)):-
	print_(E),
	nl,
	write('Escreva a posicao onde deseja jogar: '),
	read(X),
	trocaSimbolo(J,J1),
	(X=1
		->op1((E,J),insere(p1,J1),Es),!
	;(X=2
		->op1((E,J),insere(p2,J1),Es),!
	;(X=3
		->op1((E,J),insere(p3,J1),Es),!
	;(X=4
		->op1((E,J),insere(p4,J1),Es),!
	;(X=5
		->op1((E,J),insere(p5,J1),Es),!
	;(X=6
		->op1((E,J),insere(p6,J1),Es),!
	;(X=7
		->op1((E,J),insere(p7,J1),Es),!
	;(X=8
		->op1((E,J),insere(p8,J1),Es),!
	;(X=9
		->op1((E,J),insere(p9,J1),Es),!
	;(X=10
		->op1((E,J),insere(p10,J1),Es),!
	;(X=11
		->op1((E,J),insere(p11,J1),Es),!
	;(X=12
		->op1((E,J),insere(p12,J1),Es),!
	;(X=13
		->op1((E,J),insere(p13,J1),Es),!
	;(X=14
		->op1((E,J),insere(p14,J1),Es),!
	;(X=15
		->op1((E,J),insere(p15,J1),Es),!
	;(X=16
		->op1((E,J),insere(p16,J1),Es),!
	;(X=17
		->op1((E,J),insere(p17,J1),Es),!
	;(X=18
		->op1((E,J),insere(p18,J1),Es),!
	;(X=19
		->op1((E,J),insere(p19,J1),Es),!								
	;(X=20
		->op1((E,J),insere(p20,J1),Es),!
	;(write('valor invalido!'),nl, jogada_minimax('h',(E,J))))))))))))))))))))))),
	jogada_minimax('p',Es).
	


jogada_alfabeta(_,(E,J)):- (linhas(E);colunas(E);diagonais(E)), print_(E),write('VENCEDOR: '),write(J),!.
jogada_alfabeta(_,(E,_)):- empate(E), print_(E),write('EMPATE!'),nl,!.

jogada_alfabeta('p',(E,J)):-
	print_(E),
	nl,statistics(real_time,[Ti,_]),
	alfabeta_decidir((E,J),Op),
	statistics(real_time,[Tf,_]), T is Tf-Ti,
	nl, 
	write('Tempo: '(T)),
	nl,
	n(N),
	write('Numero de Nos: '(N)),
	initInc,	
	nl,
	write(Op),
	nl,
	nl,
	op1((E,J),Op,Es),
	jogada_alfabeta('h',Es).

jogada_alfabeta('h',(E,J)):-
	print_(E),
	nl,
	write('Escreva a posicao onde deseja jogar: '),
	read(X),
	trocaSimbolo(J,J1),
	(X=1
		->op1((E,J),insere(p1,J1),Es),!
	;(X=2
		->op1((E,J),insere(p2,J1),Es),!
	;(X=3
		->op1((E,J),insere(p3,J1),Es),!
	;(X=4
		->op1((E,J),insere(p4,J1),Es),!
	;(X=5
		->op1((E,J),insere(p5,J1),Es),!
	;(X=6
		->op1((E,J),insere(p6,J1),Es),!
	;(X=7
		->op1((E,J),insere(p7,J1),Es),!
	;(X=8
		->op1((E,J),insere(p8,J1),Es),!
	;(X=9
		->op1((E,J),insere(p9,J1),Es),!
	;(X=10
		->op1((E,J),insere(p10,J1),Es),!
	;(X=11
		->op1((E,J),insere(p11,J1),Es),!
	;(X=12
		->op1((E,J),insere(p12,J1),Es),!
	;(X=13
		->op1((E,J),insere(p13,J1),Es),!
	;(X=14
		->op1((E,J),insere(p14,J1),Es),!
	;(X=15
		->op1((E,J),insere(p15,J1),Es),!
	;(X=16
		->op1((E,J),insere(p16,J1),Es),!
	;(X=17
		->op1((E,J),insere(p17,J1),Es),!
	;(X=18
		->op1((E,J),insere(p18,J1),Es),!
	;(X=19
		->op1((E,J),insere(p19,J1),Es),!								
	;(X=20
		->op1((E,J),insere(p20,J1),Es),!
	;(write('valor invalido!'),nl, jogada_alfabeta('h',(E,J))))))))))))))))))))))),
	jogada_alfabeta('p',Es).




quant(E,X,Y,Z,J,S):-
				findall((X,J), (member(X,J),E), L1),
				findall((Y,J), (member(Y,J),E), L2),
				findall((Z,J), (member(Z,J),E), L3),
				length(L1,S1),
				length(L2,S2),
				length(L3,S3),
				S = S1 + S2 + S3.


linhas2(E,J, Total):-
	quant(E,p1,p2,p3,J,S1);
	quant(E,p2,p3,p4,J,S2);
	quant(E,p3,p4,p5,J,S3);
	quant(E,p6,p7,p8,J,S4);
	quant(E,p7,p8,p9,J,S5);
	quant(E,p8,p9,p10,J,S6);
	quant(E,p11,p12,p13,J,S7);
	quant(E,p12,p13,p14,J,S8);
	quant(E,p13,p14,p15,J,S9);
	quant(E,p16,p17,p18,J,S10);
	quant(E,p17,p18,p19,J,S11);
	quant(E,p18,p19,p20,J,S12)).

	quant(E,p1,p6,p11,J,S13);
	quant(E,p6,p11,p16,J,S14);
	quant(E,p2,p7,p12,J,S15);
	quant(E,p7,p12,p17,J,S16);
	quant(E,p3,p8,p13,J,S17);
	quant(E,p8,p13,p18,J,S18);
	quant(E,p4,p9,p14,J,S19);
	quant(E,p9,p14,p19,J,S20);
	quant(E,p5,p10,p15,J,S21);
	quant(E,p10,p15,p20,J,S22)).

	quant(E,p6,p12,p18,J,S23);
	quant(E,p1,p7,p13,J,S24);
	quant(E,p7,p13,p19,J,S25);
	quant(E,p2,p8,p14,J,S26);
	quant(E,p8,p14,p20,J,S27);
	quant(E,p3,p9,p15,J,S28);
	quant(E,p10,p14,p18,J,S29);
	quant(E,p17,p13,p9,J,S30);
	quant(E,p13,p9,p5,J,S31);
	quant(E,p16,p12,p8,J,S32);
	quant(E,p12,p8,p4,J,S33);
	quant(E,p11,p7,p3,J,S34)).

	linhas2_aux(S1, Ss1),
	linhas2_aux(S2, Ss2),
	linhas2_aux(S3, Ss3),
	linhas2_aux(S4, Ss4),
	linhas2_aux(S5, Ss5),
	linhas2_aux(S6, Ss6),
	linhas2_aux(S7, Ss7),
	linhas2_aux(S8, Ss8),
	linhas2_aux(S9, Ss9),
	linhas2_aux(S10, Ss10),
	linhas2_aux(S11, Ss11),
	linhas2_aux(S12, Ss12),
	linhas2_aux(S13, Ss13),
	linhas2_aux(S14, Ss14),
	linhas2_aux(S15, Ss15),
	linhas2_aux(S16, Ss16),
	linhas2_aux(S17, Ss17),
	linhas2_aux(S18, Ss18),
	linhas2_aux(S19, Ss19),
	linhas2_aux(S20, Ss20),
	linhas2_aux(S21, Ss21),
	linhas2_aux(S22, Ss22),
	linhas2_aux(S23, Ss23),
	linhas2_aux(S24, Ss24),
	linhas2_aux(S25, Ss25),
	linhas2_aux(S26, Ss26),
	linhas2_aux(S27, Ss27),
	linhas2_aux(S28, Ss28),
	linhas2_aux(S29, Ss29),
	linhas2_aux(S30, Ss30),
	linhas2_aux(S31, Ss31),
	linhas2_aux(S32, Ss32),
	linhas2_aux(S33, Ss33),
	linhas2_aux(S34, Ss34),

	Total = (Ss1 * S1) + (Ss2 * S2) + (Ss3 * S3) + (Ss4 * S4) + (Ss5 * S5) + (Ss6 * S6) + (Ss7 * S7) + (Ss8 * S8) + (Ss9 * S9)+
			(Ss10 * S10) + (Ss11 * S11) + (Ss12 * S12) + (Ss13 * S13) + (Ss14 * S14) + (Ss15 * S15) + (Ss16 * S16) + (Ss17 * S17) + (Ss18 * S18)
			+ (Ss19 * S19) + (Ss20 * S20) + (Ss21 * S21) + (Ss22 * S22) + (Ss23 * S23) + (Ss24 * S24) + (Ss25 * S25) + (Ss26 * S26) + (Ss27 * S27)
			+ (Ss28 * S28) + (Ss29 * S29) + (Ss30 * S30) + (Ss31 * S31) + (Ss32 * S32) + (Ss33 * S33) + (Ss34 * S34)).

linhas2_aux(S, Ss) :-
	( =(S,1)
		-> Ss = 1
		; ( =(S,2)
			-> Ss = 2
			; Ss = 3
		  )
	).


func_aval((E,J), Val,_):-
	trocaSimbolo(J, J2),
	aval(E,J2,Val).

aval(E, J, Val):-
	linhas2(E,J, Val1),
	trocaSimbolo(J, J2),
	linhas2(E,J2,Val2),
	Val is (Val1-Val2).
	


print_(E):-
	print_linhas(E).

print_linhas(E):-
	write('       '),
	print_linha1(E),
	write('       '),
	write_line(1, 5),
	write('       '),
	print_linha2(E),
	write('       '),
	write_line(1, 5),
	write('       '),
	print_linha3(E),
	write('       '),
	write_line(1, 5),
	write('       '),
	print_linha4(E),
	write('\n\n').



print_linha1(E):-
	member((p1, X), E),
	write_elements(X),
	member((p2, Y), E),
	write_elements(Y),
	member((p3, Y), E),
	write_elements(Y),
	member((p4, Y), E),
	write_elements(Y),
	member((p5, Z), E),
	write_last_element(Z).

print_linha2(E):-
	member((p6, X), E),
	write_elements(X),
	member((p7, Y), E),
	write_elements(Y),
	member((p8, Y), E),
	write_elements(Y),
	member((p9, Y), E),
	write_elements(Y),
	member((p10, Z), E),
	write_last_element(Z).

print_linha3(E):-
	member((p11, X), E),
	write_elements(X),
	member((p12, Y), E),
	write_elements(Y),
	member((p13, Y), E),
	write_elements(Y),
	member((p14, Y), E),
	write_elements(Y),
	member((p15, Z), E),
	write_last_element(Z).

print_linha4(E):-
	member((p16, X), E),
	write_elements(X),
	member((p17, Y), E),
	write_elements(Y),
	member((p18, Y), E),
	write_elements(Y),
	member((p19, Y), E),
	write_elements(Y),
	member((p20, Z), E),
	write_last_element(Z).

write_elements(X):-
	nonvar(X),
	write(X),write(' | ').
write_elements(X):-
	\+ nonvar(X),
	write(' '),write(' | ').
write_elements(X):-
	\+ nonvar(X),
	write(' '),write(' | ').
write_elements(X):-
	\+ nonvar(X),
	write(' '),write(' | ').
write_last_element(X):-
	nonvar(X),
	write(X), write('\n').
write_last_element(X):-
	nonvar(X),
	write(X), write('\n').
write_last_element(X):-
	\+ nonvar(X),
	write(' '), write('\n').


write_line( I, P):-
        I = P, write('- - - - -'), nl.
write_line( I, P):-
        I < P, I2 is I+1,
        write('- '),
        write_line(I2, P).