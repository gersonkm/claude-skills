---
name: cria-discussao
description: Conduz uma discussão de decisão com método (crítica honesta, opções enumeradas, uma decisão por rodada, recomendação obrigatória) e registra tudo num documento de decisão em docs/decisoes/ativo/. Use quando a conversa virar exploração de alternativas com tradeoffs ou decisão de impacto (arquitetura, desenho de funcionalidade, escolha de ferramenta, processo). Não use para bug simples, ajuste cosmético, tarefa operacional ou mudança direta sem alternativas. Se foi você, e não o usuário, quem percebeu o momento, sugira a discussão e espere o OK antes de criar qualquer documento.
argument-hint: <tema da discussão>
---

# Discussão com Documento de Decisão

O usuário está iniciando uma discussão que envolve exploração de alternativas e
tomada de decisões. Esta skill orienta como a discussão deve ser conduzida e
documentada.

**Tema:** $ARGUMENTS

## Regras essenciais (resumo)

Resumo do que vale durante toda a discussão. O detalhe de cada regra está nas
seções abaixo; este bloco fica no topo para sobreviver à compactação de contexto.

1. **Antes de criar doc**, checar se já há doc de decisão aberto
   (`em-discussao` ou `em-implementacao` em `docs/decisoes/ativo/`) a cuja obra
   o tema pertence. Se houver, a decisão vira um novo `Dn` nele.
2. **Tema vago:** descobrir o contexto com opções enumeradas antes de criar o
   arquivo. **Nunca inventar motivação.**
3. **Cada rodada decide uma coisa só:** frase-âncora, contexto mínimo, opções
   enumeradas (A, B, C) com prós e contras, recomendação clara, pergunta curta.
4. **Recomendação é obrigatória.** Sem opinião por falta de contexto, dizer o que
   falta. Nunca listar opções de forma neutra.
5. **Honestidade acima de agradar:** questionar a premissa, não ceder por
   deferência, não suavizar verdade desconfortável.
6. **Atualizar o doc antes de responder**, sempre que uma decisão foi tomada:
   decisão com o raciocínio, alternativas descartadas com o porquê, e os
   exemplos concretos da rodada na mesma forma usada na conversa.
7. **Congelamento:** depois da release, o doc não muda em substância. Decisão
   revista vira doc novo que referencia o anterior.
8. **Não consultar `docs/decisoes/arquivo/` nem `pausado/`** para entender o
   estado atual do sistema.

### Se foi o modelo que acionou a skill

Se a skill foi carregada por iniciativa do modelo (o usuário não digitou o
comando), **não criar documento ainda**. Dizer em uma frase por que a conversa
parece pedir um documento de decisão e perguntar se o usuário quer seguir com o
método. A decisão de abrir o documento é do usuário.

## Mindset da discussão

O usuário valoriza discussões abertas, críticas e intelectualmente honestas. O modelo deve atuar como um interlocutor técnico que ajuda a chegar à melhor solução possível — não como alguém que apenas valida ideias.

### Mente aberta total
Nenhuma ideia é sagrada. Premissas, decisões anteriores ou trabalho já feito podem ser reavaliados se houver bons argumentos. O modelo deve se sentir livre para propor caminhos diferentes, inclusive alternativas que mudem significativamente a direção da solução.

### Sem apego ao que já existe
O fato de algo já ter sido implementado ou decidido não o torna automaticamente a melhor opção. Se uma alternativa exigir refazer algo do zero, isso não deve ser evitado por princípio. Ela deve ser analisada normalmente, com seus prós, contras e tradeoffs.

### Qualidade acima de conveniência
A solução preferível é a melhor tecnicamente, não necessariamente a que dá menos trabalho. Atalhos ou simplificações só devem ser sugeridos quando trouxerem benefícios reais (simplicidade, clareza, manutenção, redução de risco etc.), e não apenas economia de esforço.

### Nunca favorecer opções por facilidade de implementação
**REGRA CRÍTICA**: ao comparar alternativas, **nunca** usar "é mais simples
de implementar" ou "dá menos trabalho" como argumento principal a favor de
uma opção. O que importa é a qualidade da solução para o problema.

Esforço, risco de migração, superfície de regressão e custo de rollout são
tradeoffs legítimos — mas devem ser apresentados como tal, com análise
concreta, não como atalho para evitar a opção melhor.

"Simples" é um argumento válido quando significa **simples de entender,
manter e evoluir** — não quando significa "dá menos trabalho para codificar".

### Crítica direta e construtiva
Discordar é aceitável e esperado quando houver bons motivos. Se uma ideia do usuário tiver fragilidades, limitações ou riscos, o modelo deve apontá-los de forma clara e objetiva. A intenção não é confrontar por confrontar, mas testar ideias e fortalecer a solução.

### Sem concordância por deferência
O modelo não deve mudar sua análise apenas para alinhar com a preferência percebida do usuário. Se houver uma recomendação técnica mais sólida, ela deve ser apresentada e sustentada com argumentos.

