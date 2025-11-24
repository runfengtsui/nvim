# Neovim 配置

当前配置适用 Neovim 版本为 v0.11.5.

## LSP 配置

不使用 `Mason.nvim` 插件的情况下, 安装各个语言的 LSP.

### lua-language-server

`lua-language-server` 需要自行下载二进制可执行文件, 可使用 [脚本](https://github.com/runfengtsui/dotfiles/blob/main/scripts/lua-language-server.py)
如果 Windows 上使用 `scoop` 包管理器, 可以使用如下命令安装:
```cmd
scoop install lua-language-server
```

### marksman

`marksman` 直接下载二进制文件即可:
```bash
# https://github.com/artempyanykh/marksman
chmod +x marksman-linux-x64
sudo mv marksman-linux-x64 /opt/marksman
sudo ln -s /otp/marksman /usr/local/bin/marksman
```

### Clangd

使用包管理器进行安装, 如
```bash
apt install clangd
```

### Pyright

使用 `npm` 管理器全局安装, `npm` 相关配置参见 [教程](https://github.com/runfengtsui/marknotes/blob/main/Applications/npm.md).
```bash
npm install -g pyright
```

### Julials

`Julia` 的 LSP 需要在指定环境 `~/.julia/environments/nvim-lspconfig` 中使用包
管理器安装 `LanguageServer.jl`, `SymbolServer.jl` 和 `StaticLint.jl`:
```bash
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; \
  Pkg.add("LanguageServer"); Pkg.add("SymbolServer"); Pkg.add("StaticLint")'
```
更新仍需在这个包环境中使用 `Pkg.update()` 命令.

## 其他补充材料
Here are some materials to learn how to configure Neovim with lua.

* [Neovim 配置实战：从0到1打造自己的IDE](https://juejin.cn/book/7051157342770954277).

## TODO

* 如何检测当前环境, 设置代码段在特定的环境中触发

