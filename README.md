

![Let's build an agent](images/ai-agenter-2025.png?raw=true)

# Välkommen till # AI-Agenter 2025!

## Sätt upp din utvecklingsmiljö

### Hemligheter / Secrets
...finns [här](https://docs.google.com/document/d/1GU-AHlKJ1WrakcmzZdqxsi9HrmI2nJY15bt23B0TWC0/edit?usp=drive_link) för inklistring på läpligt ställe (`.env`-fil etc)`. 


## Google Colab - For Jupyter Notebooks Exercises

1. **Use Google Colab (requires a Google account)**:
    - Click the corresponding _**`Open in Google Colab`**_ link below.
    - Configure "Secrets" / API-keys (reachable from the left-hand menu).
      ![Google Colab - Secrets](images/colab-keys.png)


## Local (or Cloud) Development Environment Setup

### 1. Use a Dev Container (requires Docker or similar installed locally)
1. Install [Docker](https://www.docker.com/get-started/) (or similar container runtime).
2. Open this folder in VSCode.
3. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension if you haven't already.
3. When prompted, click "Reopen in Container".
4. Create a `.env` file with your API keys.


### 2. Local environment setup (if you have Python installed locally)

1. Install dependencies:
```bash
# Install uv (https://docs.astral.sh/uv/)

# Run uv sync to install dependencies
uv sync
```

2. Create a `.env` file with your API keys:
```
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
```

3. Run exercises or scripts:
```bash
uv run jupyter notebook some-notebook.ipynb  # For lab exercises
uv run script.py         # For Python scripts
```

### 3. **Use GitHub Codespaces - (requires a GitHub-account)**:
- _(Optional first step if you want to save your changes: **Fork this repo**)_ <br/>
    <img src="images/fork.png" height="30"/>

- Click "Code" and then "Create codespace on main" in the GitHub UI<br/>
    <img src="images/code.png" height="30"/><br/>
    <img src="images/codespacer.png" height="30"/>
    <br/>

- Wait for the codespace to be created and then create a `.env` file with the API-keys.
    (_**See below for screenshots**_)


## Länkar
- GitHub Spec kit: https://github.com/github/spec-kit


## Jupyter Notebooks in GitHub Codespaces
There is a bug in the latest Microsoft Jupyter extension that prevents Jupyter Notebooks from working properly in Codespaces. To work around this, **revert it back to version 2025.8.x**

## Jupyter Notebooks Colab links

Open notebook here on GitHub and then click the "Open in Colab" button (like the one below).<br/>
<img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>


