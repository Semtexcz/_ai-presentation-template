#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COPIER_FILE="$SCRIPT_DIR/copier.yml"

if [[ ! -f "$COPIER_FILE" ]]; then
  echo "Missing copier.yml at $COPIER_FILE" >&2
  exit 1
fi

for cmd in git copier awk; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd is required but not available in PATH" >&2
    exit 1
  fi
done

template_version="$(
  awk '
    $0 ~ /^template_version:/ { in_block=1; next }
    in_block && $0 ~ /^[^[:space:]]/ { exit }
    in_block && $0 ~ /^[[:space:]]+default:/ {
      line = $0
      sub(/^[[:space:]]+default:[[:space:]]*/, "", line)
      gsub(/["'\'']/, "", line)
      print line
      exit
    }
  ' "$COPIER_FILE"
)"

if [[ -z "$template_version" ]]; then
  echo "Could not read template_version.default from $COPIER_FILE" >&2
  exit 1
fi

tag_name="v${template_version#v}"

echo "Ensuring annotated tag $tag_name exists"

if git rev-parse -q --verify "refs/tags/$tag_name" >/dev/null; then
  echo "Local tag $tag_name already exists, skipping creation"
else
  git tag -a "$tag_name" -m "$tag_name"
  echo "Created local tag $tag_name"
fi

echo "Ensuring tag $tag_name exists on origin"

if git ls-remote --exit-code --tags origin "refs/tags/$tag_name" >/dev/null 2>&1; then
  echo "Remote tag $tag_name already exists, skipping push"
else
  git push origin "$tag_name"
  echo "Pushed tag $tag_name to origin"
fi