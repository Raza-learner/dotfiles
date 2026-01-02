#!/bin/bash

# Dotfiles Installation Script
# This script creates symbolic links from the dotfiles directory to your home directory

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to backup existing file
backup_file() {
    local file="$1"
    if [ -e "$file" ] || [ -L "$file" ]; then
        print_warn "Backing up $file"
        mkdir -p "$BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/"
    fi
}

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ ! -e "$source" ]; then
        print_warn "Source file $source does not exist, skipping..."
        return
    fi
    
    backup_file "$target"
    print_info "Linking $target -> $source"
    ln -sf "$source" "$target"
}

# Main installation
main() {
    print_info "Starting dotfiles installation..."
    print_info "Dotfiles directory: $DOTFILES_DIR"
    print_info "Backup directory: $BACKUP_DIR"
    echo ""
    
    # Create backup directory
    mkdir -p "$BACKUP_DIR"
    
    # Shell configuration files
    print_info "Installing shell configurations..."
    create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    create_symlink "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
    create_symlink "$DOTFILES_DIR/.bash_logout" "$HOME/.bash_logout"
    create_symlink "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
    echo ""
    
    # Git configuration
    print_info "Installing Git configuration..."
    create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    print_warn "⚠️  Remember to update ~/.gitconfig with your name and email!"
    echo ""
    
    # Application configurations
    print_info "Installing application configurations..."
    
    # Create .config directory if it doesn't exist
    mkdir -p "$HOME/.config"
    
    # Neovim
    if [ -d "$DOTFILES_DIR/config/nvim" ]; then
        backup_file "$HOME/.config/nvim"
        print_info "Linking Neovim configuration"
        ln -sf "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"
    fi
    
    # Kitty
    if [ -d "$DOTFILES_DIR/config/kitty" ]; then
        backup_file "$HOME/.config/kitty"
        print_info "Linking Kitty configuration"
        ln -sf "$DOTFILES_DIR/config/kitty" "$HOME/.config/kitty"
    fi
    
    # Hyprland
    if [ -d "$DOTFILES_DIR/config/hypr" ]; then
        backup_file "$HOME/.config/hypr"
        print_info "Linking Hyprland configuration"
        ln -sf "$DOTFILES_DIR/config/hypr" "$HOME/.config/hypr"
    fi
    
    # Waybar
    if [ -d "$DOTFILES_DIR/config/waybar" ]; then
        backup_file "$HOME/.config/waybar"
        print_info "Linking Waybar configuration"
        ln -sf "$DOTFILES_DIR/config/waybar" "$HOME/.config/waybar"
    fi
    
    # Rofi
    if [ -d "$DOTFILES_DIR/config/rofi" ]; then
        backup_file "$HOME/.config/rofi"
        print_info "Linking Rofi configuration"
        ln -sf "$DOTFILES_DIR/config/rofi" "$HOME/.config/rofi"
    fi
    
    # Tmux
    if [ -d "$DOTFILES_DIR/config/tmux" ]; then
        backup_file "$HOME/.config/tmux"
        print_info "Linking Tmux configuration"
        ln -sf "$DOTFILES_DIR/config/tmux" "$HOME/.config/tmux"
    fi
    
    # Swaync
    if [ -d "$DOTFILES_DIR/config/swaync" ]; then
        backup_file "$HOME/.config/swaync"
        print_info "Linking Swaync configuration"
        ln -sf "$DOTFILES_DIR/config/swaync" "$HOME/.config/swaync"
    fi
    
    # Htop
    if [ -d "$DOTFILES_DIR/config/htop" ]; then
        backup_file "$HOME/.config/htop"
        print_info "Linking Htop configuration"
        ln -sf "$DOTFILES_DIR/config/htop" "$HOME/.config/htop"
    fi
    
    echo ""
    
    # Other configurations
    print_info "Installing other configurations..."
    create_symlink "$DOTFILES_DIR/.fehbg" "$HOME/.fehbg"
    create_symlink "$DOTFILES_DIR/.gtkrc-2.0" "$HOME/.gtkrc-2.0"
    create_symlink "$DOTFILES_DIR/.yarnrc" "$HOME/.yarnrc"
    echo ""
    
    # Final message
    print_info "Installation complete! 🎉"
    echo ""
    print_info "Your original files have been backed up to: $BACKUP_DIR"
    print_warn "⚠️  Don't forget to:"
    print_warn "   1. Update ~/.gitconfig with your name and email"
    print_warn "   2. Install required dependencies (Oh My Zsh, Powerlevel10k, etc.)"
    print_warn "   3. Restart your shell or run: source ~/.zshrc"
    echo ""
}

# Run main function
main
