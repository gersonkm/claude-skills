# Instalar com o Claude

Este arquivo é **para o Claude Code** de quem quer usar os plugins deste repositório. A pessoa só precisa pedir, numa sessão do Claude Code (terminal ou aba Code do Claude Desktop):

> Siga o INSTALAR-COM-CLAUDE.md de github.com/gersonkm/claude-skills

## Passos para o Claude

Faça tudo o que puder sozinho. Peça confirmação **antes de instalar qualquer programa** (passos 2 e 3) e diga em uma frase para que ele serve. Fale com a pessoa no idioma dela, sem jargão.

### 1. Descobrir o ambiente

Descubra o sistema operacional (Windows, macOS ou Linux) e se o comando `claude` existe no terminal (`claude --version`).

### 2. Windows: Git for Windows

Os hooks do plugin são scripts bash, e no Windows o bash vem com o Git for Windows. Rode `git --version`.

- Se existir, siga.
- Se não existir, proponha instalar com `winget install --id Git.Git -e` e explique: sem ele, a skill funciona, mas as proteções do plugin não rodam e aparece erro a cada uso de ferramenta. Com o OK, instale. Se o `winget` não existir, indique o download em https://git-scm.com/download/win.

No macOS e no Linux, pule este passo.

### 3. O comando `claude`

A instalação usa o comando `claude plugin`. Ele não existe quando a pessoa usa só o Claude Desktop e nunca instalou o Claude Code no terminal.

- Se `claude --version` funcionar, siga.
- Se não funcionar, proponha instalar o Claude Code no terminal, com o instalador oficial. Explique que, além de permitir a instalação, ele deixa usar o Claude Code direto no terminal, com a mesma conta e os mesmos plugins do Desktop.
  - Windows (PowerShell): `irm https://claude.ai/install.ps1 | iex`
  - macOS e Linux: `curl -fsSL https://claude.ai/install.sh | bash`

  Com o OK, instale e confira com `claude --version`. Se o comando ainda não for encontrado, a pasta de instalação pode não estar no `PATH` da sessão atual: use o caminho que o instalador mostrou.

> Não tente instalar o plugin gravando direto no `settings.json`: o marketplace e o plugin ficam declarados, mas o Claude Code não os baixa. Sem o comando `claude`, a alternativa é a pessoa instalar pela tela: no Desktop, **+** ao lado da caixa de mensagem → **Add plugins**.

### 4. Instalar o plugin

```
claude plugin marketplace add gersonkm/claude-skills
claude plugin install decisoes@gersonkm --scope user
```

O escopo `user` vale para todos os projetos da pessoa, no terminal e no Desktop.

### 5. Ligar a atualização automática

Marketplaces que não são da Anthropic vêm com a atualização automática desligada. Ligue-a no `settings.json` do usuário (`~/.claude/settings.json`; no Windows, `%USERPROFILE%\.claude\settings.json`; se a variável `CLAUDE_CONFIG_DIR` estiver definida, é o `settings.json` dentro dessa pasta): o passo 4 já criou ali a entrada `extraKnownMarketplaces.gersonkm`; acrescente nela `"autoUpdate": true`.

```json
"gersonkm": {
  "source": { "source": "github", "repo": "gersonkm/claude-skills" },
  "autoUpdate": true
}
```

Edite só essa entrada, preservando o resto do arquivo, e confira que o JSON continua válido.

### 6. Conferir se funcionou

Plugins novos só valem a partir de uma sessão nova: a sessão em que você está agora não recebe o plugin, mesmo depois de instalado. Se o comando `claude` funciona, você mesmo pode conferir, abrindo uma sessão à parte:

```
claude -p "Responda em uma linha: você recebeu no início da sessão um bloco chamado 'Regras de documentos de decisão (plugin decisoes)'? Qual comando ele manda sugerir?"
```

- ✅ A resposta cita `/decisoes:discute`: a skill e os hooks estão funcionando.
- ❌ A resposta diz que não recebeu o bloco: os hooks não rodaram. No Windows, confira o Git for Windows (passo 2) e repita depois de abrir o Claude de novo.
- Se o `claude -p` pedir login, peça à pessoa para rodar `claude` uma vez no terminal e entrar com a conta dela, ou pule para o roteiro manual abaixo.

Com ou sem essa conferência, diga à pessoa para **fechar e abrir uma sessão nova** antes de usar o plugin e, se quiser conferir com os próprios olhos, seguir o [roteiro de teste](docs/teste-instalacao.md).

### 7. Se os hooks não rodarem de jeito nenhum

Só nesse caso, ofereça uma alternativa para o Claude continuar sugerindo a discussão na hora certa: colocar o conteúdo de [`plugins/decisoes/hooks/regras-sessao.md`](plugins/decisoes/hooks/regras-sessao.md) no `CLAUDE.md` global da pessoa (`~/.claude/CLAUDE.md`), entre as marcas `<!-- gersonkm/decisoes: início -->` e `<!-- gersonkm/decisoes: fim -->`. Avise que esse bloco **não se atualiza sozinho** e que as proteções de documento arquivado continuam sem funcionar. Mostre o texto e só grave com o OK. Peça também para a pessoa abrir uma issue neste repositório, com o sistema operacional e o que aconteceu.

### 8. Resumo para a pessoa

Termine em poucas linhas: o que foi instalado, se a atualização automática ficou ligada, o comando `/decisoes:discute` e que o Claude vai sugerir a discussão sozinho quando a conversa virar uma escolha entre alternativas.
