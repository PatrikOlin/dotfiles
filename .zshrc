# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/olin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

# Set fzf installation directory path
export FZF_BASE=/path/to/fzf/install/dir

# fzf settings
# export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --no-ignore-vcs --glob "!node_modules/*" --glob "!.git/*"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 50% --reverse --extended --preview "head -100 {}"'

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  nvm
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  fzf
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# echo "alias ls='ls -G'" >> ~/.zshrc

#prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
#}

#SPACESHIP:
  # Set Spaceship ZSH as a prompt
  # autoload -U promptinit; promptinit
  # prompt spaceship

# Set GOPATH
# export GOPATH=$HOME/dev/go

#
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls="exa"
alias screen="xrandr --output HDMI-0 --off --output DP-2.1 --mode 2560x1440 --pos 0x0 --rotate left --output DP-2.2 --primary --mode 2560x1440 --pos 1440x592 --rotate normal --output DP-2 --off --output DP-1 --mode 1920x1080 --pos 4000x840 --rotate normal --output DP-0 --off"
alias config='/usr/bin/git --git-dir=/home/olin/.cfg --work-tree=/home/olin'
alias reload='exec zsh'
alias zshrc='nvim ~/.zshrc'
alias fejk=$HOME/scripts/fejk.sh
alias jp=$HOME/scripts/json-prettify.sh
alias cheat='cht.sh'
alias vim='nvim'
alias '?'='ddgr'
alias bb='butler-burton'

# Set to show name of virtualenv when operating in virtualenv
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/patrikolin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/patrikolin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/patrikolin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrikolin/google-cloud-sdk/completion.zsh.inc'; fi

# z installation
# . /Users/patrikolin/z

# eval $(thefuck --alias)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# . $HOME/.asdf/asdf.sh

# . $HOME/.asdf/completions/asdf.bash
#export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
#export PATH="/usr/local/opt/arm-gcc-bin@8/bin:$PATH"
# export PATH="$PATH:$HOME/.config/regolith/i3/scripts"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.m2:$PATH"
typeset -U PATH


# fpath=($fpath "/home/patrik/.zfunctions")

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# export PATH=$PATH:~/go/bin
fpath=($fpath "/home/patrik/.zfunctions")

eval "$(starship init zsh)"
fpath=(~/.zsh.d/ $fpath)

source /home/olin/.config/broot/launcher/bash/br

export EDITOR="nvim"
export TERM="xterm-256color"

function zshaddhistory() {
	echo "${1%%$'\n'}|${PWD}   " >> ~/.zsh_history_ext
}
if [ -e /home/olin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/olin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
