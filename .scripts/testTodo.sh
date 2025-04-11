#!/usr/bin/env bash

# TODO List TUI
# Inspirado no trabalho de Dylan Araps

TODO_FILE="$HOME/Documentos/toDoCli/TODO.txt"

# Cores e formatação
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
RESET='\033[0m'

# Configurações do terminal
setup_terminal() {
  # Salva o estado atual do terminal
  printf '\033[?1049h' # Alterna para o buffer alternativo
  printf '\033[?25l'   # Esconde o cursor

  # Limpa a tela
  printf '\033[2J'
  printf '\033[H'

  # Desativa o eco e o modo canônico
  stty -echo -icanon
}

# Restaura o terminal ao estado original
reset_terminal() {
  printf '\033[?25h'   # Mostra o cursor
  printf '\033[?1049l' # Retorna ao buffer principal

  # Restaura as configurações do terminal
  stty echo icanon
}

# Desenha a interface
draw_ui() {
  local width=$(tput cols)
  local height=$(tput lines)
  local content_width=$((width - 4))

  # Limpa a tela
  printf '\033[2J'
  printf '\033[H'

  # Desenha o cabeçalho
  printf "${BOLD}${BLUE}%*s${RESET}\n" $width " "
  printf "${BOLD}${BLUE}  LISTA DE TAREFAS  ${RESET}\n"
  printf "${BLUE}%*s${RESET}\n\n" $width " "

  # Verifica se o arquivo existe
  if [[ ! -f "$TODO_FILE" ]]; then
    printf "  ${YELLOW}Nenhuma tarefa encontrada. Arquivo não existe.${RESET}\n"
    return
  fi

  # Verifica se o arquivo está vazio
  if [[ ! -s "$TODO_FILE" ]]; then
    printf "  ${YELLOW}Sua lista de tarefas está vazia.${RESET}\n"
    return
  fi

  # Exibe as tarefas
  local line_num=1
  while IFS= read -r line; do
    # Extrai o hash e a tarefa
    local hash="${line%% -> *}"
    local task="${line#* -> }"

    # Formata e exibe a tarefa
    printf "  ${GREEN}%2d${RESET} [${YELLOW}%s${RESET}] ${BOLD}%s${RESET}\n" "$line_num" "$hash" "$task"

    ((line_num++))
  done <"$TODO_FILE"

  # Desenha o rodapé
  printf "\n${BLUE}%*s${RESET}\n" $width " "
  printf "${BLUE}  Pressione 'q' para sair  ${RESET}\n"
  printf "${BLUE}%*s${RESET}\n" $width " "
}

# Função principal
main() {
  # Configura o terminal
  setup_terminal

  # Desenha a interface inicial
  draw_ui

  # Loop principal
  local key=""
  while true; do
    # Lê uma tecla
    read -rsn1 key

    # Verifica se é para sair
    if [[ "$key" == "q" ]]; then
      break
    fi

    # Redesenha a interface (para atualizações futuras)
    draw_ui
  done

  # Restaura o terminal
  reset_terminal
}

# Trata sinais para garantir que o terminal seja restaurado
trap reset_terminal EXIT INT TERM

# Inicia o programa
main
