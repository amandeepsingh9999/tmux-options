#!/bin/bash

tmus() {
  local options=("New Session" "Attach to Session" "Remove Session" "Default")
  
  config=$(printf "%s\n" "${options[@]}" | fzf --prompt="Tmux config" --height=~50% --layout=reverse --border --exit-0)

  case $config in
    "New Session")
      read -r -p "Enter Name for your session ==> " Sname
      tmux new -s "$Sname"
      ;;
    "Attach to Session")
      echo "Attaching to an existing session..."
      tmuxSessions
      ;;

    "Remove Session")
      echo "For removing select further"
      tmuxSessionsRemoval
      ;;
    "Default")
      echo "Starting a default session..."
      tmux
      ;;
    *)
      echo "Nothing selected"
      ;;
  esac
}

tmuxSessions() {
  local session_names=($(tmux ls | awk '{print $1}' | sed 's/://') "Default")
  
  session_name=$(printf "%s\n" "${session_names[@]}" | fzf --prompt="Tmux session_names" --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $session_name ]]; then
    echo "Nothing selected"
  elif [[ $session_name == "Default" ]]; then
    tmux
  else
    tmux attach -d -t "$session_name"
  fi
}

tmuxSessionsRemoval() {
  local session_names=($(tmux ls | awk '{print $1}' | sed 's/://') "Kill all")
  
  session_name=$(printf "%s\n" "${session_names[@]}" | fzf --prompt="Tmux session_names" --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $session_name ]]; then
    echo "Nothing selected"
  elif [[ $session_name == "Kill all" ]]; then
    for sess in $session_names
    do
      tmux kill-session -t "$sess"
    done
    
  else
    tmux kill-session -t "$session_name"
  fi
}


tmus
