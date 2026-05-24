# Zinger's Playground 项目说明（给 AI Agent）

## 这是什么

Zinger's Playground 是 zikeb 的个人网站，基于 Hugo 静态网站生成器搭建，部署在 Netlify。GitHub 仓库：alone-tree/Zingerplayground。

## 你应该知道的事

### 1. 技术栈

- Hugo Extended 0.139.0 + Go Modules
- 自建主题：themes/minimal-theme（极简设计，深色/浅色模式自适应）
- 部署：Netlify，推送到 main 分支自动构建部署
- 构建命令：`hugo --gc --minify`，输出目录：`public/`
- 语言：中文（zh-cn）

### 2. 内容结构

网站有 6 个板块：首页、小说、文章、代码、摄影、播客、关于。

**各板块状态（2026-05-24）：**
- 小说：《完美伴侣》8 章 + 封面 + 简介
- 文章：6 篇，分类 AI编程/投资/自我觉察，卡片式布局 + 分类筛选
- 代码：3 个项目（siyuan-agent-bridge / siyuan-sisyphus / TextDrop），卡片式布局
- 摄影：清迈艺术集市专题 9 张照片，Masonry 画廊
- 关于：个人介绍页，窄容器排版
- 播客：空壳
- 所有模板（除小说外）：layouts/articles/*, layouts/code/*, layouts/photography/*, layouts/about/* — 统一复用 CSS 变量，卡片悬停动效，深/浅色模式自适应

内容模板和目录结构规则详见：
- [STRUCTURE.md](STRUCTURE.md) — 目录结构、文件命名规则
- [TEMPLATES.md](TEMPLATES.md) — Front Matter 字段说明和模板

**关键规则：**
- 中长篇小说简介文件必须命名为 `_index.md`（带下划线）
- 章节文件必须命名为 `index.md`（不带下划线）
- 短篇 `category` 必须是 `"短篇"`，中长篇必须是 `"中长篇"`
- 中长篇简介必须加 `layout: "list"`
- `draft: true` 的内容不会在网站上显示

### 3. 内容来源

zikeb 的主要写作在思源笔记中（笔记本："自己写的文章"78 篇、"故事"30 篇等）。搬运到网站时：
- 注意 Hugo front matter 格式（参考 TEMPLATES.md）
- 日期使用原文发布时间，不是搬运时间
- 图片路径注意 static/ 目录映射（Hugo 中 `/images/xxx.jpg` → `static/images/xxx.jpg`）

### 4. 做事约定

- **先讨论，再动手。** 所有修改（内容、布局、配置）必须先和 zikeb 确认方案
- 不要改动主题文件（themes/minimal-theme/）——除非明确讨论过
- 不要改动 netlify.toml 和 config.toml——除非明确讨论过
- 新增内容时严格遵守 TEMPLATES.md 中的模板格式
- **做任何事之后，立即同步更新 PROJECT_LOG.md 和 CHANGELOG.md。** 做完一件记一件，不要等批次结束再统一补。这条是 zikeb 最在意的规则，遗漏会被严厉纠正。

### 5. 关键文件

| 文件 | 说明 |
|------|------|
| config.toml | Hugo 配置（baseURL、菜单、配色等） |
| netlify.toml | Netlify 部署配置（Hugo 版本、构建命令） |
| STRUCTURE.md | 目录结构说明和文件命名规则 |
| TEMPLATES.md | 内容模板和 Front Matter 字段说明 |
| DEPLOY.md | 部署流程说明 |
| PROJECT_LOG.md | 项目日志（想法、决策、踩坑记录） |
| CHANGELOG.md | 版本变更记录 |
| README.md | 项目概述 |

### 6. 本地开发

```bash
# 安装依赖
hugo mod get

# 启动开发服务器
hugo server --disableFastRender
# 访问 http://localhost:1313

# 构建
hugo --gc --minify
```

注意：必须使用 Hugo Extended 版本。

### 7. 常见错误速查

最容易踩的坑，按致命程度排列：

**文件命名（一错网站就崩）：**
- 中长篇简介文件必须是 `_index.md`（带下划线），章节文件必须是 `index.md`（不带下划线）
- 搞反了会导致章节不显示或简介页面出错

**Front Matter（一错内容就不出现）：**
- 短篇 `category` 必须是 `"短篇"`，中长篇必须是 `"中长篇"`
- 中长篇简介必须加 `layout: "list"`
- `draft: true` 不会显示，写完记得改 `false`

**图片路径（常见但不易察觉）：**
- markdown 里写 `/images/xxx.jpg`，实际放在 `static/images/xxx.jpg`
- 小说封面放 `content/novels/小说名/cover.png`，和 index.md 同级

**Git 操作：**
- commit 到本地即可，不要 push（网络可能不通）
- 需要 push 时由 zikeb 手动操作
