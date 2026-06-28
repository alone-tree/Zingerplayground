# Zinger's Playground 设计规范

> 所有页面模板、CSS 修改必须遵循本规范。如有更新，同步修改本文档。

---

## 1. 配色系统

定义在 `themes/minimal-theme/assets/css/main.css` 的 `:root` 中。

| 变量 | 值 | 用途 |
|------|-----|------|
| `--color-dark-gray-blue` | `#2C3639` | 文本色基础 |
| `--color-medium-gray-green` | `#3F4E4F` | hover 链接色 |
| `--color-warm-brown` | `#A27B5C` | 链接色、强调色 |
| `--color-light-beige` | `#DCD7C9` | 次要背景（深色模式） |

**语义变量：**

| 变量 | 浅色模式 | 深色模式 | 用途 |
|------|---------|---------|------|
| `--bg-color` | `#FFFFFF` | `--color-dark-gray-blue` | 页面主背景 |
| `--bg-secondary` | `--color-light-beige` | `--color-medium-gray-green` | 次要背景 |
| `--text-color` | `--color-dark-gray-blue` | `--color-light-beige` | 正文色 |
| `--link-color` | `--color-warm-brown` | `--color-warm-brown` | 链接、强调 |
| `--link-hover` | `--color-medium-gray-green` | `--color-light-beige` | 链接 hover |
| `--border-color` | `rgba(44, 54, 57, 0.1)` | `rgba(220, 215, 201, 0.2)` | 边框、分隔线 |
| `--shadow-color` | `rgba(44, 54, 57, 0.1)` | `rgba(0, 0, 0, 0.3)` | 阴影 |

**原则：** 不使用暖黄色/米黄色作为主要卡片的背景色。卡片使用 `--bg-color`（白色）+ 细边框 `1px solid var(--border-color)`。

---

## 2. 间距系统

| 变量 | 值 |
|------|-----|
| `--spacing-xs` | 0.5rem（8px） |
| `--spacing-sm` | 1rem（16px） |
| `--spacing-md` | 2rem（32px） |
| `--spacing-lg` | 3rem（48px） |
| `--spacing-xl` | 4rem（64px） |

**原则：** 所有间距优先使用 spacing 变量，不写死像素值。移动端适当缩减。

---

## 3. 字体系统

| 变量 | 字体栈 | 用途 |
|------|--------|------|
| `--font-sans` | PingFang SC, Microsoft YaHei, Helvetica Neue, Arial, sans-serif | 导航、标题、列表、元信息 |
| `--font-serif` | Songti SC, SimSun, serif | 文章正文（`.article-content`） |
| `--font-mono` | SF Mono, Monaco, Consolas, monospace | 日期、代码、等宽内容 |

**原则：**
- 非正文内容统一用 `--font-sans`
- 文章正文（`.article-content`）用 `--font-serif`，字号 17px
- 日期用 `--font-mono` 以保持等宽对齐
- 正文 base size: 16px（`html { font-size: 16px }`）

---

## 4. 容器布局

| 类名 | 最大宽度 | 用途 |
|------|---------|------|
| `.container` | 1200px | 列表页、首页 |
| `.container-narrow` | 750px | 文章详情页 |

**原则：** 所有页面内容用 `.container` 包裹，自带水平 padding `0 var(--spacing-md)`（移动端依然生效）。

---

## 5. 页面模板结构规范

### 首页（index.html）
- 使用 `.home` 类，`max-width: 720px`
- section 间用 `border-top` 分隔
- 每个 section 包含标题行（标题左 + "查看全部"右）
- 列表项采用 flex 布局：标题在左（自动截断），日期在右（固定不换行）
- 标题截断：`white-space: nowrap; overflow: hidden; text-overflow: ellipsis; min-width: 0`

### 文章列表（articles/list.html）
- 分类筛选：JS 驱动，`.tab-button` + `.article-card` 的 `data-category` 属性
- 卡片网格：`grid-template-columns: repeat(auto-fill, minmax(320px, 1fr))`
- 卡片结构：无背景色（`--bg-color`），细边框，hover 增加阴影
- 卡片内 padding: 1.25rem

### 文章详情（articles/single.html）
- 正文用 `--font-serif`，17px
- 公式用 KaTeX 渲染
- 表格用标准 border-collapse，纯边框、无斑马纹

---

## 6. 响应式断点

| 断点 | 调整项 |
|------|--------|
| `max-width: 768px` | 导航高度 56px，h1-h3 字号降级，文章网格单列 |
| `max-width: 600px` | 首页 padding 缩减，字号额外缩小 |

---

## 7. 分类命名

文章 front matter 中 `category` 字段的可用值：
- `AI与Coding`
- `经济与投资`
- `自我觉察`
- `社会观察`

---

## 8. 通用原则

- **间距一致性**：同一层级使用同一 spacing 变量
- **信息密度**：首页列表模式下不留过多空白，删除不必要的大段 padding
- **卡片设计**：白色背景 + 边框，不填充彩色背景（浅色模式下）
- **标题截断**：列表模式中标题过长用 `text-overflow: ellipsis` 截断，日期保持可见
- **不用写死 px 值**：优先用 CSS 变量或相对单位
