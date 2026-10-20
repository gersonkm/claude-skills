# claude-skills

Plugins do [Claude Code](https://code.claude.com/docs), abertos para quem quiser usar. Funcionam no terminal (CLI) e no Claude Desktop, na aba **Code**.

## Plugins

| Plugin | O que faz |
|---|---|
| [`decisoes`](plugins/decisoes/) | Conduz discussões de decisão com método e registra o porquê de cada escolha em `docs/decisoes/`. O Claude sugere a discussão sozinho quando percebe que a conversa virou uma escolha entre alternativas. |

## Instalar

### ⚠️ Antes, no Windows: Git for Windows

Os hooks do plugin são scripts bash. No Windows, o bash vem com o **Git for Windows**. Sem ele, a skill funciona, mas as proteções não rodam e aparece erro a cada uso de ferramenta.

```powershell
winget install --id Git.Git -e
```

Ou baixe em [git-scm.com](https://git-scm.com/download/win). Depois feche e abra o Claude de novo. No Mac não precisa instalar nada.

### No terminal (CLI)

Numa sessão do Claude Code, em qualquer pasta:

```
/plugin marketplace add gersonkm/claude-skills
/plugin install decisoes@gersonkm
```

### No Claude Desktop (aba Code)

Numa sessão da aba **Code**, clique no **+** ao lado da caixa de mensagem, depois em **Add plugins**. Adicione o marketplace `gersonkm/claude-skills` e instale o plugin `decisoes`.

O que se instala por aqui também vale para o terminal na mesma máquina, e vice-versa.

## Receber as atualizações

Cada mudança publicada neste repositório vira uma versão nova. Para recebê-las sozinho, ligue a atualização automática **uma vez** (ela vem desligada para marketplaces que não são da Anthropic):

`/plugin` → aba **Marketplaces** → `gersonkm` → **Enable auto-update**

A versão nova é baixada em segundo plano e passa a valer na sessão seguinte. Para atualizar na hora:

```
/plugin marketplace update gersonkm
```

## Conferir se está funcionando

Depois de instalar, abra uma sessão nova e siga o [roteiro de teste](docs/teste-instalacao.md). São três perguntas ao Claude, em dois minutos.
