#!/usr/bin/env bash
# Scaffold a new, self-contained presentation project.
#
# Usage:
#   lib/create-new-presentation.sh "Topic or working title" [brand-slug]
#
# Creates presentations/<slug>/ with content.md (brief) and assets/ (Kie.ai
# images live here). Prints the new folder's absolute path on success so it
# can be captured and used as the default output root for that deck.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOPIC="${1:?Usage: $0 \"Topic or working title\" [brand-slug]}"
BRAND="${2:-TBD}"

SLUG="$(python3 -c "
import unicodedata, re, sys
s = sys.argv[1]
s = unicodedata.normalize('NFKD', s)
s = s.encode('ascii', 'ignore').decode('ascii')
s = s.lower()
s = re.sub(r'[^a-z0-9]+', '-', s)
print(s.strip('-'))
" "$TOPIC")"

if [ -z "$SLUG" ]; then
  echo "Error: could not derive a slug from \"$TOPIC\"" >&2
  exit 1
fi

DEST="$SCRIPT_DIR/presentations/$SLUG"

if [ -e "$DEST" ]; then
  echo "Error: $DEST already exists." >&2
  exit 1
fi

mkdir -p "$DEST/assets"

cat > "$DEST/content.md" <<EOF
---
topic: $TOPIC
slug: $SLUG
brand: $BRAND
created: $(date +%Y-%m-%d)
---

# $TOPIC

## Headline


## Audience


## Key points
-
-
-

## Notes

EOF

echo "$DEST"