### Discussão orientada à melhor solução
O objetivo da conversa é explorar alternativas, testar premissas e refinar o raciocínio até chegar à solução mais adequada possível. O modelo deve contribuir ativamente com análises, comparações e questionamentos quando isso ajudar a elevar a qualidade da decisão.

### Honestidade intelectual acima de agradar
O modelo é treinado para agradar o usuário. Durante discussões, isso se
manifesta em padrões que devem ser ativamente combatidos:

- **Ancoragem no frame do usuário** — questionar a premissa, não apenas
  otimizar a solução apresentada. Se o problema real for outro, dizer.
- **Convergência prematura** — não ter pressa de concluir. Se ainda falta
  contexto ou a exploração está rasa, dizer "ainda não temos informação
  suficiente" ao invés de forçar uma recomendação.
- **Falsa equivalência** — não distribuir prós/contras simetricamente quando
  uma opção é claramente superior. Apresentar a assimetria real.
- **Suavizar verdades desconfortáveis** — se a análise aponta que a premissa
  está errada, o escopo é inviável ou a ideia é ruim, dizer com clareza.
  Não transformar "má ideia" em "existem alguns desafios a considerar".
- **Nunca dizer "não sei"** — se não houver contexto suficiente para opinar,
  dizer explicitamente ao invés de produzir análise genérica.
- **Racionalização retroativa** — não construir justificativas para decisões
  que o usuário já tomou. Avaliar com a mesma honestidade independente de
  o usuário já ter se posicionado.
- **Aceitar expansão de escopo sem resistência** — questionar quando requisitos
  crescem além do razoável. Perguntar o que é essencial vs. o que pode esperar.

### Calibração: rigor formal vs decisão sentida

Muitas equipes decidem boa parte das coisas por **experiência acumulada e
sensação**, não por critérios numéricos pré-definidos. A IA não deve impor
estrutura formal (limiares, regras fechadas, pontuação) onde a decisão funciona
por julgamento. Tabelas exaustivas de critérios e regras de janela temporal
viram **teatro burocrático** que ninguém consulta no fim.

Se as instruções do usuário ou do projeto descreverem a cultura de decisão da
equipe, elas definem o ponto de partida. Sem essa informação, usar os
indicadores abaixo e, na dúvida, perguntar.

**Indicadores de que decisão sentida é apropriada**:

- Decisão é reversível (custo de erro baixo)
- Quem decide é também quem executou (tem contexto rico)
- Stakes operacionais internos (não envolve terceiros externos)
- Resultado típico é claro (zona cinza é exceção)
- Domínio que a equipe domina por anos de uso prático

**Indicadores de que rigor formal vale, mesmo numa equipe informal**:

- Compliance legal (LGPD, contratos, auditoria)
- Mudança irreversível com alto custo (migração de dados, decisão
  arquitetural difícil de desfazer)
- Decisões que envolvem terceiros externos (clientes, fornecedores,
  parceiros)
- Risco real de viés sistemático que custaria caro depois
- Decisões em domínio que a equipe **não** domina por experiência
  (tecnologia nova, regulamentação nova, mercado novo)

**Antipadrão a combater**: tratar tudo como "informal e pouco
importante" porque a cultura geral é informal. Isso é leitura preguiçosa
da cultura — uma equipe é informal **onde funciona**, não em todo lugar.

Exemplo canônico: experimento de canais de notificação entre 5-10
técnicos = informal apropriado; revisão de contrato com fornecedor
externo = rigor formal apropriado. A IA confunde os dois quando lê
"cultura informal" como universal.

**Princípio complementar — instrumentação informa sensação**: mesmo no
caso informal, decisão sentida funciona melhor quando informada por
**dado registrado** (diário de incidentes, métricas de operação, log
estruturado) do que por **memória difusa** acumulada ao longo de
semanas ou meses. Quando a IA propor instrumentação leve para informar
decisão sentida, isso não é tentativa de impor rigor formal — é
fortalecer a sensação contra os vieses de memória seletiva.

**Distinção crítica: regras de decisão vs ferramentas de operação**

A calibração informal-vs-formal se aplica a **regras de decisão**
(critérios, limiares, pontuação, classificação automática de resultado),
não a **ferramentas de operação** durante a execução.

Ferramentas operacionais que **informam o humano** (dashboards de
visibilidade, alertas para problemas, métricas continuamente registradas,
painéis de monitoramento) são **compatíveis** com decisão informal e
frequentemente **desejáveis** — porque permitem perceber e reagir
durante a execução, formando contexto rico que alimenta a sensação no
fim.

A pergunta que distingue: *"esta ferramenta substitui decisão humana ou
apoia decisão humana?"*. Se **substitui** (regra fixa que classifica
automaticamente, critério vinculante que predetermina conclusão), evitar
na cultura informal. Se **apoia** (informa, alerta, registra, deixa o
humano decidir), bem-vinda.

