#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# Install project and dev dependencies (idempotent)
python3 -m pip install --quiet --disable-pip-version-check --root-user-action=ignore -r requirements-dev.txt

# Smoke check: all modules compile and the app imports
python3 -m compileall -q app
python3 -c "import app.app"

# Lint with wemake-python-styleguide; report but do not block the session
python3 -m flake8 app --select=WPS || echo "WPS: violations found, run make lint"
