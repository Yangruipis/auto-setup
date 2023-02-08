# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/r.yang/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd history)

source $ZSH/oh-my-zsh.sh

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias kc="kubectl -n bdasire"
alias dc='docker-compose'
alias pwc='pwd | x'
alias pwv='cd `xsel -b`'
alias shotwel='shotwell'
alias sw='shotwell'
alias st='shotwell'
alias cl='clear'
alias countjpg='find -name "*.jpg" | wc -l'
alias countjson='find -name "*.json" | wc -l'
alias randomjpg='find -name "*.jpg" | shuf | head -1 | xargs -I {} shotwell {}'
alias randomjson='find -name "*.json" | shuf | head -1 | xargs -I {} cat {}'
alias pwv='cd `xsel -b`'
alias shotwel='shotwell'
alias sw='shotwell'
#alias x='xsel -i -b'
alias st='shotwell'
alias cl='clear'
alias ema='TERM=xterm-256color /home/r.yang/miniconda3/bin/emacsclient -c -nw'
alias emakill="/home/r.yang/miniconda3/bin/emacsclient -e '(save-buffers-kill-emacs)'"
alias emakillforce="/home/r.yang/miniconda3/bin/emacsclient -e '(kill-emacs)'"
#alias ema='emacs -nw'
alias b='cd ../'
alias s='ls -a'
alias ss='ls -lh -a'
alias sl='ls'
alias e='emacs -nw -q'
alias dud1='du -lh --max-depth=1'
alias gitu='git status -uno'
alias gitb='git branch'
alias gitd='git difftool --tool=ediff '
alias gitdc='git diff --cached '
alias gitc='git checkout'
alias gitg='git log --all --decorate --oneline --graph'
alias gitp='git push -u origin `git branch | grep "*" | cut -d " " -f2`'
alias condaa='conda activate'
alias condad='conda deactivate'
alias wc='wc -l'
alias xsel2='nc -q0 localhost 5556'
alias x='nc -q0 localhost 5556'
alias zell='zellij --config ~/.config/zellij/config.yaml --layout ~/.config/zellij/layout.yaml'

#source /home/ray/mnt/home/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/r.yang/git_repos/auto-setup//third_party/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 使emacs用server启动
export ALTERNATE_EDITOR=""
export EDITOR='TERM=xterm-256color emacsclient -c -nw'
# export EDITOR='emacs -nw -q'

if git rev-parse --git-dir > /dev/null 2>&1; then
    git config --add oh-my-zsh.hide-status 1
    git config --add oh-my-zsh.hide-info 1
fi

export PYTHONIOENCODING=utf-8
# 防止乱行 & 中文显示问题
export LANG=C.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/go-1.19
export PATH=/home/r.yang/node-v17.5.0-linux-x64/bin:$GOPATH/bin/:/home/r.yang/.local/bin:$PATH

export GOPROXY="https://goproxy.cn,direct"
export GOPRIVATE="*.tianrang-inc.com"
alias ediff='/home/r.yang/git_repos/auto-setup//misc_config/ediff.py'

export DISABLE_AUTO_UPDATE="true"
export TERM=xterm-256color

setopt share_history

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/r.yang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/r.yang/miniconda3/etc/profile.d/conda.sh" ]; then
	. "/home/r.yang/miniconda3/etc/profile.d/conda.sh"
    else
	export PATH="/home/r.yang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#conda activate py37

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
