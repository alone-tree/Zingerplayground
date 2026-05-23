# Zinger's Playground 项目日志

> 记录网站建设过程中的想法、决策、踩坑和经验。

---

## 2026-05-23 — 项目重启

### 现状梳理

- Hugo 静态站，自建 minimal-theme，Netlify 部署
- 线上地址：https://zingerplayground.netlify.app/
- GitHub：alone-tree/Zingerplayground
- 当前内容：1 篇 hello-world + 《完美伴侣》8 章正文
- 导航栏有 6 个入口，但 articles/code/photography/podcast/about 都是空壳

### 内容规划

**最优先：从思源笔记搬运已有文章**

思源"自己写的文章"笔记本有 78 篇成品文章（15 万字+），按主题分：

- AI/编程类（~7 篇）：标题有传播力，和网站身份一致
  - "别学编程了用 AI 暴力编程法"
  - "文科生的 AI 编程"
  - "受够了每次和 AI 都从头聊起"
  - "小心你这样用 AI 正在废掉自己"
  - "AI 写论文给 AI 读的闭环"

- 投资类（~8 篇）：有数据框架支撑，不是泛泛而谈
  - "八年投资两轮牛熊"
  - "我做了一套不能骗自己的投资账本"
  - "桥水全天候真实持仓与底层原理"
  - "如果当初看一眼数据，股市能少亏点吗"
  - "你以为自己能承受风险，其实未必"

- 自我觉察/成长类（~25 篇）：可以放，比较私人但符合 Playground 调性

**代码板块：项目展示**

- siyuan-plugins-mcp-sisyphus
- siyuan-agent-bridge
- 其他 GitHub 项目
- 每个项目写：解决的问题 + 怎么用 + 踩过的坑

**小说板块：继续更新《完美伴侣》**

- 已有 8 章正文
- 人物传记 9 篇（各 9000-28000 字）可作为番外/附录

**摄影/播客：暂不填**

- 无实际内容积累，不做空壳

**关于页面：用既有思考填充**

- 从日记随笔和文章中提取核心观点
- 不是简历，是"这个站为什么存在"

### 待讨论事项

- [ ] 网站 Geo 优化（面向哪些地区、CDN 策略）
- [ ] 排版和布局调整
- [ ] SEO 优化
- [ ] 评论系统
- [ ] 自定义域名

### 技术备忘

- Hugo 版本：0.139.0（netlify.toml 指定）
- 构建命令：`hugo --gc --minify`
- 内容模板见 TEMPLATES.md，目录结构见 STRUCTURE.md
- 短篇：`content/novels/xxx.md`，中长篇：`content/novels/小说名/_index.md` + 章节文件夹
- 推送到 main 分支自动触发 Netlify 部署

## 2026-05-24 — GEO 优化讨论

### 核心判断

AI 时代互联网将从 app 割据变成"网站 + app"双重模式。AI 能访问公开网站但无法穿透封闭 app（小红书、公众号等）。目标：让 AI 搜索/ChatGPT/Perplexity 等能检索到网站内容，进而了解 zikeb。

### GEO 三层策略

**第一层——立即能做：**
- [ ] robots.txt：在 static/ 下创建，显式 Allow GPTBot、ChatGPT-User、OAI-SearchBot、ClaudeBot、Claude-Web、anthropic-ai、PerplexityBot、Google-Extended、CCBot、Applebot-Extended
- [ ] 关于页面：填充身份信息，让 AI 建立 Person 实体关联
- [ ] 每篇文章补全 description（AI 生成摘要的关键来源，TEMPLATES.md 已有字段定义）

**第二层——内容策略：**
- [ ] 检查主题模板的 HTML 语义结构（h1-h6、article 标签）
- [ ] 优先搬运问题-答案型文章（标题即用户会搜的问题）
- [ ] 跨平台身份一致性（思源/GitHub/网站用相同名字、头像、链接）

**第三层——长期积累：**
- [ ] Schema.org 结构化数据（JSON-LD：Person、Article、WebSite）
- [ ] llms.txt（新兴标准，暂观望）
- [ ] 外部引用：GitHub、知乎等平台被引用和链接

### 讨论中的问题

- [ ] 外部引用的具体操作方式
- [ ] AI 引用 vs 访问的区别和影响

### 运维约定

- 所有网站修改先讨论再执行
- 新文章从思源搬运时，注意 Hugo front matter 格式
- 修改主题文件要谨慎，确认不影响现有页面
