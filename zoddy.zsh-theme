# zoddy zsh theme

PROMPT='
╭[%{$fg[blue]%}%~%{$reset_color%}]-[%{$fg[red]%}%*%{$reset_color%}]
╰[%{$fg[magenta]%}%?%{$reset_color%}]-[%{$fg[green]%}$(_git_info)%{$reset_color%}$(git_prompt_status)] ♯ '

PROMPT2=''
RPROMPT=''

function _git_info() {
  branchname=$(command git symbolic-ref --short HEAD 2> /dev/null) || return
  echo "${branchname}"
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
