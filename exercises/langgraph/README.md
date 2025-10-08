# Day 1 LangGraph Exercises

Progressive hands-on exercises for mastering LangGraph fundamentals and building AI agents.

## 📚 Exercise Overview

| Module | Title | Duration | Difficulty | Key Concepts |
|--------|-------|----------|------------|--------------|
| **1.1** | Building Your First Agent | 45 min | ⭐ Beginner | StateGraph, Nodes, Edges, TypedDict |
| **1.2** | Routing with LLMs | 45 min | ⭐⭐ Intermediate | LLM-based routing, Sentiment analysis, Conditional logic |
| **1.3** | Tool Calling Agent | 60 min | ⭐⭐⭐ Advanced | ReAct pattern, ToolNode, Function calling |

## 🎯 Learning Objectives

By the end of these exercises, you will be able to:

- ✅ Define structured state schemas using TypedDict
- ✅ Create node functions that update state
- ✅ Build graphs with normal and conditional edges
- ✅ Use LLMs for intelligent routing decisions
- ✅ Implement sentiment/intent analysis
- ✅ Define and use tools with the `@tool` decorator
- ✅ Build complete ReAct agents with tool calling
- ✅ Debug and visualize agent workflows

## 🚀 Quick Start

### Prerequisites

- Python 3.11 or 3.12
- OpenAI API key (or Azure OpenAI)
- Basic Python knowledge
- Familiarity with async/await (helpful but not required)

### Setup

1. **Clone/Navigate to exercises directory:**
   ```bash
   cd exercises/langgraph
   ```

2. **Create virtual environment:**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install openai~=1.57 python-dotenv~=1.0 \
               langchain~=0.3 langchain_openai~=0.2 \
               langgraph~=0.2 jupyter
   ```

4. **Set up environment variables:**
   ```bash
   # Create .env file
   cp .env.example .env

   # Edit .env and add your API key:
   # OPENAI_API_KEY=sk-...
   ```

5. **Start Jupyter:**
   ```bash
   jupyter notebook
   ```

## 📖 Exercise Guide

### Module 1.1: Building Your First Agent
**File:** `1.1-langgraph-first-agent.ipynb`

**What you'll build:** A name generator agent that creates cool names and routes based on name length.

**Key learnings:**
- Understanding StateGraph architecture
- Creating node functions with state updates
- Using conditional edges for routing
- Compiling and testing graphs

**Exercise challenge:** Build a "Job Title Generator" with custom routing logic.

---

### Module 1.2: Routing with LLMs
**File:** `1.2-langgraph-routing.ipynb`

**What you'll build:** A customer service router that analyzes sentiment and routes to different response personalities.

**Key learnings:**
- LLM-based conditional logic
- Sentiment analysis for routing
- Creating nodes with distinct personalities
- When to use LLM routing vs. simple logic

**Exercise challenge:** Build an intent-based router for technical/billing/general support.

---

### Module 1.3: Tool Calling Agent
**File:** `1.3-langgraph-tool-calling.ipynb`

**What you'll build:** A ReAct agent with weather, calculator, and fact-retrieval tools.

**Key learnings:**
- Defining tools with `@tool` decorator
- Binding tools to LLM with `bind_tools()`
- Using ToolNode for automatic execution
- Implementing the ReAct pattern (Reasoning + Acting)
- Multi-step tool calling workflows

**Exercise challenge:** Build a research assistant with Wikipedia search, date, and currency conversion tools.

## 🛠️ Troubleshooting

### Common Issues

**1. API Key Not Found**
```
ValueError: Please set OPENAI_API_KEY in your .env file
```
**Solution:** Create a `.env` file with your API key:
```bash
echo "OPENAI_API_KEY=sk-your-key-here" > .env
```

**2. Import Errors**
```
ModuleNotFoundError: No module named 'langgraph'
```
**Solution:** Ensure virtual environment is activated and dependencies installed:
```bash
source .venv/bin/activate
pip install -r requirements.txt
```

**3. Mermaid Visualization Fails**
```
IPython.display.Image: No such file or directory
```
**Solution:** Install graphviz (optional, for visualization):
```bash
# macOS
brew install graphviz

