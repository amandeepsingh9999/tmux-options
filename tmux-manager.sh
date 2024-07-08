#!/bin/bash

tmus() {
  local options=("New Session" "Attach to Session" "Remove Session" "Default")
  
  config=$(printf "%s\n" "${options[@]}" | fzf --prompt="Tmux config" --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing Selected"
  elif [[ $config == "New Session" ]]; then
    read -r -p "Enter Name for your session ==> " Sname
    if [[ -n $Sname ]]; then
      tmux new -s "$Sname"
    else
      echo "Session name cannot be empty"
    fi
  elif [[ $config == "Attach to Session" ]]; then
    echo "Attaching to an existing session..."
    tmuxSessions
  elif [[ $config == "Remove Session" ]]; then
    echo "Removing a session..."
    tmuxSessionsRemoval
  elif [[ $config == "Default" ]]; then
    echo "Starting a default session..."
    tmux
  else
    echo "Invalid option selected"
  fi
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
    for sess in "${session_names[@]}"; do
      if [[ $sess != "Kill all" ]]; then
        tmux kill-session -t "$sess"
      fi
    done
  else
    tmux kill-session -t "$session_name"
  fi
}

tmus
