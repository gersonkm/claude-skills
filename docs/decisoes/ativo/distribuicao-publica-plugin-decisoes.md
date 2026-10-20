# Distribuição pública do plugin de documentos de decisão

## Status
em-implementacao

> Este documento registra as decisões de distribuição (o quê e por quê).
> Detalhes de implementação ficam no código do plugin.

## Problema

O método de documentos de decisão (skill `cria-discussao` e as regras que a acompanham) existia só num marketplace privado. A necessidade era levá-lo a pessoas sem acesso a ele, com três exigências:

- **instalar remotamente**, sem copiar arquivo à mão;
- **receber as atualizações** a cada melhoria da skill;
- **abrir para mais pessoas** quando fizer sentido, sem depender de acesso a uma organização.

A única versão fora do marketplace privado era uma cópia antiga carregada numa conta do claude.ai (`discussao`), com metade do tamanho: sem a estrutura da rodada, sem "uma decisão por vez", sem "recomendação obrigatória", sem "copiar exemplos concretos para o doc" e sem "procurar doc aberto antes de criar". Foi avaliada como fraca demais e descartada.

Os usuários iniciais estão no **Claude Desktop (aba Code) no Windows**, com intenção de passar ao CLI, e no **Mac**.

## Exploração

**Canal de distribuição.** Marketplace de plugins do Claude Code num repositório GitHub foi o caminho natural: instala com dois comandos, atualiza a partir do repositório e é o mesmo formato do marketplace privado de origem. A alternativa de zip para upload no claude.ai foi descartada: não atualiza sozinho e não leva hooks.

**Repositório público ou privado.** Com repo privado, cada pessoa precisaria de acesso ao repo e de credencial do git salva na máquina, e a documentação avisa que, se a credencial pedir senha, a atualização em segundo plano falha em silêncio e a pessoa fica na versão antiga sem saber. Como o conteúdo genérico não tem nada específico do marketplace privado nem segredos, público não custa nada. Visibilidade aceita: repo público aparece no perfil, na busca do GitHub e em buscadores, e pode ser listado por sites da comunidade.

**Nome.** `claude-skills`, porque o pacote (plugin, marketplace, hooks) é do Claude Code. `anthropic-skills` foi descartado: é o prefixo das skills da própria Anthropic e daria a impressão de produto oficial.

**Duas cópias ou uma fonte só.**
- A) Manter a versão privada e a genérica em paralelo, à mão. Mais simples hoje, mas cada melhoria precisa ser feita duas vezes e as cópias se separam com o tempo. Foi exatamente o que produziu a `discussao` fraca.
- B) A genérica vira a única skill, para todo mundo, inclusive quem usava a versão privada. O que é específico daquele ambiente sai da skill e vai para as instruções próprias dele; a skill passa a dizer "se o projeto ou a organização tiver calibração própria, ela define o ponto de partida".

**Gatilhos.** A versão privada dependia de cada pessoa colar no seu `CLAUDE.md` um parágrafo de "comportamento proativo". Sem ele, o Claude só usava a skill quando alguém digitava o comando. E a descrição da skill ("Iniciar discussão com documento de decisão") não dava ao Claude como saber a hora.

**O hook depois da compactação ainda é necessário?** A documentação atual confirma que, na compactação automática, o Claude Code reanexa as skills invocadas, mas só os primeiros 5.000 tokens de cada uma, com teto de 25.000 no total. A `cria-discussao` tem uns 37 KB, cerca de 10 mil tokens: metade sumiria, justamente a parte de condução das rodadas. Logo, o hook continua valendo.

**Hooks no Windows.** Os hooks antigos eram bash com `jq`. No Windows, hooks rodam no Git Bash quando ele existe; sem ele, no PowerShell. O Node não é garantido (o Claude Code nativo não depende dele). Opções:
- bash sem dependências: roda no Mac e no Windows com Git for Windows;
- Node: roda onde houver Node instalado, o que não é garantido;
- PowerShell mais bash: cobre o Windows sem Git, mas são dois scripts para manter.

## Decisões

### D1. Marketplace público em `gersonkm/claude-skills`

Marketplace `gersonkm`, plugin `decisoes` (o comando foi definido em D7). Público pelos motivos da Exploração: sem credencial, sem atualização que falha em silêncio, e nada sensível no conteúdo.

### D2. Uma fonte só (opção B)

A skill genérica é a única. A versão privada será aposentada e quem a usava passa ao comando novo; a troca de comando foi considerada aceitável. A calibração específica daquele ambiente (cultura de decisão "sentida" como ponto de partida, convenções da casa) vai para as instruções que aquela equipe já instala. Ficam no plugin as regras gerais, inclusive "perguntar a prática da casa antes de generalizar", com exemplos anonimizados.

Descartada a opção A porque a duplicação já tinha falhado uma vez.

### D3. Hooks dentro do plugin