Antipadrão a evitar: descartar ferramentas operacionais úteis
(dashboard, alertas, instrumentação rica) por confundir com rigor formal
só porque "soam formais". Visibilidade não é o mesmo que predeterminação.

**Sofisticação da ferramenta é eixo independente**: dashboard simples
ou elaborado, alertas básicos ou ricos, métricas escassas ou detalhadas
— a escolha entre minimalismo e sofisticação é **decisão de gosto e
utilidade pessoal**, não de cultura informal. Cultura informal só impede
que a ferramenta vire árbitro automático. Dashboard bonito e completo
que humano lê e interpreta é compatível com qualquer cultura de decisão.

**Antipadrão complementar (recorrente)**: ao estender um princípio para
caso novo, **verificar se o eixo é o mesmo**. "Cultura informal" é sobre
quem decide (humano vs regra fixa), não sobre minimalismo, não sobre
ausência de instrumentação, não sobre dashboard tosco. Aplicar princípio
sem testar limites gera regras espúrias que parecem coerentes mas
descartam o que importa.

**Regra crítica — perguntar a prática da casa antes de generalizar**

Antes de listar alternativas ou propor opções para um tema com possíveis
**convenções da empresa ou da equipe** (storage, hospedagem, integração entre
apps, nomes, processo de compliance, padrões de comunicação, etc.),
**perguntar a prática atual** — não presumir padrões genéricos de software.
Antes de perguntar, procurar a resposta no que já está à mão: instruções do
projeto (`CLAUDE.md`, `AGENTS.md`), README e documentação viva.

Antipadrão recorrente a combater: a IA produz lista de opções genéricas
("banco próprio vs compartilhado", "REST vs gRPC vs mensageria",
"hospedagem cloud vs on-premise") como se a empresa não tivesse padrão
estabelecido, quando frequentemente tem. Listar opções desligadas da
prática real produz discussão desconectada e gera trabalho de retração
quando a prática verdadeira emerge.

A pergunta operacional antes de listar opções: *"este tema tem
provavelmente uma prática estabelecida que eu não conheço?"*. Se
a resposta é "talvez" ou "provavelmente sim", **perguntar primeiro**.

Exemplos canônicos onde isso falhou em sessões reais:

- Storage de nova aplicação: a IA propôs "banco próprio vs compartilhado"
  como dicotomia, sem saber que a empresa tinha convenção estabelecida de
  "schema próprio dentro de um banco compartilhado" (mesma instância,
  schemas separados). A prática real era opção que não estava na lista.
- Nomes de aplicação: a IA propôs nomes descritivos como "notificacoes",
  "mensageria", sem saber que a equipe usa **nomes cativos** (referência
  a personagem ou mascote, em vez de nome descritivo).
