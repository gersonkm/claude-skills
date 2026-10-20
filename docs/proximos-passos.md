# Próximos passos

Painel do que vem a seguir neste repositório. Cada item diz quando sai daqui.

## Plugin `decisoes`: comandos do ciclo de vida

Acrescentar comandos não quebra quem já instalou; por isso ficaram para depois do primeiro uso. Contexto em [D7](decisoes/ativo/distribuicao-publica-plugin-decisoes.md).

- **`/decisoes:fecha`**: encerrar o doc depois da release. Muda o status para `publicado` ou `descartado` (ou pausa), faz o `git mv` para `arquivo/` ou `pausado/` e atualiza quem aponta para ele. É o de maior retorno: esquecer de fechar o doc já deixou decisões entregues parecendo abertas por meses. Sai quando o comando for publicado.
- **`/decisoes:retoma`**: continuar uma discussão numa sessão nova. Relê o doc, resume onde parou e propõe a próxima rodada. Sai quando o comando for publicado.
- **`/decisoes:confere`**: panorama dos docs abertos de um repo, confrontando o status com a realidade (releases depois da última atualização, "Pendente:" já feitos). Sai quando o comando for publicado.

## Primeira instalação

- **Testar no Windows (Claude Desktop, aba Code) e no Mac** com o [roteiro de teste](teste-instalacao.md). O ponto em aberto é se o Desktop roda os hooks do plugin; a documentação não garante. Sai quando os dois testes passarem, ou quando a falha virar ajuste no plugin.
