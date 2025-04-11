# shellcheck disable=2006
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
# export PATH=/var/lib/flatpak/exports/bin:$PATH
# export PATH=/home/jampietro/.local/share/applications:$PATH
# JDK
#export PATH="/usr/java/jdk-20:$PATH"
#-------------------------------------

# shell options

shopt -s autocd     # cd into directory symply by typing name.
shopt -s cdspell    # autocorrects cd misspellings
shopt -s cmdhist    # save multi-line commands in history as single line
shopt -s histappend # do not overwrite history
set -o vi           # escape to vi mode

export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'
export HISTSIZE=100000
export HISTFILESIZE=10000

#
#-------------------------------------
# FZF_DEFAULT_OPTS
#
#export FZF_DEFAULT_OPTS="--height=70% --layout=reverse --info=inline --border --margin=1 --padding=1"
# jampietro/kanagawa fzf colorscheme
#export FZF_DEFAULT_OPTS='--height=100% --layout=reverse --border --info=inline --margin=0 --padding=0 --color=bg+:#1f1f28,border:#c0a36e,spinner:#E6DB74,hl:#c34043:regular,fg:#c0a36e,header:#458585,query:white:regular,info:#76946a,pointer:#c34043,marker:#c34043,fg+:white:regular,prompt:#c34043,hl+:#76946a:reverse'

export FZF_DEFAULT_OPTS=" --height=50% --prompt=' ' --marker=' ' --pointer='' 
--layout=default --multi --cycle --border=bold --border-label='╢ Fuzzy Finder ╟' --border-label-pos=bottom --margin=0 --padding=0 \
--color=label:italic:#cbc5f7,border:#353640
--color=bg+:#313244,spinner:#f5e0dc,hl:#5f87af \
--color=fg:#cdd6f4,header:#f38ba8,info:#3f580f,pointer:#cba6f7 \
--color=marker:#f38ba8,fg+:#cdd6f4,prompt:#cba6f7,hl+:#388d45"

# ,bg:#1e1e2e
#

export FZF_DEFAULT_COMMAND="fd --hidden ."
# restore fzf default options ('fzf clear')
alias fzfcl="export FZF_DEFAULT_COMMAND='fd --hidden .'"

# reinstate fzf custom options ('fzf-' as in 'cd -' as in 'back to where I was')
alias fzf-="export FZF_DEFAULT_COMMAND='fd --hidden . $HOME'"

#
#-------------

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

#example prompts
#PS1="\[\e[01;37m\]{ \[\e[01;34m\]\w \[\e[01;37m\]} \[\e[01;35m\]\[\$ \]\[\e[01;37m\]"
#PS1="\[\e[1;36m\]\[\033[31m\]\[\033[00m\]\n\w\[\e[1;31m\] \[\e[1;36m\]\[\e[1;37m\] "
#PS1="\[\e[1;35m\]┌ \[\033[0;31m\] \[\e[3;34m\]\`parse_git_branch\`\[\e[1;31m\] \[\e[0;33m\] \w \[\e[0;31m\] \n\[\e[0;1;35m\]└\[\e[0;31m\]\[\e[1;37m\]\[\e[0;37m\] "

######My symbols:    

# my best prompts ################
#PS1="\[\e[1;36m\]┌─\[\e[1;31m\]\[\e[00;37m\]\t \[\e[1;36m\]\u\[\e[1;31m\]\n\[\e[1;36m\]└─\[\e[00;31m\]   \[\e[1;32m\]\w\[\e[1;31m\]\[\e[1;36m\]\[\e[0;97m\] "
#PS1="\[\e[1;36m\]┌─\[\e[1;31m\]\[\e[00;37m\]\t \[\e[1;36m\]\u \[\e[1;32m\]\W\[\e[1;31m\]\n\[\e[1;36m\]└─\[\e[00;31m\]  \[\e[1;31m\]\[\e[1;36m\]\[\e[0;97m\] "
#PS1="\[\e[1;36m\] \u \[\[31m\]\n\[\033[1;31m\]  \[\e[1;33m\] \`parse_git_branch\` \[\e[1;36m\]\[\e[1;37m\] "
#PS1="\[\e[1;35m\]┌ \[\033[0;31m\]\[\e[1;36m\] \w \[\e[0;31m\] \n\[\e[0;1;35m\]└\[\e[1;33m\]\`parse_git_branch\` \[\e[0;1;31m\]\[\e[0;36m\]\[\e[0;37m\] "
PS1="\[\e[1;35m\]┌ \[\033[0;31m\]\[\e[1;36m\] \w \[\e[0;33m\]\`parse_git_branch\`\[\e[0;31m\] \n\[\e[0;1;35m\]└\[\e[0;1;31m\]\[\e[0;32m\]\[\e[0;37m\] "
#PS1="\[\e[0;37m\]┌ \[\033[1;37m\]\[\e[1;30;47m\]\w \[\e[0;31;47m\]\`parse_git_branch\` \[\e[0;37m\] \n\[\e[0;1;35m\]└\[\e[0;1;31m\]\[\e[0;32m\]\[\e[0;37m\] "
#PS1='\[\e[0;1;36m\]┌─\[\e[0;1;31m\]\[\e[0;37m\]\t \[\e[0;1;36m\]\u \[\e[0m\](\[\e[0;1;32m\]\w\[\e[0m\])\[\e[97m\] \[\e[0;1;3;53;97m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;1;31m\]\n\[\e[0;1;36m\]└─\[\e[31m\] \[\e[0m\] \[\e[0;1;31m\]\[\e[0;1;36m\] \[\e[0m\]'

