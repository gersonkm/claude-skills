---
name: tira-do-papel
description: Tira uma ideia nova do papel. Entende a ideia, sugere o nome e cria a pasta do projeto com git e um repositório privado no GitHub, conduz as decisões com o método de /decisoes:discute registrando tudo num documento de decisão, e, quando a ideia estiver madura, entrega o CLAUDE.md para começar a construir. Só a pessoa aciona este comando.
argument-hint: <a sua ideia, com as suas palavras>
disable-model-invocation: true
---

# Tirar uma ideia do papel

**Ideia:** $ARGUMENTS

A pessoa tem uma ideia (um produto, um serviço, uma ferramenta, um projeto pessoal) e ainda não
tem projeto para ela. Este comando cuida da **largada**: entende a ideia, cria o projeto (pasta,
git, GitHub), conduz as decisões e termina com o projeto pronto para começar a construir.

## Antes de tudo: o método da `discute`

As decisões seguem o método da skill `discute`, deste mesmo plugin. **Leia agora** o `SKILL.md`
dela: fica em `../discute/SKILL.md`, a partir do diretório base desta skill (o caminho aparece
quando a skill é carregada). Aplique o método inteiro (mindset, uma decisão por vez, opções
enumeradas, recomendação obrigatória, atualização incremental do documento, nunca inventar
motivação). Este comando só acrescenta o que está abaixo: a criação do projeto e o roteiro de uma
ideia nova.

## Regras desta largada

- 🛑 **Pedir OK antes de cada passo que cria algo ou sai da máquina:** a pasta, o repositório no
  GitHub, a instalação de qualquer programa. Diga em uma frase o que vai acontecer.
- 🔒 **O repositório no GitHub é sempre privado.** O documento de decisão guarda o plano da ideia
  (público, preço, estratégia). Público só se a pessoa pedir com todas as letras, e depois de você
  avisar que qualquer pessoa poderia ler o documento.
- 📁 **Nunca criar o projeto dentro de outro projeto.**
- 🔍 **Conferir antes de afirmar o que depende da pessoa.** Plano da conta (GitHub, hospedagem),
  o que já está instalado, onde ela já publica outros projetos: confira (`gh`, a máquina, os
  projetos que ela já tem) e, se não der, pergunte. Não aplique a regra geral como se fosse dela.
  Exemplo real: afirmar "na conta gratuita, o GitHub Pages não publica repositório privado, então
  hospede fora" para quem já tinha plano pago. Um repositório privado dela com Pages publicado
  (`gh api /repos/<dono>/<repo>/pages`) já mostra que o plano permite.
- 🗣️ **Falar a língua de quem tem uma ideia**, sem jargão de software. Enquanto nada foi
  construído, não falar de release nem de congelamento.

## Fluxo

### 1. A ideia

Se o comando veio sem ideia, peça-a numa pergunta aberta: "Qual é a ideia? Conte com as suas
palavras, sem se preocupar em caprichar."

### 2. Entender antes de criar qualquer coisa

Conduza a descoberta como na `discute` (opções enumeradas quando ajudarem), até entender **o que
é**, **para quem** e **por que** a pessoa quer fazer isso. No máximo três perguntas por vez,
numeradas, lembrando que dá para responder só pelo número. Não crie nada ainda: o nome da pasta
nasce desse entendimento, assim como o nome do documento.

### 3. A pasta do projeto

Veja onde a sessão está (o diretório atual):

- **Pasta vazia** (ou só com arquivos ocultos) cujo nome combina com a ideia: proponha usar ela
  mesma.
- **Pasta de projetos** (várias subpastas, cada uma um projeto, como `~/projetos`): proponha criar
  a pasta nova dentro dela.
- **Dentro de um projeto** (tem `.git`, `CLAUDE.md`, código ou documentos de outro assunto):
  proponha criar ao lado, na pasta-mãe, nunca dentro.
