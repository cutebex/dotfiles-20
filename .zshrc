# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="/Users/umschaudhary/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will

# load a random theme each time oh-my-zsh is loaded, in which case,

# to know which specific one was loaded, run: echo $RANDOM_THEME

# See [https://github.com/ohmyzsh/ohmyzsh/wiki/Themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

ZSH_THEME="spaceship"

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

# DISABLE_AUTO_UPDATE="true"

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

# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)

# See [https://github.com/ohmyzsh/ohmyzsh/issues/5765](https://github.com/ohmyzsh/ohmyzsh/issues/5765)

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

plugins=(
	git
	zsh-syntax-highlighting
	pip
	zsh-autosuggestions
	common-aliases
	copyfile
	vi-mode
)

source $ZSH/oh-my-zsh.sh
VI_MODE_SET_CURSOR=true



if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases      # Compilation flags
fi

SPACESHIP_PROMPT_ORDER=(
dir           # Current directory section
git           # Git section (git_branch + git_status)
venv

# pyenv

docker
exec_time     # Execution time
line_sep      # Line break
# vi_mode       # Vi-mode indicator
char          # Prompt character
)

# SPACESHIP_CHAR_SYMBOL="⤷➤"

SPACESHIP_CHAR_SYMBOL="△"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_ADD_NEWLINE=false

# VENV

SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_VENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_VENV_COLOR="yellow"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$HOME/development/flutter/bin:$PATH

# export PYENV_ROOT="$HOME/.pyenv"

# export PATH="$PYENV_ROOT/bin:$PATH"

# eval "$(pyenv init -)"

# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"

# export PATH="$HOME/.poetry/bin:$PATH"

# export PATH=/opt/homebrew/bin:/Users/umeshchaudhary/.poetry/bin:/opt/homebrew/opt/postgresql@12/bin:/opt/homebrew/opt/libpq/bin:/Users/umeshchaudhary/.pyenv/bin:/opt/homebrew/opt/curl/bin:/Users/umeshchaudhary/.nvm/versions/node/v16.5.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Library/Apple/usr/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/Applications/Postgres.app/Contents/Versions/13/bin:/Users/umeshchaudhary/Library/Android/sdk/emulator:/Users/umeshchaudhary/Library/Android/sdk/tools:/Users/umeshchaudhary/Library/Android/sdk/tools/bin:/Users/umeshchaudhary/Library/Android/sdk/platform-tools

#

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export CRYPTOGRAPHY_SUPPRESS_LINK_FLAGS="1"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export WORKON_HOME=$HOME/.virtualenvs

export PATH="$HOME/flutter/bin:$PATH"
# eval "$(rbenv init - zsh)"

# export PATH=$PATH:/Library/PostgreSQL/14/bin
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

 . /opt/homebrew/opt/asdf/asdf.sh
 export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
 export PATH="$HOME/.asdf/shims/bundle:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/libpq/include"

# bun completions
[ -s "/Users/umschaudhary/.bun/_bun" ] && source "/Users/umschaudhary/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/umschaudhary/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
