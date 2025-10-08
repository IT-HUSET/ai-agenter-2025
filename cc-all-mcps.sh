#!/usr/bin/env bash

# Try multiple methods to find claude
CLAUDE_CMD=""

# Method 1: Check if claude is available as a command (works for actual applications in PATH)
if command -v claude >/dev/null 2>&1; then
    CLAUDE_CMD="claude"
# Method 2: Check common user-specific location
elif [ -x "$HOME/.claude/local/claude" ]; then
    CLAUDE_CMD="$HOME/.claude/local/claude"
# Method 3: Check if it's an alias (by sourcing shell config and checking)
elif [ -n "$BASH_VERSION" ] && alias claude 2>/dev/null | grep -q claude; then
    # Extract the actual path from the alias
    CLAUDE_PATH=$(alias claude 2>/dev/null | sed "s/.*='*\([^']*\)'*.*/\1/")
    if [ -x "$CLAUDE_PATH" ]; then
        CLAUDE_CMD="$CLAUDE_PATH"
    fi
fi

if [ -n "$CLAUDE_CMD" ]; then
    exec $CLAUDE_CMD --dangerously-skip-permissions --mcp-config all-mcps.json
else
    echo "Error: 'claude' command not found. Please install Claude CLI." >&2
    echo "Tried: PATH, $HOME/.claude/local/claude, and shell aliases" >&2
    exit 1
fi