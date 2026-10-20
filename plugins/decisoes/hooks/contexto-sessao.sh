#!/usr/bin/env bash
# Hook SessionStart do plugin `decisoes`.
#
# Em toda sessão: injeta as regras curtas de documentos de decisão
# (regras-sessao.md), para valerem mesmo sem a skill carregada. É o que faz o
# Claude sugerir a skill na hora certa.
#
# Depois da compactação: se houver doc `em-discussao`, manda reler a skill.
# Motivo: na compactação o Claude Code só reanexa os primeiros ~5.000 tokens de
# cada skill, e a skill discute é maior que isso; a parte de condução das
# rodadas se perderia.
#
# ⚠️ Sem `jq` de propósito (Git Bash do Windows e macOS sem instalar nada).

entrada=$(cat)
pasta_hook="$(cd "$(dirname "$0")" && pwd)"

origem=$(printf '%s' "$entrada" \
  | grep -o '"source"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | head -n 1 \
  | sed -E 's/.*"([^"]*)"$/\1/')

cat "$pasta_hook/regras-sessao.md"

[ "$origem" = "compact" ] || exit 0

# Caminho da skill: CLAUDE_PLUGIN_ROOT vem com barras normais também no
# Windows (C:/...), que é o formato que a ferramenta Read entende.
skill="${CLAUDE_PLUGIN_ROOT:-$pasta_hook/..}/skills/discute/SKILL.md"
projeto="${CLAUDE_PROJECT_DIR:-.}"

# Doc em discussão = primeira linha não vazia depois de "## Status" começa com em-discussao.
ativos=""
for doc in "$projeto"/docs/decisoes/ativo/*.md; do
  [ -f "$doc" ] || continue
  if awk '/^## Status/{achou=1; next} achou && NF {exit ($1 ~ /^em-discussao/) ? 0 : 1} END{if(!achou) exit 1}' "$doc"; then
    ativos="$ativos
   - ${doc#"$projeto"/}"
  fi
done

if [ -n "$ativos" ]; then
  cat <<EOF

DEPOIS DA COMPACTAÇÃO: há discussão de decisão em andamento:$ativos
Releia a skill completa em $skill para recuperar o método (rodadas, uma decisão
por vez, recomendação obrigatória, atualização incremental do doc). Depois de
reler, continue a discussão de onde parou.
EOF
fi

exit 0
