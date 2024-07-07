# Tmux Session Management Script with FZF

This script enhances tmux session management using FZF (fuzzy finder) for an intuitive and efficient terminal session control experience.

## Features

- **tmus Function**: Allows creation of new tmux sessions, attachment to existing sessions, removal of sessions, and starting a default session.
- **tmuxSessions Function**: Lists existing tmux sessions for easy selection and attachment.
- **tmuxSessionsRemoval Function**: Enables removal of selected sessions or all active sessions.

## System Requirements

- Unix-like operating system (Linux, macOS)
- tmux installed (`sudo apt install tmux` on Debian/Ubuntu, `brew install tmux` on macOS)
- fzf installed (Installation instructions available at [fzf GitHub](https://github.com/junegunn/fzf))

## Installation

1. Clone the repository or download the script:

   ```bash
   git clone https://github.com/your-username/tmux-session-manager.git
   ```

2. Make the script executable:

   ```bash
   chmod +x tmux-session-manager.sh
   ```

3. Add the script to your PATH or create an alias in your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

   ```bash
   alias tmux-manager="/path/to/tmux-session-manager.sh"
   ```

## Usage

### Running the Script

Execute the script in your terminal to manage tmux sessions interactively:

```bash
./tmux-session-manager.sh
```

### Options Available:

1. **New Session**: Create a new tmux session by providing a session name.
2. **Attach to Session**: Attach to an existing tmux session.
3. **Remove Session**: Select a session to remove or choose to remove all active sessions.
4. **Default**: Start a default tmux session if no specific option is chosen.

### Example:

- Select "New Session" and enter a name when prompted to create a new tmux session.
- Choose "Attach to Session" to list and attach to an existing tmux session.
- Opt for "Remove Session" to select a session to remove or choose "Kill all" to terminate all active sessions.
