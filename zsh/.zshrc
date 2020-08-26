### Unified settings

# Added to workaround a fork issue with Ansible and macOS High Sierra
# https://github.com/ansible/ansible/issues/32499
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="tjkirch"
# ZSH_THEME="smt"
ZSH_THEME="junkfood"
# ZSH_THEME="gnzh"
# ZSH_THEME="bureau"
# ZSH_THEME="rkj-repos"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL='code --wait'
export EDITOR='code --wait'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

source $ZSH/oh-my-zsh.sh

export DISPLAY=:0

# Disable Cowsay in Ansible
export ANSIBLE_NOCOWS=1

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias grep='egrep'
alias tree='tree -CN'
alias getip='ifconfig | egrep -A1 "^eth0"; echo ---; echo -n "Internet: "; curl ipecho.net/plain; echo'
alias hg='history | grep'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias python='python3.7'
alias pip='pip3'
alias get-panw-config='get-panw-config -K'
alias run-panw-cmd='run-panw-cmd -K'

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_WORKON_CD=False
# source /usr/local/bin/virtualenvwrapper.sh

# Workaround hash issue (python, virtualenv, pip install)
# https://stackoverflow.com/questions/36543707/why-does-zsh-ignore-the-path-entry-order
autoload -Uz add-zsh-hook
auto_rehash () {
    rehash
}
# Enable rehash function
# add-zsh-hook precmd auto_rehash
# Disable
# add-zsh-hook -d precmd auto_rehash

slackit() {
    curl -X POST -H 'Content-type: application/json' --data "{'text':'$@'}" $webhook
}

export intl='aubj|auch|aufo|auhp|aume|aupe|ausy|cndg|cnsg|cnsh|deca|gbku|gbtc|gbwf|idsu|idtr|ingg|inma|momr|prtg|puin|sgsi|tris|vnth'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git pip rsync pep8 nmap docker docker-compose ansible history-substring-search python pylint sudo)
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#.# zsh-syntax-highlighting
#
# Fish shell like syntax highlighting for Zsh
#
# @link: http://github.com/zsh-users/zsh-syntax-highlighting
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

source $HOME/.zshrc_local
