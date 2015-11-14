# zoddy zsh theme

PROMPT='╭[%{$fg[cyan]%}%~%{$reset_color%}][%{$fg[yellow]%}%*%{$reset_color%}][$(_battery)]
╰[%{$fg[magenta]%}%?%{$reset_color%}]$(_git_info) %(!.#.$) '

PROMPT2=''
RPROMPT=''

function _battery() {
  power=$(pmset -g batt | sed -n 1,1p)
  percentage=$(pmset -g batt | grep -o "[0-9]\{1,3\}%;" | grep -o "[0-9]\{1,3\}")

  if [[ $power == *"AC Power"* ]]; then
    echo -n "%{$fg[green]%}⊕"
  else
    echo -n "%{$fg[red]%}⊗"
  fi

  if [[ percentage -gt 80 ]]; then
    echo -n "%{$fg[green]%}"
  elif [[ percentage -gt 20 ]]; then
    echo -n "%{$fg[yellow]%}"
  else
    echo -n "%{$fg[red]%}"
  fi

  echo -n "%{$percentage%}%{$reset_color%}"
}

function _git_info() {
  branchname=$(command git symbolic-ref --short HEAD 2> /dev/null) || return

  echo -n "[%{$fg[green]%}${branchname}%{$reset_color%}"
  echo -n "$(git_prompt_status)%{$reset_color%}]"
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✎"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
