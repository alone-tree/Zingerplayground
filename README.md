# 我的 Hugo 个人网站

这是一个基于 Hugo Modules 搭建的极简个人网站，使用自建主题。

## 项目结构

```
.
├── config.toml              # Hugo 配置文件
├── go.mod                   # Go 模块配置
├── content/                 # 内容目录
│   └── posts/              # 博客文章
│       └── hello-world.md
├── themes/                  # 主题目录
│   └── minimal-theme/      # 自建极简主题
│       ├── go.mod
│       ├── layouts/        # 模板文件
│       │   ├── _default/
│       │   │   ├── baseof.html
│       │   │   ├── list.html
│       │   │   └── single.html
│       │   └── index.html
│       └── assets/
│           └── css/
│               └── main.css
└── public/                  # 生成的静态文件（自动生成）
```

## 本地开发

### 前置要求

- [Hugo](https://gohugo.io/installation/) (Extended 版本)
- [Go](https://golang.org/dl/) 1.22 或更高版本

### 启动开发服务器

```bash
hugo server --disableFastRender
```

访问 http://localhost:1313 查看网站。

### 创建新文章

```bash
hugo new posts/my-new-post.md
```

编辑 `content/posts/my-new-post.md`，将 `draft = true` 改为 `draft = false`。

### 构建静态文件

```bash
hugo --gc --minify
```

生成的静态文件在 `public/` 目录中。

## 技术栈

- **Hugo**: 静态网站生成器
- **Hugo Modules**: 模块化主题管理
- **语言**: 中文（zh-cn）

## 主题特性

- 极简设计
- 响应式布局
- 深色/浅色模式自适应
- 无外部依赖

## 部署到 Netlify

本项目已配置好 Netlify 部署所需的文件（`netlify.toml`），只需简单几步即可上线。

### 步骤 1：推送代码到 GitHub

```bash
git init
git add .
git commit -m "Initial commit: Hugo site with custom theme"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

### 步骤 2：连接 Netlify

1. 登录 [Netlify](https://app.netlify.com/)
2. 点击 "Add new site" → "Import an existing project"
3. 选择 "Deploy with GitHub"
4. 授权 Netlify 访问您的 GitHub 账户
5. 选择您的仓库（如 `Zingerplayground`）

### 步骤 3：配置构建设置

Netlify 会自动检测到 `netlify.toml` 文件，无需手动配置。确认以下设置：

- **Build command**: `hugo --gc --minify`
- **Publish directory**: `public`
- **Hugo version**: `0.139.0`

### 步骤 4：部署

点击 "Deploy site"，Netlify 会自动：
1. 克隆您的仓库
2. 安装 Hugo 和 Go
3. 运行构建命令
4. 发布到 CDN

### 步骤 5：更新域名

部署成功后，Netlify 会分配一个随机域名（如 `random-name-123.netlify.app`）。

**更新 `config.toml` 中的 baseURL**：
```toml
baseURL = "https://你的站点名.netlify.app/"
```

然后推送更改：
```bash
git add config.toml
git commit -m "Update baseURL for Netlify"
git push
```

Netlify 会自动重新部署。

### 自定义域名（可选）

在 Netlify 控制台：
1. 进入 "Site settings" → "Domain management"
2. 点击 "Add custom domain"
3. 按照指引配置 DNS 记录
4. 更新 `config.toml` 中的 `baseURL` 为您的自定义域名

### 持续部署

配置完成后，每次推送到 `main` 分支，Netlify 都会自动重新构建和部署您的网站。

### 其他部署选项

本项目也可以部署到：
- **Vercel**: 类似的流程，支持 Hugo
- **GitHub Pages**: 需要配置 GitHub Actions
- **Cloudflare Pages**: 支持 Hugo 的快速部署

## 许可

MIT License

