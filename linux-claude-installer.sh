npm install -g @anthropic-ai/claude-code

# install uv - dependency of superclaude
curl -Ls https://astral.sh/uv/install.sh | sh

# install superclaude 
git clone https://github.com/SuperClaude-Org/SuperClaude_Framework.git
cd SuperClaude_Framework
uv venv
source .venv/bin/activate
uv pip install SuperClaude
uvx pip install SuperClaude
python3 -m SuperClaude install


