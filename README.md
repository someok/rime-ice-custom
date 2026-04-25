# rime-ice-custom

## 安装「东风破」 [Plum](https://github.com/rime/plum/tree/master)

> 建议安装在用户目录下

```bash
git clone --depth 1 git@github.com:rime/plum.git
cd plum
```

### 升级 Plum 自身

```bash
cd plum
bash rime-install plum
```

## 安装/升级「雾凇拼音」 [rime-ice](https://dvel.me/posts/rime-ice/)

```bash
bash rime-install iDvel/rime-ice:others/recipes/full
```

## 安装/升级 someok 自定义配置

```bash
bash rime-install someok/rime-ice-custom
```

### 软链接自定义词库

一些敏感的字库放置在本机，可以通过如下命令创建一个目录的软链接将其链接到 Rime 下

```bash
ln -s "~/dict/path/cn_dicts_custom" "$HOME/Library/Rime/cn_dicts_custom"
```

## 补充说明

- `update.sh` 文件已废弃
