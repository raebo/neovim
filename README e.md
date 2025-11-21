# Neovim Config

A modern Neovim configuration optimized for development in:

- **Ruby, TypeScript/React, Lua**
- **HTML, CSS, JSON**

with **LSP support**, **fuzzy finding**, **snippets**, and **tab/file management**.

---

## Features

### LSP & Language Support

- LSP servers configured via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [Mason](https://github.com/williamboman/mason.nvim)
- Supported languages:
  - Lua (`lua_ls`)
  - TypeScript / JavaScript (`tsserver`)
  - Ruby (`solargraph`)
  - HTML (`html`)
  - CSS (`cssls`)
  - JSON (`jsonls`)
- Auto-format on save
- Diagnostic floating windows with rounded borders

* To uninstall a language server use Mason

```bash
:MasonUninstall solargraph
```

### Autocompletion & Snippets

- Powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Snippet support via [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- LSP-aware completion for all supported languages
- Command-T style fuzzy file search with [Telescope](https://github.com/nvim-telescope/telescope.nvim)

### File Explorer & Tabs

- File tree sidebar with [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- Tabs and buffers fully navigable
- Easily move lines or visual selection left/right (Tab/Shift-Tab)

### Keymaps

- `<leader>w` → Save file
- `<leader>q` → Quit
- `<leader>ff` → Find files (Telescope)
- `<leader>fg` → Live grep (Telescope)
- `<leader>t` → Command-T style search
- `<leader>e` → Toggle file explorer (Nvim-Tree)
- `<leader>tn` → New tab
- `<leader>tc` → Close tab
- `<leader>tl` → Next tab
- `<leader>th` → Previous tab
- `<Tab>` / `<S-Tab>` in visual mode → Indent selection right/left

---

## Installation

### Install font with nerdfonts

* check if a nerd font is on your system installed


```bash
fc-list | grep -i nerd
```

* installation e.g. for JetBrainsMono

```bash
  sudo mkdir -p /usr/local/share/fonts
  cd /usr/local/share/fonts
  sudo wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  sudo unzip -o JetBrainsMono.zip -d JetBrainsMono
  sudo rm JetBrainsMono.zip
  fc-cache -fv
```

### Install Livegrep dependencies

```bash 
sudo apt install ripgrep fd-find
```

### Install Ruby-LSP dependencies

```bash 
 gem install ruby-lsp
 gem install debug
```


### 1️⃣ Install Neovim (unstable / nightly)

**Linux (Debian/Ubuntu example)**:

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

### 2️⃣ Install Lua Language Server

* Using Mason (recommended):
* Open Neovim and run:


```bash
:Mason
```

* Install the lua language server

* Download lates release from github server
* https://github.com/LuaLS/lua-language-server/releases
* I'd like to put the files to ~/.local/share/lua-lang-server. You can choose other place for them.
* After that

```bash
 mkdir -p ~/.local/share/lua-lang-server && \
tar --extract --file <YOUR .gz FILE> -av -C ~/.local/share/lua-lang-server
```

* Create a symbolic link in '~/.local/bin

```bash
ln -s ~/.local/share/lua-lang-server/bin/lua-language-server ~/.local/bin/lua-language-server
```

* After that try to execute the language server
* If that fails add the .local/bin folder to the executable


```bash
 export PATH=$PATH:~/.local/bin
```


# HELP HELP

* for a fresh install backup and remove the plugins


# Backup your config first

```bash
cp -r ~/.config/nvim ~/.config/nvim.backup
```

# Remove all plugins and cache


```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

* After that 
