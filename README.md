# rime-ice-custom

基于「雾凇拼音」[rime-ice](https://dvel.me/posts/rime-ice/) 的自定义配置。

通过 Rime 的 patch 模式实现，最大限度复用雾凇的配置。安装通过 [Plum](https://github.com/rime/plum/tree/master)（东风破）实现，执行 `rime-install` 后会自动将 `recipe` 配置项拷贝到 Rime 配置目录，因此 Plum 可放置在任意位置。

## 安装步骤

### 1. 安装东风破 Plum

> 建议安装在用户目录下

```bash
git clone --depth 1 git@github.com:rime/plum.git
```

### 2. 安装/升级雾凇拼音

```bash
cd plum
bash rime-install iDvel/rime-ice:others/recipes/full
```

### 3. 安装/升级自定义配置

```bash
bash rime-install someok/rime-ice-custom
```

### 4. 软链接自定义词库（可选）

本配置使用了两个私有词库：

| 词库 | 说明 | 配置位置 |
|------|------|----------|
| `cn_dicts_custom/my_contacts` | 个人联系人词库 | [rime_ice_someok.dict.yaml](./rime_ice_someok.dict.yaml) |
| `cn_dicts_custom/custom_phrase_custom` | 常用词库（txt 格式） | [rime_ice.custom.yaml](./rime_ice.custom.yaml) |

> **注**：`rime_ice_someok.dict.yaml` 复制自雾凇的 [rime_ice.dict.yaml](https://github.com/iDvel/rime-ice/blob/main/rime_ice.dict.yaml)，因 dict 文件无法通过 patch 添加 `import_tables`，故需复制后修改。

将词库文件放置在同一目录下（如 `~/dicts/cn_dicts_custom`），然后创建软链接：

```bash
ln -s "~/dicts/cn_dicts_custom" "$HOME/Library/Rime/cn_dicts_custom"
```

> 注意：这些文件修改之后别忘记执行「重新部署」

## 其他

- 升级 Plum 自身：`cd plum && bash rime-install plum`
- `update.sh` 文件已废弃
