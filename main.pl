:- use_module(base_conhecimento).
:- use_module(perfil_teste1).
:- use_module(perfil_teste2).
:- use_module(perfil_teste3).

:- dynamic resposta/2. % predicado resposta/2 sera dinamico (pode ser modificado durante execucao) por exemplo o assertz e retract.

ler_resposta(Resp) :- % le um valor digitado que seria resposta e verifica se for s ou n se for ele corta com o "!" e uni Resp = Raw.
    read(Raw),
    (Raw == s ; Raw == n), !,
    Resp = Raw.
ler_resposta(Resp) :- % se um valor nao for s ou n ele escreve uma frase de erro e faz uma recursao para que o usuario tente denovo
    write('Resposta inválida. Digite s para sim ou n para não: '), nl,
    ler_resposta(Resp).


faz_perguntas([]). % e como uma regra de parada quando a lista esta vazia que seria a lista de perguntas ele para 
faz_perguntas([C|Resto]) :- % basicamente pega a (C) que seria a pergunta e deixa o Resto (Resto), faz a pergunta, e guarda a resposta.
    pergunta(_, Texto, C),
    write(Texto), nl,
    ler_resposta(Resp),
    assertz(resposta(C, Resp)),
    faz_perguntas(Resto). % Chama como um loop ate faz_perguntas = [] e ai para. e quando nao tem mais perguntas para perguntar.


calcula_pontuacao(Trilha, P) :-  % calcula a pontuacao de uma trilha dependendo da resposta do usuario
    findall(Peso, ( % basicamente busca todos os pesos das caracteristicas C da trilha (ex C=lideranca)
        perfil(Trilha, C, Peso),
        resposta(C, s)
    ), Lista), 
    sum_list(Lista, P).


justificativa(Trilha) :- % mostra quais respostas "sim" contribuíram para a pontuação de uma trilha
    findall(C-Peso, ( % cria uma lista de pares C-Peso
        perfil(Trilha, C, Peso), % pega todas as caracteristicas C da trilha com seus pesos
        resposta(C, s) % so considera as caracteristicas (C) que o user respondeu com "s"
    ), Lista), 
    write('Respostas que contribuíram para esta trilha:'), nl,
    forall(member(C-P, Lista), % para cada par C-P na lista
           (write(' - '), write(C), write(' (peso '), write(P), write(')'), nl)). % escreve a caracteristica (C) e o peso



melhor(Trilhas) :- 
    findall(P-T, (trilha(T,_), calcula_pontuacao(T,P)), Pares),     % pega todas as trilhas com suas pontuacoes
    keysort(Pares, Ordenados),     % ordena pela pontuacao (crescente)
    reverse(Ordenados, [MaiorPontuacao-_|_]),  % inverte para decrescente e pega a maior pontuação
    findall(T-D, (member(MaiorPontuacao-T, Ordenados), trilha(T,D)), Trilhas). % retorna todas as trilhas que tem o maior pontuacao
    

ranking(ListaRanking) :-
    findall(P-T, (trilha(T,_), calcula_pontuacao(T,P)), Pares), % pega todas as trilhas com as pontuacoes
    keysort(Pares, Ordenados), % ai ordena pela pontuacao
    reverse(Ordenados, ListaRanking). % inverte para decrescente e retorna todas no ranking

iniciar :-
    retractall(resposta(_,_)),
    write('Questionário de Trilhas'), nl,
    write('Responda com s (sim) ou n (não)'), nl,
    Caracteristicas = [big_data,hadoop,estatistica,
                       redes,criptografia,firewall,
                       interface,sites,banco_de_dados,
                       machine_learning,redes_neurais,linguagem_natural,
                       lideranca,governanca,gestao_projetos],
    faz_perguntas(Caracteristicas),
    melhor(Todas),
    write('Resultado:'), nl,
    write('Trilhas recomendadas: '), nl,
    forall(member(T-D, Todas), (
        write('- '), write(T), write(': '), write(D), nl,
        justificativa(T), nl
    )),
    write('Ranking completo:'), nl,
    ranking(R),
    write(R), nl.
