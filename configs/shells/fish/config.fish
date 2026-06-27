# ── Environment ──────────────────────────────────────────────────────────────
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LESS '-R -F -X -i'
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx NH_FLAKE $HOME/nixos

# XDG base directories
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $HOME/.local/state
set -q XDG_CONFIG_DIRS[1]; or set -gx --path XDG_CONFIG_DIRS /etc/xdg
set -q XDG_DATA_DIRS[1]; or set -gx --path XDG_DATA_DIRS /usr/local/share /usr/share

if command -q brew
  set -l brew_data_dir (brew --prefix)/share
  contains -- $brew_data_dir $XDG_DATA_DIRS; or set -gx --path XDG_DATA_DIRS $brew_data_dir $XDG_DATA_DIRS
end

# ── PATH ─────────────────────────────────────────────────────────────────────
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/bin
fish_add_path -g /opt/homebrew/bin
fish_add_path -g /opt/homebrew/sbin

# ── SSH  ─────────────────────────────────────────────────────────────────────
# Prefer a custom agent if my socket isn't already set
set custom_agent "$HOME/.ssh/agent/custom.sock"
set internal_agent "$HOME/.ssh/agent/internal.sock"
set standard_agent /run/user/(id -u)/ssh-agent.sock

# Ignore the default macOS launchd agent.
if set -q SSH_AUTH_SOCK; and string match -rq '^/var/run/com\.apple\.launchd\.[^/]+/Listeners$' -- $SSH_AUTH_SOCK
    set -e SSH_AUTH_SOCK
end

if not set -q SSH_AUTH_SOCK; or not test -S "$SSH_AUTH_SOCK"
  for agent_sock in $custom_agent $standard_agent $internal_agent
    if test -S $agent_sock
      set -gx SSH_AUTH_SOCK $agent_sock
      break
    end
  end
end

# ── Interactive shell only ───────────────────────────────────────────────────
status is-interactive; or return

# Disable the default greeting
set -g fish_greeting

set -g fish_key_bindings fish_hybrid_key_bindings
set -g fish_transient_prompt 1

# Better colors for ls (if available)
set -gx CLICOLOR 1

# Native prompt, based on the starship prompt I use
set -l fish_config_dir (path dirname (path resolve (status filename)))
for prompt_file in fish_prompt.fish fish_mode_prompt.fish
    set -l prompt_path $fish_config_dir/functions/$prompt_file
    test -r $prompt_path; and source $prompt_path
end

bind -M insert ctrl-backspace backward-kill-word
bind -M insert alt-backspace backward-kill-word

# ── Aliases ──────────────────────────────────────────────────────────────────

abbr -a reload 'source ~/.config/fish/config.fish'
abbr -a path 'string split : $PATH'
abbr -a fenv 'set --show'

alias ip 'ip -c'
abbr -a cl 'clear'
if command -q eza
    alias ls eza
    alias ll 'eza -lah --git --icons'
    abbr -a tree 'eza --tree --icons'
else
    abbr -a ll 'ls -lah'
    abbr -a la 'ls -A'
    abbr -a l  'ls -CF'
end

abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'

if command -q git
    abbr -a g   git
    abbr -a ga  git add
    abbr -a gaa git add .
    abbr -a gs  git status
    abbr -a gd  git diff
    abbr -a gl  git log --oneline --graph --decorate
    abbr -a gp  git pull
    abbr -a gP  git push
    abbr -a gc  git commit
    abbr -a gcm git commit -m
    abbr -a gco git checkout
    abbr -a gb  git branch
    abbr -a gr  git remote
    abbr -a grv git remote -v
end
if command -q gitui
    abbr -a gu  gitui
end

abbr -a nv nvim

if not command -q rb && test -x ~/.rootbeer/bin/rb
    alias rb="~/.rootbeer/bin/rb"
end

if command -q bat
    alias cat='bat -p'
end

if not command -q sudo; and command -q doas
    function sudo --wraps doas --description 'Run a command via doas'
        command doas $argv
    end
end

function mkcd
    mkdir -p $argv[1]; and cd $argv[1]
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish 2>/dev/null | source
end

if type -q direnv
    direnv hook fish | source
end
