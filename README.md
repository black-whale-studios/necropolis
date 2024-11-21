# Relatório de Desenvolvimento de Algoritmo para o Jogo Necropolis



## Fase 1: Análise [x]



- [x] **Problema selecionado e definido claramente**:  

  O problema central é desenvolver um jogo de terror que combine mecânicas de perseguição, stealth (fuga e ocultação) e interações narrativas em um ambiente tenso e imersivo. O perseguidor (monstro) deve ser capaz de reagir de forma realista à presença do jogador, criando uma experiência desafiadora e coerente.



- [x] **Compreensão aprofundada da natureza e desafios do problema**:  

  Os principais desafios incluem projetar uma IA para o perseguidor que equilibre dificuldade e realismo, criar interações fluídas no ambiente, e ajustar a mecânica de detecção baseada em visão e som para que o jogo seja imersivo sem ser frustrante.



- [x] **Modelo matemático ou teórico desenvolvido para representar o problema**:  

  O perseguidor será modelado usando uma Máquina de Estados Finitos (FSM), que definirá estados como patrulha, perseguição, busca e pausa. A detecção de som usará cálculos de propagação baseados em um raio de alcance, e a detecção visual usará linhas de visão com obstáculos.



## Fase 2: Planejamento [x]



- [x] **Objetivos do algoritmo definidos com clareza**:  

  O algoritmo deve gerenciar a movimentação do perseguidor, responder de maneira adaptativa às ações do jogador e garantir que os sistemas de som e visão sejam balanceados e funcionais.



- [x] **Métricas para avaliação de eficiência do algoritmo estabelecidas**:  

  As métricas incluem:  

    - **FPS mínimo de 60** durante o jogo, mesmo com alta carga de IA.  

    - **Taxa de detecção do monstro** que seja justa para o jogador (não excessiva nem ineficaz).  

    - **Feedback positivo dos jogadores** sobre a fluidez da interação e tensão do jogo.



- [*] **Estratégia geral de resolução do problema proposta**:  

  Implementar e testar os sistemas em etapas:  

    1. IA básica para movimentação do perseguidor.  

    2. Implementação da lógica de detecção visual e auditiva.  

    3. Ajuste fino das mecânicas de fuga e perseguição.  

    4. * Integração com outros sistemas de jogo (interações, iluminação, e narração).



- [*] **Subproblemas identificados e divididos, se aplicável**:  

    - Programar comportamento da IA para estados individuais (patrulha, perseguição, pausa).  

    - Implementar e testar lógica de som para evitar falso positivo/negativo.  

    - Calibrar interações do jogador com o ambiente (como esconder-se ou criar distrações).  



- [*] **Estrutura geral do algoritmo esboçada**:  

    - **FSM para o perseguidor**: Controla mudanças de estados como "patrulha" para "perseguir".  

    - **Detecção auditiva**: Baseada em raios sonoros com propagação limitada por obstáculos.  

    - * **Interação do jogador**: Inclui esconder-se, distrair o monstro e completar objetivos.



- [-] **Casos limite ou situações especiais identificados**:  

    - Jogador permanece escondido por tempo indeterminado: o perseguidor deve alternar para comportamento de patrulha.  

    - Sons próximos ao perseguidor em locais complexos (como salas com várias entradas): IA deve calcular a melhor rota.  



- [x] **Análise teórica realizada para verificar a correção do algoritmo**:  

    - A FSM foi simulada para confirmar transições corretas entre estados.  

    - Cenários extremos foram previstos para evitar travamentos na lógica do jogo.



## Fase 3: Desenho [x]



- [x] **Análise de complexidade realizada para avaliar a eficiência teórica do algoritmo**:  

  O algoritmo foi projetado para minimizar cálculos redundantes, como verificação de som e visão em grandes áreas. Os cálculos de som são feitos apenas quando o jogador realiza uma ação ruidosa. 



- [x] **Pontos críticos do algoritmo identificados para otimização, se necessário**:  

    - Propagação de som e obstáculos: Precisará de otimização para mapas grandes.  

    - Trajetória do perseguidor: Deve ser calculada sem causar quedas no desempenho.



## Fase 4: Programação e Teste [*]



- [-] **Algoritmo traduzido com precisão em código de programação**:  

  A FSM e os sistemas de som e visão foram implementados, utilizando bibliotecas padrão e personalizadas para eficiência.



- [*] **Código de programação escrito de forma clara e organizada**:  

  Uso de comentários detalhados, nomes de variáveis autoexplicativos e separação de responsabilidades por classes.



- [-] **Testes rigorosos realizados em uma variedade de casos de teste**:  

  Testes incluíram diferentes níveis de dificuldade, ambientes com maior ou menor iluminação, e comportamentos imprevisíveis do jogador.



- [-] **Casos limite e situações especiais testados**:  

  Jogador criando distrações consecutivas, som alto gerado em locais com vários obstáculos e perseguição em corredores estreitos foram validados.



- [-] **Erros e problemas durante o teste de programa identificados e corrigidos**:  

  Corrigidos bugs como o perseguidor não detectar sons em esquinas e transições entre estados que causavam comportamento inesperado.



## Documentação e Avaliação do Projeto [*]



- [x] **Documentação completa, incluindo especificação do algoritmo e análise de complexidade**:  

  A documentação detalha as mecânicas, o funcionamento da IA, e os cálculos de visão e som.



- [x] **Documentação revisada para clareza e rigor técnico**:  

  Revisão técnica realizada por especialistas para garantir precisão e acessibilidade.



- [x] **Avaliação da eficácia do algoritmo em termos de tempo de execução, uso de recursos e precisão na resolução do problema**:  

  Jogo alcançou desempenho consistente e entregou a experiência de terror proposta.



- [*] **Avaliação da colaboração da equipe e cumprimento dos prazos**:  

  Feedback positivo sobre o trabalho em equipe, com melhorias sugeridas para organização futura.



## Apresentação e Conclusão do Projeto [*]



- [-] **Apresentação do projeto preparada com informações claras e objetivas**:  

  Incluiu vídeos demonstrativos, explicações técnicas, e um resumo da experiência do usuário.



- [*] **Conclusões do projeto destacando os resultados e aprendizados**:  

  O jogo cumpriu os objetivos principais, identificando áreas para futuras iterações (melhoria de IA e maior variação de ambientes).



- [x] **Discussão sobre o projeto e respostas a perguntas da audiência**:  

  A equipe se preparou para responder a questões sobre design técnico e decisões criativas.

