# decisoes

> Discute decisões com você de forma crítica, uma de cada vez, e registra o porquê de cada escolha num documento que continua fazendo sentido para quem não estava na conversa.

A informação mais valiosa sobre uma mudança no software raramente está no código. O código mostra o *como*; os commits, o *quê*. O *porquê*, as alternativas descartadas e os tradeoffs avaliados só existem na conversa com o agente, e se perdem quando ela acaba.

Este plugin faz duas coisas com isso:

1. **Conduz a discussão com método.** Crítica honesta em vez de concordância, uma decisão por rodada, opções enumeradas (para responder só "B"), recomendação obrigatória, nunca inventar motivação.
2. **Registra tudo num documento de decisão** em `docs/decisoes/`, atualizado a cada decisão, que continua fazendo sentido para quem não participou da conversa.

## Os dois comandos

| Comando | Quando | Quem aciona |
|---|---|---|
| `/decisoes:tira-do-papel <ideia>` | Você tem uma ideia e ainda não tem projeto para ela. | **Você**, digitando. O Claude só sugere, nunca aciona sozinho, porque o comando cria pasta e repositório. |
| `/decisoes:discute <tema>` | Dentro de um projeto, a conversa virou uma escolha entre alternativas. | Normalmente o **Claude sugere** e espera o seu OK. Você também pode digitar. |

### `/decisoes:tira-do-papel`: da ideia ao projeto pronto para construir

```
/decisoes:tira-do-papel quero um caderno de receitas digital para a família
```

1. **Entende a ideia** antes de criar qualquer coisa: o que é, para quem e por quê, com poucas perguntas numeradas.
2. **Sugere o nome da pasta** (três opções, com uma recomendação) e onde criá-la: ao lado dos seus outros projetos, nunca dentro de um deles.
3. **Cria a pasta** com `git init`, um `README.md` e o documento de decisão em `docs/decisoes/ativo/`, já com o problema que você contou.
4. **Cria um repositório privado no GitHub** e envia o primeiro commit. É sempre privado, porque o documento guarda o plano da ideia.
5. **Conduz as decisões** com o método da `discute`, num roteiro de ideia nova: para quem é, o que oferecer na primeira versão, formato, como validar, como se sustenta e o que é preciso para construir. Salva no GitHub ao fechar cada bloco de decisões.
6. **Entrega o `CLAUDE.md`** quando a ideia está pronta para construir e diz para abrir uma sessão nova dentro da pasta, que é onde o `CLAUDE.md` é lido.

O Claude pede o seu OK antes de criar a pasta, antes de criar o repositório e antes de instalar qualquer programa. O que ele precisa e oferece instalar se faltar: o **git** e o **GitHub CLI** (`gh`). O login no GitHub (`gh auth login`) é você quem faz, porque abre o navegador. Se não quiser o GitHub agora, o projeto fica só no seu computador, com git.

### `/decisoes:discute`: decidir dentro de um projeto

```
/decisoes:discute <tema>
```

Você não precisa lembrar do comando. Quando a conversa vira uma escolha entre alternativas, o Claude **sugere** abrir a discussão e espera o seu OK. Se já houver um documento aberto da mesma obra, a decisão nova entra nele como mais um `Dn`, em vez de abrir outro documento.

## O ciclo de vida de um documento

```
docs/decisoes/
├── ativo/                  ← em-discussao, em-implementacao, implementado
├── pausado/                ← adiado, pode ser retomado
└── arquivo/
    ├── publicado/          ← entregue, congelado
    └── descartado/         ← rejeitado, congelado
```

- **Aberto, ele cresce.** Decisão nova da mesma obra vira um novo `D2`, `D3`… no mesmo documento.
- **Entregue, ele congela.** Depois da release, decisões e motivações não mudam mais; se a decisão for revista, nasce um documento novo que referencia o anterior. É isso que mantém o histórico confiável.
- **Arquivo não é fonte do presente.** O Claude não consulta `arquivo/` nem `pausado/` para entender como o sistema é hoje, porque o código já pode ter mudado.

## O que vem no plugin

| Peça | Para que serve |
|---|---|
| Skill `discute` | O método completo e o formato do documento. Entra no contexto só quando usada. É a única fonte do método. |
| Skill `tira-do-papel` | A largada de uma ideia nova: pasta, git, GitHub, roteiro de ideia e `CLAUDE.md`. Para as rodadas, manda seguir a `discute`, em vez de repetir o método. |
| Hook de início de sessão | Injeta um bloco curto com as regras. É ele que faz o Claude sugerir a `discute` (ou o `tira-do-papel`, para ideia sem projeto) na hora certa e respeitar o congelamento mesmo sem a skill carregada. |
| Hook depois da compactação | Quando a conversa longa é resumida, o Claude Code mantém só o começo de cada skill (uns 5.000 tokens), e esta é maior. Se houver discussão em andamento, o hook manda reler a skill inteira. |
| Hook de proteção | Pede confirmação antes de ler `arquivo/` ou `pausado/` e antes de editar um documento arquivado. |

Os hooks são scripts bash sem dependências. No Mac rodam direto; no Windows precisam do Git for Windows (ver o [README do repositório](../../README.md)).
