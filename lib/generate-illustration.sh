#!/usr/bin/env bash
# Generate an illustration via Kie.ai (Google nano-banana-2) and download it.
#
# Usage:
#   lib/generate-illustration.sh "prompt text" [output_path] [aspect_ratio] [resolution]
#
# Defaults: output_path=output.png  aspect_ratio=1:1  resolution=2K
#
# Reads KIE_API_KEY from .env at the repo root.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"
if [ -f "$ENV_FILE" ]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

if [ -z "${KIE_API_KEY:-}" ]; then
  echo "Error: KIE_API_KEY not set. Add it to .env at the repo root (KIE_API_KEY=...)." >&2
  exit 1
fi

PROMPT="${1:?Usage: $0 \"prompt\" [output_path] [aspect_ratio] [resolution]}"
OUTPUT="${2:-output.png}"
ASPECT_RATIO="${3:-1:1}"
RESOLUTION="${4:-2K}"

echo "Submitting task to Kie.ai (nano-banana-2)..." >&2

CREATE_RESPONSE="$(curl -sX POST https://api.kie.ai/api/v1/jobs/createTask \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$(jq -n \
        --arg prompt "$PROMPT" \
        --arg ar "$ASPECT_RATIO" \
        --arg res "$RESOLUTION" \
        '{model: "nano-banana-2", input: {prompt: $prompt, aspect_ratio: $ar, resolution: $res, output_format: "png"}}')")"

TASK_ID="$(echo "$CREATE_RESPONSE" | jq -r '.data.taskId // empty')"

if [ -z "$TASK_ID" ]; then
  echo "Error creating task: $CREATE_RESPONSE" >&2
  exit 1
fi

echo "Task $TASK_ID submitted — polling for completion..." >&2

while true; do
  sleep 3
  STATUS_RESPONSE="$(curl -s "https://api.kie.ai/api/v1/jobs/recordInfo?taskId=$TASK_ID" \
    -H "Authorization: Bearer $KIE_API_KEY")"
  STATE="$(echo "$STATUS_RESPONSE" | jq -r '.data.state // "unknown"')"

  case "$STATE" in
    success)
      RESULT_URL="$(echo "$STATUS_RESPONSE" | jq -r '.data.resultJson | fromjson | .resultUrls[0]')"
      echo "Generation complete. Downloading to $OUTPUT" >&2
      curl -sL "$RESULT_URL" -o "$OUTPUT"
      echo "$OUTPUT"
      exit 0
      ;;
    fail)
      FAIL_MSG="$(echo "$STATUS_RESPONSE" | jq -r '.data.failMsg // "unknown error"')"
      echo "Generation failed: $FAIL_MSG" >&2
      exit 1
      ;;
    waiting|queuing|generating)
      echo "  state=$STATE..." >&2
      ;;
    *)
      echo "  unexpected response: $STATUS_RESPONSE" >&2
      ;;
  esac
done
