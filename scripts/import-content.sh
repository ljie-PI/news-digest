#!/bin/bash
# Import deep_dive markdown files into Astro content directory
# Usage: ./scripts/import-content.sh [batch_dir]
# Example: ./scripts/import-content.sh 2026-04-20_07

set -euo pipefail

DEEP_DIVE_DIR="$HOME/.openclaw/workspace/news-monitor/deep_dive"
CONTENT_DIR="$(cd "$(dirname "$0")/.." && pwd)/src/content/articles"
mkdir -p "$CONTENT_DIR"

import_file() {
  local file="$1"
  local batch="$2"  # e.g. 2026-04-20_07
  local rel="${file#*/deep_dive/$batch/}"  # e.g. hackernews/foo.md or reddit/local-llm/foo.md
  local dir_part="${rel%%/*}"  # hackernews or reddit
  local basename="$(basename "$file" .md)"
  local date="${batch%%_*}"  # 2026-04-20

  # Determine source
  local source
  case "$dir_part" in
    hackernews) source="HN" ;;
    reddit)     source="Reddit" ;;
    github)     source="GitHub" ;;
    producthunt) source="PH" ;;
    *)          source="$dir_part" ;;
  esac

  local slug="${batch}-${basename}"
  local dest="$CONTENT_DIR/${slug}.md"

  # Extract title from first H1
  local title
  title=$(grep -m1 '^# ' "$file" | sed 's/^# //' || echo "$basename")
  [ -z "$title" ] && title="$basename"

  # Extract summary from first paragraph after the title (skip blank lines and blockquotes)
  local summary
  summary=$(awk 'BEGIN{found=0} /^# /{found=1;next} found && /^[^>#\[]/ && NF{print;exit}' "$file" | head -c 200 || echo "")
  summary="${summary//\"/\\\"}"

  # Skip if already exists
  [ -f "$dest" ] && { echo "  skip: $slug"; return; }

  # Write with frontmatter
  {
    echo "---"
    echo "title: \"${title//\"/\\\"}\""
    echo "date: \"$date\""
    echo "source: \"$source\""
    echo "slug: \"$slug\""
    [ -n "$summary" ] && echo "summary: \"$summary\""
    echo "---"
    echo ""
    cat "$file"
  } > "$dest"
  echo "  added: $slug"
}

if [ $# -ge 1 ]; then
  batches=("$@")
else
  batches=($(ls "$DEEP_DIVE_DIR" | sort))
fi

for batch in "${batches[@]}"; do
  echo "Importing batch: $batch"
  find "$DEEP_DIVE_DIR/$batch" -name '*.md' -type f | sort | while read -r f; do
    import_file "$f" "$batch"
  done
done

echo "Done. Content in: $CONTENT_DIR"
