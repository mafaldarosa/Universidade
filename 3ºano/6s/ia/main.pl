%:-initialization(menu).


initInc:-
	retractall(n(_)),
	assertz(n(0)),!.

%incrementa o contador mais N
incMais(N):-
	retract(n(M)),
	M1 is N+M,
	assertz(n(M1)),!.

menu:-
	nl,
	write('  MENU '),nl,
	nl,
	nl,
	write('       JOGO     '),nl,
	write('---------------------------'),nl,
	write(' 1 - HUMANO VS PC (minimax)'),nl,
	nl,
	write(' 2 - HUMANO VS PC (alfabeta)'),nl,
	nl,
	nl,
	write(' 3 - FECHAR MENU E PROGRAMA'),nl,
	nl,
	nl,
	write(' ESCOLHA UMA OPCAO:'),nl,
	nl,
	read(OPCAO),
	escolha(OPCAO).

escolha(1):-
	[minimax],
	[jogo],
	initInc, 
	write('JOGADOR PRIMEIRO - JOGADOR "X"'),
	nl,
	estado_inicial((E,P)),nl,	
	jogada_minimax('h', (E,'o')),
	menu.


escolha(2):-
	[alfabeta],
	[jogo],
	initInc,  	
	write('JOGADOR PRIMEIRO - JOGADOR "X"'),
	nl,
	estado_inicial((E,P)),nl,	
	jogada_alfabeta('h', (E,'o')),
	menu.



escolha(3).


escolha(_):-
	nl, write('POR FAVOR, INSIRA VALOR VALIDO!'),nl,
	read(OPCAO),
	escolha(OPCAO).