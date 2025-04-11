#!/usr/bin/env bash


MAX_DEPTH=7

#
#format_info formats anything piped into 'file' command
format_info(){
    nl=$'\nl' # simplificação de quebra de linha
    tmp=${1//, /$nl} # formatação do que for passado através de argumento $1 
    echo "${tmp//: /$nl$nl}" # formatação de tmp
}

export -f format_info

dir_contents() {
    find ${1:-$HOME} -maxdepth $MAX_DEPTH | sort # the ':-' after $1 means if no arguments passed use $HOME variable. this allows find to start at home directory by default
}

search()  {
    local opts='--reverse -e -i --tiebreak=begin --prompt=: ' # arguments for fzf. '-e' exact match. '-i' case-insensitive. 
    local pwin='--preview-window=down:40' # enable preview windows for fzf
    fzf $opts $pwin --preview='format_info "$(file {})"'<<< $(dir_contents $1) # {} receives any content being selected in fzf and then gets formated in format_info()
}

start_dir=$1

while :; do # ':' is a null command that returns true
    sel=$(search $start_dir) #receives fzf selection 
                            # if nothing is selected, end script, else if something is selected switch value.
    if [[ -z $sel ]]; then 
        exit 0
    elif [[ -d $sel ]]; then
        start_dir=$sel
    elif [[ -f $sel ]]; then
        finfo=$(file $sel)
        break
    fi
done

nvim $sel
#xdg-open $sel

exit
