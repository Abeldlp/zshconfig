# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/abeldelapaz/.oh-my-zsh"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes


ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="bira"


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
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
  # zsh-autosuggestions
  zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export LSCOLORS=DxGxBxDxCxEgEdxbxgDxDx

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


alias s="git status"
alias a="git add ."
alias c="git commit -m"
alias p="git push"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias google="open -a 'Google Chrome'"
alias kraken="open -a Gitkraken"
alias slack="open -a Slack"
alias burp="open -a Burp\ Suite\ Community\ Edition"
alias code="open -a Visual\ Studio\ Code"
alias whereami="/Users/abeldelapaz/xsombi/scripts/whereami.sh"
alias whereis="python3 ~/xsombi/scripts/whereis.py"
alias config="nvim ~/.zshrc"
alias sconfig="source ~/.zshrc"
alias npmaws="aws codeartifact login --tool npm --domain foodticket --domain-owner 817222806835 --repository"
alias npmback="npm config set registry https://registry.npmjs.com/"
alias ipv6off="sudo networksetup -setv6off \"Wi-Fi\""
alias ipv6on="sudo networksetup -setv6automatic \"Wi-Fi\""
alias caldera="python3 /Users/abeldelapaz/Desktop/tools/caldera/server.py"
alias temperature="sudo powermetrics --samplers smc |grep -i \"CPU die temperature\""
alias todos="cat /Users/abeldelapaz/xsombi/todo.txt | less"
alias todo="taskwarrior-tui"
alias youtube="open https://www.youtube.com/"
alias devstart="brew services start yabai && brew services start skhd"
alias devstop="brew services stop yabai && brew services stop skhd"
alias devrestart="brew services restart yabai && brew services restart skhd"
alias neo="neofetch --ascii_distro Arch"
alias devkill="kill \$(jobs -p) > /dev/null 2>&1"
alias clean="git restore public/js/app.js && git restore public/css/app.css"
alias neovide="~/tools/neovide/target/release/neovide"
alias ls="logo-ls"
alias l="logo-ls -l"
alias ll="logo-ls -la"
alias cat="bat"
alias x="exit"
alias t="tmux"
alias v="nvim"
alias win="tmux rename-window"

devscreen(){
    CURRENT="$(pwd)"
    cd ~/Projects/hyper
    yarn run dev > /dev/null 2>&1 &
    yarn run app > /dev/null 2>&1 &
    cd ${CURRENT}
}

awslibrary(){
  if [[ $2 ]]; then
    if aws codeartifact login --tool npm --domain foodticket --domain-owner $2 --repository $1 ; then
      npm install @foodticket/$1
      npm config set registry https://registry.npmjs.com/
    fi
		
  elif [[ $1 ]]; then
    if aws codeartifact login --tool npm --domain foodticket --domain-owner 817222806835 --repository $1; then 
      npm install @foodticket/$1
      npm config set registry https://registry.npmjs.com/
  fi
  else
    echo "You need to pass the name of the library you need"
    echo "Default domain example: awslibrary queryable"
    echo "Specific domain example: awslibrary queryable 465213549785"
  fi
}


awspublish(){
  if [[ $2 ]]; then
    if aws codeartifact login --tool npm --domain foodticket --domain-owner $2 --repository $1 ; then
      npm publish
      npm config set registry https://registry.npmjs.com/
  fi
		
  elif [[ $1 ]]; then
    if aws codeartifact login --tool npm --domain foodticket --domain-owner 817222806835 --repository $1; then 
      npm publish
      npm config set registry https://registry.npmjs.com/
  fi
  else
    echo "You need to pass the name of the library you need"
    echo "Default domain example: awspublish queryable"
    echo "Specific domain example: awspublish queryable 465213549785"
  fi
}

export PATH=$(brew --prefix openvpn)/sbin:$PATH

#export ANDROID_HOME=$HOME/Library/Android/sdk
#export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/usr/local/bin:$PATH"export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.composer/vendor/bin
export MSF_DATABASE_CONFIG="/Users/abeldelapaz/.msf4/database.yml"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"


ARCH

#############################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' frequency 13

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
  git
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8

alias config="nvim ~/.zshrc"
alias sconfig="source ~/.zshrc"
alias v="nvim"
alias a="git add ."
alias s="git status"
alias c="git commit"
alias p="git push"
alias gl="git log"
alias glo="git log --oneline"
alias gd="git diff ."
alias gds="git diff --staged ."
alias l="logo-ls -l"
alias ll="logo-ls -la"
alias x="exit"
alias open="xdg-open"
alias t="tmux"
alias docker-down="sudo chmod 666 /var/run/docker.sock"
alias crm-node="nvm use 14.19.0"
alias store="~/AppImages/pling-store-5.0.2-1-x86_64.AppImage"
alias music="glava > /dev/null 2>&1 &"
alias window="tmux rename-window"
alias token="cat ~/token.md"
alias cat="bat"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias start-docker-desktop="systemctl --user start docker-desktop"
alias stop-docker-desktop="systemctl --user stop docker-desktop"
alias stoplight="~/Tools/stoplight-studio-linux-x86_64.AppImage --disable-gpu-sandbox"
alias act="~/bin/act"
alias docker-stop="docker stop $(docker ps -a -q)"
alias zoom="zoom --disable-gpu-sandbox"

function screen() {
  xrandr --output DP-4 --brightness $1
}

function squash(){
  git reset $(git merge-base master $(git branch --show-current))
}

function exploit(){
    sqlmap -u $1 --random-agent --tamper=space2comment --batch
}

function exploit-dork(){
    sqlmap -g $1 --random-agent --tamper=space2comment --batch
}

function firafont (){
  current_directory=$(pwd)
  cd ~/.config/alacritty
  git checkout solarized-hack
  cd $current_directory
}

function nofont (){
  current_directory=$(pwd)
  cd ~/.config/alacritty
  git checkout solarized
  cd $current_directory
}

function borders (){
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  OPTION="$(echo $1 | tr a-z A-Z)"
  echo "${GREEN} ${NC} Decorations have been changed to ${GREEN}${OPTION}${NC} for next terminal"
  sed -i "s/decorations: .*/decorations: $1/g" ~/.config/alacritty/alacritty.yml
}

function opacity(){
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  OPTION="$(echo $1 | tr a-z A-Z)"
  echo "${GREEN} ${NC} Opacity changed to ${GREEN}${OPTION}${NC}"
  sed -i "s/opacity: .*/opacity: 0.$1/g" ~/.config/alacritty/alacritty.yml
}


function kill-port(){
  sudo kill -9 $(sudo lsof -t -i:$1)
}

function toggle(){
  current_size=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
  if [ ${current_size} != 2560 ]
  then
      cd ~/.config/glava
      git checkout main
      cd ~/
  else
      cd ~/.config/glava
      git checkout laptop 
      cd ~/
  fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=$HOME/Tools/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
