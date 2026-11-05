# homebrew-acp-host

`acp-host` 的 Homebrew 软件源（tap）。代码在 https://github.com/thatwzzh/acp-host

## 安装

```bash
brew tap thatwzzh/acp-host
brew install acp-host
```

## 验证装好了

```bash
acp-host --version

echo '{"id":"1","method":"agents.list"}' | acp-host
```

## 注意

直接敲 `acp-host` 会打印用法提示然后退出——它是**等 stdin 的守护进程**，
不是那种跑一下就打印结果的命令。正常用法是喂 JSON 进去，或者被客户端
（npm / PyPI 上的 `acp-host-client`）起起来。

## 这个仓库怎么维护

**别手工改 `Formula/acp-host.rb` 里的版本号和 sha256。** 每次主仓库发版，
发布脚本（`acp-host/scripts/publish.sh`）会自动重写它们并推送。
要改流程去改主仓库。
