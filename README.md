# dotfile

## 拿到新電腦後該如何快速建立舊有的開發環境

### Step 1: 下載 `Homebrew`

### Step 2: 下載 `nvm`

> 可以參考 [[NodeJS] 透過 NVM 安裝與使用 Node.js](https://pjchender.dev/nodejs/nvm/)

### Step 3: `clone` 本 repo 至本機端

> `git clone repo ~/.dotfiles`
> clone repo 至 `~/.dotfiles`

### Step 4: 下載 `stow`

`brew install stow` 

### Step 5: 下載 `Brewfile` 中所有的 packages

`brew bundle --file ~/myFolder/Brewfile`

*ref. [Manage all your installed software at one place with Homebrew Bundle](https://pumpingco.de/blog/brewfile/)*
（根據這個人分享，這樣子 `Homebrew` 就會自動下載 `Brewfile` 中的所有 packages 了）

或者 `brew bundle install`
（但這個指令會需要 `Brewfile` 在以下 path: `~/Brewfile`）

### Step 6: 下載 `tmux` 套件

先執行取得 `tpm` 套件管理：
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

同步 `tmux` 環境：
```bash
# type this in terminal if tmux is already running
:source-file ~/.tmux.conf
```

裝完 `tmux` 按下 prefix + I 即可安裝 tmux 套件

### Step 7: 下載 `oh-my-zsh`

```bash
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

### Step 8: 下載 `powerlevel10k`

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

因為有 `.p10k.zsh` 所以下載後不需要額外設定。

### Step 9: 下載 `zsh` 的套件

```bash
# download zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# download zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

source ~/.zshrc
```

也可以回去看我之前整理的 [建立 .dotfiles 以便在任何 Macbook 上都可以擁有相同的開發環境](https://hackmd.io/@s_jpXuNwRQiUuGCOQAOZuA/SJXGJa_4s)
