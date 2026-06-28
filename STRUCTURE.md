# 网站目录结构说明

```
content/
├── about.md                    # 关于页面
├── posts/
│   └── hello-world.md          # 示例文章
├── articles/
│   ├── _index.md               # 文章板块首页（空壳，Hugo 自动生成列表）
│   ├── my-article.md           # 单篇文章
│   └── ...                     # 更多文章
├── code/
│   ├── _index.md               # 代码板块首页
│   ├── my-project.md           # 单个项目介绍
│   └── ...
├── novels/
│   └── ...                     # 见下方小说结构
├── photography/
│   └── ...                     # 见下方摄影结构
└── ...
```

### 文章板块 (content/articles/)

```
content/articles/
├── _index.md                   # 文章板块首页（自动生成列表）
├── my-article.md              # 单个文章文件
├── another-article.md         # 更多文章
└── ...
```

- **位置**：直接放在 `content/articles/` 目录下
- **格式**：单个 `.md` 文件（非帖文格式，前后 `---` 分隔 front matter）
- **命名**：`article-name.md`（英文和连字符）
- **图片**：封面图通过 front matter `cover` 字段指向 `static/images/articles/` 目录

**访问路径：**

| 页面类型 | URL 路径 | 说明 |
|---------|---------|------|
| 文章列表 | `/articles/` | 显示所有文章卡片（含分类筛选按钮） |
| 单篇文章 | `/articles/my-article/` | 文章详情页 |

### 代码板块 (content/code/)

类似文章板块：
- 文件直接放 `content/code/` 下
- 命名：`project-name.md`

**访问路径：**

| 页面类型 | URL 路径 | 说明 |
|---------|---------|------|
| 代码列表 | `/code/` | 显示所有项目卡片 |
| 单个项目 | `/code/my-project/` | 项目详情页，默认用 single.html |
| 遥测看板 | `/code/siyuan-bridge-telemetry/` | 特殊页面，用 telemetry.html 独立模板 |

---

## 小说板块 (content/novels/)

```
content/novels/
├── _index.md                    # 小说板块首页
├── starlight.md                 # 短篇小说（直接放在 novels/ 下）
└── [中长篇小说名]/              # 每部中长篇一个文件夹
    ├── _index.md                # 小说简介（必须带下划线）
    ├── chapter-01/              # 章节文件夹（名称可自定义）
    │   └── index.md            # 章节内容（必须是 index.md）
    ├── chapter-02/
    │   └── index.md
    └── ...
```

## 文件组织规则

### 短篇小说
- **位置**：直接放在 `content/novels/` 目录下
- **格式**：单个 `.md` 文件（推荐，也支持 `.html`）
- **命名**：`story-name.md`（建议用英文和连字符）

### 中长篇小说
- **位置**：在 `content/novels/` 下创建独立文件夹
- **格式**：Page Bundle（文件夹 + _index.md）
- **命名规则**：
  - 小说文件夹：`novel-name/`（建议用英文和连字符）
  - 小说简介：必须是 `_index.md`（带下划线）
  - 章节文件夹：可自定义（如 `chapter-01/` 或 `01-chapter-name/`）
  - 章节文件：必须是 `index.md`（不带下划线）

> **Hugo Page Bundle 说明**：
> - `_index.md`（带下划线）= Branch Bundle，可以有子页面
> - `index.md`（不带下划线）= Leaf Bundle，是最终页面

## 页面访问路径

| 页面类型 | URL 路径 | 说明 |
|---------|---------|------|
| 小说总列表 | `/novels/` | 显示所有小说卡片 |
| 短篇小说 | `/novels/starlight/` | 直接阅读全文 |
| 中长篇简介 | `/novels/time-traveler/` | 显示章节列表 |
| 中长篇章节 | `/novels/time-traveler/chapter-01/` | 阅读具体章节 |

## 短篇 vs 中长篇

| 特性 | 短篇 | 中长篇 |
|------|------|--------|
| 文件结构 | 单个 `.md` 文件 | 文件夹 + `_index.md` |
| 存放位置 | `novels/` 下 | `novels/小说名/` 下 |
| 点击卡片 | 直接阅读全文 | 跳转到章节列表 |
| `category` | "短篇" | "中长篇" |
| `layout` | 不需要 | 必须是 "list" |
| 章节 | 无 | 多个章节文件夹 |

## 图片资源

```
static/images/
├── hero/                # Hero 横幅图
│   └── mountain-sea.jpg
├── default/             # 默认占位图
│   └── novel-cover.jpg
├── articles/            # 文章封面图（21:9 横版）
│   └── article-name-cover.png
└── novels/              # 小说封面（可选）
    └── your-novel/
        └── cover.jpg
```

## 网站板块总览

| 板块 | 内容路径 | 模板位置 | 特殊规则 |
|------|---------|---------|---------|
| 首页 | content/_index.md | themes/minimal-theme/layouts/index.html | — |
| 关于 | content/about.md | layouts/about/single.html | 窄容器 750px |
| 文章 | content/articles/ | layouts/articles/list.html + single.html | JS 分类筛选（按 category 字段） |
| 代码 | content/code/ | layouts/code/list.html + single.html | telemetry.html 独立模板 |
| 小说 | content/novels/ | themes/minimal-theme/layouts/ | _index.md / index.md 命名规则 |
| 摄影 | content/photography/ | layouts/photography/list.html + single.html | — |

## 示例

### 当前结构
```
content/novels/
├── _index.md                 # 小说首页
├── starlight.md             # ✓ 短篇
└── time-traveler/           # ✓ 中长篇
    ├── _index.md            # 小说简介（带下划线）
    ├── chapter-01/
    │   └── index.md        # 第一章（不带下划线）
    └── chapter-02/
        └── index.md        # 第二章（不带下划线）
```

### 扩展后的结构
```
content/novels/
├── _index.md
├── starlight.md             # 短篇 1
├── the-last-star.md         # 短篇 2
├── dream-catcher.md         # 短篇 3
├── time-traveler/           # 中长篇 1
│   ├── _index.md
│   ├── chapter-01/
│   └── chapter-02/
└── parallel-world/          # 中长篇 2
    ├── _index.md
    ├── chapter-01/
    └── chapter-02/
```

## 章节排序说明

章节在页面上的显示顺序由 Front Matter 中的 `chapter` 参数决定，与文件夹名称无关。

**示例：**
- `chapter-01/index.md` 中 `chapter: 1`
- `chapter-02/index.md` 中 `chapter: 2`
- 页面会按照 1, 2, 3... 的顺序显示

## 相关文档

- [内容模板和添加指南](./TEMPLATES.md)
