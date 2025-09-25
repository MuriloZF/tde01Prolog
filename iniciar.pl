:- use_module(ler_perguntas).
:- use_module(faz_perguntas).
:- use_module(calcula_resultado).
:- use_module(exibe_resultado).

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
