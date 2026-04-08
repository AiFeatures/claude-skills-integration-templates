#!/usr/bin/env bash
# Validator CLI for claude-skills-integration-templates.
#
# Checks every template under templates/ for:
#   - presence of CLAUDE_SKILLS_INTEGRATION.md
#   - non-empty body
#   - no leftover <PLACEHOLDER> tokens in ALL_CAPS angle brackets
#   - reasonable length (> 20 lines)
#
# Usage: bash scripts/validate.sh [templates-dir]
# Exit: 0 = all valid, 1 = one or more issues found

set -u

dir="${1:-templates}"
errors=0
checked=0

if [[ ! -d "$dir" ]]; then
  echo "error: directory not found: $dir" >&2
  exit 1
fi

for tmpl in "$dir"/*/; do
  [[ -d "$tmpl" ]] || continue
  name="$(basename "$tmpl")"
  checked=$((checked + 1))

  manifest="$tmpl/CLAUDE_SKILLS_INTEGRATION.md"
  if [[ ! -f "$manifest" ]]; then
    echo "FAIL [$name] missing CLAUDE_SKILLS_INTEGRATION.md"
    errors=$((errors + 1))
    continue
  fi

  if [[ ! -s "$manifest" ]]; then
    echo "FAIL [$name] CLAUDE_SKILLS_INTEGRATION.md is empty"
    errors=$((errors + 1))
    continue
  fi

  lines=$(wc -l <"$manifest" | tr -d ' ')
  if [[ "$lines" -lt 20 ]]; then
    echo "WARN [$name] manifest is only $lines lines (expected >= 20)"
  fi

  if grep -qE '<[A-Z_]{3,}>' "$manifest"; then
    placeholders=$(grep -oE '<[A-Z_]{3,}>' "$manifest" | sort -u | tr '\n' ' ')
    echo "FAIL [$name] unfilled placeholders: $placeholders"
    errors=$((errors + 1))
    continue
  fi

  echo "OK   [$name]"
done

echo ""
echo "Checked $checked template(s), $errors error(s)"
[[ "$errors" -eq 0 ]]