As proteções (confirmação antes de ler `arquivo/` e `pausado/`, confirmação antes de editar doc arquivado) e o lembrete depois da compactação passam a ser instalados junto com a skill. Antes, viviam só numa configuração pessoal, fora do plugin, e quem instalava a versão privada levava a skill sem as proteções. O hook de compactação tinha, além disso, um caminho quebrado: apontava para um arquivo removido numa migração anterior, e a releitura não funcionava. No plugin, o caminho é relativo ao próprio plugin.

### D4. Gatilhos em duas camadas

- **Descrição da skill** diz quando usar e quando não usar. Se o Claude carregar a skill por iniciativa própria, ela começa sugerindo, não criando o documento. Assim continua valendo "sugerir; a decisão de abrir é do usuário".
- **Hook de início de sessão** injeta um bloco curto com as regras que precisam valer mesmo sem a skill carregada: quando sugerir, doc aberto vs. novo, congelamento, não consultar o arquivo. Substitui o parágrafo que cada pessoa tinha de colar no `CLAUDE.md`. Custa contexto em toda sessão, por isso é curto; o detalhe fica na skill.

Também foi colocado um resumo das regras essenciais no topo da skill, dentro dos primeiros 5.000 tokens, para sobreviver à compactação mesmo sem o hook.

### D5. Hooks em bash sem dependências; Git for Windows como pré-requisito

Um único script para Mac e Windows, lendo o JSON sem `jq` e aceitando caminho com barra invertida. No Windows, o Git for Windows é pré-requisito, documentado na instalação: quem versiona os documentos de decisão no git provavelmente já o tem. Descartado Node, porque não é garantido. Descartados dois scripts (bash e PowerShell), porque dobrariam a manutenção para cobrir um caso raro.

### D6. Sem número de versão no plugin

Sem `version` no `plugin.json`, a versão é o commit: cada `git push` vira atualização para todos, sem lembrar de subir número. Contrapartida aceita: não há como segurar uma mudança no repo sem publicá-la.

### D7. Comando `/decisoes:discute`

O comando é `/<plugin>:<skill>`, e os dois nomes foram revistos antes da primeira instalação: depois que alguém instala, trocar o nome do plugin quebra a atualização dessa pessoa. Acrescentar comandos novos ao plugin, ao contrário, não quebra nada.

A frase que descreve o plugin orientou a escolha: *"Discute decisões com você de forma crítica, uma de cada vez, e registra o porquê de cada escolha num documento que continua fazendo sentido para quem não estava na conversa."* O comando é essa frase invertida.

**Skill: `discute`.** Verbo no presente, na 3ª pessoa, como nas demais skills do autor. Descartados:
- `cria-discussao` (o nome original): repete a ideia do prefixo, e "cria" não descreve o caso em que a decisão vira um novo `Dn` num doc já aberto;
- `decide`: promete o resultado, mas muitas discussões terminam pausadas ou descartadas;
- `abre`: mesmo problema do "cria".

**Plugin: `decisoes`.** Num repo público, nome descritivo ganha de nome criativo: quem procura "documento de decisão" acha, e quem lê o comando entende sem abrir o README. O nome também comporta uma família de comandos do ciclo de vida do documento. Descartados:
- `adr`: termo conhecido, mas a skill rejeita de propósito o formato rígido de ADR, e as decisões não são só de arquitetura;
- `porque`: memorável e fiel à essência (o porquê), mas não diz o que é para quem vê de fora, e a grafia confunde;
- `deliberacao`: preciso, mas longo e formal demais para digitar.

"Documento" ficou fora do nome: o nome diz o que a pessoa faz, e o documento é a consequência. A palavra aparece na descrição, que é o que a listagem do marketplace mostra.

**Português, não inglês.** `/decisions:discuss` foi considerado para ampliar o alcance. Com o conteúdo em português, um nome em inglês prometeria um plugin que um falante de inglês não conseguiria usar. Se um dia houver tradução, o caminho previsto é uma skill só, escrita em inglês, que conversa no idioma do usuário, sem duas versões. Com ela vem um cuidado: aceitar `docs/decisions/` além de `docs/decisoes/`, inclusive nos hooks.

## O que mudou

Pendente: publicação do repositório, aposentadoria da versão privada, troca dos hooks da configuração pessoal pelo plugin e primeira instalação no Windows e no Mac.

## Conhecimento extraído

- Compactação: o Claude Code reanexa só os primeiros 5.000 tokens de cada skill invocada (teto de 25.000 no total). Skill maior que isso perde o final ao compactar. Fonte: code.claude.com/docs/en/skills ("Skill content lifecycle").
- Hooks no Windows rodam no Git Bash, ou no PowerShell se o Git Bash não existir. O caminho do arquivo chega com barra invertida no JSON do `PreToolUse`. Fonte: code.claude.com/docs/en/hooks.
- Marketplaces de terceiros vêm com atualização automática desligada; cada pessoa liga uma vez em `/plugin` → Marketplaces. Fonte: code.claude.com/docs/en/plugins/loading.
