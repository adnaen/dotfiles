export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# to open neovim as text-editor
export VISUAL=nvim
export EDITOR=nvim


# plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting you-should-use)
plugins=(git sudo history encode64 copypath zsh-autosuggestions you-should-use)

source $ZSH/oh-my-zsh.sh
eval "$(fzf --zsh)"

alias lg="lazygit"
alias nv="nvim"
alias ts="tmux-session"
alias fzf="fzf --preview='bat --color=always {}'"
inv() {
  local dir="${1:-.}"
  local file=$(find "$dir" -type f \
    ! -path "*/env/*" \
    ! -path "*/.venv/*" \
    ! -path "*/venv/*" \
    ! -path "*/.git/*" \
    ! -path "*/__pycache__/*" \
    ! -path "*/.tox/*" \
    ! -path "*/.ipynb_checkpoints/*" \
    ! -path "*/node_modules/*" \
    ! -path "*/.coverage/*" \
    ! -path "*/*.egg-info/*" \
    ! -path "*/*.pyc" | fzf)

  if [ -n "$file" ]; then
    nvim "$file" -c "lcd %:p:h"
  fi
}



export PATH=$PATH:/usr/share/autojump
[[ -s /home/adnan/.autojump/etc/profile.d/autojump.sh ]] && source /home/adnan/.autojump/etc/profile.d/autojump.sh


PATH=~/.console-ninja/.bin:$PATH
export PATH="/home/adnan/.local/bin:$PATH"
export PATH="/opt/nvim/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
