# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Show OS Data
# screenfetch -D 'MacOSX'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Mac Python
# pip
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# apk
export PATH=$PATH:/Users/zoi/Library/Android/sdk/platform-tools

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Intel Homebrew
alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'
alias ib='PATH=/usr/local/bin'

# export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin

# export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"

# DaVinci Resolve
export RESOLVE_SCRIPT_API="/Library/Application Support/Blackmagic Design/DaVinci Resolve/Developer/Scripting/"
export RESOLVE_SCRIPT_LIB="/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fusionscript.so"
export PYTHONPATH="$PYTHONPATH:$RESOLVE_SCRIPT_API/Modules/"

# alias python='python3.6'

# Doc PATH
export PATH="$HOME/Documents/PATH:$PATH"

# JMeter
export PATH="/opt/homebrew/Cellar/jmeter/5.4.1/bin:$PATH"

# GitHub Packages repo token
export GITHUB_PACKAGES_TOKEN="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"
eval "$(gh completion -s zsh)"

# Get list of unused brew package
alias brew-unused="brew list --formula | xargs -P7 -I{} sh -c 'brew uses --installed {} | wc -l | xargs printf \"%20s is used by %2d formulae.\\n\" {}' | grep ' 0 formulae'"

# exa
alias l="exa --icons --all --group-directories-first"
alias ll="l --long --group"
alias tree="ll --tree --level=4 -I=.git --git-ignore"

# lazygit
alias lg="lazygit"

# mpv
alias mpv="mpv --vo=tct --really-quiet"

# --- Hyper ---

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)

# --- (End of Hyper) ---

# scrpy
alias scrcpy="scrcpy -b 200M"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# yt-dlp
alias yt-dlp="yt-dlp --config-location ~/.config/yt-dlp/config"
alias youtube-dl=yt-dlp

# NeoVim
alias gnvim="goneovim"
alias ngvim="gnvim"

# lima docker
# export DOCKER_HOST=unix:///${HOME}/.lima/docker/sock/docker.sock
# DOCKER_VERSION=`ls /opt/homebrew/Cellar/docker/ | sort --version-sort | head -n 1`
# export PATH="/opt/homebrew/Cellar/docker/$DOCKER_VERSION/bin:$PATH"
# alias docker="lima sudo  docker"
# alias act="lima sudo act"
# export LIMA_INSTANCE="docker"

# alias act="act --container-architecture linux/amd64"

export QT_DIR=~/Qt
export QT_VERSION=5.14.2
export QT_API=5.13.0

export GOPATH=~/go

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"

# alias clang++="clang++ --sysroot=$(xcrun --sdk macosx --show-sdk-path)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

alias sed='gsed'

eval "$(direnv hook zsh)"

# AtCoder Compiler
alias g++-atcoder='g++ -I ~/Documents/AtCoder/include -std=c++17 -O0 -g -ftrapv -fstack-protector-all -fno-omit-frame-pointer -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG'
alias g++-atcoder-fast='g++ -I ~/Documents/AtCoder/include -std=c++17 -O0 -g'
alias oj-test='g++-atcoder-fast main.cpp && oj t -e 1e-6'
alias acc-submit='acc s -s -- --no-open --yes'
alias acc-check-submit='oj-test && acc-submit'

# iTerm2
alias chprof='(){echo -e "\033]1337;SetProfile=$1\a"}'
alias otaku='chprof Otaku'

image_list=($(ls -d ~/Documents/Image/StableDiffusion/*))
image_count=$(ls -F ~/Documents/Image/StableDiffusion/ | grep -v / | wc -l | sed -e "s/ //g")
image_index=1
bg() {
  if test $image_index -eq $image_count; then
    image_index=1
  else
    image_index=$(( $image_index + 1 ))
  fi
  echo $image_count
  image_path=$image_list[$image_index]
  base64=$(echo "$image_path" | sed -e "s/ /\\\\ /g" | base64)
  echo -ne "\033]1337;SetBackgroundImageFile=${base64}\a"
}
alias otaku-toggle=bg

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
