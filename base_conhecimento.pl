:- module(base_conhecimento, [trilha/2, perfil/3, pergunta/3]).

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
