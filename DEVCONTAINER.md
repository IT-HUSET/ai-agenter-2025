# Multi-Language Dev Container

A lightweight development container built on **Debian** with modular Features for Node.js, Deno, Python, and GitHub CLI.

## What's Included

This container uses a minimal Debian base (~124MB) and adds capabilities via Dev Container Features:

### Base Image
- `mcr.microsoft.com/devcontainers/base:debian` - Minimal Debian container

### Installed via Features
- **Common Utils**: Zsh with Oh My Zsh, git, curl, wget, jq, vim, nano, and more
- **Node.js LTS**: JavaScript/TypeScript runtime with npm and Yarn
- **Python 3.12**: With pip, pipx, and common development tools
- **UV**: Blazing-fast Python package manager (with shell autocompletion)
- **Deno**: Modern JavaScript/TypeScript runtime
- **GitHub CLI**: Official `gh` command-line tool
- **Git (latest)**: From PPA for the newest version
- **Claude Code**: AI coding assistant (installed via npm)

### Total Size
Approximately **1.5-2GB** after all features are installed (much lighter than Universal's 6GB!)

## Getting Started

1. Open this folder in VS Code
2. When prompted, click "Reopen in Container"
3. Wait for features to install (first time only, ~5-10 minutes)
4. Container is cached for instant subsequent launches

## Verify Installation

```bash
# Check Node.js
node --version

# Check Deno
deno --version

# Check Python
python3 --version

# Check UV
uv --version

# Check GitHub CLI
gh --version

# Check Claude Code
claude --version
```

## Usage Examples

### Node.js
```bash
npm init -y
npm install express
node index.js
```

### Deno
```bash
deno run --allow-net https://deno.land/std/examples/welcome.ts
```

### Python with UV
```bash
# Create a new project
uv init my-project
cd my-project

# Add dependencies
uv add requests

# Run your script
uv run script.py

# Or use traditional venv
uv venv
source .venv/bin/activate
uv pip install requests
python script.py
```

### GitHub CLI
```bash
gh auth login
gh repo list
gh pr list
```

## Accessing Web Applications

### Automatic Port Forwarding

VS Code automatically detects when you start a web server in the container and forwards the port to your host machine. The container is configured with smart port forwarding that:

- **Auto-detects** common development ports (3000, 5173, 8000, 8080)
- **Automatically opens browser** when a port starts
- **Avoids port conflicts** - VS Code will use an available port on your host if the default is taken

### How to Access

1. **Start your web server** in the container on standard ports:
   ```bash
   # Example: Node.js/React (port 3000)
   npm run dev

   # Example: Vite (port 5173)
   npm run dev

   # Example: Python HTTP server (port 8000)
   python -m http.server 8000

   # Example: Deno Fresh (port 8000)
   deno task start
   ```

2. **VS Code automatically handles the rest**:
   - Detects the port and forwards it
   - Opens your browser automatically
   - If port is taken on host, VS Code picks the next available port

3. **View/Manage ports** in VS Code:
   - Open the **Ports** panel (View → Ports, or Ctrl+`)
   - See all forwarded ports and their **local addresses**
   - The local address shows the actual port on your host (may differ from container port)
   - Right-click to change visibility (private/public)
   - Copy the local address to access from other apps

### Port Conflicts

If you already have something running on port 3000 on your host machine:
- VS Code will automatically forward to the next available port (e.g., 3001, 3002)
- Check the **Ports** panel to see the actual local address
- Your container still uses the original port internally

### Manual Port Forwarding

To forward additional ports:
1. Open the **Ports** panel
2. Click **Forward a Port**
3. Enter the port number from the container
4. VS Code will find an available port on your host

## Playwright Browser Testing

Playwright works perfectly in this dev container for headless browser testing and **Playwright MCP**.

### Pre-installed

Chromium browser is **pre-installed** during container creation for immediate use with:
- **Playwright MCP** (Model Context Protocol) - for AI-driven browser automation
- **Playwright testing** - for traditional E2E testing

### Setup for Testing (Optional)

If you want to use Playwright for traditional testing:

```bash
# Initialize Playwright in your project
npm init playwright@latest

# Browsers are already installed, but you can add more:
npx playwright install firefox webkit
```

### Running Tests

**Headless Mode** (default - works perfectly in container):
```bash
# Run all tests
npx playwright test

# Run specific test file
npx playwright test tests/example.spec.ts

# Run with reporter
npx playwright test --reporter=html
```

**Headed Mode** (see browser UI - requires X11 on Linux/Mac):
```bash
# Run with visible browser
npx playwright test --headed

# Run in UI mode (interactive debugging)
npx playwright test --ui

# Debug mode
npx playwright test --debug
```

**Note**: Headed/UI mode requires X11 forwarding on your host machine. Headless mode (default) works out of the box with no additional setup.

### Why It Works

- **Chromium pre-installed** - ready for Playwright MCP and testing
- **Headless browsers** don't need a display - perfect for containers
- **All dependencies included** - system libraries installed via `--with-deps`
- **Fast and reliable** - tests run 2x-15x faster in headless mode
- **CI/CD ready** - same commands work in CI pipelines

### Using with Playwright MCP

Playwright MCP is already configured in Claude Code. Just use it:

```bash
# Playwright MCP uses the pre-installed Chromium automatically
# No additional setup needed!
```

When Claude Code uses the Playwright MCP server, it will automatically use the pre-installed Chromium browser in the container.

## VS Code Extensions

The container includes extensions for:
- ESLint & Prettier (JavaScript/TypeScript)
- Deno language support
- Python & Pylance
- GitLens

## Notes

- Deno is disabled by default. Enable it per-workspace in VS Code settings
- Command history is persisted across container rebuilds
- Pre-configured ports will auto-forward with notifications
- Playwright headless mode works perfectly with no additional setup
