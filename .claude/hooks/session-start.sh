#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# Install project dependencies (idempotent)
python3 -m pip install --quiet --disable-pip-version-check --root-user-action=ignore -r requirements.txt

# Smoke check: all modules compile and the app imports
python3 -m compileall -q app
python3 -c "import app.app"
