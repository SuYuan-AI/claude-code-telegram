#!/bin/bash
# Run test bot instance from local source code (feat/bot-control-commands branch)
# Usage: ./run_test_bot.sh
set -e

cd /root/claude-code-telegram

# Make sure we're on the feature branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Branch: $BRANCH"

# Check test token is filled in
if grep -q "REPLACE_WITH_TEST_TOKEN" .env.test; then
    echo "❌ Fill in TELEGRAM_BOT_TOKEN in .env.test first"
    exit 1
fi

echo "Starting test bot from source (PYTHONPATH workaround)..."
ENV_FILE=.env.test PYTHONPATH=/root/claude-code-telegram python3 -m src.main
