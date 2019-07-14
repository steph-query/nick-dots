# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG
# A big thanks to \amethyst on Freenode

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      CYAN=$(tput setaf 87)
      WHITE=$(tput setaf 0)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      CYAN=$(tput setaf 6)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    CYAN="\033[1;36m"
    BOLD=""
    RESET="\033[m"
fi


function python_venv_prompt {
  set +u
  local python_venv=""

  PYTHON_VENV_CHAR=${POWERLINE_PYTHON_VENV_CHAR:="❲venv - "}
  PYTHON_VENV=$(basename "${VIRTUAL_ENV}")

  [[ -n "${PYTHON_VENV}" ]] && echo "${PYTHON_VENV_CHAR}${PYTHON_VENV} ❳ "
}

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \[\1$(parse_git_dirty)\]/"
}

function prompt_command() {
  PS1="${CYAN}$(python_venv_prompt)\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]])\[$PURPLE\]\$(parse_git_branch) \[$WHITE\]${BOLD}${CYAN}==>  \[$RESET\]"
}

safe_append_prompt_command prompt_command
