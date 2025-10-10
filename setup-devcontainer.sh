#!/bin/bash
set -e

# Install Claude Code CLI globally
npm install -g @anthropic-ai/claude-code

# Install Gemini CLI globally
#npm install -g @google/gemini-cli

# Install OpenAI Codex CLI globally
#npm install -g @openai/codex

# Setup Claude config directory
sudo mkdir -p ~/.claude
sudo chown vscode:vscode ~/.claude

# Copy project-specific Claude agents and commands to user directory
if [ -d ".claude/agents" ]; then
    cp -r .claude/agents ~/.claude/
    echo "Copied .claude/agents to ~/.claude/"
fi

if [ -d ".claude/commands" ]; then
    cp -r .claude/commands ~/.claude/
    echo "Copied .claude/commands to ~/.claude/"
fi

# Add yoloc alias to .zshrc if not already present
if ! grep -q "alias yoloc=" /home/vscode/.zshrc 2>/dev/null; then
    echo "" >> /home/vscode/.zshrc
    echo "# Claude Code alias" >> /home/vscode/.zshrc
    echo 'alias yoloc="claude --dangerously-skip-permissions"' >> /home/vscode/.zshrc
    echo "Added yoloc alias to .zshrc"
fi
