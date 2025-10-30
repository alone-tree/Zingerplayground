# Netlify 部署快速指南

## 📋 准备清单

在部署到 Netlify 之前，请确认以下文件已经就绪：

- ✅ `netlify.toml` - Netlify 构建配置
- ✅ `config.toml` - Hugo 站点配置
- ✅ `go.mod` - Go 模块依赖
- ✅ `.gitignore` - Git 忽略规则

## 🚀 部署步骤

### 1. 初始化 Git 仓库（如果还没有）

```powershell
git init
git add .
git commit -m "Initial commit: Hugo site with custom theme"
```

### 2. 推送到 GitHub

如果您的 GitHub 仓库已存在：

```powershell
git branch -M main
git remote add origin https://github.com/你的用户名/Zingerplayground.git
git push -u origin main
```

### 3. 在 Netlify 上部署

#### 方式 A：通过 Netlify 网站界面

1. 访问 [https://app.netlify.com/](https://app.netlify.com/)
2. 登录或注册账户
3. 点击 **"Add new site"** → **"Import an existing project"**
4. 选择 **"Deploy with GitHub"**
5. 授权 Netlify 访问您的 GitHub
6. 在仓库列表中选择 `Zingerplayground`
7. Netlify 会自动检测 `netlify.toml`，确认设置：
   - Build command: `hugo --gc --minify`
   - Publish directory: `public`
8. 点击 **"Deploy site"**

#### 方式 B：通过 Netlify CLI（可选）

```powershell
# 安装 Netlify CLI
npm install -g netlify-cli

# 登录
netlify login

# 初始化并部署
netlify init
```

### 4. 等待构建完成

Netlify 会自动：
1. 安装 Hugo 0.139.0 和 Go 1.22
2. 运行 `hugo mod tidy`
3. 执行 `hugo --gc --minify`
4. 发布到 CDN

构建通常需要 1-2 分钟。

### 5. 更新域名

部署成功后，Netlify 会分配一个临时域名，例如：
```
https://随机名称.netlify.app/
```

**重要**：将此域名更新到 `config.toml`：

```toml
baseURL = "https://你的实际域名.netlify.app/"
```

然后推送更新：

```powershell
git add config.toml
git commit -m "Update baseURL for Netlify deployment"
git push
```

### 6. 自定义站点名称（可选）

在 Netlify 控制台：
1. 进入 **Site settings** → **Site details**
2. 点击 **"Change site name"**
3. 输入您想要的名称（如 `my-blog`）
4. 新域名将变为 `https://my-blog.netlify.app/`

别忘了更新 `config.toml` 中的 `baseURL`！

## 🔧 常见问题

### 构建失败：Hugo 版本问题

如果构建日志显示 Hugo 版本错误，检查 `netlify.toml` 中的版本设置：

```toml
[build.environment]
  HUGO_VERSION = "0.139.0"  # 确保版本号正确
```

### 样式或资源加载失败

这通常是 `baseURL` 配置问题。确保：
1. `config.toml` 中的 `baseURL` 与实际部署域名一致
2. `baseURL` 以 `/` 结尾

### Go 模块找不到

确保 `go.mod` 文件包含正确的 replace 指令：

```go
replace minimal-theme => ./themes/minimal-theme
```

## 🔄 持续部署

配置完成后，后续更新只需：

```powershell
# 1. 修改内容或代码
# 2. 提交并推送
git add .
git commit -m "更新内容"
git push

# 3. Netlify 自动重新构建和部署
```

## 📊 部署后检查

访问您的网站，确认：

- ✅ 首页正常显示
- ✅ 文章列表可见
- ✅ 文章详情页可访问
- ✅ CSS 样式正确加载
- ✅ 深色/浅色模式切换正常

## 🌐 自定义域名（进阶）

### 添加自定义域名

1. 在 Netlify 控制台：**Domain settings** → **Add custom domain**
2. 输入您的域名（如 `www.example.com`）
3. 在域名注册商处添加 DNS 记录：
   ```
   类型: CNAME
   名称: www
   值: 你的站点名.netlify.app
   ```
4. 等待 DNS 传播（最多 24 小时）
5. Netlify 自动为您的域名配置 HTTPS

### 更新配置

```toml
baseURL = "https://www.example.com/"
```

## 📝 部署检查清单

在推送代码之前：

- [ ] 所有文章的 `draft` 已设置为 `false`
- [ ] `config.toml` 的 `baseURL` 已更新
- [ ] 本地测试通过（`hugo server`）
- [ ] 构建无错误（`hugo --gc --minify`）
- [ ] 已提交所有更改到 Git
- [ ] `.gitignore` 已配置正确（不包含 `public/`）

祝您部署顺利！🎉

