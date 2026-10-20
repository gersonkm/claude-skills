#!/usr/bin/env bash
# Hook PreToolUse do plugin `decisoes`.
#
# Pede confirmação ao usuário antes de:
#   - ler ou buscar em docs/decisoes/arquivo/ ou docs/decisoes/pausado/
#     (esses docs não descrevem o estado atual do sistema);
#   - editar doc em docs/decisoes/arquivo/ (doc congelado).
#
# ⚠️ Sem `jq` de propósito: precisa rodar no Git Bash do Windows e no macOS sem
# instalar nada. A extração abaixo lê só campos de texto simples do JSON de
# entrada. Ocorrências escapadas dentro de conteúdo (ex.: o texto de um Write
# que cita "file_path") não casam, porque ali as aspas chegam como \".

entrada=$(cat)

# Valor de um campo de texto do JSON (primeira ocorrência não escapada).
campo() {
  printf '%s' "$entrada" \
    | grep -o "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" \
    | head -n 1 \
    | sed -E "s/^\"$1\"[[:space:]]*:[[:space:]]*\"//; s/\"$//"
}

# No Windows o caminho chega com barra invertida (escapada no JSON como \\).
normaliza() {
  printf '%s' "$1" | sed -e 's#\\\\#/#g' -e 's#\\#/#g'
}

ferramenta=$(campo tool_name)
alvo="$(normaliza "$(campo file_path)") $(normaliza "$(campo notebook_path)") $(normaliza "$(campo path)") $(normaliza "$(campo pattern)")"

pede_confirmacao() {
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"%s"}}\n' "$1"
  exit 0
}

case "$ferramenta" in
  Read|Glob|Grep)
    if printf '%s' "$alvo" | grep -qE 'docs/decisoes/(arquivo|pausado)'; then
      pede_confirmacao "Documento em docs/decisoes/arquivo/ ou pausado/. Esses documentos não refletem o estado atual do sistema. Aprovar só se o usuário pediu para consultar o histórico, para citar decisão anterior num doc novo ou para retomar um doc pausado."
    fi
    ;;
  Edit|Write|MultiEdit|NotebookEdit)
    if printf '%s' "$alvo" | grep -qE 'docs/decisoes/arquivo/'; then
      pede_confirmacao "Documento arquivado (congelado). Aprovar só para correção factual objetiva (typo, link quebrado, nome errado) ou melhoria didática que não muda o que foi decidido. Nunca para revisar decisões ou motivações: decisão revista vira doc novo."
    fi
    ;;
esac

exit 0
