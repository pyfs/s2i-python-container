# bashrc extra

# pyenv
# 必须手动写 .bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# direnv
# 必须手动写 .bashrc
eval "$(direnv hook bash)"

# sqlite3 update
export LD_LIBRARY_PATH="/usr/local/sqlite/lib"
