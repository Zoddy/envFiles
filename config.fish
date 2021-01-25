# fish git prompt
set fish_greeting ""
set __fish_git_prompt_color_branch green
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_char_dirtystate '✎'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_char_untrackedfiles '✈'

function _current_dir
  set_color cyan
  echo -ne (string replace $HOME "~" (pwd))
  set_color normal
end

function _exit_status
  if test $argv[1] -eq 0
    set_color magenta
  else
    set_color red
  end
  
  echo -n $status
  set_color normal
end

# prompt
function fish_prompt
  # get last command exit status
  set last_status $status

  # first line
  echo -e [(_current_dir)]

  # second line
  echo -ne [(_exit_status $last_status)]
  echo -ne (__fish_git_prompt "[%s]")
  echo ' $ '
end

function fish_right_prompt
end

# aliases
alias ...="cd ../.."
alias ....="cd ../../.."
alias cpr="cp -R"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcof="git checkout -f"
alias gd="git diff"
alias gl="git pull"
alias gm="git merge"
alias gmv="git mv"
alias gp="git push"
alias gs="git status -sb -uall"
alias l="exa -ghl"
alias tarit="tar zcvf"
alias untar="tar zxvf"

function brewme
  brew update
  brew upgrade
  brew cleanup
end

# create and jump into directory
function mkcdir
  mkdir -p -- $argv[1]
  cd $argv[1]
end

# environment variables
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"
export PATH="/Users/zoddy/.config/fnm/bin:$PATH"
export PATH="/Users/zoddy/.cargo/bin:$PATH"
export GOPATH=$HOME/.go
export NODE_ENV=development
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# fnm
fnm env | source

# OPS config
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"
