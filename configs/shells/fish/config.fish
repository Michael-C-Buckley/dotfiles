# ~/.config/fish/config.fish

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

# ── PATH ─────────────────────────────────────────────────────────────────────
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/bin
fish_add_path -g /opt/homebrew/bin
fish_add_path -g /opt/homebrew/sbin

# ── SSH  ─────────────────────────────────────────────────────────────────────
# Prefer a custom agent if my socket isn't already set
set standard_agent "$HOME/.ssh/agent/internal.sock"

if not set -q SSH_AUTH_SOCK
  if test -S $standard_agent
    set -gx SSH_AUTH_SOCK $standard_agent
  end
end

# ── Interactive shell only ───────────────────────────────────────────────────
status is-interactive; or return

# Disable the default greeting
set -g fish_greeting

fish_vi_key_bindings

# Better colors for ls (if available)
set -gx CLICOLOR 1

# Backup default prompt, overriden by starship if available
fish_config prompt choose arrow

bind -M insert ctrl-backspace backward-kill-word
bind -M insert alt-backspace backward-kill-word

# ── Aliases ──────────────────────────────────────────────────────────────────
alias ip 'ip -c'
abbr -a cl 'clear'
abbr -a ll 'ls -lah'
abbr -a la 'ls -A'
abbr -a l  'ls -CF'
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'

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

abbr -a nv nvim

if not command -q rb && test -x ~/.rootbeer/bin/rb
    alias rb="~/.rootbeer/bin/rb"
end

# ── Tool integrations (loaded only if installed) ─────────────────────────────
if type -q starship; and not set -q FISH_NO_STARSHIP
    starship init fish | source
    enable_transience
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
