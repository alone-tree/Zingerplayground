# Zinger's Playground 项目说明（给 AI Agent）

## 这是什么

Zinger's Playground 是 zikeb 的个人网站，基于 Hugo 静态网站生成器搭建，部署在 Netlify。GitHub 仓库：alone-tree/Zingerplayground。

**所有页面设计、CSS 修改都必须遵循 [DESIGN.md](DESIGN.md) 中定义的设计规范，包括配色、间距、字体、布局原则等。新增模板或修改现有模板前先读 DESIGN.md。**

## 你应该知道的事

### 1. 技术栈

- Hugo Extended 0.139.0 + Go Modules
- 自建主题：themes/minimal-theme（极简设计，深色/浅色模式自适应）
- `baseURL` 已更新为 `https://zingerplayground.top/`（2026-06）
- Netlify 自动部署，推送到 main 分支时会自动构建
- 构建命令：`hugo --gc --minify`，输出目录：`public/`
- 语言：中文（zh-cn）

### 2. 内容结构

网站有 6 个板块：首页、小说、文章、代码、摄影、播客、关于。

**各板块状态（2026-06-28）：**
- 小说：《完美伴侣》8 章 + 封面 + 简介
- 文章：7 篇，分类 AI/AI编程/投资/自我觉察，卡片式布局 + 分类筛选（JS 按钮切换）
- 代码：4 个项目（siyuan-agent-bridge / siyuan-sisyphus / TextDrop / 思源桥遥测看板），卡片式布局
- 摄影：清迈艺术集市专题 9 张照片，Masonry 画廊
- 关于：个人介绍页，窄容器排版
- 播客：空壳
- 所有模板（除小说外）：layouts/articles/*, layouts/code/*, layouts/photography/*, layouts/about/* — 统一复用 CSS 变量，卡片悬停动效，深/浅色模式自适应

**分类筛选机制：**
articles/list.html 会自动提取所有文章 `.Params.category` 字段的去重值，生成顶部筛选按钮（「全部」+ 各 category）。点击按钮后 JavaScript 按 `data-category` 隐藏/显示卡片。新增文章只需在 front matter 中设置 `category` 字段即可自动出现在筛选栏中。

内容模板和目录结构规则详见：
- [STRUCTURE.md](STRUCTURE.md) — 目录结构、文件命名规则
- [TEMPLATES.md](TEMPLATES.md) — Front Matter 字段说明和模板

**关键规则：**
- 中长篇小说简介文件必须命名为 `_index.md`（带下划线）
- 章节文件必须命名为 `index.md`（不带下划线）
- 短篇 `category` 必须是 `"短篇"`，中长篇必须是 `"中长篇"`
- 中长篇简介必须加 `layout: "list"`
- `draft: true` 的内容不会在网站上显示
- 文章（非小说）的 `category` 字段会驱动文章列表页的分类筛选按钮（JS 自动生成）
- 所有文档必须用中文撰写，禁止用英文

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
- **遵守流程规范：** 操作时必须严格遵循已定义的文档和工作流，不能图快跳步骤。尤其在思源笔记操作上，必须走能力库 MCP 链路（load_mcp → siyuan_start → use_tool），不能直接调 SiYuan API。写入需 confirmed=true。

### 5. 关键文件

| 文件 | 说明 |
|------|------|
| config.toml | Hugo 配置（baseURL、菜单、配色等） |
| netlify.toml | Netlify 部署配置（Hugo 版本、构建命令） |
| STRUCTURE.md | 目录结构说明和文件命名规则 |
| TEMPLATES.md | 内容模板和 Front Matter 字段说明 |
| DESIGN.md | 设计规范（配色、间距、字体、布局原则） |
| DEPLOY.md | 部署流程说明 |
| PROJECT_LOG.md | 项目日志（想法、决策、踩坑记录） |
| CHANGELOG.md | 版本变更记录 |
| README.md | 项目概述 |

### 6. 本地开发

**正确启动开发服务器（唯一推荐方式）：**

```bash
terminal(background=true) → cd /d/Github/Zingerplayground && hugo server -D
```

- 必须 `background=true`，**不要加 `&`**（加 `&` 会让子 shell 立即退出，Hermes 以为进程结束了）
- `-D` 包含草稿内容

**验证服务是否启动：**

```bash
curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:1313/
# 期望: 200
```

**停止开发服务器：**

```bash
powershell.exe -Command "Get-Process hugo -ErrorAction SilentlyContinue | Stop-Process -Force"
```

**一键脚本（有坑）：**
项目中有 `restart-hugo.ps1` 和 `stop-hugo.ps1`，但 `restart-hugo.ps1` 的 `Start-Process` 没设 `-WorkingDirectory`，必须在 `D:\Github\Zingerplayground` 下运行：

```bash
cd /d/Github/Zingerplayground && powershell.exe -ExecutionPolicy Bypass -File restart-hugo.ps1
```

**浏览器验证：**
- 截图验证（用户能看）：加载能力库「浏览器控制」MCP → `browser_navigate` → `browser_take_screenshot`
- 直接看（用户可见）：`cmd /c start "" "http://127.0.0.1:1313/"`

**构建：**

```bash
hugo --gc --minify
```

生成文件在 `public/` 目录。

> ⚠️ Windows 经验：不要传 `--disableFastRender --bind 127.0.0.1 --port 1313` 等多余参数——这些都是 Hugo 默认值。命令越短越可靠。

### 8. 标准启动流程（完整版）

每次启动个人网站进行本地开发/验证时，按此顺序执行，不要跳过步骤，不要凭记忆简化。

```bash
# 第1步：清理旧进程
taskkill /F /IM hugo.exe 2>/dev/null

# 第2步：启动 Hugo 开发服务器（后台，不加 &，必须 -D 含草稿）
terminal(background=true) → cd /d/Github/Zingerplayground && hugo server -D

# 第3步：等待并验证服务启动
wait 3s → curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:1313/
# 期望返回 200

# 第4步：在用户浏览器中打开（用户可见）
cmd /c start "" "http://127.0.0.1:1313/"

# 第5步：加载能力库「浏览器控制」MCP（Playwright headed 浏览器，你我都能看见和操作）
cd /d/HermesSync/capability-library
python tools/mcp/load_mcp.py --name "浏览器控制"

# 第6步：导航到本地网站
python tools/mcp/use_tool.py --mcp "浏览器控制" --tool "browser_navigate" --params-json "{\"url\": \"http://127.0.0.1:1313/\"}"
```

**原理说明：**
- Hugo 开发服务器用 `background=true`，**不能加 `&`**（加了子 shell 立即退出，Hermes 以为进程结束了）
- `-D` 包含草稿内容（`draft: true` 的文章也会显示）
- `cmd /c start` 在 Windows 默认浏览器中打开页面，用户能直接看见
- 能力库「浏览器控制」MCP 启动 headed Chromium，窗口弹出在桌面上，AI 能通过 `use_tool.py` 操控，用户也能直接交互
- 第一步清理旧进程是必需的，Hugo 端口被占用时不会报错但无法访问

**停止：**
```bash
taskkill /F /IM hugo.exe
# 浏览器窗口手动关闭即可
```

### 9. 常见错误速查

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

**本地开发（不可重复的踩坑经验）：**
- 启动服务器必须用 `background=true` 且**不加 `&`**，加了 `&` shell 立即退出
- 不要传 `--disableFastRender --bind 127.0.0.1 --port 1313`——这些都是默认值，传了反而不稳定
- `restart-hugo.ps1` 必须在 `D:\Github\Zingerplayground` 目录下运行，否则找不到 config
- git-bash 没有 `pgrep`——查找进程用 `ps | grep hugo` 代替
- 停进程用 `taskkill /F /IM hugo.exe`，不要用 kill（Windows 风格）
