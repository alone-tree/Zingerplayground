# 网站目录结构说明（已更新）

## 内容组织

### 小说板块 (content/novels/)

```
content/novels/
├── _index.md                    # 小说板块首页
├── starlight.md                 # 短篇小说 1（直接放在 novels/ 下）
├── another-story.md             # 短篇小说 2
└── [中长篇小说名]/              # 每部中长篇一个文件夹
    ├── index.md                # 小说简介 + 章节列表
    ├── chapter-01/
    │   └── index.md            # 第一章内容
    ├── chapter-02/
    │   └── index.md            # 第二章内容
    └── ...
```

## 文件组织规则

### 短篇小说
- **位置**：直接放在 `content/novels/` 目录下
- **格式**：单个 `.md` 文件
- **命名**：`小说名.md` 或 `story-name.md`

### 中长篇小说
- **位置**：在 `content/novels/` 下创建独立文件夹
- **格式**：Page Bundle（文件夹 + index.md）
- **命名**：`小说名/` 文件夹，里面包含 `index.md` 和各章节文件夹

## 添加新内容

### 添加短篇小说

创建文件：`content/novels/your-story.md`

```yaml
---
title: "你的短篇标题"
date: 2025-10-30
draft: false
tags: ["科幻", "人文"]
category: "短篇"
description: "简短描述"
cover: ""  # 可选：封面图路径
---

正文内容...
```

### 添加中长篇小说

1. 创建小说文件夹：`content/novels/your-novel/`

2. 创建小说简介：`content/novels/your-novel/index.md`
```yaml
---
title: "你的小说名"
date: 2025-10-30
draft: false
tags: ["科幻"]
category: "中长篇"
description: "小说简介"
---

## 作品简介
...
```

3. 创建章节：`content/novels/your-novel/chapter-01/index.md`
```yaml
---
title: "第一章：章节名"
novel: "你的小说名"
chapter: 1
date: 2025-10-30
draft: false
tags: ["科幻"]
category: "中长篇"
---

章节内容...
```

## 页面访问路径

- 小说总列表：`/novels/`
- 单篇短篇：`/novels/starlight/`（直接阅读）
- 中长篇简介：`/novels/time-traveler/`（章节列表）
- 中长篇章节：`/novels/time-traveler/chapter-01/`（阅读章节）

## Front Matter 字段说明

### 短篇小说
- `title`: 标题
- `date`: 发布日期
- `draft`: 是否草稿（true/false）
- `tags`: 标签数组
- `category`: **必须是 "短篇"**
- `description`: 简介
- `cover`: 封面图（可选）

### 中长篇小说（index.md）
- `title`: 小说名称
- `category`: **必须是 "中长篇"**
- 其他字段同短篇

### 中长篇章节
- `title`: 章节标题
- `novel`: 所属小说名称
- `chapter`: 章节号（用于排序）
- `category`: **必须是 "中长篇"**
- 其他字段同短篇

## 图片资源

```
static/images/
├── hero/                # Hero 横幅图
│   └── mountain-sea.jpg
├── default/             # 默认占位图
│   └── novel-cover.jpg
└── novels/              # 小说封面（可选）
    └── your-novel/
        └── cover.jpg
```

## 区别说明

### 短篇 vs 中长篇

| 特性 | 短篇 | 中长篇 |
|------|------|--------|
| 文件结构 | 单个 `.md` 文件 | 文件夹 + `index.md` |
| 存放位置 | `novels/` 下 | `novels/小说名/` 下 |
| 点击卡片 | 直接阅读全文 | 跳转到章节列表 |
| `category` | "短篇" | "中长篇" |
| 章节 | 无 | 多个章节文件夹 |

## 示例

### 当前结构
```
content/novels/
├── _index.md                 # 小说首页
├── starlight.md             # ✓ 短篇
└── time-traveler/           # ✓ 中长篇
    ├── index.md            # 小说简介
    ├── chapter-01/
    │   └── index.md        # 第一章
    └── chapter-02/
        └── index.md        # 第二章
```

### 添加更多内容后
```
content/novels/
├── _index.md
├── starlight.md             # 短篇 1
├── the-last-star.md         # 短篇 2
├── dream-catcher.md         # 短篇 3
├── time-traveler/           # 中长篇 1
└── parallel-world/          # 中长篇 2
    ├── index.md
    ├── chapter-01/
    └── chapter-02/
```