#───────────#
#  Aliases  #
#───────────#
alias testfont='bash ~/.scripts/nerdFontTest.sh'
alias clima='curl https://wttr.in/lauro_de_freitas'
alias mir='scrcpy -Sw'
alias estudos='cd /mnt/ARQUIVO/ESTUDOS'
# Change cd into gd funcion
# cool way of changing dirs.
# function at the end of bashrc

#alias cd='gd'

#Color my grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Changing "ls" to "eza" previously 'exa' but repo was abandoned so community created eza
#
alias ls='eza -al --color=always --group-directories-first --icons' # my preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.='eza -a | egrep "^\."'
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#alias\
#  tree1='tree -L 1' \
#  tree2='tree -L 2' \
#  ls='ls -hN --color=auto --group-directories-first' \
#  ll='ls -lh' \
#  lla='ls -alh' \
#  lsym='ls -l `\find . -maxdepth 1 -type l -print`'

# +----------------------+
# | my must have aliases |
# +---------------------+
alias nv='nvim'
alias v='nvim'
alias mybash='nvim $HOME/.bashrc'
alias fonts='fc-cache -f -v'
alias cdnv='fd . ~/.config/nvim --type f --hidden --no-ignore --exclude .git | fzf | xargs nvim'
alias updateall='sudo -- sh -c "dnf update && dnf upgrade"'
alias sb='source ~/.bashrc' # reload bashrc
alias btop='bpytop'
alias q='exit'
alias updategrub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias chux='sudo chmod u+x -v'
alias chx='chmod +x -v'

## change jack bufferzise to 128
alias buffer='pw-metadata -n settings 0 clock.force-quantum '

#change alacrittyFontSize
alias fontsize="bash .scripts/alacrittyFontSize.sh"

# Unpack some shit
alias untar="tar zxvf "

# Bluetooth connect
alias bcn='bash ~/.scripts/bcn.sh'
#FZF
#
# upgrade fzf
alias updatefzf='cd ~/.fzf && git pull && ./install'
#
alias fzn='fzf --multi --height=50% --border-label="((Open in Neovim))" --reverse --preview "bat --style=numbers --color=always --line-range :500 {}" --bind "enter:become(nvim {+})"'
alias fzp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fzm='bash $HOME/.scripts/fuzzymenu.sh'
alias favd='cd $(cat ~/favDirs.txt | fzf --height=100% --margin=10 --padding=1 --border-label="((FavDirs))" )'
alias fzh="help -d '*' | tail -n+3 | column -t -s'-' | fzf --preview='p={}; help -m $p'"

# confirm before overwriting something and then verbose it because yes.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias rmf='rm -rf'
alias mkdir='mkdir -pv'

# +------------+
# |   NETWORK  |
# +------------+

# change wifi
alias wificon='nmcli -f 'bssid,signal,bars,freq,ssid' --color yes device wifi |
  fzf \
  --with-nth=2.. \
  --ansi \
  --height=40% \
  --reverse \
  --cycle \
  --inline-info \
  --header-lines=1 \
  --bind="enter:execute:nmcli -a device wifi connect {1}"'

#show open ports
alias openports='netstat -nape --inet'

#tmux
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'
alias muxy='nvim ~/.tmux.conf'

# +--------+
# |   GIT  |
# +--------+

