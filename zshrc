# Unix
export EDITOR=vim

# Aliases
alias g="git"
alias b="bundle"

# Autocomplete
# [[ -f "$HOME/.zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] && source "$HOME/.zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Prompt
# Left
PROMPT='%~ (%?) (%T) > '

# Right
# https://stackoverflow.com/a/1128583/4165455
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# Support history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Rbenv
if type rbenv &>/dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Local config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "$SPIN" ]; then
  # Remove old versions of fzf
  [[ -f "/usr/local/bin/fzf" ]] && sudo rm /usr/local/bin/fzf
  [[ -f "/usr/bin/fzf" ]] && sudo rm /usr/bin/fzf

  # Install Linuxbrew
  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
fi

alias luamake=/Users/muyiwa/.config/nvim/lua-language-server/3rd/luamake/luamake
