%Trilhas
trilha(ciencia_de_dados, 'Estudo de dados para extrair conhecimentos significativos para os negócios').
trilha(seguranca_da_informacao, 'Proteção de informações importantes contra acesso não autorizado, divulgação, uso, alteração ou interrupção').
trilha(desenvolvimento_web, 'Criação e manutenção de websites na internet').
trilha(inteligencia_artificial, 'Estudo e desenvolvimento de programas computacionais capazes de reproduzir o comportamento humano na tomada de decisões e na realização de tarefas').
trilha(gestao_de_ti, 'Planeja, implementa, gerencia e otimiza recursos tecnológicos para atingir objetivos organizacionais').


%Perfis e relevância 
perfil(ciencia_de_dados, big_data, 5).
perfil(ciencia_de_dados, hadoop, 4).
perfil(ciencia_de_dados, estatistica, 3).

perfil(seguranca_da_informacao, redes, 5).
perfil(seguranca_da_informacao, criptografia, 4).
perfil(seguranca_da_informacao, firewall, 3).

perfil(desenvolvimento_web, interface, 4).
perfil(desenvolvimento_web, sites, 5).
perfil(desenvolvimento_web, banco_de_dados, 3).

perfil(inteligencia_artificial, machine_learning, 5).
perfil(inteligencia_artificial, redes_neurais, 4).
perfil(inteligencia_artificial, linguagem_natural, 3).

perfil(gestao_de_ti, lideranca, 4).
perfil(gestao_de_ti, governanca, 5).
perfil(gestao_de_ti, gestao_projetos, 3).

pergunta(1, 'Você pretende aprender mais sobre Big Data?', big_data).
pergunta(2, 'Você gostaria de aprender Hadoop?', hadoop).
pergunta(3, 'Você tem afinidade com estatística?', estatistica).

pergunta(4, 'Você tem interesse em aprender redes?', redes).
pergunta(5, 'Você tem interesse em estudar criptografia?', criptografia).
pergunta(6, 'Você gostaria de aprender a configurar firewalls?', firewall).

pergunta(7, 'Você tem interesse em criar interfaces de usuário?', interface).
pergunta(8, 'Você gostaria de aprender a desenvolver sites?', sites).
pergunta(9, 'Você gostaria de aprender bancos de dados em sites?', banco_de_dados).

pergunta(10, 'Você tem interesse em aprender machine learning?', machine_learning).
pergunta(11, 'Você gostaria de aprender sobre redes neurais?', redes_neurais).
pergunta(12, 'Você gostaria entender como os computadores entendem nossa linguagem humana?', linguagem_natural).

pergunta(13, 'Você é uma pessoa que possui uma boa liderança?', lideranca).
pergunta(14, 'Você tem interesse em aprender sobre governança de TI?', governanca).
pergunta(15, 'Você tem interesse em gestão de projetos de TI?', gestao_projetos).

:- dynamic resposta/2.

ler_resposta(Resp) :-
    read(Raw),
    (Raw == s ; Raw == n), !,
    Resp = Raw.
ler_resposta(Resp) :-
    write('Resposta inválida. Digite s para sim ou n para não: '), nl,
    ler_resposta(Resp).


faz_perguntas([]).
faz_perguntas([C|Resto]) :-
    pergunta(_, Texto, C),
    write(Texto), nl,
    ler_resposta(Resp),
    assertz(resposta(C, Resp)),
    faz_perguntas(Resto).


calcula_pontuacao(Trilha, P) :-
    findall(Peso, (
        perfil(Trilha, C, Peso),
        resposta(C, s)
    ), Lista),
    sum_list(Lista, P).


justificativa(Trilha) :-
    findall(C-Peso, (
        perfil(Trilha, C, Peso),
        resposta(C, s)
    ), Lista),
    write('Respostas que contribuíram para esta trilha:'), nl,
    forall(member(C-P, Lista),
           (write(' - '), write(C), write(' (peso '), write(P), write(')'), nl)).


melhor(Trilhas) :-
    findall(P-T, (trilha(T,_), calcula_pontuacao(T,P)), Pares),
    keysort(Pares, Ordenados),
    reverse(Ordenados, [MaiorPontuacao-_|_]),
    findall(T-D, (member(MaiorPontuacao-T, Ordenados), trilha(T,D)), Trilhas).

ranking(ListaRanking) :-
    findall(P-T, (trilha(T,_), calcula_pontuacao(T,P)), Pares),
    keysort(Pares, Ordenados),
    reverse(Ordenados, ListaRanking).


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


%Perfil com tendencia a Inteligencia artificial
perfil_teste(1, [big_data-s,hadoop-n,estatistica-s,redes-n,criptografia-n,firewall-n,
          interface-n,sites-n,banco_de_dados-n,machine_learning-s,
          redes_neurais-s,linguagem_natural-n,lideranca-n,governanca-n,gestao_projetos-n]).
%Perfil com tendencia a seguranca da informacao
perfil_teste(2, [big_data-n,hadoop-n,estatistica-n,redes-s,criptografia-s,firewall-s,
          interface-n,sites-n,banco_de_dados-n,machine_learning-n,
          redes_neurais-n,linguagem_natural-n,lideranca-n,governanca-n,gestao_projetos-n]).
%perfil com tendencia a desenvolvimento web
perfil_teste(3, [big_data-n,hadoop-n,estatistica-n,redes-n,criptografia-n,firewall-n,
          interface-s,sites-s,banco_de_dados-s,machine_learning-n,
          redes_neurais-n,linguagem_natural-n,lideranca-s,governanca-n,gestao_projetos-n]).


rodar_teste(Id) :-
    retractall(resposta(_,_)),
    perfil_teste(Id, Lista),
    forall(member(C-R, Lista), assertz(resposta(C,R))),
    melhor(Todas),
    nl, write('Teste '), write(Id), write(' -> Trilhas recomendadas:'), nl,
    forall(member(T-D, Todas), (
        write('- '), write(T), write(': '), write(D), nl,
        justificativa(T), nl
    )),
    write('Ranking completo:'), nl,
    ranking(R), write(R), nl.


