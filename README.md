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

## 部署

将来可以部署到 Netlify、Vercel、GitHub Pages 等平台。

### Netlify 部署（可选）

创建 `netlify.toml` 文件：

```toml
[build]
  command = "hugo --gc --minify"
  publish = "public"

[build.environment]
  HUGO_VERSION = "0.134.3"
  HUGO_ENV = "production"
```

## 许可

MIT License