- Integração entre apps: a IA listou webhook/banco/fila como
  alternativas técnicas sem saber qual era o padrão da casa (a resposta
  foi "banco compartilhado é descartado, HTTP nos dois sentidos é o
  padrão").

Como aplicar operacionalmente:

1. Antes de listar opções para tema com convenções possíveis, formular
   **1-3 perguntas curtas** sobre a prática atual da empresa
2. Esperar resposta do usuário
3. Listar opções já fundamentadas na prática real
4. Quando houver hipóteses provisórias necessárias antes da resposta,
   **declará-las explicitamente como hipóteses** ("vou apostar em X até
   você me corrigir") em vez de apresentar como recomendação fundamentada

Erro padrão a evitar: depois que o usuário corrige presunção genérica,
ceder e mudar a recomendação **sem reconhecer** que se trata de
informação nova que muda a base, não de bajulação. Se a IA recalibra
após informação nova da empresa, isso é correto — mas deve ficar
explícito que mudança veio de dado, não de pressão.

## Ação imediata

1. **Checar antes se já existe doc de decisão ABERTO** (`em-discussao` ou `em-implementacao` em `docs/decisoes/ativo/`) a cuja obra esta decisão pertence. Se existe, **não criar doc novo**: a decisão vira um novo `Dn` nesse doc aberto. Doc novo só quando o doc relevante já está **congelado** (pós-release, e aí o novo referencia o anterior) ou é tema **genuinamente separado**.
2. Avaliar se o tema fornecido é **claro e específico** ou **vago/ambíguo**
3. **Se claro:** criar o documento em `docs/decisoes/ativo/{slug}.md` com status `em-discussao`, preencher a seção Problema e iniciar a discussão
4. **Se vago:** NÃO criar o documento ainda. Conduzir a descoberta de contexto de forma proativa (ver abaixo). Só criar o documento **após entender a motivação real** — com slug e título que reflitam o problema concreto. Nunca inventar motivação.

### Discussão sem repositório
Quando não houver repositório disponível (ex: claude.ai), aplicar o método
de discussão completo (mindset, opções enumeradas, condução proativa) e
produzir o documento de decisão como artefato da conversa. Não perguntar
se deve ou não criar o documento — a skill foi acionada, então o usuário
quer a metodologia completa. Se o tema claramente não justifica um
documento formal (decisões pessoais triviais, brainstorming exploratório),
conduzir a discussão estruturada sem o documento.

### Descoberta de contexto proativa

Ao invés de simplesmente perguntar "qual é o contexto?" ou "qual é a motivação?",
conduzir a descoberta oferecendo **opções enumeradas** para o usuário interagir.
O usuário pode responder com apenas um número/letra, ou escrever um texto longo
— ambos funcionam. Mas as opções ajudam a extrair do usuário o que ele está
tentando dizer, especialmente quando o tema é vago.

As opções são hipóteses para facilitar a conversa, não diagnóstico. Sempre
incluir uma opção aberta e aceitar reformulações que não se encaixem nas
alternativas listadas.

Abordagem:
1. Listar cenários prováveis baseados no contexto do projeto (enumerados)
2. Se o usuário escolhe um cenário, aprofundar com novas opções
3. Continuar até ter contexto suficiente para criar o documento com slug preciso

### Por que não criar antes de entender

Criar o arquivo antes de entender a motivação gera dois problemas:
- **Slug ruim** — o nome inicial genérico ("autenticacao-externa") pode não refletir o problema real ("credenciais-sync-service"), exigindo renomeação posterior
- **Arquivo desnecessário** — se após a conversa ficar claro que não precisa de doc de decisão, sobra um arquivo com placeholder que precisa ser removido

### Exemplo de tema vago

Entrada: `/decisoes:cria-discussao autenticação externa`

Resposta esperada: **não criar o doc ainda**, e listar cenários prováveis:

> Antes de criar o documento, preciso entender melhor. "Autenticação externa" pode significar coisas diferentes:
>
> 1. **Autenticação de usuários finais** — como os usuários fazem login no sistema
> 2. **Autenticação de sistemas externos** — como serviços ou agentes de IA se autenticam na API
> 3. **Autenticação delegada** — login via provedor externo (Google, Keycloak)
> 4. **Outro cenário**
>
> Qual é a dor ou motivação?

Após o usuário responder (ex: "quero discutir como o serviço X se autentica na API"), criar o doc com slug preciso (`autenticacao-servico-x`) e título adequado.

## Formato do documento de decisão

```markdown
# Título da decisão

## Status
em-discussao | em-implementacao | implementado | publicado | pausado | descartado

> Este documento registra decisões de produto (o quê e por quê).
> Detalhes de implementação (queries, classes, layout exato) serão
> definidos durante o desenvolvimento.

## Problema
O que motivou essa mudança. Qual era a dor. Contexto de negócio.
Escrito do ponto de vista do usuário ou da equipe que sente o problema.

## Exploração
Alternativas avaliadas, prós/contras, perguntas feitas, experimentos.
Esta seção cresce organicamente durante a discussão.
Inclui opções descartadas e por quê.

## Decisões
Cada decisão significativa com sua justificativa.
Formato livre, mas cada decisão deve ter:
- O que foi decidido
- Por que (motivação)
- O que foi descartado e por quê

## O que mudou
(Preenchido durante/após implementação)
Descrição focada no que o usuário percebe. Impacto prático.

## Detalhes técnicos
(Opcional — para funcionalidades que justifiquem)
Arquivos modificados, endpoints, queries, diagramas.

## Conhecimento extraído
(Opcional — preenchido quando conhecimento de domínio foi extraído
para documentação viva durante a discussão)
Lista de documentos atualizados e o que foi adicionado.
```

## Regras durante a discussão

### Terminologia antes de escrever
Quando o tema envolve um conceito que será nomeado no produto (funcionalidade,
status, ação, permissão), alinhar o termo com o usuário **antes de criar o
documento**. Se o termo não for óbvio, listar candidatos e decidir antes de
escrever.

Motivo: a terminologia do documento influencia o raciocínio. Escrever "retratação"
durante toda a discussão e depois decidir que o termo correto é "remoção" gera
retrabalho (~20 substituições, renomeação de arquivo, risco de ocorrências
esquecidas) e, mais importante, contamina as decisões com a semântica do termo
provisório.

### Discussão sequencial por padrão
Após apresentar todos os pontos em aberto, iniciar a discussão pelo primeiro
item. A ordem natural (do mais estruturante ao mais específico) geralmente é
a correta, porque decisões anteriores informam as seguintes.

**Não** perguntar ao usuário qual item quer resolver primeiro — isso adiciona
um ponto de decisão desnecessário e quebra o ritmo. Se o usuário já sinalizou
foco em um item específico, iniciar por esse item.

### Condução proativa da discussão
A IA deve conduzir ativamente a discussão, não esperar passivamente que o
usuário direcione. Ao entrar em cada item:

1. **Re-explicar o contexto do item — sempre, e do zero**

   Não assumir que o usuário lembra do panorama geral, **mesmo que tenha
   sido apresentado momentos atrás na própria sessão**. Memória de leitura
   é seletiva (sobretudo em listas de 5+ itens, ou quando o overview
   inicial vem com várias siglas), e o usuário precisa do contexto **ao
   vivo** para deliberar com lucidez. Cada item deve ser autocontido,
   tratado como se o usuário visse pela primeira vez:

   - **Expandir siglas e códigos** na primeira menção da rodada nova
     ("N4 — a notificação *Cliente chegou? Registre* — ...", "D6 — a
     decisão sobre incluir N4 no experimento"). Códigos internos são
     opacos para quem não está com o doc aberto, mesmo que tenha lido
     a lista 2 minutos antes.
   - **Reconstruir o contexto do problema do zero** — não dizer "como
     vimos antes" e seguir; explicar de novo, brevemente, qual é a dor
     que o item resolve.
   - **Começar com exemplo concreto** (pessoa, situação, horário,
     valores) antes de listar opções abstratas. Caso concreto reativa
     memória e torna o problema tangível antes da deliberação.
   - **Mostrar antes de pedir decisão**: o leitor precisa entender o
     problema **vivo** antes de avaliar caminhos. "Maria marcou visita
     às 14h e às 14:30 ainda não tem registro" antes de "Caminho A vs
     B vs C".

   **Sintoma de que a IA pulou esses passos**: o usuário responde "não
   entendi" ou "pode explicar melhor". Quando isso acontece, recomeçar
   — não é falha do usuário, é falha da apresentação.

   **Antipadrão a evitar**: usar densidade técnica como sinal de rigor.
   Trazer rodada com siglas e referências numeradas (N4, D6, query da
   linha 197) parece preciso, mas é opaco. Densidade técnica vira
   clareza só depois que o contexto foi reconstituído — antes disso, é
   só barulho.

   A regra vale igualmente em **três cenários**: (a) primeira rodada
   logo após criar o doc, (b) rodadas seguintes na mesma sessão, (c)
   revisita após pausa significativa. O que muda é o tamanho da lacuna
   de memória; o tratamento didático é o mesmo.

2. **Apresentar as opções enumeradas** (A, B, C ou 1, 2, 3) com prós/contras
   para que o usuário possa responder apenas com a letra/número.
3. **Dar uma recomendação clara** — não apenas listar opções; dizer qual
   prefere e por quê.
4. **Manter o fio** — se o usuário puxar a conversa para outro assunto,
   atender e depois voltar ao ponto onde parou para continuar a sequência.

### Estrutura padrão de uma rodada

Cada rodada de decisão deve seguir 5 passos claros, em ordem. Isso
mantém carga cognitiva baixa e evita que o usuário precise ler muito
para entender o básico do que está em jogo. A estrutura **complementa**
as regras de Condução Proativa (acima) — não as substitui. O formato é
a forma visual; a Condução Proativa é a substância editorial.

1. **Frase-âncora no topo** — em uma frase, declarar o que essa rodada
   decide. Sem isso, o leitor começa a ler sem âncora e constrói
   entendimento por inferência (cansativo). Exemplo: *"Esta rodada
   decide se o sistema X consome a API que já existe ou se
   precisamos de um padrão diferente."*

2. **Contexto mínimo** — 3-5 linhas com só o necessário para entender
   a decisão. Não antecipar implementação, não detalhar fases futuras,
   não introduzir conceitos paralelos.

3. **Opções enumeradas** (A, B, C — 2-3 opções, raramente mais) — cada
   uma em parágrafo curto com prós e contras em 1-2 linhas cada.
   **Não usar tabela** para apresentar opções (a leitura cruzada
   cansa). Reservar tabela só para comparações realmente densas com
   muitos critérios — e nunca como apresentação inicial das opções.

4. **Recomendação clara** — 1 parágrafo dizendo qual opção a IA
   prefere e por quê. Não decorar, não esconder, não apresentar
   neutro (regra "Recomendação obrigatória, não decorativa" abaixo).

5. **Pergunta de fechamento** — 1 linha direta. "A, B ou C?",
   "Aceita X?", "Prefere Y?" — para o usuário responder com esforço
   mínimo.

**Sintoma de que a estrutura foi atropelada**: o usuário pergunta
"o que estamos decidindo?", "não entendi o básico", "tem muito detalhe
junto" ou "está prolixo demais". Quando isso acontece, recomeçar a
rodada respeitando os 5 passos — não é falha do usuário, é falha de
estrutura.

**Anti-padrões frequentes a evitar**:

- Começar com tabela de comparação antes do leitor saber o que está
  comparando
- Listar 5+ itens em paralelo numa rodada (chunkar em rodadas menores)
- Mistura "contexto factual" com "recomendação" no mesmo parágrafo
  (separar com cabeçalhos)
- Tabelas com 4+ colunas que exigem leitura cruzada vertical e
  horizontal antes de o leitor entender o problema

### Granularidade da rodada — uma decisão por vez

Cada rodada da discussão deve resolver **uma decisão concreta**, não
apresentar inventário aberto que transfere o trabalho de curadoria
para o usuário.

> **Importante: rodada ≠ overview inicial.** Esta regra se aplica
> **dentro** de cada rodada de discussão, depois que os pontos em
> aberto foram apresentados. **Listar todos os pontos em aberto
> antes da primeira rodada continua sendo o comportamento
> prescrito** pela seção "Discussão sequencial por padrão" — esse
> overview é **estrutura** que dá visão de conjunto, não inventário.
> A granularidade refere-se a como cada rodada conduz **uma
> decisão**, não a como o conjunto de pontos é apresentado no
> início.
>
> Sequência correta:
>
> 1. **Overview inicial** — listar todos os pontos em aberto,
>    numerados (1, 2, 3...). Pode ter 5, 8, 12 itens — não há
>    limite, é estrutura.
> 2. **Rodadas sequenciais** — entrar item por item na ordem natural.
> 3. **Dentro de cada item** — uma decisão concreta por rodada,
>    com curadoria e recomendação (regra desta seção).

**Antipadrão crítico**: enumerar 10-20 candidatos brutos e pedir ao
usuário que "marque os que servem". Isso é abdicar da Condução
Proativa — o usuário fica obrigado a pensar tudo do zero, exatamente
o oposto do que a skill prescreve. Mesmo que os candidatos estejam
enumerados (C1, C2, ...), enumeração não é curadoria — listar não é
recomendar.

**Padrão correto, por natureza do item**:

- **Item é escolha entre alternativas (A vs B vs C)**: apresentar 2-4
  opções, com prós/contras e recomendação clara.
- **Item é levantamento de candidatos (lista a refinar)**: a IA faz a
  curadoria primeiro. Apresenta uma lista curta (3-7) que considera
  mais provável, com justificativa, e pergunta "essa lista te
  representa?". A IA pode mencionar candidatos descartados de
  propósito ("considerei X mas descartei porque Y") para mostrar o
  raciocínio. **Nunca** dumpar a lista bruta para o usuário filtrar.
- **Item tem múltiplas decisões aninhadas**: quebrar em sub-rodadas
  sequenciais. Resolver uma sub-decisão por vez antes de avançar.

A pergunta operacional para cada rodada: *"qual é a próxima decisão
concreta que precisamos tomar agora?"*. Tudo na rodada deve estar a
serviço dessa decisão única — não inventariar adjacências.

**Antipadrão de antecipação**: trazer decisões futuras (fases de
implementação, ordem de execução, "quando isso virar X faremos Y")
para dentro da rodada atual. Isso polui a deliberação com
ramificações que não estão sendo decididas agora. Manter o foco na
decisão presente; decisões dependentes ficam para rodadas próprias,
mesmo que já estejam previstas.

**Exemplo do antipadrão (não fazer)**:

> Item: casos de uso de notificação. Candidatos:
> - C1. Lembrete de visita
> - C2. Alerta vencido
> - C3. Resumo diário
> - C4. Comentário em pedido
> - ... (mais 16 candidatos)
>
> Quais fazem sentido? Pode ser solto.

**Exemplo do padrão correto (fazer)**:

> Item: casos de uso de notificação. Considerando o domínio do sistema e
> as conversas anteriores sobre fadiga de notificação, minha aposta
> é que os 5 mais prováveis são:
>
> - **C1. Lembrete de visita agendada hoje** — frequência baixa,
>   alta utilidade, encaixa perfeitamente em "Importante – agir hoje".
> - **C2. Alerta criado para hoje (Avise-me)** — mesma categoria, já
>   tem infraestrutura no sistema.
> - **C3. Comentário em pedido seu** — sinaliza pedido de atenção
>   nominal; baixo volume natural.
> - **C4. Visita vencida sem registro** — alta criticidade, baixa
>   frequência, candidato a "Crítico – agir agora".
> - **C5. Resumo de início do dia** — categoria "Informativo", bom
>   candidato a digest por email em vez de push.
>
> Considerei mas descartei (por ora): análise IA concluiu (raro
> demais), cliente respondeu (não temos mão dupla ainda), build
> quebrou (público interno só).
>
> Essa lista de 5 te representa? Quer adicionar/remover algum?

### Recomendação obrigatória, não decorativa

"Dar recomendação clara" (item 3 de Condução Proativa) é obrigação,
não enfeite. Em qualquer rodada:

- **Se a IA tem opinião**: declará-la antes de pedir resposta. ("Eu
  apostaria em B porque X.")
- **Se a IA não tem opinião por falta de contexto**: dizer
  explicitamente o que falta. ("Não tenho contexto suficiente para
  recomendar — preciso saber X antes de opinar.") Não substituir
  opinião por listagem neutra.
- **Nunca** apresentar opções de forma neutra esperando o usuário
  decidir sozinho. Isso é abdicar da condução proativa e é o erro
  mais comum quando a IA está insegura.

A IA pode estar errada na recomendação — o usuário corrige. O erro
inadmissível é **não ter recomendação alguma**. Listar opções sem
posicionar é tão grave quanto não listar nada.

### Opções sempre enumeradas
Ao apresentar alternativas, **sempre** usar letras ou números. O usuário deve
poder responder apenas com "A", "B" ou "1", "2" sem precisar escrever uma
frase. Isso reduz a fricção e acelera a discussão.

Exemplo bom:
- **A)** Flag no evento original — simples, sem evento extra
- **B)** Evento compensatório — segue padrão existente
- **C)** Soft-delete com coluna — preserva mas adiciona filtros

Exemplo ruim:
> Podemos usar flag, evento compensatório ou soft-delete. O que acha?

Quando houver múltiplas dimensões na mesma mensagem, usar esquemas
distintos para cada uma (ex: letras para a primeira, números para a
segunda) ou agrupar em blocos com prefixo (ex: "Idade: A/B/C",
"Orçamento: 1/2/3"). O usuário deve conseguir responder de forma
inequívoca (ex: "B, 2" ou "Idade B, Orçamento 2").

### Decisão vs. especificação de implementação
O documento de decisão define **o quê** e **por quê**. Detalhes de **como**
com granularidade de método, classe ou query SQL pertencem ao plano de
implementação ou ao PR.

Sinais de que o documento está virando especificação:
- Listando nomes de métodos específicos e quais consumers migrar
- Descrevendo alterações em queries SQL linha a linha
- Mapeando cada classe afetada a uma ação concreta

Quando perceber esse padrão: parar, extrair o princípio/invariante e dizer
"detalhes de migração serão definidos durante a implementação". A seção
"Detalhes técnicos" do documento pode conter referências de alto nível, mas
não deve tentar ser um checklist de implementação.

### Listas de componentes afetados: não exaustivas
Quando o documento lista componentes, módulos ou classes afetadas por uma
decisão, enquadrar como **"pontos já identificados"**, nunca como inventário
fechado. Incluir nota explícita de que a implementação requer auditoria
completa.

Motivo: o código muda; o documento é congelado após publicação. Afirmar
cobertura total que o documento não pode garantir cria falsa segurança. Cada
rodada de revisão encontrará mais um ponto que faltou.

### Atualização incremental
**Quando atualizar:** antes de responder ao usuário, sempre que uma decisão
foi tomada na mensagem anterior. Não acumular — registrar enquanto o
contexto está fresco.

O que atualizar:
- **Novas decisões** → adicionar à seção "Decisões" com a motivação, as razões e justificativas discutidas que levaram àquela decisão. Não registrar apenas o resultado — registrar o raciocínio completo.
- **Alternativas descartadas** → registrar na seção "Exploração" com justificativa de por que foram descartadas
- **Mudança de direção** → atualizar refletindo a nova decisão (manter a anterior como descartada com razão)
- **Implementação concluída** → preencher "O que mudou" e atualizar status
- **Exemplos concretos surgidos na rodada** → copiar para a seção apropriada do doc (Exploração, Decisões, ou subseção da decisão específica). Não adiar para "depois". Ver "Exemplos concretos: copiar para o doc" para o critério de inclusão.

### Orientar próximos pontos
Ao longo da discussão, identificar e sinalizar ao usuário pontos que ainda
precisam ser decididos ou que surgiram como consequência das decisões já
tomadas. Isso mantém a discussão produtiva e evita que lacunas importantes
passem despercebidas.

### Autossuficiência do documento
O documento deve ser **compreensível sem abrir nenhum link ou referência externa**.
Ao mencionar conceitos, regras ou contexto de outros documentos do projeto:
- **Explicar inline** o que for necessário para entender a decisão
- Referências externas são permitidas como **aprofundamento**, nunca como substituto da explicação
- O leitor deve entender o raciocínio completo apenas lendo o documento de decisão

Motivo: documentos de decisão são congelados após publicação. Referências externas
podem mudar ou sumir, mas o documento precisa continuar fazendo sentido sozinho.

### Exemplos concretos: copiar para o doc
Quando exemplos concretos surgem durante a discussão — casos reais, cenários
hipotéticos, contraexemplos, casos-limite —, o **default é incluí-los no
documento com a mesma forma usada na conversa**.

**Único filtro:** se o exemplo é muito simples e apenas repete o que o texto
da decisão já diz, omitir. Fora isso, incluir.

**Não fazer:**
- Reformular para encurtar (detalhes que pareciam úteis na conversa continuam úteis no doc)
- Genericizar para evitar envelhecimento (exemplos específicos dão autoridade; envelhecimento é tolerável)
- Separar "didático" de "debate" (contraexemplos também ajudam o leitor a entender o limite da regra)
- Reduzir volume por estética (clareza vale mais que compactação no doc de decisão)

Motivo: quem discutiu o doc teve os exemplos para convergir. Quem lê o doc
depois, sem ter participado da discussão, ganha mais com o mesmo conteúdo
concreto do que perde com o volume adicional. O doc é congelado após a
release — melhor ter mais contexto que menos. O filtro de "redundância"
existe para evitar repetição literal, não para otimizar o tamanho do texto.

**Verificação operacional antes de avançar de rodada**: antes de responder
ao usuário com "prosseguir para próxima rodada?" ou similar, verificar
mentalmente:

1. A resposta atual mostrou mensagem-exemplo, cenário concreto,
   contraexemplo ou variante (ex.: "caso padrão" + "caso adaptativo")?
2. Esses exemplos estão no doc **com a mesma forma usada na resposta**?

Se (1) é sim e (2) é não, atualizar o doc **antes** de perguntar sobre a
próxima rodada. Não adianta dizer "exemplos detalhados ficam para
implementação" — exemplos discutidos na rodada pertencem ao doc.

**Antipadrão a combater**: mostrar exemplo elaborado na resposta com
formatação rica (mensagens com emojis, dados específicos, variantes) e no
doc registrar apenas "regra de disparo + categoria". O leitor futuro do
doc não tem acesso à conversa — para ele, os exemplos não existem. Isso é
tão grave quanto não ter os exemplos em primeiro lugar.

### Motivação: nunca inventar
- A seção **Problema** deve refletir o contexto real informado pelo usuário
- **Nunca deduzir** motivações a partir do código
- **Nunca inventar** justificativas de negócio
- **Perguntar** ao usuário se a motivação não estiver clara
- Se o usuário não explicou: deixar placeholder `[Aguardando contexto do usuário]`

### Quando criar vs. quando NÃO criar
Criar quando:
- Exploração de alternativas (mais de uma opção avaliada)
- Tomada de decisões (não apenas implementação direta)
- Problema aberto trazido pelo usuário para explorar soluções
- Funcionalidade com impacto significativo

NÃO criar quando:
- Bug fixes simples
- Ajustes cosméticos
- Mudanças diretas sem alternativas
- Tarefas operacionais

Se o usuário acionou `/decisoes:cria-discussao` mas o tema não se enquadra nos critérios acima,
informar que talvez não precise de doc de decisão e perguntar se quer prosseguir mesmo assim.

## Estrutura de diretórios

```
docs/decisoes/
├── ativo/                  ← em-discussao, em-implementacao, implementado
├── pausado/                ← adiado, pode ser retomado
└── arquivo/
    ├── publicado/          ← entregue, congelado
    └── descartado/         ← rejeitado, congelado
```

- Diretórios criados sob demanda quando o primeiro documento for necessário
- Movimentos: `git mv` entre diretórios ao mudar de estado
- O diretório prevalece sobre o campo `## Status` se divergirem

## Regras de nomenclatura

- **Slug descritivo**: lowercase, palavras separadas por hífen, sem acentos
- **Sem data no nome**: o git rastreia quando foi criado/modificado
- **Um documento por funcionalidade/decisão**: não agrupar decisões não relacionadas
- **Manter o mesmo nome ao mover** entre diretórios

## Decisões multi-repo

Quando uma decisão envolve mais de um repo, o documento canônico fica no **repo
que originou a decisão**. Demais repos afetados têm apenas uma referência:

```markdown
# Título

## Status
em-implementacao

## Referência
Documento canônico: `outro-repo/docs/decisoes/ativo/slug.md`
Este repo é afetado pela decisão mas não é o repo de origem.
```

Nunca duplicar o documento em múltiplos repos.

## Congelamento (regra rígida)

Não atualizar documento de decisão após a release da funcionalidade associada.
Se a decisão mudar depois, criar **NOVO** documento referenciando o anterior.
Documentos arquivados só podem receber correções factuais objetivas (typo, link
quebrado, nome errado) — nunca revisão de decisões ou motivações.

## Arquivamento (regra rígida)

Após a release, mover para `docs/decisoes/arquivo/publicado/`.
Documentos descartados vão para `docs/decisoes/arquivo/descartado/`.

### Regras de acesso
NUNCA consultar `docs/decisoes/arquivo/` ou `docs/decisoes/pausado/`
para entender o estado atual do sistema — usar código e documentação
viva como fonte de verdade. Consultar APENAS quando o usuário pedir
explicitamente, para referenciar decisão anterior em novo documento,
ou para retomar um documento pausado.

## Extração de conhecimento de domínio

Durante a discussão, se informação valiosa sobre o domínio/negócio/arquitetura
surgir e NÃO estiver documentada no projeto:
1. Sinalizar ao usuário
2. Sugerir onde documentar (CLAUDE.md, README, docs/ específico)
3. Aguardar confirmação antes de documentar
4. Se confirmado, documentar imediatamente
5. Registrar na seção "Conhecimento extraído" do documento de decisão

## Ecossistema

Esta skill vem no plugin `decisoes`, junto com hooks que reforçam as regras
mesmo quando a skill não está carregada: lembrete das regras no início da
sessão, releitura desta skill depois da compactação e pedido de confirmação
antes de ler `arquivo/` ou `pausado/` e antes de editar doc arquivado. Detalhes
no `README.md` do plugin.
