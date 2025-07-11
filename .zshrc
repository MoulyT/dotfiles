# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

#------------------------------------------------------------------------------
# History Configuration
#------------------------------------------------------------------------------
# Format: 31-Jan-2024 14:30
HIST_STAMPS="%d-%b-%Y %H:%M"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/lua/config/options.lua"
# alias ohmyzsh="mate ~/.oh-my-zsh"


################################################################################
# Development Tools Configuration
################################################################################

#------------------------------------------------------------------------------
# Fast Node Manager (FNM)
#------------------------------------------------------------------------------
# Initialize fnm
eval "$(fnm env --use-on-cd)"

# NVM compatibility alias
alias nvm="fnm"

#------------------------------------------------------------------------------
# Node Version Manager (NVM) - Comentado pero mantenido como backup
#------------------------------------------------------------------------------
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#------------------------------------------------------------------------------
# Python Environment (pyenv)
#------------------------------------------------------------------------------
# Add pyenv to PATH and initialize
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
# Initialize pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

#------------------------------------------------------------------------------
# Package Managers
#------------------------------------------------------------------------------
# PNPM
export PNPM_HOME="/Users/mouly/Library/pnpm"
# Add to PATH if not already present
case ":$PATH:" in
 *":$PNPM_HOME:"*) ;;
 *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# PNPM alias for shorter commands
alias p='pnpm'

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Load bun completions
[ -s "/Users/mouly/.bun/_bun" ] && source "/Users/mouly/.bun/_bun"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#------------------------------------------------------------------------------
# Git Aliases and Functions
#------------------------------------------------------------------------------
# gacp: Git Add, Commit, and Push in one command
# Usage: gacp "commit message"
gacp() {
 git add . && git commit -m "$1" && git push
}

###############################################################################
# FZF (Fuzzy Finder) Configuration
###############################################################################

#------------------------------------------------------------------------------
# Core FZF Setup
#------------------------------------------------------------------------------
# Initialize FZF key bindings and completions for zsh
# Default key bindings:
#   - Ctrl+T: File search
#   - Alt+C: Directory navigation  
#   - Ctrl+R: Command history search
eval "$(fzf --zsh)"

#------------------------------------------------------------------------------
# Preview Configuration
#------------------------------------------------------------------------------
# Configure intelligent preview for files and directories
# For files: Use bat with syntax highlighting and line numbers (limited to 500 lines)
# For directories: Use eza to show tree structure (limited to 200 lines)
# Note: --git-ignore flag makes eza respect .gitignore patterns
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --git-ignore --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# Apply preview settings to different FZF commands
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --git-ignore --color=always {} | head -200'"

# Customize preview behavior based on command context
_fzf_comprun() {
 local command=$1
 shift

 case "$command" in
   cd)           fzf --preview 'eza --tree --git-ignore --color=always {} | head -200' "$@" ;;
   export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
   ssh)          fzf --preview 'dig {}'                   "$@" ;;
   *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
 esac
}

#------------------------------------------------------------------------------
# FD Integration (Fast Find Alternative)
#------------------------------------------------------------------------------
# Configure fd as the default command for file searching
# --hidden: Include hidden files/folders
# --strip-cwd-prefix: Remove ./ prefix from results
# --exclude .git: Ignore git directory
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
# Use same fd settings for Ctrl+T file search
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Configure fd for Alt+C directory navigation (only show directories)
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

#------------------------------------------------------------------------------
# FZF Completion Functions
#------------------------------------------------------------------------------
# These functions enable fuzzy completion for:
#   - Files: Type ** and TAB (e.g., vim **/file.txt<TAB>)
#   - Directories: Type **/ and TAB (e.g., cd **/projects<TAB>)
# 
# Path completion using fd
# $1: Base path to start traversal
_fzf_compgen_path() {
 fd --hidden --exclude .git . "$1"
}

# Directory completion using fd
# $1: Base path to start traversal
_fzf_compgen_dir() {
 fd --type=d --hidden --exclude .git . "$1"
}

#------------------------------------------------------------------------------
# Git Integration
#------------------------------------------------------------------------------
# Load fzf git utilities for enhanced git operations
# Source: https://github.com/junegunn/fzf-git.sh
#
# Most useful keybindings:
#   - CTRL-GF: Search git files (modified, untracked, etc.)
#   - CTRL-GB: Switch between branches
#   - CTRL-GH: Browse commit history
source ~/Code/fzf-git.sh/fzf-git.sh

#------------------------------------------------------------------------------
# Theme Configuration
#------------------------------------------------------------------------------
# Define colors
fg="#CBE0F0"          # Foreground text
bg="#011628"          # Background
bg_highlight="#143652" # Selected item background
purple="#B388FF"      # Highlighting
blue="#06BCE4"        # Info text
cyan="#2CF9ED"        # UI elements

# Apply color scheme
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},\
bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},\
pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

################################################################################
# Modern CLI Tools Configuration
################################################################################

#------------------------------------------------------------------------------
# Bat Configuration (Modern replacement for cat)
#------------------------------------------------------------------------------
# Set theme for syntax highlighting
export BAT_THEME=tokyonight_night

#------------------------------------------------------------------------------
# Eza Configuration (Modern replacement for ls)
#------------------------------------------------------------------------------
# Configure default ls command with eza
# Flags explained:
#   --color=always:    Enable colorized output
#   --long:            Use long listing format
#   --git:            Show git status
#   --no-filesize:    Hide file size (reduce visual noise)
#   --icons=always:   Show icons for files and directories
#   --no-time:        Hide timestamps
#   --no-user:        Hide user column
#   --no-permissions: Hide permissions
#
# Note: Additional arguments can be passed to ls/eza as normal
# Example: ls -r (will reverse sort)
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

#------------------------------------------------------------------------------
# Zoxide Configuration (Smarter cd command)
#------------------------------------------------------------------------------
# Initialize zoxide for zsh
# This provides the following commands:
#   - z foo:    cd to highest ranked directory matching foo
#   - zi foo:   Interactive selection using fzf
#   - z foo/:   Only match directories with foo in name
#   - z ../foo: Regular cd-like behavior
eval "$(zoxide init --cmd cd zsh)"

#------------------------------------------------------------------------------
# History Management (Atuin)
#------------------------------------------------------------------------------
# Initialize Atuin for better history management
# Features:
#   - Sync history between machines
#   - Search by date, directory, or exit status
#   - Up arrow for local history, Alt-Up for global
eval "$(atuin init zsh)"
