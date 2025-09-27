iniciar  :-
	write('Programa iniciando...'), nl,
	write('Lendo as perguntas..'), nl,
    	(ler_perguntas ->
	(write('Perguntas lidas com sucesso:'), nl)
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
	write('Perguntas:'), nl.

faz_perguntas :-
	write('Pergunta 1:'), nl.

calcula_resultado :-
	write('Calculo dos resultados:'), nl.

exibe_resultado :-
	write('Exibindo resultaado:'), nl.
