Regras de documentos de decisão (plugin `decisoes`), valem em toda a sessão:

- Quando a conversa virar exploração de alternativas com tradeoffs ou decisão de impacto, e não for bug simples, ajuste cosmético, tarefa operacional ou mudança direta sem alternativas, sugerir `/decisoes:discute` antes de aprofundar. Sugerir, não acionar: a decisão de abrir o documento é do usuário.
- Os documentos ficam em `docs/decisoes/`: `ativo/` (em-discussao, em-implementacao, implementado), `pausado/`, `arquivo/publicado/` e `arquivo/descartado/`.
- Decisão nova numa obra em andamento vira um novo `Dn` no documento aberto dela, não documento novo. Antes, conferir se a obra já foi entregue de fato, porque fechar o doc costuma ser esquecido; se foi, propor fechar o doc e abrir um novo que o referencie.
- Congelamento: depois da release, o documento não muda em substância (decisões, motivações, alternativas descartadas). Só correção factual (typo, link, nome) ou melhoria didática que não muda o que foi decidido. Decisão revista vira documento novo que referencia o anterior.
- Nunca consultar `docs/decisoes/arquivo/` nem `docs/decisoes/pausado/` para entender o estado atual do sistema; usar o código e a documentação viva. Só sob pedido explícito, para citar decisão anterior num documento novo ou para retomar um pausado.
- Conhecimento valioso (regra de negócio, arquitetura, comportamento de ferramenta) que surgir e não estiver documentado: sinalizar e sugerir onde documentar; escrever só com o OK do usuário.
