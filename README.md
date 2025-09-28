# Trabalho RA1 Programação Lógica e Funcional

## Curso: Ciência da Computação, PUCPR - 4° semestre

### Grupo:
- Adryan Costa Silva

- Hassan Ali El Gazouini

- Hussein Ali El Gazouini

- Murilo Zimerman Fortaleza

- ---

### Sistema de Recomendação de Trilhas em Prolog:

- Este trabalho foi desenvolvido para recomendar trilhas para o usuario por meio de perguntas feitas, onde cada pergunta possui uma pontuacao, o usuario que tem interersse em saber em qual area gostaria de continuar, respondera perguntas com s e n,  onde respectivamente significa sim e nao, o sistema ira calcular as pontuacoes e ira mostrar as trilhas que satisfazem as repostas do usuario junto com as justificativas, as trilhas irao ser mostradas de forma onde a trilha que mais juntou pontuacao ira ser mostrada no comeco e assim respectivamente, como se fosse um ranking das que o usuario tem mais interesse e ao que menos tem interesse, tambem foi elaborado 3 perfis para que rodem de forma automatica sem a necessidade de que alguem responda as perguntas.
- 
---

### trilhas disponiveis:
- Ciencia de dados
- Seguranca da informacao
- desenvolvimento Web
- Inteligencia artificial
- Gestao de TI
---

### Como rodar:

- Para rodar, é necessário algum compilador de Prolog (eg: swiprolog)

- Para executar, utilize: swipl -s main.pl (o comando para executar pode variar de acordo com o compilador)

- Para começar o questionário, digite: iniciar.

- **Importante: lembrar de sempre colocar ponto final, tanto para iniciar, tanto para responder.**

- Para rodar testes, utilize rodar_teste(id), em que id é o número do teste (1 - 3).

- ---
### Como rodar (Automatico):
- para rodar automaticamente, o usuario devera digitar a funcao de rodar_teste junto com o seu ID, ou seja rodar_teste(id)

---
### Estrutura do codigo 
- trilha/2: trilhas e descricoes

- perfil/3: características com pesos

- pergunta/3: mostra perguntas que vao ser feitas ao usuario

- ler_resposta/1: valida as respostas do usuario

- faz_perguntas/1:  percorre todas as perguntas e armazena as respostas do usuario 

- calcula_pontuacao/2:  soma as pontuacoes das características

- justificativa/1:  mostra quais respostas contribuíram para aquela trilha

- melhor/1:  determina as trilhas com maior pontuacao

- ranking/1:  mostra o ranking de todas as trilhas

- iniciar/0:  inicia a execucao

- rodar_teste/1:
