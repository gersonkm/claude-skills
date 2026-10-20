# Roteiro de teste da instalação

Para fazer uma vez, logo depois de instalar o plugin `decisoes`. Confirma que a skill, as regras e as proteções chegaram. Abra uma **sessão nova** (as mudanças de plugin só valem a partir dela), dentro de uma pasta de projeto qualquer.

## 1. A skill está disponível?

Digite `/decisoes` e veja se aparece `/decisoes:discute` na lista.

- ✅ Aparece: a skill foi instalada.
- ❌ Não aparece: confira em `/plugin` se o plugin `decisoes` está instalado e habilitado.

## 2. As regras chegaram no início da sessão?

Pergunte ao Claude:

> Você recebeu no início da sessão um bloco chamado "Regras de documentos de decisão (plugin decisoes)"? Qual comando ele manda sugerir?

- ✅ Responde que sim e cita `/decisoes:discute`: os hooks estão rodando.
- ❌ Diz que não recebeu: os hooks não rodaram. No Windows, a causa mais provável é falta do Git for Windows (ver o README). Se ele estiver instalado, abra uma issue neste repositório com a resposta do Claude e o sistema operacional.

## 3. A proteção de documento arquivado funciona?

Peça ao Claude para criar um arquivo de teste e depois lê-lo:

> Crie o arquivo docs/decisoes/arquivo/publicado/teste.md com a palavra "teste". Depois, use a ferramenta Read para lê-lo.

- ✅ Na leitura, o Claude Code pede confirmação, com uma mensagem sobre documentos que "não refletem o estado atual do sistema": a proteção funciona. Pode negar.
- ❌ Lê sem pedir nada: a proteção não está rodando. Mesmo diagnóstico do item 2.

A criação do arquivo também pede confirmação, porque a pasta é de documentos congelados. Pode aprovar, é só um teste. No fim, apague a pasta `docs/decisoes/arquivo/` do teste.
