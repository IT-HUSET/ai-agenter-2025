# AI Agents Course

A comprehensive 3-day course on AI agents, their applications, and practical implementations.

## Course Overview

This course provides hands-on experience with AI agents, LangGraph, and real-world applications:

- **Day 1**: Foundations of AI Agents - Theory, architecture, prompt engineering, and introduction to AI coding agents
- **Day 2**: Agentic RAG and practical lab exercises
- **Day 3**: Real-world case studies and extended lab work

## Tech Stack

- **Python** 3.11+
- **Package Manager**: uv
- **AI Framework**: LangGraph
- **Key Libraries**: LangChain, OpenAI, Anthropic, ChromaDB

## Setup

1. Install dependencies:
```bash
uv sync
```

2. Create a `.env` file with your API keys:
```
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
TAVILY_API_KEY=your_key_here
```

3. Run exercises or scripts:
```bash
uv run jupyter notebook  # For lab exercises
uv run script.py         # For Python scripts
```

## Project Structure

- `course-content/` - Course materials, plans, and slides
- `exercises/` - Lab exercises for OpenAI, LangGraph, and Claude Code
- `input/` - Reference materials and previous course content


## TODO: Docs about dev containers

### Additional features
See: https://containers.dev/features
