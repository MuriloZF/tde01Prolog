iniciar  :-
	write('Programa iniciando...'), nl,
	write('Lendo as perguntas..'), nl,
	(ler_perguntas ->  
    	(write('Perguntas lidas:'), nl)
    ;   
    	(write('Falha ao ler as perguntas'), nl)
    ),
	write('Iniciando o questionário...'), nl,
	faz_perguntas,
	write('Calculando resultado...'), nl,
	calcula_resultado,
	write('Resultado:'), nl,
	exibe_resultado.

ler_perguntas :-
    write('Abrindo txt').

faz_perguntas  :-
	write('Pergunta 1: ').

calcula_resultado :-
	write('Calcula resultado').

exibe_resultado :-
	write('Resultado: 10').

