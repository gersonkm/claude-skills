# decisoes

A informação mais valiosa sobre uma mudança no software raramente está no código. O código mostra o *como*; os commits, o *quê*. O *porquê*, as alternativas descartadas e os tradeoffs avaliados só existem na conversa com o agente, e se perdem quando ela acaba.

Este plugin faz duas coisas com isso:

1. **Conduz a discussão com método.** Crítica honesta em vez de concordância, uma decisão por rodada, opções enumeradas (para responder só "B"), recomendação obrigatória, nunca inventar motivação.
2. **Registra tudo num documento de decisão** em `docs/decisoes/`, atualizado a cada decisão, que continua fazendo sentido para quem não participou da conversa.

## Como usar

```
/decisoes:cria-discussao <tema>
```

Você não precisa lembrar do comando. Quando a conversa vira uma escolha entre alternativas, o Claude **sugere** abrir a discussão e espera o seu OK.

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
| Skill `cria-discussao` | O método completo e o formato do documento. Entra no contexto só quando usada. |
| Hook de início de sessão | Injeta um bloco curto com as regras. É ele que faz o Claude sugerir a skill na hora certa e respeitar o congelamento mesmo sem a skill carregada. |
| Hook depois da compactação | Quando a conversa longa é resumida, o Claude Code mantém só o começo de cada skill (uns 5.000 tokens), e esta é maior. Se houver discussão em andamento, o hook manda reler a skill inteira. |
| Hook de proteção | Pede confirmação antes de ler `arquivo/` ou `pausado/` e antes de editar um documento arquivado. |

Os hooks são scripts bash sem dependências. No Mac rodam direto; no Windows precisam do Git for Windows (ver o [README do repositório](../../README.md)).