alias gdot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotpush='gdot push git@gitlab.com:jampietro/dotfiles.git master'
alias gds='gdot status'
alias gda='gbare add '
alias gdc='gbare com '
alias gdl="gdot log --oneline | fzf --preview '/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME show --color=always {+1} '"

alias gflux='/usr/bin/git --git-dir=$HOME/fluxStuff/ --work-tree=$HOME'
alias fluxpush='gflux push git@gitlab.com:jampietro/fluxStuff.git master'

# +--------+
# | Docker |
# +--------+

alias dockstart='sudo systemctl start docker'

# +---------+
# | HomeLab |
# +---------+

alias hal='ssh jampietro@192.168.15.190'

alias myip="curl --silent -m 10 https://api.ipify.org | tr -dc '[:alnum:].'"
alias localip="ip a | grep 'inet 192' | awk '{ print \$2, \$9 }'"

# +--------+
# | System |
# +--------+

alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'

# +------------+
# | Flux stuff |
# +------------+

#tmux FluxNodes session launcher
alias fluxnodes='bash $HOME/.scripts/myFluxNodes.sh'

alias nimbus1='ssh alpha@192.168.15.151'
alias nimbus2='ssh alpha@192.168.15.152'

# gd function by:
# Blau Araujo
# https://codeberg.org/blau_araujo/gd-function
# ------------------

# gd (go to dir)...
gd() {
	# Mantendo as variáveis locais à função...
	local sel dir dirs dirs_hist dirs_home IFS fzf

	# Invocação e opções do fuzzy finder...
	fzf=(
		fzf
		--reverse -e -i -1
		--prompt=': '
		--height=15%
		--border=horizontal
	)

	# Testar a quantidade de argumentos: se houver mais de um,
	# termina com erro...
	[[ $# -le 1 ]] || {
		echo 'gd: Excesso de argumentos!' 1>&2
		return 1
	}

	# Sem argumentos, o diretório será $HOME...
	dir="${1:-$HOME}"

	# Argumentos especiais...
	case "$dir" in
	-) # Muda para o último diretório visitado...
		dir=
		;;
	--) # Abre a busca para todos os diretórios em $HOME (até 4 níveis)...
		dir=$(find $HOME -maxdepth 4 -type d | ${fzf[@]} || return 0)
		;;
	esac

	# Se $dir não vier de uma seleção ou de uma predefinição especial,
	# o comando 'pushd' tentará localizá-lo no diretório corrente...
	pushd ${dir:+"$dir"} &>/dev/null && return

	# Se não encontrar, as listas de busca serão montadas.

	# Montar lista de diretórios visitados na sessão...
	dirs_hist=$(dirs -l -p | grep "$dir")

	# Montar lista de diretórios em `~/' que casam com o padrão...
	dirs_home=$(find ~ -maxdepth 4 -type d -wholename "*$dir*")

	# Outras listas podem ser definidas segundo o modelo de 'dirs_home'.

	# Mudar localmente o separador de campos para uma quebra de linha...
	IFS=$'\n'

	# Unir as listas montadas...
	dirs=(
		${dirs_hist:+"$dirs_hist"}
		${dirs_home:+"$dirs_home"}
	)

	# Caso nenhum padrão correspondente ao argumento seja encontrado
	# na montagem das listas, termina com erro...
	((${#dirs[@]})) || {
		echo "gd: $dir: Diretório não encontrado" 1>&2
		return 2
	}

	# Caso contrário, inicia uma busca "fuzzy"...
	sel=$(printf '%s\n' "${dirs[@]}" | awk '!i[$0]++' | ${fzf[@]} || return 0)

	# Se algo for selecionado, muda de diretório...
	pushd "$sel" >/dev/null
}
# Autocomplete para o gd...
complete -F _cd gd

###---------------------------------------------
##
# gbare is a simple function to handle
# my git bare repo more easilly

gbare() {

	slct=$(gds --porcelain | awk '{print $2}' | fzf -i --no-info --prompt=': ' --height=25% --border=rounded --border-label='╢ Dotfiles Repo ╟' --border-label-pos=bottom --preview='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME diff --color=always {+1} ')

	case "$1" in
	add)
		gdot add $slct
		;;
	com)
		gdot commit $slct
		;;
	esac

}

###----------------------------------------------
##
# +--------------------------+
# | Git functions for Prompt |
# +--------------------------+
#

# get current branch in git repo
function parse_git_branch() {
	# shellcheck disable=2006
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo " ${BRANCH}${STAT}"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

##
####-----------------------------------
##
# +------------+
# | Test stuff |
# +------------+

####-----------------------------------
##

unset rc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
