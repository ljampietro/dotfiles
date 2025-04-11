#! /usr/bin/env bash

# TODO LIST CLI
#
TODODIR="$HOME/Documentos/toDoCli"
TODO="$HOME/Documentos/toDoCli/TODO.txt"
function tla() {
  [ ! -f "$TODO" ] && mkdir -p "$TODODIR" && touch "$TODO"
  if [ $# -eq 0 ]; then
    if [ -s "$TODO" ]; then
      cat -n "$TODO"
    else
      echo "Lista Vazia."
    fi
  else
    echo "$(echo $* | md5sum | cut -c 1-4) -> $*" >>"$TODO"
    echo "Tarefa Adicionada."
  fi
}

function tlr() {
  
  if [ ! -f "$TODO" ] || [ ! -s "$TODO"]; then
    echo "Lista Vazia"
    return 1
  fi

  if command -v fzf >/dev/null 2>&1; then
    selected=$(cat -n "$TODO" | fzf --ansi --header="Selecione a tarefa para remover (ESC para cancelar)")

    if [ -z "$selected"]; then
      echo "Operação Cancelada"
      return 0
    fi 

    num=$(echo "$selected" | awk '{print $1}')





}
