# Dotfiles

My personal dotfiles configuration for Linux systems. This repository contains configuration files for various tools and applications I use daily.

## 📁 Structure

```
dotfiles/
├── .zshrc              # Zsh shell configuration
├── .bashrc             # Bash shell configuration
├── .bash_profile       # Bash profile configuration
├── .bash_logout        # Bash logout configuration
├── .p10k.zsh           # Powerlevel10k theme configuration
├── .gitconfig          # Git configuration
├── .fehbg              # Feh background configuration
├── .gtkrc-2.0          # GTK2 configuration
├── .yarnrc             # Yarn configuration
├── config/             # Application configurations
│   ├── nvim/          # Neovim configuration
│   ├── kitty/         # Kitty terminal configuration
│   ├── hypr/          # Hyprland window manager configuration
│   ├── waybar/        # Waybar configuration
│   ├── rofi/          # Rofi launcher configuration
│   ├── tmux/          # Tmux configuration
│   ├── swaync/        # Sway notification center configuration
│   └── htop/          # Htop configuration
├── .gitignore         # Git ignore file
├── install.sh         # Installation script
└── README.md          # This file
```

## 🚀 Installation

### Prerequisites

- Git
- Zsh (optional, for zsh configuration)
- Bash (for bash configuration)

### Quick Install

Run the installation script to automatically set up all dotfiles:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### Manual Installation

If you prefer to install manually or selectively:

#### 1. Shell Configuration

**Zsh:**
```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
```

**Bash:**
```bash
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bash_logout ~/.bash_logout
```

#### 2. Git Configuration

```bash
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
```

**⚠️ Important:** Edit `~/.gitconfig` and update your name and email before using.

#### 3. Application Configurations

**Neovim:**
```bash
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/config/nvim ~/.config/nvim
```

**Kitty:**
```bash
mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/config/kitty ~/.config/kitty
```

**Hyprland:**
```bash
mkdir -p ~/.config/hypr
ln -sf ~/dotfiles/config/hypr ~/.config/hypr
```

**Waybar:**
```bash
mkdir -p ~/.config/waybar
ln -sf ~/dotfiles/config/waybar ~/.config/waybar
```

**Rofi:**
```bash
mkdir -p ~/.config/rofi
ln -sf ~/dotfiles/config/rofi ~/.config/rofi
```

**Tmux:**
```bash
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/config/tmux ~/.config/tmux
```

**Swaync:**
```bash
mkdir -p ~/.config/swaync
ln -sf ~/dotfiles/config/swaync ~/.config/swaync
```

**Htop:**
```bash
mkdir -p ~/.config/htop
ln -sf ~/dotfiles/config/htop ~/.config/htop
```

#### 4. Other Configurations

```bash
ln -sf ~/dotfiles/.fehbg ~/.fehbg
ln -sf ~/dotfiles/.gtkrc-2.0 ~/.gtkrc-2.0
ln -sf ~/dotfiles/.yarnrc ~/.yarnrc
```

## 🔧 Configuration Details

### Shell (Zsh)

- **Oh My Zsh** with Powerlevel10k theme
- Custom aliases and functions
- Zoxide integration for smart directory navigation
- Python virtualenv prompt support

### Shell (Bash)

- Basic bash configuration
- Colorized grep output
- Custom prompt

### Git

- User name and email configuration
- **⚠️ Remember to update with your own details**

### Neovim

- Custom Neovim configuration
- Plugins and keybindings

### Kitty

- Terminal emulator configuration
- Color scheme and font settings

### Hyprland

- Window manager configuration
- Keybindings and window rules

### Waybar

- Status bar configuration
- Modules and styling

### Rofi

- Application launcher configuration
- Themes and keybindings

### Tmux

- Terminal multiplexer configuration
- Session management

## 📝 Updating Dotfiles

To update your dotfiles:

1. Make changes to files in `~/dotfiles`
2. Commit and push changes:
   ```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update configuration"
   git push
   ```

## 🔄 Syncing to New Machine

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

3. Install required dependencies:
   - Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
   - Powerlevel10k: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
   - Zoxide: Follow installation instructions at https://github.com/ajeetdsouza/zoxide

## ⚠️ Important Notes

- **Backup existing configurations** before installing
- **Update `.gitconfig`** with your own name and email
- Some configurations may require specific software to be installed
- Review and customize configurations according to your needs

## 📄 License

This repository is for personal use. Feel free to fork and customize for your own needs.

## 🤝 Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome!

## 📧 Contact

For questions or suggestions, please open an issue on GitHub.