- **Não dá para saber:** pergunte onde a pessoa guarda os projetos dela, sugerindo uma opção.

Para o nome, faça uma rodada: **três opções** curtas, em minúsculas, palavras separadas por hífen,
sem acento, com uma recomendação e o porquê. Explique que o nome vale também para o repositório
no GitHub. Se já existir uma pasta com o nome escolhido, avise e peça outro.

Com o OK, crie a pasta. A partir daqui, grave os arquivos **dentro dela**, pelo caminho completo:
a sessão continua aberta na pasta onde começou.

### 4. Git e o primeiro documento

Na pasta nova:

1. `git init`. Sem o git instalado, proponha instalar (no Windows, `winget install --id Git.Git -e`);
   siga sem git só se a pessoa recusar.
2. Crie o documento de decisão em `docs/decisoes/ativo/<nome>.md`, no formato da `discute`, com o
   status `em-discussao` e a seção **Problema** preenchida só com o que a pessoa contou.
3. Crie um `README.md` curto: o nome do projeto e uma frase sobre a ideia.
4. Faça o primeiro commit. Se o git reclamar que não sabe quem é o autor (`user.name`,
   `user.email`), pergunte o nome e o e-mail da pessoa e configure com o OK dela.

### 5. O repositório privado no GitHub

1. Confira se o GitHub CLI existe (`gh --version`) e se há login (`gh auth status`).
   - Sem o `gh`, proponha instalar: no Windows, `winget install --id GitHub.cli -e`; no Mac,
     `brew install gh` (ou o instalador de https://cli.github.com).
   - Sem login, peça à pessoa para rodar `gh auth login` num terminal: o login abre o navegador e
     precisa ser feito por ela. Espere ela avisar que terminou.
2. Mostre o que vai ser criado (nome, **privado**) e peça o OK.
3. Crie e envie: `gh repo create <nome> --private --source <pasta> --remote origin --push`.
4. Mostre o link do repositório.

Se a pessoa não quiser o GitHub agora, siga só com o git local e ofereça de novo no fim.

### 6. As decisões

Conduza as rodadas com o método da `discute`, atualizando o documento na pasta nova a cada
decisão. Para uma ideia nova, este é o roteiro típico. Adapte à ideia: pule o que não se aplica e
mude a ordem quando uma decisão depender de outra.

1. **Para quem é** e qual problema resolve para essa pessoa.
2. **O que exatamente oferecer** na primeira versão: o mínimo que já tem valor para alguém.
3. **Formato e canal:** como chega a quem vai usar.
4. **Como validar** antes de investir muito tempo ou dinheiro.
5. **Como se sustenta** (preço, custo, tempo), quando for produto ou serviço.
6. **O que é preciso para construir:** ferramentas, tempo, custo, ajuda.

**Gravar sem virar ruído:** ao fechar cada bloco de decisões, faça commit (e push, se houver
GitHub) com uma mensagem que diga o que foi decidido, e avise em uma linha ("Salvei no GitHub:
público e primeira versão decididos."). Nada de um commit por resposta.

### 7. Quando a ideia estiver pronta para construir

O sinal é estar decidido o que construir primeiro. Aí ofereça o `CLAUDE.md`:

- crie na raiz da pasta, com o que é o projeto, para quem, as decisões principais (apontando o
  documento de decisão, sem copiá-lo), o escopo da primeira versão e as regras que valem para
  construir;
- faça commit e push;
- explique, em uma frase, que o `CLAUDE.md` só é lido numa sessão aberta **dentro da pasta**: no
  Claude Desktop, abrir uma sessão nova escolhendo essa pasta; no terminal, `cd <pasta>` e
  `claude`. É lá que a construção começa. Quando ela começar, o status do documento passa a
  `em-implementacao`.

### 8. Fechamento

Resuma em poucas linhas: a pasta, o link do repositório, o documento de decisão, o que foi
decidido e o próximo passo.
