# rime-ice-custom

## 安装「东风破」 [Plum](https://github.com/rime/plum/tree/master)

```bash
git clone --depth 1 git@github.com:rime/plum.git
cd plum
```

### 升级 Plum 自身

```bash
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

## 命令行
```bash
# 升级 plum
./update.sh -p plum

# 升级 rime-ice
./update.sh -p ice

# 升级自身
./update.sh -p someok
```

### 前置条件

`plum` 与 `rime-ice-custom` 位于同一级目录下。
