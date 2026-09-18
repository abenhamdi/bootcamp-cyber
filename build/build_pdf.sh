#!/usr/bin/env bash
# Convertit un fichier Markdown en PDF : pandoc (MD -> HTML) puis weasyprint (HTML -> PDF)
# Usage: ./build_pdf.sh <fichier.md> <sortie.pdf>
set -euo pipefail

SRC="$1"
OUT="$2"
HERE="$(cd "$(dirname "$0")" && pwd)"
CSS="$HERE/assets/style.css"
export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:${DYLD_FALLBACK_LIBRARY_PATH:-}"
TMP_HTML="$(mktemp -t bootcamp).html"

PANDOC="$(command -v pandoc)"
WEASY="$(command -v weasyprint)"

"$PANDOC" "$SRC" \
  --from=gfm+tex_math_dollars \
  --to=html5 \
  --standalone \
  --highlight-style=kate \
  --metadata title="" \
  -o "$TMP_HTML"

"$WEASY" "$TMP_HTML" "$OUT" --stylesheet "$CSS"

rm -f "$TMP_HTML"
echo "OK -> $OUT"