# Ubuntu/Debian
sudo apt-get install graphviz
```

**4. Tool Calls Not Working**
- Ensure you're using a model that supports function calling (gpt-4o-mini, gpt-4, etc.)
- Check that tools are properly bound: `llm_with_tools = llm.bind_tools(tools)`
- Verify tool docstrings are clear and descriptive

## 📊 Exercise Progression

The exercises build on each other:

```
1.1 Foundation
    ↓ (Learn state, nodes, edges)

1.2 Smart Routing
    ↓ (Add LLM-based decisions)

1.3 Tool Calling
    ↓ (Add external actions)

→ Ready for Day 2 RAG exercises!
```

## 🎓 Best Practices

### State Design
- ✅ Use TypedDict for type hints
- ✅ Mark optional fields with `NotRequired`
- ✅ Keep state flat and simple
- ✅ Use meaningful field names

### Node Functions
- ✅ First parameter is always state
- ✅ Return dict with state updates
- ✅ Add print statements for debugging
- ✅ Handle errors gracefully

### Tool Design
- ✅ Write clear, detailed docstrings
- ✅ Use type hints for all parameters
- ✅ Return strings (easiest for LLM)
- ✅ Test tools independently first

### Debugging
- ✅ Use `graph.stream()` to see each step
- ✅ Visualize with `.get_graph().draw_mermaid_png()`
- ✅ Use `xray=True` to see internal nodes
- ✅ Start simple, add complexity gradually

## 🔗 Resources

### Official Documentation
- [LangGraph Documentation](https://langchain-ai.github.io/langgraph/)
- [LangGraph Low-Level Concepts](https://langchain-ai.github.io/langgraph/concepts/low_level/)
- [LangGraph How-To Guides](https://langchain-ai.github.io/langgraph/how-tos/)
- [LangChain Tools](https://python.langchain.com/docs/concepts/tools/)

### Additional Learning
- [ReAct Paper (2022)](https://arxiv.org/abs/2210.03629)
- [LangGraph GitHub Examples](https://github.com/langchain-ai/langgraph/tree/main/examples)
- [LangSmith for Debugging](https://docs.smith.langchain.com/)

### Community
- [LangChain Discord](https://discord.gg/langchain)
- [LangChain Twitter](https://twitter.com/langchainai)
- [Stack Overflow: langgraph tag](https://stackoverflow.com/questions/tagged/langgraph)

## 💡 Tips for Success

1. **Do the exercises in order** - Each builds on previous concepts
2. **Complete the challenges** - Hands-on practice is essential
3. **Experiment freely** - Modify code, break things, learn from errors
4. **Read the docs** - The official LangGraph docs are excellent
5. **Ask questions** - Use the community resources above

## 🎯 Next Steps

After completing these exercises, you'll be ready for:
- **Day 2:** RAG with LangGraph (Module 2.4)
- Building production agents with persistence
- Advanced patterns: human-in-the-loop, streaming, checkpointing
- Multi-agent systems and complex workflows

---

## 📝 Notes

### Version Information
- LangGraph: ~0.2.56
- LangChain: ~0.3.10
- OpenAI: ~1.57
- Python: 3.11+

### Alternative LLM Providers

**Azure OpenAI:**
```python
from langchain_openai import AzureChatOpenAI

llm = AzureChatOpenAI(
    deployment_name="gpt-4o-mini",
    temperature=0.0,
    openai_api_version="2024-10-01-preview"
)
```

**Anthropic Claude:**
```python
from langchain_anthropic import ChatAnthropic

llm = ChatAnthropic(model="claude-3-5-sonnet-20241022")
```

---

Happy learning! 🚀
