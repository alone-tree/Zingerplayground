# 内容模板

本文档提供添加新内容的模板和字段说明。

## 快速开始

### 添加短篇小说

1. 创建文件：`content/novels/your-story.md`

2. 复制以下模板：

```markdown
---
title: "你的短篇标题"
date: 2025-10-30
draft: false
tags: ["科幻", "人文"]
category: "短篇"
description: "卡片页展示的一句话简介"
cover: ""  # 可选：封面图路径
---

正文内容...

```

### 添加中长篇小说

#### 步骤 1：创建小说文件夹和简介

1. 创建文件夹：`content/novels/your-novel/`
2. 创建文件：`content/novels/your-novel/_index.md`

创建的_index.md内容如下

```markdown
---
title: "你的小说名"
date: 2025-10-30
draft: false
tags: ["科幻"]
category: "中长篇"
description: "小说简介"
layout: "list"
cover: ""  # 可选：封面图路径
---

## 作品简介

小说的详细介绍（不是卡片上的一句话介绍）

这里的介绍会展示在小说的章节目录上面，可以多写一些。

```

#### 步骤 2：添加章节

1. 创建文件夹：`content/novels/your-novel/chapter-01/`
2. 创建文件：`content/novels/your-novel/chapter-01/index.md`

每一章的index.md内容如下

```markdown
---
title: "章节名"
novel: "你的小说名"
chapter: 1
date: 2025-10-30
draft: false
tags: ["科幻"]
category: "中长篇"
---

章节内容...

```

## Front Matter 字段说明

### 通用字段

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `title` | 字符串 | ✓ | 标题 |
| `date` | 日期 | ✓ | 发布日期（格式：YYYY-MM-DD） |
| `draft` | 布尔值 | ✓ | 是否草稿（true/false） |
| `tags` | 数组 | ✓ | 标签列表 |
| `description` | 字符串 | ✓ | 简介（显示在卡片上） |
| `cover` | 字符串 | ✗ | 封面图路径 |

### 短篇小说专用字段

| 字段 | 值 | 必填 | 说明 |
|------|-----|------|------|
| `category` | "短篇" | ✓ | **必须是 "短篇"** |

### 中长篇小说专用字段（_index.md）

| 字段 | 值 | 必填 | 说明 |
|------|-----|------|------|
| `category` | "中长篇" | ✓ | **必须是 "中长篇"** |
| `layout` | "list" | ✓ | **必须是 "list"**（用于显示章节列表） |

### 中长篇章节专用字段

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `novel` | 字符串 | ✓ | 所属小说名称 |
| `chapter` | 数字 | ✓ | 章节号（用于排序） |
| `category` | "中长篇" | ✓ | **必须是 "中长篇"** |

## 完整示例

### 短篇小说示例（starlight.md）

```markdown
---
title: "星光下的约定"
date: 2025-10-30
draft: false
tags: ["科幻", "人文"]
category: "短篇"
description: "一个关于星空、梦想与承诺的温暖故事。"
---

夜幕降临，城市的灯光逐渐亮起...

（全文）
```

### 中长篇小说示例

#### 小说简介（time-traveler/_index.md）

```markdown
---
title: "时间旅行者"
date: 2025-10-28
draft: false
tags: ["科幻"]
category: "中长篇"
description: "一个关于时间、选择与命运的奇幻冒险故事。"
layout: "list"
---

## 作品简介

这是一部关于时间旅行的科幻小说。主人公意外获得了穿越时空的能力...
```

#### 第一章（time-traveler/chapter-01/index.md）

```markdown
---
title: "意外的礼物"
novel: "时间旅行者"
chapter: 1
date: 2025-10-28
draft: false
tags: ["科幻"]
category: "中长篇"
---

正文里面建议不要再写 # 第一章标题 这样的东西

雨夜，城市的街道上行人寥寥...

（章节内容）
```

#### 第二章（time-traveler/chapter-02/index.md）

```markdown
---
title: "时间的代价"
novel: "时间旅行者"
chapter: 2
date: 2025-10-29
draft: false
tags: ["科幻"]
category: "中长篇"
---

当陈墨再次睁开眼睛时...

（章节内容）
```

## 注意事项

### 必须遵守的规则

1. ✓ 短篇的 `category` 必须是 `"短篇"`
2. ✓ 中长篇的 `category` 必须是 `"中长篇"`
3. ✓ 中长篇小说简介必须添加 `layout: "list"`
4. ✓ 章节的 `chapter` 参数用于排序，必须正确设置
5. ✓ 小说简介文件必须命名为 `_index.md`（带下划线）
6. ✓ 章节文件必须命名为 `index.md`（不带下划线）

### 建议遵守的规则

1. 文件夹和文件名使用英文和连字符（如 `time-traveler`）
2. 日期格式统一使用 `YYYY-MM-DD`
3. 章节标题建议包含章节号（如 `"第一章：章节名"`）
4. `draft: false` 才会在网站上显示

## 相关文档

- [网站目录结构说明](./STRUCTURE.md)

