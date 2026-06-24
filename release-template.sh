#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COPIER_FILE="$SCRIPT_DIR/copier.yml"

if [[ ! -f "$COPIER_FILE" ]]; then
  echo "Missing copier.yml at $COPIER_FILE" >&2
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required but not available in PATH" >&2
  exit 1
fi

if ! command -v copier >/dev/null 2>&1; then
  echo "copier is required but not available in PATH" >&2
  exit 1
fi

template_version="$(
  awk '
    $0 ~ /^template_version:/ { in_block=1; next }
    in_block && $0 ~ /^[^[:space:]]/ { exit }
    in_block && $0 ~ /^[[:space:]]+default:/ {
      line = $0
      sub(/^[[:space:]]+default:[[:space:]]*/, "", line)
      gsub(/"/, "", line)
      print line
      exit
    }
  ' "$COPIER_FILE"
)"

if [[ -z "$template_version" ]]; then
  echo "Could not read template_version.default from $COPIER_FILE" >&2
  exit 1
fi

temp_version="v${template_version#v}"

echo "Creating annotated tag $temp_version from $COPIER_FILE"
git tag -a "$temp_version" -m "$temp_version"

echo "Pushing tag $temp_version to origin"
git push origin "$temp_version"

echo "Running copier update --defaults --trust"
copier update --defaults --trust
