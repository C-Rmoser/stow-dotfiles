source ~/tools/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# Alias tips
antigen bundle djui/alias-tips
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# zsh z
antigen bundle agkozak/zsh-z
# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# plugins=(git vi-mode mvn)
# export VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"
source <(kubectl completion zsh)

# source /usr/share/doc/fzf/examples/completion.zsh
# source /usr/share/doc/fzf/examples/key-bindings.zsh

# fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export PATH=$PATH:~/tools/zig/

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

# export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

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

function edit_neovim_config {
    cd ~/dotfiles/.config/nvim/
    nvim
}

bindkey -s ^f "tmux-sessionizer\n"

alias vimconfig="edit_neovim_config"
alias nvimconfig="edit_neovim_config"

alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias tmuxconfig="nvim ~/.tmux.conf"
alias tmuxreload="tmux source-file ~/.tmux.conf"

# alias alconfig="nvim ~/.config/alacritty/alacritty.yml"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"

alias vim="nvim"

alias defold="~/tools/Defold/Defold"
# alias vim="/home/crohrmoser/.local/bin/lvim"

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias ansibleconfig="nvim ~/ansible.yml"

alias mvnrundev="mvn spring-boot:run -Pwwi -Ph2 -Dspring-boot.run.arguments=\"--spring.profiles.active=dev,dev-h2,dev-testdata\"mvn spring-boot:run -Pwwi -Ph2 -Dspring-boot.run.arguments=\"--spring.profiles.active=dev,dev-h2,dev-testdata\""
alias mvnwwi="mvn -Pwwi -P'!deploy-package' -P'!docker'"
alias mvnrundev="mvn spring-boot:run -Dspring-boot.run.profiles=dev"

alias k=kubectl

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# local ww installation
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Kubernetes Krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/crohrmoser/google-cloud-sdk/path.zsh.inc' ]; then . '/home/crohrmoser/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/crohrmoser/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/crohrmoser/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:/usr/local/go/bin

